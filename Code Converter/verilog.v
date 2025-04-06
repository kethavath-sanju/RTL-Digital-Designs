module binary_to_gray #(parameter N = 4) (
    input  [N-1:0] binary_in,
    output reg [N-1:0] gray_out
);
    integer i;

    always @(*) begin
        gray_out[N-1] = binary_in[N-1]; 
        for (i = N-2; i >= 0; i = i - 1) begin
            gray_out[i] = binary_in[i+1] ^ binary_in[i];
        end
    end
endmodule
