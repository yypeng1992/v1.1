module load_store_tb();
reg        clk;
reg        reset_n;

wire       ce;
wire [31:0]pc;
wire [31:0]inst;

`ifdef SIM_LOAD_STORE
initial begin
	clk = 1'b0;
	 forever #10   clk = ~clk;
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
	$fsdbDumpfile("load_store.fsdb");
	$fsdbDumpvars(0,load_store_tb);
end

`endif

openmips_min_sopc sopc(
 .clk     (clk     ),
 .reset_n (reset_n )

);

endmodule
