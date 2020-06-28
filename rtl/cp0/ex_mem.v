module ex_mem(clk,reset_n,ex_mem_stall,
	      ex_we,ex_waddr,ex_wdata,ex_whilo,ex_hi,ex_lo,ex_cnt,ex_hilo_tempt,ex_minuend,
	      mem_we,mem_waddr,mem_wdata,mem_whilo,mem_hi,mem_lo,mem_cnt,mem_hilo_tempt,mem_minuend,
	      ex_alusel,ex_aluop,ex_ram_addr,ex_reg2,mem_alusel,mem_aluop,mem_ram_addr,mem_reg2,
	      ex_cp0_reg_we,ex_cp0_reg_write_addr,ex_cp0_reg_data,mem_cp0_reg_we,mem_cp0_reg_write_addr,mem_cp0_reg_data);
input           clk;
input           reset_n;
input     [5:0 ]ex_mem_stall;
input           ex_we;
input     [4:0 ]ex_waddr;
input     [31:0]ex_wdata;
input           ex_whilo;
input     [31:0]ex_hi;
input     [31:0]ex_lo;
input     [5:0 ]ex_cnt;
input     [63:0]ex_hilo_tempt;
input     [63:0]ex_minuend;

output reg      mem_we;
output reg[4:0 ]mem_waddr;
output reg[31:0]mem_wdata;
output reg      mem_whilo;
output reg[31:0]mem_hi;
output reg[31:0]mem_lo;
output reg[5:0 ]mem_cnt;
output reg[63:0]mem_hilo_tempt;
output reg[63:0]mem_minuend;

//////////////////////////////////////////////////
///////input and output for load_store
//////////////////////////////////////////////////
input     [2 :0] ex_alusel;
input     [7 :0] ex_aluop;
input     [31:0] ex_ram_addr;
input     [31:0] ex_reg2;
output reg[2 :0] mem_alusel;
output reg[7 :0] mem_aluop;
output reg[31:0] mem_ram_addr;
output reg[31:0] mem_reg2;

//////////////////////////////////////////////////
///////input and output for cp0
//////////////////////////////////////////////////
input             ex_cp0_reg_we;
input      [4:0]  ex_cp0_reg_write_addr;
input      [31:0] ex_cp0_reg_data;
output reg        mem_cp0_reg_we;
output reg [4 :0] mem_cp0_reg_write_addr;
output reg [31:0] mem_cp0_reg_data;

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		mem_we          <= {1'b0};
                mem_waddr[4:0 ] <= {5{1'b0}};
                mem_wdata[31:0] <= {32{1'b0}};
                mem_whilo       <= 1'b0;
                mem_hi   [31:0] <= {32{1'b0}};
                mem_lo   [31:0] <= {32{1'b0}};
		mem_cnt  [5:0 ] <= {6{1'b0}};
		mem_hilo_tempt[63:0] <= {64{1'b0}};
		mem_minuend[63:0]<={64{1'b0}};
		mem_alusel[2:0] <= {3{1'b0}};
		mem_aluop [7:0] <= {8{1'b0}};
		mem_ram_addr[31:0] <= {32{1'b0}};
		mem_reg2 [31:0] <= {32{1'b0}};
                mem_cp0_reg_we  <= 1'b0;
                mem_cp0_reg_write_addr[4:0] <= {5{1'b0}};
                mem_cp0_reg_data[31:0]      <= {32{1'b0}};
	end else if(!ex_mem_stall[4]) begin
		mem_we          <= ex_we;         
                mem_waddr[4:0 ] <= ex_waddr[4:0 ]; 
                mem_wdata[31:0] <= ex_wdata[31:0];
                mem_whilo       <= ex_whilo;       
                mem_hi   [31:0] <= ex_hi   [31:0];
                mem_lo   [31:0] <= ex_lo   [31:0];
		mem_cnt  [5:0 ] <= ex_cnt  [5:0 ];
		mem_hilo_tempt[63:0] <= ex_hilo_tempt[63:0];
		mem_minuend[63:0]<=ex_minuend[63:0];
		mem_alusel[2:0] <= ex_alusel[2:0];
		mem_aluop [7:0] <= ex_aluop [7:0];
		mem_ram_addr[31:0] <= ex_ram_addr[31:0];
		mem_reg2 [31:0] <= ex_reg2[31:0];
                mem_cp0_reg_we  <= ex_cp0_reg_we;
                mem_cp0_reg_write_addr[4:0] <= ex_cp0_reg_write_addr[4:0];
                mem_cp0_reg_data[31:0]      <= ex_cp0_reg_data[31:0];
	end
end

endmodule
