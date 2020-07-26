module buzzer_pwm_tb();
reg clk;
reg reset_n;
reg key;
wire buzzer_out;

`ifdef SIM_BUZZER
initial begin
	clk = 1'b0;
	forever #10 clk = ~clk;
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
	    key = 1'b1;
	#70 key = 1'b0;
	#15 key = 1'b1;
	#25 key = 1'b0;
	#300 key = 1'b1;
	#2000 key = 1'b0;
	#3000 key = 1'b1;
	#2000 key = 1'b0;
	#3000 key = 1'b1;
	#2000 key = 1'b0;
	#3000 key = 1'b1;

end 




initial begin
	$fsdbDumpfile("buzzer.fsdb");
	$fsdbDumpvars(0,buzzer_pwm_tb);
end

`endif

buzzer_pwm_top top(
 .clk        (clk       ),
 .reset_n    (reset_n   ),
 .key_in     (key       ),
 .buzzer_out (buzzer_out)
);

endmodule
