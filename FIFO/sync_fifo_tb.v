module sync_fifo_TB;
  reg clk, rst_n;
  reg w_en, r_en;
  reg [3:0] data_in;
  wire [3:0] data_out;
  wire full, empty;
  
  synchronous_fifo s_fifo(clk, rst_n, w_en, r_en, data_in, data_out, full, empty);
  
  always #5 clk = ~clk;


  initial begin

    clk = 0; rst_n = 0;
    w_en = 0; r_en = 0;
    #5 rst_n = 1;
  
    #10;
    w_en = 1 ;  
    data_in = 3'd0;
    
     
    #10;
    w_en = 1 ;  
    data_in = 3'd1;
    
    
    #10;
    w_en = 1 ;  
    data_in = 3'd2;
    

    #10;
    w_en = 1 ;  
    data_in = 3'd3;
    

    #10;
    w_en = 1 ;  
    data_in = 3'd4;
    

    #10;
    w_en = 1 ;  
    data_in = 3'd5;
    

    #10;
    w_en = 1 ;  
    data_in = 3'd6;
   

    #10;
    w_en = 1 ;  
    data_in = 3'd7;
    $monitor("w_en =%b r_en = %b data_in = %b empty = %b full = %b data_out = %b", w_en, r_en, data_in, empty, full, data_out);


    #10;
    w_en = 0 ;  

    #10;
    r_en = 1;
    
    #10;
    r_en = 1;
 
    #10;
    r_en = 1;
    
    #10;
    r_en = 1;
   
    #10;
    r_en = 1;
    
    #10;
    r_en = 1;
   
    #10;
    r_en = 1;
    
    #10;
    r_en = 1;
 
    #10;
    r_en = 1;
    $monitor("w_en =%b r_en = %b data_in = %b empty = %b full = %b data_out = %b", w_en, r_en, data_in, empty, full, data_out);


    $finish;
  end
 

//initial 
//   $monitor("w_en =%b r_en = %b data_in = %b empty = %b full = %b data_out = %b", w_en, r_en, data_in, empty, full, data_out);
  
  
endmodule
