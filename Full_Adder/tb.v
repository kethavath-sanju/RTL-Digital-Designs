module Fulladder_tb();
	reg a;
	reg b;
	reg c;
	wire sum;
	wire carry;
	
Fulladder uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.sum(sum), 
		.carry(carry)
	);

	initial 
          begin
		   a = 0;
		   b = 0;
		   c = 0;
		   #10;
		   {a,b,c}=3'b101;
		   #20;
		   {a,b,c}=3'b011;
		    #20;
	      	    {a,b,c}=3'b100;
		     #100;
	  end
      
endmodule
