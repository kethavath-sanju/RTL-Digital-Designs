module t_ff(input t, clk,
            output reg q);
  always @ (posedge clk)
    begin
     if(t==0)
	 q=0;
	 else
	 q=~q;
      	 
    end
endmodule
