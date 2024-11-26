module name(dx0,dx1,dx2,dx3,d0,d1,d2,d3,d4,d5,d6);
input dx0,dx1,dx2,dx3;
output d0,d1,d2,d3,d4,d5,d6;

assign d0=~(~dx1&dx0|~dx3&~dx2&~dx1);
assign d1=~(dx2&dx0|~dx2&~dx1);
assign d2=~(~dx1&dx0|dx2&dx0|dx2&~dx1|dx3);
assign d3=~(dx1&~dx0|dx2&~dx1&dx0);
assign d4=~(~dx3);
assign d5=~(~dx3&(dx2|~dx1|~dx0)&(~dx2|dx1|dx0));
assign d6=~(~dx3&~dx1&~dx0|dx1&dx0|~dx2&~dx3);
endmodule