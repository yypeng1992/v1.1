module wb(clk,reset_n,wb_stall,flush,
	  mem_we,mem_waddr,mem_wdata,mem_whilo,mem_hi,mem_lo,
	  wb_we,wb_waddr,wb_wdata,wb_whilo,wb_hi,wb_lo,
	  mem_LLbit_we,mem_LLbit_value,wb_LLbit_we,wb_LLbit_value,
	  mem_cp0_reg_we,mem_cp0_reg_write_addr,mem_cp0_reg_data,wb_cp0_reg_we,wb_cp0_reg_write_addr,wb_cp0_reg_data);
input            clk;
input            reset_n;
input   [5:0]    wb_stall;
input            flush;

/////////////////////////////////
////input from mem
/////////////////////////////////
input            mem_we;
input      [4:0] mem_waddr;
input      [31:0]mem_wdata;
input            mem_whilo;
input      [31:0] mem_hi;
input      [31:0]mem_lo;

/////////////////////////////////
////output to wb
/////////////////////////////////
output reg       wb_we;
output reg [4:0] wb_waddr;
output reg [31:0]wb_wdata;
output reg       wb_whilo;
output reg [31:0] wb_hi;
output reg [31:0]wb_lo;


/////////////////////////////////
////for ll and sc
/////////////////////////////////
input      mem_LLbit_we;
input      mem_LLbit_value;
output reg wb_LLbit_we;
output reg wb_LLbit_value;

/////////////////////////////////
////input and output for cp0
/////////////////////////////////
input            mem_cp0_reg_we;
input      [4 :0]mem_cp0_reg_write_addr;
input      [31:0]mem_cp0_reg_data;
output reg       wb_cp0_reg_we;
output reg [4 :0]wb_cp0_reg_write_addr;
output reg [31:0]wb_cp0_reg_data;

always @ (posedge clk or negedge reset_n ) begin
	if(!reset_n ) begin
		wb_we         <=  1'b0;
		wb_waddr[4:0] <=  {5{1'b0}};
		wb_wdata[31:0]<=  {32{1'b0}};
		wb_whilo      <=  1'b0;
		wb_hi   [31:0] <=  {32{1'b0}};
		wb_lo  [31:0] <=  {32{1'b0}};
		wb_LLbit_we   <= 1'b0;
		wb_LLbit_value<= 1'b0;
                wb_cp0_reg_we <= 1'b0;
                wb_cp0_reg_write_addr[4:0] <= {5{1'b0}};
                wb_cp0_reg_data[31:0]      <= {32{1'b0}};
	end else if(flush)begin
		wb_we         <=  1'b0;
		wb_waddr[4:0] <=  {5{1'b0}};
		wb_wdata[31:0]<=  {32{1'b0}};
		wb_whilo      <=  1'b0;
		wb_hi   [31:0] <=  {32{1'b0}};
		wb_lo  [31:0] <=  {32{1'b0}};
		wb_LLbit_we   <= 1'b0;
		wb_LLbit_value<= 1'b0;
                wb_cp0_reg_we <= 1'b0;
                wb_cp0_reg_write_addr[4:0] <= {5{1'b0}};
                wb_cp0_reg_data[31:0]      <= {32{1'b0}};

	end else if(!wb_stall[5])begin
		wb_we         <=  mem_we;
		wb_waddr[4:0] <=  mem_waddr[4:0];
		wb_wdata[31:0]<=  mem_wdata[31:0];
		wb_whilo      <=  mem_whilo;
		wb_hi   [31:0] <=  mem_hi[31:0];
		wb_lo  [31:0] <=  mem_lo[31:0];
		wb_LLbit_we   <= mem_LLbit_we;
		wb_LLbit_value<= mem_LLbit_value;
                wb_cp0_reg_we <= mem_cp0_reg_we;
                wb_cp0_reg_write_addr[4:0] <= mem_cp0_reg_write_addr[4:0];
                wb_cp0_reg_data[31:0]      <= mem_cp0_reg_data[31:0];
	end
end


endmodule
