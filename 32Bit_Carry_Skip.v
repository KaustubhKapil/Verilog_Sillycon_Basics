module CSA32 (
    input  [31:0] A,
    input  [31:0] B,
    input         Cin,
    output reg [31:0] Sum,
    output reg        Cout
);
    reg [31:0] Carry;            // Intermediate carry values
    reg [3:0] GroupPropagate;    // Propagate signals for four groups

    always @(*) begin
        // Here I have used a for loop to generate carry using: C_new = G_new + (P_new * C_previous)
        Carry[0] = (A[0] & B[0]) | ((A[0] ^ B[0]) & Cin);
        for (integer i = 1; i < 32; i = i + 1) begin
            Carry[i] = (A[i] & B[i]) | ((A[i] ^ B[i]) & Carry[i-1]);
        end
        // These are the sums
        for (integer i = 0; i < 32; i = i + 1) begin
            Sum[i] = A[i] ^ B[i] ^ (i == 0 ? Cin : Carry[i-1]);
        end

        // Compute Group Propagate signals (each group = 8 bits)
        GroupPropagate[0] = &({A[7:0] ^ B[7:0]}); 
        GroupPropagate[1] = &({A[15:8] ^ B[15:8]});
        GroupPropagate[2] = &({A[23:16] ^ B[23:16]});
        GroupPropagate[3] = &({A[31:24] ^ B[31:24]});

        if (GroupPropagate[0] & Cin)
            Carry[7] = Cin;
        
        if (GroupPropagate[1] & Carry[7])
            Carry[15] = Carry[7];
        
        if (GroupPropagate[2] & Carry[15])
            Carry[23] = Carry[15];
        
        if (GroupPropagate[3] & Carry[23])
            Carry[31] = Carry[23];


        Cout = Carry[31];
    end
endmodule