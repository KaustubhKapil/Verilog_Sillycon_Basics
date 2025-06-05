module CLA (
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output reg [7:0] Sum,
    output reg Cout
);
    reg [7:0] C; 

    always @(*) begin
        C[0] = (A[0] & B[0]) | ((A[0] ^ B[0]) & Cin);
        C[1] = (A[1] & B[1]) | ((A[1] ^ B[1]) & C[0]);
        C[2] = (A[2] & B[2]) | ((A[2] ^ B[2]) & C[1]);
        C[3] = (A[3] & B[3]) | ((A[3] ^ B[3]) & C[2]);
        C[4] = (A[4] & B[4]) | ((A[4] ^ B[4]) & C[3]);
        C[5] = (A[5] & B[5]) | ((A[5] ^ B[5]) & C[4]);
        C[6] = (A[6] & B[6]) | ((A[6] ^ B[6]) & C[5]);
        C[7] = (A[7] & B[7]) | ((A[7] ^ B[7]) & C[6]);
        Sum[0] = A[0] ^ B[0] ^ Cin;
        Sum[1] = A[1] ^ B[1] ^ C[0];
        Sum[2] = A[2] ^ B[2] ^ C[1];
        Sum[3] = A[3] ^ B[3] ^ C[2];
        Sum[4] = A[4] ^ B[4] ^ C[3];
        Sum[5] = A[5] ^ B[5] ^ C[4];
        Sum[6] = A[6] ^ B[6] ^ C[5];
        Sum[7] = A[7] ^ B[7] ^ C[6];
        Cout = C[7];
    end
endmodule