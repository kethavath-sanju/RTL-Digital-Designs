module t_ff_tb;

	// Inputs
	reg t;
	reg clk;

	// Outputs
	wire q;

	// Instantiate the Unit Under Test (UUT)
	t_ff uut (
		.t(t), 
		.clk(clk), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		t = 0;
		clk = 1;
		
		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		t=1;
		#10;
		t=0;
		#10;
		t=1;
		#10;
		t=1;
		forever #10 clk=~clk;
		
		$finish;
	end
      
endmodule
