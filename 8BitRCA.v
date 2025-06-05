// Here, I have instantiated 'fa_behave' from the Full_Adder_Behavioral.v file

module rca(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] S,
    output Co
);

wire [7:0] internal_carry;

fa_behave f0 (A[0], B[0], Cin, S[0], internal_carry[0]);
fa_behave f1 (A[1], B[1], internal_carry[0], S[1], internal_carry[1]);
fa_behave f2 (A[2], B[2], internal_carry[1], S[2], internal_carry[2]);
fa_behave f3 (A[3], B[3], internal_carry[2], S[3], internal_carry[3]);
fa_behave f4 (A[4], B[4], internal_carry[3], S[4], internal_carry[4]);
fa_behave f5 (A[5], B[5], internal_carry[4], S[5], internal_carry[5]);
fa_behave f6 (A[6], B[6], internal_carry[5], S[6], internal_carry[6]);
fa_behave f7 (A[7], B[7], internal_carry[6], S[7], Co);

endmodule