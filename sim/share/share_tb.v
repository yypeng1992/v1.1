module share_tb();
reg clk;
reg reset_n;

`define POS_CLK  @(posedge clk) #1;

reg push;
reg [8-1:0] push_data;
reg pop;
wire full;
wire [8-1:0] pop_data;
wire empty;
wire valid;
`ifdef SIM_SHARE
initial begin
	$fsdbDumpfile("share.fsdb");
	$fsdbDumpvars(0,share_tb);
end

initial begin
	clk=1'b0;
	forever #10 clk = ~clk;
end

initial begin
	reset_n = 1'b0;
	#507 reset_n = 1'b1;
	#100000; 
	$display("%t @@@ ready to exit from share testbench in system-verilog language", $realtime);
	$finish(2);
end

initial begin
	#400;
	push = 'h0;
	push_data[7:0] = 'h0;
	pop = 'h0;
	#500;
	push_data[7:0] = 'h0f;
	`POS_CLK;
	$display("%t @@@ start to test push!", $realtime);
	repeat(128) begin
		`POS_CLK;
		push = 1'b1;
		push_data[7:0] = push_data[7:0] + 'h1;
	end
	`POS_CLK;
	push = 1'b0;
	$display("%t @@@ end to test push!", $realtime);
	#100;

	$display("%t @@@ start to test pop!", $realtime);
	repeat(128) begin
		`POS_CLK;
		pop = 1'b1;
	end
	`POS_CLK;
	pop = 1'b0;
	$display("%t @@@ end to test pop!", $realtime);
end
`endif

stack_MxN#(128,8,7) stack_128x8(
        .clk      (clk           ),
        .reset_n  (reset_n       ),
        .push     (push          ),
        .push_data(push_data[7:0]),
        .full     (full          ),
        .pop      (pop           ),
        .pop_data (pop_data[7:0] ),
        .empty    (empty         ),
        .valid    (valid         )
);
endmodule
