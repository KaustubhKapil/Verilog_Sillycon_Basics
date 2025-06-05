module CSA32 (
    input  [31:0] A,
    input  [31:0] B,
    input         Cin,
    output [31:0] Sum,
    output        Cout
);
    wire [7:0] Sum0_0, Sum1_0;
    wire [7:0] Sum0_1, Sum1_1;
    wire [7:0] Sum0_2, Sum1_2;
    wire [7:0] Sum0_3, Sum1_3;

    wire       C0_0, C1_0;
    wire       C0_1, C1_1;
    wire       C0_2, C1_2;
    wire       C0_3, C1_3;

    reg        Sel1, Sel2, Sel3;
    reg [31:0] Sum_internal;
    reg        Cout_internal;

    assign {C0_0, Sum0_0} = A[7:0] + B[7:0] + 1'b0;
    assign {C1_0, Sum1_0} = A[7:0] + B[7:0] + 1'b1;

    assign {C0_1, Sum0_1} = A[15:8] + B[15:8] + 1'b0;
    assign {C1_1, Sum1_1} = A[15:8] + B[15:8] + 1'b1;

    assign {C0_2, Sum0_2} = A[23:16] + B[23:16] + 1'b0;
    assign {C1_2, Sum1_2} = A[23:16] + B[23:16] + 1'b1;

    assign {C0_3, Sum0_3} = A[31:24] + B[31:24] + 1'b0;
    assign {C1_3, Sum1_3} = A[31:24] + B[31:24] + 1'b1;

    always @(*) begin
        if (Cin) begin
            Sum_internal[7:0] = Sum1_0;
            Sel1 = C1_0;
        end else begin
            Sum_internal[7:0] = Sum0_0;
            Sel1 = C0_0;
        end

        if (Sel1) begin
            Sum_internal[15:8] = Sum1_1;
            Sel2 = C1_1;
        end else begin
            Sum_internal[15:8] = Sum0_1;
            Sel2 = C0_1;
        end

        if (Sel2) begin
            Sum_internal[23:16] = Sum1_2;
            Sel3 = C1_2;
        end else begin
            Sum_internal[23:16] = Sum0_2;
            Sel3 = C0_2;
        end

        if (Sel3) begin
            Sum_internal[31:24] = Sum1_3;
            Cout_internal = C1_3;
        end else begin
            Sum_internal[31:24] = Sum0_3;
            Cout_internal = C0_3;
        end
    end

    assign Sum = Sum_internal;
    assign Cout = Cout_internal;

endmodule