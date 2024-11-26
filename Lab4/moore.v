 module moore (Clock, w, Resetn, z);
 input Clock, w, Resetn;
 output z;
 reg [1:0] y;
 parameter A= 2'b00, B = 2'b01, C = 2'b10;
 always @(posedge Clock, negedge Resetn)
 begin
 if (Resetn == 0)
 y<=A;
 else
 case (y)
 A: if(w==0) y<=A;
 else
 y<=B;
 B: if(w==0) y<=A;
 else
 y<=C;
 C: if(w==0) y<=A;
 else
 y<=C;
 default: y <=2'bxx;
 endcase
 end
 assign z=(y==C);
 endmodule