module tb_binary_to_gray;
    parameter N = 4;

    reg  [N-1:0] binary_in;
    wire [N-1:0] gray_out;

    binary_to_gray #(N) uut (
        .binary_in(binary_in),
        .gray_out(gray_out)
    );

    initial begin
        $display("Binary\tGray");
        for (integer i = 0; i < 2**N; i = i + 1) begin
            binary_in = i;
            #1 $display("%b\t%b", binary_in, gray_out);
        end
        $finish;
    end
endmodule
