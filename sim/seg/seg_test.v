module seg_test();
reg       clk;
reg       reset_n;
reg  [5:0]sel;
reg [7:0]dig;

`ifdef SIM_DIG
initial begin
	clk = 1'b0;
	forever #10 clk = ~clk;
end

initial begin
	reset_n = 1'b0;
	#39 reset_n = 1'b1;
	#2000000 $finish;
end

initial begin
	sel[5:0] = 6'd0;
end

initial begin
	$fsdbDumpfile("dig.fsdb");
	$fsdbDumpvars(0,seg_test);
end


`endif

seg_decoder dig_top(
 .clk     (clk      ),
 .reset_n (reset_n  ),
 .sel     (sel[5:0] ),
 .dig     (dig[7:0] )
);
endmodule
