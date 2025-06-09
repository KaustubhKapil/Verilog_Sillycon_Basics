`timescale 1ns / 1ps
module pe_tb;
    reg [7:0] in;   
    wire [2:0] out; 
    pe uut (
        .in(in),
        .out(out)
    );

    initial begin
        $monitor("Time=%0d, in=%b, out=%b", $time, in, out);

        
        in = 8'b00000001; #10; 
        in = 8'b00000010; #10;
        in = 8'b00000100; #10;
        in = 8'b00001000; #10;
        in = 8'b00010000; #10;
        in = 8'b00100000; #10;
        in = 8'b01000000; #10;
        in = 8'b10000000; #10; 
        in = 8'b00011000; #10; 
        in = 8'b01100000; #10; 
        
        in = 8'b00000000; #10; 

        $stop;
    end
endmodule