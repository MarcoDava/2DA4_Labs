module Prelab (x0, x1, y0, y1, f1, f2);
	input x0, x1, y0, y1;
	output f1,f2;
	assign f1 = (~x0|y0)&(x0|~x1|y0|y1)&(~x0|~x1|~y0|y1);
	assign f2 = (~x0&~x1&~y0&~y1)|(x0&~x1&y0&~y1)|(~x0&x1&~y0&y1)|(x0&x1&y0&y1);
endmodule