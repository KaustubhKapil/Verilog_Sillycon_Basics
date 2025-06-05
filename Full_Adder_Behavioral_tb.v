`timescale 1ns/1ps

module fa_behave_tb;
    // Inputs
    reg A;
    reg B;
    reg Cin;

    // Outputs
    wire Sum;
    wire Cout;

    // Instantiate the module under test (MUT)
    fa_behave uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Test stimulus
    initial begin
        $monitor("At time %0t: A=%b B=%b Cin=%b -> Sum=%b Cout=%b", $time, A, B, Cin, Sum, Cout);

        // Apply test cases
        A = 0; B = 0; Cin = 0; #10;
        A = 0; B = 0; Cin = 1; #10;
        A = 0; B = 1; Cin = 0; #10;
        A = 0; B = 1; Cin = 1; #10;
        A = 1; B = 0; Cin = 0; #10;
        A = 1; B = 0; Cin = 1; #10;
        A = 1; B = 1; Cin = 0; #10;
        A = 1; B = 1; Cin = 1; #10;

        // End simulation
        #10;
        $finish;
    end
endmodule