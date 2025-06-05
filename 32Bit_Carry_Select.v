module CSA32 (
    input  [31:0] A,
    input  [31:0] B,
    input         Cin,
    output [31:0] Sum,
    output        Cout
);
    wire [31:0] Sum0, Sum1;  
    wire [3:0]  Carry0, Carry1; 
    wire [3:0]  CarrySelect; 

    // carries when Cin = 0
    assign Carry0[0] = (A[7:0] & B[7:0]) | ((A[7:0] ^ B[7:0]) & 1'b0);
    assign Sum0[7:0] = A[7:0] ^ B[7:0] ^ 1'b0;

    assign Carry0[1] = (A[15:8] & B[15:8]) | ((A[15:8] ^ B[15:8]) & Carry0[0]);
    assign Sum0[15:8] = A[15:8] ^ B[15:8] ^ Carry0[0];

    assign Carry0[2] = (A[23:16] & B[23:16]) | ((A[23:16] ^ B[23:16]) & Carry0[1]);
    assign Sum0[23:16] = A[23:16] ^ B[23:16] ^ Carry0[1];

    assign Carry0[3] = (A[31:24] & B[31:24]) | ((A[31:24] ^ B[31:24]) & Carry0[2]);
    assign Sum0[31:24] = A[31:24] ^ B[31:24] ^ Carry0[2];

    // carries when Cin = 1
    assign Carry1[0] = (A[7:0] & B[7:0]) | ((A[7:0] ^ B[7:0]) & 1'b1);
    assign Sum1[7:0] = A[7:0] ^ B[7:0] ^ 1'b1;

    assign Carry1[1] = (A[15:8] & B[15:8]) | ((A[15:8] ^ B[15:8]) & Carry1[0]);
    assign Sum1[15:8] = A[15:8] ^ B[15:8] ^ Carry1[0];

    assign Carry1[2] = (A[23:16] & B[23:16]) | ((A[23:16] ^ B[23:16]) & Carry1[1]);
    assign Sum1[23:16] = A[23:16] ^ B[23:16] ^ Carry1[1];

    assign Carry1[3] = (A[31:24] & B[31:24]) | ((A[31:24] ^ B[31:24]) & Carry1[2]);
    assign Sum1[31:24] = A[31:24] ^ B[31:24] ^ Carry1[2];

    // Select correct Carry based on Cin
    assign CarrySelect[0] = Cin ? Carry1[0] : Carry0[0];
    assign CarrySelect[1] = Cin ? Carry1[1] : Carry0[1];
    assign CarrySelect[2] = Cin ? Carry1[2] : Carry0[2];
    assign CarrySelect[3] = Cin ? Carry1[3] : Carry0[3];

    assign Sum[7:0]   = Cin ? Sum1[7:0] : Sum0[7:0];
    assign Sum[15:8]  = CarrySelect[0] ? Sum1[15:8] : Sum0[15:8];
    assign Sum[23:16] = CarrySelect[1] ? Sum1[23:16] : Sum0[23:16];
    assign Sum[31:24] = CarrySelect[2] ? Sum1[31:24] : Sum0[31:24];

    assign Cout = CarrySelect[3];

endmodule