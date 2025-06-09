`timescale 1ns / 1ps
module mux_tb;
    reg [1:0] sel;
    reg [3:0] in;
    wire out;

    mux uut (
        .sel(sel),
        .in(in),
        .out(out)
    );

    initial begin
        $monitor("Time=%0d, sel=%b, in=%b, out=%b", $time, sel, in, out);
        
        in = 4'b1010; 
        
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $stop;
    end
endmodule