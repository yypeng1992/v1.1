module uart_test();
reg      clk;
reg      reset_n;
reg      rx_pin;
wire     tx_pin;

`ifdef SIM_UART

initial begin
	clk = 1'b0;
	forever #10 clk = ~clk;
end

initial begin
	reset_n = 1'b0;
	#45 reset_n = 1'b1;
	#2000000 $finish;
end


initial begin
	   rx_pin = 1'b1;
	   #172600 rx_pin = 1'b0;
	   #1500 rx_pin = 1'b1;
	   #1200 rx_pin = 1'b0;
	   #700 rx_pin = 1'b1;
	   #1200 rx_pin = 1'b0;
	   #800 rx_pin = 1'b1;
	
end

initial begin
	$fsdbDumpfile("uart.fsdb");
	$fsdbDumpvars(0,uart_test);
end

`endif


uart_top top0(
 .clk     (clk        ),
 .reset_n (reset_n    ),
 .rx_pin  (rx_pin   ),
 .tx_pin  (tx_pin   )
);

endmodule



