module led_new_tb();
reg clk;
reg reset_n;
reg key ;
wire [3:0]led;

`ifdef SIM_LED_NEW
initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial begin
	reset_n = 1'b0;
	#18 reset_n = 1'b1;
	$display("%t @@@ start!",$realtime);
	#200000;
	$display("%t @@@ finish!",$realtime);
	$finish;
end

initial begin
	    key = 1'b1;
	#70 key = 1'b0;
	#15 key = 1'b1;
	#25 key = 1'b0;
	#300 key = 1'b1;
	#15 key = 1'b0;
	#27 key = 1'b1;
	#80 key = 1'b0;
	#800 key = 1'b1;

end 




initial begin
	$fsdbDumpfile("led_new.fsdb");
	$fsdbDumpvars(0,led_new_tb);
end

`endif

key_top led_new0(
 .clk     (clk     ),
 .reset_n (reset_n ),
 .key    (key ),

 .led     (led[3:0])
);
endmodule
