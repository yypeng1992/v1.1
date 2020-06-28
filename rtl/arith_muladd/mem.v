module mem(reset_n,	   ex_we,ex_waddr,ex_wdata,ex_whilo,ex_hi,ex_lo,
	   mem_we,mem_waddr,mem_wdata,mem_whilo,mem_hi,mem_lo,
	   ex_cnt,ex_hilo_tempt,mem_cnt,mem_hilo_tempt);
input            reset_n;

/////////////////////////////
////input from ex
/////////////////////////////
input            ex_we;
input      [4:0] ex_waddr;
input      [31:0]ex_wdata;
input            ex_whilo;
input      [31:0] ex_hi;
input      [31:0] ex_lo;

/////////////////////////////
////output to mem
/////////////////////////////
output reg       mem_we;
output reg [4:0] mem_waddr;
output reg [31:0]mem_wdata;
output reg       mem_whilo;
output reg [31:0] mem_hi;
output reg [31:0]mem_lo;


/////////////////////////////
////input and output with ctrl
/////////////////////////////
input     [4:0] ex_cnt;
input     [63:0]ex_hilo_tempt;
output reg [4:0]mem_cnt;
output reg [63:0]mem_hilo_tempt;

always @ (*) begin
	if(!reset_n ) begin
		mem_we              =  1'b0;
		mem_waddr   [4:0]   =  {5{1'b0}};
		mem_wdata   [31:0]  =  {32{1'b0}};
		mem_whilo           =  1'b0;
		mem_hi   [31:0]     =  {32{1'b0}};
		mem_lo   [31:0]     =  {32{1'b0}};
		mem_cnt      [4:0 ] =   {5{1'b0}};
		mem_hilo_tempt[63:0] =   {64{1'b0}};
	end else  begin
		mem_we              =  ex_we;
		mem_waddr   [4:0]   =  ex_waddr[4:0];
		mem_wdata   [31:0]  =  ex_wdata[31:0];
		mem_whilo           =  ex_whilo;
		mem_hi   [31:0]     =  ex_hi[31:0];
		mem_lo   [31:0]     =  ex_lo[31:0];
		mem_cnt      [4:0 ] =  ex_cnt      [4:0];
		mem_hilo_tempt[63:0] =  ex_hilo_tempt[63:0];
	end
end


endmodule
