module fa_behave (
    input A,
    input B,
    input Cin,
    output reg Sum,
    output reg Cout
);
    always @(*) begin
        {Cout, Sum} = A+B+Cin;
    end
endmodule

// Faced difficulty with the syntax... took help from GPT.