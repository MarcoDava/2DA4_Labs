module alu3 (Clock, Reset, X,  Q);
input Clock, Reset;
input [2:0] X;
output [6:0] Q;
wire [2:0] w1,w2; 
wire [3:0] sum; 

reg3 reg1 (X, Clock, Reset, w1);
reg3 reg2 (X, Clock, Reset, w2);

ripple_adder (w1, w2, sum);

hex7seg decoder (sum, Q);

endmodule
