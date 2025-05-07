module Fulladder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
wire w1,w2,w3;
half_adder adder1(.a(a),.b(b),.sum(w1),.carry(w2));
half_adder adder2(.a(w1),.b(c),.sum(sum),.carry(w3));
or or1(carry,w2,w3);
endmodule

module half_adder(a,b,sum,carry);
input a,b;
output sum,carry;
   assign sum=a^b;
   assign carry=a&b;
endmodule
