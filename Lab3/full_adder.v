module full_adder(a,b,c,sum1,sum2);
input a,b,c;
output sum1,sum2;
assign sum1=(a ^ b ^ c);
assign sum2=(a & b) | (c & (a ^ b));
endmodule

