module d_ff(input d, clk,
            output reg q);
  always @ (posedge clk)
    begin
      q <= d; 
    end
endmodule
