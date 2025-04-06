module synchronous_fifo (
  input clk, rst_n,
  input w_en, r_en,
  input [3:0] data_in,
  output [3:0] data_out,
  output full, empty
);
  
  parameter DEPTH = 8;
  parameter DATA_WIDTH = 3;
  parameter PTR_WIDTH = $clog2(DEPTH);
  reg [PTR_WIDTH:0] w_ptr, r_ptr; // addition bit to detect full/empty condition
  reg [DATA_WIDTH-1:0] fifo[DEPTH-1:0];
  wire wrap_around;
  
  
  // To write data to FIFO
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      fifo[0] <= 3'd0;
      fifo[1] <= 3'd0;
      fifo[2] <= 3'd0;
      fifo[3] <= 3'd0;
      fifo[4] <= 3'd0;
      fifo[5] <= 3'd0;
      fifo[6] <= 3'd0;
      fifo[7] <= 3'd0;
      w_ptr <= 0;
    end
    else if(w_en & !full)begin
      fifo[w_ptr[PTR_WIDTH-1:0]] <= data_in;
      w_ptr <= w_ptr + 1;
    end
  end
  
  // To read data from FIFO
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      r_ptr <= 0;
      end
    else if(r_en & (!empty)) begin
      r_ptr <= r_ptr + 1;
    end
  end
  
  assign wrap_around = w_ptr[PTR_WIDTH] ^ r_ptr[PTR_WIDTH];   // To check MSB of write and read pointers are different
  
  //Full condition: MSB of write and read pointers are different and remainimg bits are same.
  assign full = wrap_around & (w_ptr[PTR_WIDTH-1:0] == r_ptr[PTR_WIDTH-1:0]);
  
  //Empty condition: All bits of write and read pointers are same.
  //assign empty = !wrap_around & (w_ptr[PTR_WIDTH-1:0] == r_ptr[PTR_WIDTH-1:0]);
  
  assign empty = (w_ptr == r_ptr);
  assign data_out = fifo[r_ptr[PTR_WIDTH-1:0]];
 

endmodule
