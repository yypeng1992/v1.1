module div7_tb();
reg        clk;
reg        reset_n;

wire clk_out;
`ifdef SIM_DIV 
initial begin
	clk = 1'b0;
	 forever #10  clk = ~clk;
end

initial begin
	reset_n = 1'b0;
	#198 reset_n = 1'b1;
	$display("%t @@@ start !", $realtime);
	#20000;
	$display("%t @@@ finish!", $realtime);
	$finish;
end

initial begin
	$fsdbDumpfile("div7.fsdb");
	$fsdbDumpvars(0,div7_tb);
end

`endif

div_t7 div7(
 .clk     (clk     ),
 .reset_n (reset_n ),
 .clk_out (clk_out )
);

endmodule
