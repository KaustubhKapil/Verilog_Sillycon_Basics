`timescale 1ns / 1ps

module dec_tb;
    reg [2:0] in;
    reg en;
    wire [7:0] out;
    
    dec uut (
        .in(in),
        .en(en),
        .out(out)
    );
    
    initial begin
        $monitor("Time=%0d, en=%b, in=%b, out=%b", $time, en, in, out);
        
        en = 1; in = 3'b000; #10;
        in = 3'b001; #10;
        in = 3'b010; #10;
        in = 3'b011; #10;
        in = 3'b100; #10;
        in = 3'b101; #10;
        in = 3'b110; #10;
        in = 3'b111; #10;
        
        en = 0; #10; // Check disable condition
        
        $stop;
    end
endmodule