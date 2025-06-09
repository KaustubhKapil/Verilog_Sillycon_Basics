module bcd_encoder (
    input [3:0] bin,
    output reg [3:0] bcd
);

    always @(bin) begin
        if (bin < 4'b1010)
            bcd = bin;
        else
            bcd = 4'b0000; 
    end
endmodule