module dcache_tb();
reg       clk;
reg       reset_n;
reg       hsel  ;
reg  [1:0]htrans;
reg  [2:0]hsize ;
reg  [1:0]hburst ;
reg       hwrite;
reg [19:0]haddr ;
reg [31:0]hwdata;
wire [31:0]rdata ;
wire      hready_out;


logic     InitTagTableDone;
logic     TaskAllDone;

//defparam spi_flash_tb.memory.mem_access.initfile = "~/tree/v1.1/rtl/M25P16_VG_V12/initmemory.txt"; // modified by YYP at 2020-06-06
//defparam dcache_tb.memory.mem_access.initfile = "initmemory.txt"; // modified by YYP at 2020-06-07
`define PATH_TO_TAG_TABLE(x)  dcache_tb.test0.top.hit0.tag_table``x``
`define MEMORY                 mem
//--------------------------
// Initialize tag table
//--------------------------
integer line;
initial begin
	InitTagTableDone = 1'b0;
	#10;
	wait(reset_n);
	for(line=0; line<17; line=line+1) begin: InitTagTableMemory
		`PATH_TO_TAG_TABLE(0).mem[line] = {12'h0, 2'h0, 1'b0,1'b0};
		`PATH_TO_TAG_TABLE(1).mem[line] = {12'h0, 2'h1, 1'b0,1'b0};
		`PATH_TO_TAG_TABLE(2).mem[line] = {12'h0, 2'h2, 1'b0,1'b0};
		`PATH_TO_TAG_TABLE(3).mem[line] = {12'h0, 2'h3, 1'b0,1'b0};
	end
	#100;
	InitTagTableDone = 1'b1;
	$display("%t @@@ Initialize Tag Table Memory Done!!", $realtime);
end

`ifdef SIM_DCACHE
initial begin
        clk = 1'b0;
        forever #20 clk = ~clk;
end
`define CLK_POS  @(posedge clk); 

initial begin
        reset_n = 1'b0;
        #38 reset_n = 1'b1;
        $display("%t @@@ start!",$realtime);
	wait(InitTagTableDone);
	fork
	    begin:task_monitor
	    	wait(TaskAllDone);
		#10;
		disable delay_monitor;
	    end
	    begin:delay_monitor
        	#200000000;
		disable task_monitor;
	    end
	join
        $display("%t @@@ finish!",$realtime);
        $finish;
end

initial begin
	TaskAllDone = 0;
	InitAHBbus;
	#50;
	wait(reset_n);
	#100;
	ReadAHBbus(20'h20,32'h21);
	ReadAHBbus(20'h24,32'h25);
	ReadAHBbus(20'h30,32'h31);
	ReadAHBbus(20'h34,32'h35);
	ReadAHBbus(20'h20,32'h21);
	ReadAHBbus(20'h24,32'h25);

	TaskAllDone = 1;
end

task InitAHBbus;
begin
	UpdateAHBbus(1'b0, 2'd0, 3'h0, 2'd0, 1'b0, 20'h0, 32'h0);
end
endtask

task ReadAHBbus;
input [19:0] address;
input [31:0]wdata0;
begin
	`CLK_POS; UpdateAHBbus(1'b1, 2'd2, 3'h2, 2'd0, 1'b1, address[19:0], wdata0[31:0]);
	`CLK_POS; UpdateAHBbus(1'b1, 2'd1, 3'h2, 2'd0, 1'b0, 20'h0, 32'h0);
	wait(hready_out);
	InitAHBbus;
	`CLK_POS;
end
endtask

task UpdateAHBbus;
input       	sel  ;
input [1:0] 	trans;
input [2:0] 	size ; 
input [1:0] 	burst; 
input       	write;
input [19:0]	addr ; 
input [31:0]	wdata;
begin
	hsel         = sel        ;
	htrans[1:0]  = trans[1:0] ;
	hsize[2:0]   = size[2:0]  ;
	hburst[1:0]  = burst[1:0] ;
	hwrite       = write       ;
	haddr[19:0]  = addr[19:0] ;
	hwdata[31:0] = wdata[31:0]      ;
end
endtask



initial begin
        $fsdbDumpfile("dcache.fsdb");
        $fsdbDumpvars(0,dcache_tb);
	$fsdbDumpMDA();
end
`endif

dcache_test test0(
 .clk            (clk           ),
 .reset_n        (reset_n       ),
 .hsel           (hsel          ),
 .htrans         (htrans[1:0]   ),
 .hsize          (hsize [2:0]   ),
 .hburst          (hburst[1:0]    ),
 .hwrite         (hwrite         ),
 .haddr          (haddr[19:0]    ),
 .hwdata         (hwdata[31:0]   ),
 .hrdata          (rdata[31:0]    ),
 .hready_out     (hready_out     )
);



endmodule
