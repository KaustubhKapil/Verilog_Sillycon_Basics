module enc (
    input [7:0] in,
    output reg [2:0] out
);

    always @(in) begin
        if (in == 8'b00000001)
            out = 3'b000;
        else if (in == 8'b00000010)
            out = 3'b001;
        else if (in == 8'b00000100)
            out = 3'b010;
        else if (in == 8'b00001000)
            out = 3'b011;
        else if (in == 8'b00010000)
            out = 3'b100;
        else if (in == 8'b00100000)
            out = 3'b101;
        else if (in == 8'b01000000)
            out = 3'b110;
        else if (in == 8'b10000000)
            out = 3'b111;
        else
            out = 3'b000; 
    end
endmodule