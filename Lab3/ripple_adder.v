module ripple_adder(A, B, D);
input [0:2] A, B;
output [0:3] D;
wire w1, w2;
full_adder adder1(A[0], B[0], 1'b0, D[0], w1);
full_adder adder2(A[1], B[1], w1, D[1], w2);
full_adder adder3(A[2], B[2], w2, D[2], D[3]);

endmodule