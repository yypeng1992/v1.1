module sort_tb();
reg clk;
reg reset_n;

`define POS_CLK  @(posedge clk) #1;

reg En;
reg [31:0] Addr;
reg Wr;
reg [31:0] WrData;
wire [31:0] Data;

integer i ;

localparam MAX = 256;
localparam NUM = 31;
reg [31:0] mem [0:MAX];

`ifdef SIM_SORT
initial begin
	$fsdbDumpfile("sort.fsdb");
	$fsdbDumpvars(0,sort_tb);
end

initial begin
	clk=1'b0;
	forever #10 clk = ~clk;
end

initial begin
	reset_n = 1'b0;
	#507 reset_n = 1'b1;
end

initial begin
	mem_init;
	#400;
	En           = 'h0;
	Addr[31:0]   = 'h0;
	Wr           = 'h0;
	WrData[31:0] = 'h0;
	#500;
	`POS_CLK;
	$display("%t @@@ start to fill memory before sort!", $realtime);
	for(i=0; i<NUM; i=i+1) begin
		`POS_CLK;
		En           = 1'b1;
		Addr[31:0]   = `QUICK_ADDR_MEM_BASE + 4*i;
		Wr           = 1'b1;
		WrData[31:0] = mem[i];
	end
	$display("%t @@@ start to config num!", $realtime);
		`POS_CLK;
		En           = 1'b1;
		Addr[31:0]   = `QUICK_ADDR_NUM;
		Wr           = 1'b1;
		WrData[31:0] = NUM;
	$display("%t @@@ start to quick sort!", $realtime);
		`POS_CLK;
		En           = 1'b1;
		Addr[31:0]   = `QUICK_ADDR_START;
		Wr           = 1'b1;
		WrData[31:0] = 'd1;

	$display("%t @@@ start to wait!", $realtime);
		`POS_CLK;
		En           = 1'h1;
		Addr[31:0]   = `QUICK_ADDR_STATUS;
		Wr           = 'h0;
		WrData[31:0] = 'h0;

		wait(sort_tb.quick_sort_top.exit_done);
		`POS_CLK;
		En           = 1'h0;
		Addr[31:0]   = 'h0;

	$display("%t @@@ start to read memory!", $realtime);
	for(i=0; i<NUM; i=i+1) begin
		`POS_CLK;
		En           = 1'b1;
		Addr[31:0]   = `QUICK_ADDR_MEM_BASE + 4*i;
		Wr           = 1'b0;
	end
		`POS_CLK;
		En           = 'h0;
		Addr[31:0]   = 'h0;
		Wr           = 'h0;

		#100;
	$finish(2);
end
`endif

quick_sort_top#(256, 32, 8) quick_sort_top(
	.clk       (clk          ),
	.reset_n   (reset_n      ),
	.En        (En           ),
	.Addr      (Addr[31:0]   ),
	.Wr        (Wr           ),
	.WrData    (WrData[31:0] ),
	.Data      (Data[31:0]   )
);

task mem_init;
	mem[0] = 3;
	mem[1] = 13;
	mem[2] = 2;
	mem[3] = 8;
	mem[4] = 4;
	mem[5] = 1;
	mem[6] = 9;
	mem[7] = 24;
	mem[8] = 25;
	mem[9] = 21;
	mem[10] = 17;
	mem[11] = 11;
	mem[12] = 12;
	mem[13] = 10;
	mem[14] = 22;
	mem[15] = 28;
	mem[16] = 0;
	mem[17] = 7;
	mem[18] = 43;
	mem[19] = 53;
	mem[20] = 42;
	mem[21] = 48;
	mem[22] = 44;
	mem[23] = 41;
	mem[24] = 19;
	mem[25] = 34;
	mem[26] = 35;
	mem[27] = 31;
	mem[28] = 57;
	mem[29] = 26;
	mem[30] = 27;
endtask

endmodule
