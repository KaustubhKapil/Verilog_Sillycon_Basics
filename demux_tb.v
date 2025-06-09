`timescale 1ns / 1ps
module demux_tb;
    reg in;
    reg [1:0] sel;
    wire [3:0] out;

    demux uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $monitor("Time=%0d, in=%b, sel=%b, out=%b", $time, in, sel, out);
        
        in = 1'b1;
        
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $stop;
    end
endmodule