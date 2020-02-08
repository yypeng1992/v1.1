
module led_tb();
reg clk;
reg rst;
reg key_in;


wire [3:0]led;

initial begin
	key_in = 1'b1;
	#20 key_in = 1'b0;
	#10 key_in = 1'b1;
	#40 key_in = 1'b0;
	#30 key_in = 1'b1;
	#10 key_in = 1'b0;
	#10 key_in = 1'b1;
	#100 key_in = 1'b0;
end

initial begin
	clk = 1'b0;
	forever #10 clk = ~clk;
end 

`ifdef SIM_LED
initial begin
	rst = 1'b0;
	#15 rst = 1'b1;
	#20000 $finish;
end
`endif


led_top top0(
 .rst(rst),
 .clk(clk),
 .key_in(key_in),
 .led(led)
);

endmodule

