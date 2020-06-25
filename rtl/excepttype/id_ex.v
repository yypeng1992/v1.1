module id_ex(clk,reset_n,id_ex_stall,
	     id_alusel,id_aluop,id_reg1_data,id_reg2_data,id_we,id_waddr,
	     ex_alusel,ex_aluop,ex_reg1_data,ex_reg2_data,ex_we,ex_waddr,
	     id_is_in_delaylot,id_link_address,next_inst_in_delayslot_i,ex_is_in_delayslot,ex_link_address,is_in_delayslot_o,
	     id_inst,ex_inst,
	     id_cnt,ex_cnt,
	     flush,id_excepttype,id_current_inst_addr,ex_excepttype,ex_current_inst_addr);
input            clk;
input            reset_n;
input      [5:0 ]id_ex_stall;
input      [2:0 ]id_alusel;
input      [7:0 ]id_aluop;
input      [31:0]id_reg1_data;
input      [31:0]id_reg2_data;
input            id_we;
input      [4:0 ]id_waddr;

output reg [2:0 ]ex_alusel;
output reg [7:0 ]ex_aluop;
output reg [31:0]ex_reg1_data;
output reg [31:0]ex_reg2_data;
output reg       ex_we;
output reg [4:0 ]ex_waddr;

///////////////////////////////////////////////////////
///////input and output for jump_branch
///////////////////////////////////////////////////////
input                 id_is_in_delaylot;
input [31:0]          id_link_address;
input                 next_inst_in_delayslot_i;
output reg            ex_is_in_delayslot;
output reg[31:0]      ex_link_address;
output reg            is_in_delayslot_o;

///////////////////////////////////////////////////////
///////input and output for load_store
///////////////////////////////////////////////////////
input     [31:0]id_inst;
output reg[31:0]ex_inst;

///////////////////////////////////////////////////////
///////input and output for load_relative
///////////////////////////////////////////////////////
input     [1:0]id_cnt;
output reg[1:0] ex_cnt;

///////////////////////////////////////////////////////
///////input and output for excepttype
///////////////////////////////////////////////////////
input            flush;
input      [31:0]id_excepttype;
input      [31:0]id_current_inst_addr;
output reg [31:0]ex_excepttype;
output reg [31:0]ex_current_inst_addr;

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		ex_alusel   [2:0 ] <= {3{1'b0}};
		ex_aluop    [7:0 ] <= {8{1'b0}};
		ex_reg1_data[31:0] <= {32{1'b0}};
		ex_reg2_data[31:0] <= {32{1'b0}};
		ex_we              <= 1'b0;
		ex_waddr    [4:0 ] <= {5{1'b0}};
		ex_is_in_delayslot <= 1'b0;
		ex_link_address[31:0]<= {32{1'b0}};
		is_in_delayslot_o  <= 1'b0;
		ex_inst     [31:0] <= {32{1'b0}};
		ex_excepttype[31:0]<= {32{1'b0}};
		ex_current_inst_addr[31:0]<= {32{1'b0}};
	end else if(flush)begin
		ex_alusel   [2:0 ] <= {3{1'b0}};
		ex_aluop    [7:0 ] <= {8{1'b0}};
		ex_reg1_data[31:0] <= {32{1'b0}};
		ex_reg2_data[31:0] <= {32{1'b0}};
		ex_we              <= 1'b0;
		ex_waddr    [4:0 ] <= {5{1'b0}};
		ex_is_in_delayslot <= 1'b0;
		ex_link_address[31:0]<= {32{1'b0}};
		is_in_delayslot_o  <= 1'b0;
		ex_inst     [31:0] <= {32{1'b0}};
		ex_excepttype[31:0]<= {32{1'b0}};
		ex_current_inst_addr[31:0]<= {32{1'b0}};
	end else if(!id_ex_stall[2])begin
		ex_alusel   [2:0 ] <= id_alusel   [2:0 ]; 
		ex_aluop    [7:0 ] <= id_aluop    [7:0 ];
		ex_reg1_data[31:0] <= id_reg1_data[31:0]; 
		ex_reg2_data[31:0] <= id_reg2_data[31:0]; 
		ex_we              <= id_we             ;
		ex_waddr    [4:0 ] <= id_waddr    [4:0 ];
		ex_is_in_delayslot <= id_is_in_delaylot; 
                ex_link_address[31:0]<=id_link_address[31:0];
                is_in_delayslot_o  <= next_inst_in_delayslot_i;
		ex_inst     [31:0] <= id_inst     [31:0];
		ex_excepttype[31:0]<= id_excepttype[31:0];
		ex_current_inst_addr[31:0]<=id_current_inst_addr[31:0];
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		ex_cnt[1:0]        <= 2'b0;
	end else begin
		ex_cnt[1:0]        <= id_cnt[1:0];
	end
end
endmodule
