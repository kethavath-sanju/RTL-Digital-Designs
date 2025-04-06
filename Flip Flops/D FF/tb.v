module d_ff_tb();
     reg clk;
	 reg d;
	 wire q;
	 d_ff uut(
	 .d(d),
	 .clk(clk),
	 .q(q)
	 );
	 initial begin
	     clk=1;
		
		 forever  #5 clk=~clk;
		 end
		 initial begin
		    d=0;
			#10
			d=1;
			#10
			d=0;
			#10
			d=1;
			#50;
			$finish;
			end
			endmodule
