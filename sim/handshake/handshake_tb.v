module handshake_tb();
reg tx_clk;
reg rx_clk;
reg reset_n;
reg  [7:0]data_in;
wire [7:0]data_out;



`ifdef SIM_HANDSHAKE
initial begin
	tx_clk = 1'b0;
	forever #10 tx_clk = ~tx_clk;
end


initial begin
	rx_clk = 1'b0;
	forever #20 rx_clk = ~rx_clk;
end

initial begin
	data_in[7:0] = 8'd0;
	#80 data_in[7:0] = 8'hde;
	#160 data_in[7:0] = 8'd0;
end


initial begin
	reset_n = 1'b0;
	#38 reset_n = 1'b1;
	$display("%t @@@ start!",$realtime);
	#200000;
	$display("%t @@@ finish!",$realtime);
	$finish;
end





initial begin
	$fsdbDumpfile("handshake.fsdb");
	$fsdbDumpvars(0,handshake_tb);
end

`endif

top top(
 .tx_clk   (tx_clk    ),
 .rx_clk   (rx_clk    ),
 .reset_n  (reset_n   ),
 .data_in  (data_in   ),
 .data_out (data_out  )
);

endmodule
