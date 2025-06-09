`timescale 1ns / 1ps
module tb_gray_encoder;
    reg [3:0] bin;
    wire [3:0] gray;

    gray_encoder uut (
        .bin(bin),
        .gray(gray)
    );

    initial begin
        $monitor("Time=%0d, bin=%b, gray=%b", $time, bin, gray);
        
        bin = 4'b0000; #10;
        bin = 4'b0001; #10;
        bin = 4'b0010; #10;
        bin = 4'b0011; #10;
        bin = 4'b0100; #10;
        bin = 4'b0101; #10;
        bin = 4'b0110; #10;
        bin = 4'b0111; #10;
        bin = 4'b1000; #10;
        bin = 4'b1001; #10;
        bin = 4'b1010; #10;
        bin = 4'b1011; #10;
        bin = 4'b1100; #10;
        bin = 4'b1101; #10;
        bin = 4'b1110; #10;
        bin = 4'b1111; #10;

        $stop;
    end
endmodule