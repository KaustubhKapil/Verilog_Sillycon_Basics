`timescale 1ns/1ps

module CLA_tb;

    reg [7:0] A;
    reg [7:0] B;
    reg Cin;

    wire [7:0] Sum;
    wire Cout;

    CLA uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $monitor("At time %0t: A=%b B=%b Cin=%b -> Sum=%b Cout=%b", 
                 $time, A, B, Cin, Sum, Cout);

        A = 8'b00000000; B = 8'b00000000; Cin = 0; #10;
        A = 8'b00000001; B = 8'b00000001; Cin = 0; #10;
        A = 8'b00001111; B = 8'b00001111; Cin = 0; #10;
        A = 8'b11110000; B = 8'b00001111; Cin = 1; #10;
        A = 8'b10101010; B = 8'b01010101; Cin = 0; #10;
        A = 8'b11111111; B = 8'b11111111; Cin = 1; #10;

        #10;
        $finish;
    end
endmodule