`timescale 1ns/1ps

module CSA32_tb;
    // Testbench signals
    reg [31:0] A;
    reg [31:0] B;
    reg Cin;
    wire [31:0] Sum;
    wire Cout;

    // Instantiate the Carry Skip Adder module
    CSA32 uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Apply test stimuli
    initial begin
        $monitor("At time %0t: A=%h B=%h Cin=%b -> Sum=%h Cout=%b", 
                 $time, A, B, Cin, Sum, Cout);

        // Test Cases
        A = 32'h00000000; B = 32'h00000000; Cin = 0; #10;
        A = 32'hFFFFFFFF; B = 32'h00000001; Cin = 0; #10;
        A = 32'h12345678; B = 32'h87654321; Cin = 1; #10;
        A = 32'hAAAAAAAA; B = 32'h55555555; Cin = 0; #10;
        A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; Cin = 1; #10;

        // End simulation
        #10;
        $finish;
    end
endmodule