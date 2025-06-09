module dec (
    input [2:0] in,
    input en,
    output reg [7:0] out
);
    
    always @(in or en) begin
        if (en)
            out = 1 << in;
        else
            out = 8'b00000000;
    end
endmodule