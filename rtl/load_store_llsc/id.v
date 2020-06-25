module id(reset_n,pc_i,inst_i,stallreg_from_id,inst_o,
          reg1_data_i,reg2_data_i,
	  ex_we,ex_waddr,ex_wdata,
	  mem_we,mem_waddr,mem_wdata,
	  aluop_o,alusel_o,reg1_data_o,reg2_data_o,wreg_o,waddr_o,
	  reg1_read_o,reg1_addr_o,reg2_read_o,reg2_addr_o,
	  is_in_delayslot_i,is_in_delayslot_o,link_addr_o,next_inst_in_delayslot_o,branch_flag_o,branch_target_address_o);
////////////////////////////////////////
///input from pc
////////////////////////////////////////

input              reset_n;
input       [31:0] pc_i;
input       [31:0] inst_i;

////////////////////////////////////////
///contact with ctrl
////////////////////////////////////////
output            stallreg_from_id;

////////////////////////////////////////
///input from ep
////////////////////////////////////////
input             ex_we;
input [4:0]       ex_waddr;
input [31:0]      ex_wdata;


////////////////////////////////////////
///input from mem
////////////////////////////////////////
input            mem_we;
input [4:0]      mem_waddr;
input [31:0]     mem_wdata;

////////////////////////////////////////
///input from regfile
////////////////////////////////////////
input       [31:0] reg1_data_i;
input       [31:0] reg2_data_i;

////////////////////////////////////////
///output to ex
////////////////////////////////////////
output reg  [2:0]  alusel_o;
output reg  [7:0]  aluop_o;
output reg  [31:0] reg1_data_o;
output reg  [31:0] reg2_data_o;
output reg         wreg_o;
output reg  [4:0]  waddr_o;

////////////////////////////////////////
///output to regfile
////////////////////////////////////////
output reg         reg1_read_o;
output reg  [4:0]  reg1_addr_o;
output reg         reg2_read_o;
output reg  [4:0]  reg2_addr_o;
 
reg [31:0] imm;

////////////////////////////////////////
///input and output for jump
////////////////////////////////////////
input              is_in_delayslot_i;
output reg         next_inst_in_delayslot_o;
output reg         branch_flag_o;
output reg[31:0]   branch_target_address_o;
output reg         is_in_delayslot_o;
output reg[31:0]    link_addr_o;



////////////////////////////////////////
/// output for load_store
////////////////////////////////////////
output [31:0]inst_o;
assign inst_o[31:0] = inst_i[31:0];

////////////////////////////////////////
///for jump
////////////////////////////////////////
wire [31:0]pc_plus_4;
wire [31:0]pc_plus_8;
wire [27:0]j_target;
wire [17:0]offset_left_2;
wire [31:0]branch_target_tempt;
wire [31:0]branch_target;
assign pc_plus_4[31:0]     = pc_i[31:0] + 32'd4;
assign pc_plus_8[31:0]     = pc_i[31:0] + 32'd8;
assign j_target[27:0]      = inst_i[25:0] << 2;
assign offset_left_2[17:0] = inst_i[15:0] << 2;
assign branch_target_tempt[31:0] = inst_i[15] ? {14'h3fff,offset_left_2[17:0]} : {offset_left_2[17:0]};
assign branch_target[31:0] = branch_target_tempt[31:0] + pc_plus_4[31:0];

always @ (*) begin
	if(!reset_n ) begin
		alusel_o[2:0]     =  {3{1'b0}};
		aluop_o [7:0]     =  {8{1'b0}};
		wreg_o            =  1'b0;
		waddr_o           =  {5{1'b0}};
		reg1_read_o       =  1'b0;
		reg1_addr_o[4:0]  =  {5{1'b0}};  
		reg2_read_o       =  1'b0;
		reg2_addr_o[4:0]  =  {5{1'b0}};
		imm               =  {32{1'b0}};
		next_inst_in_delayslot_o      = 1'b0;
		branch_flag_o     = 1'b0;
		branch_target_address_o[31:0] = {32{1'b0}};
		link_addr_o[31:0] = {32{1'b0}};
	end else  begin
		reg1_addr_o[4:0]  =  inst_i[25:21];
		reg2_addr_o[4:0]  =  inst_i[20:16];
		case(inst_i[31:26]) 		
		        ////////////////////////////////////////
			/////ori
			////////////////////////////////////////
			6'b001101:begin
        		        waddr_o           =  inst_i[20:16];
                       		alusel_o[2:0]     =  3'b001;
				aluop_o [7:0]     =  8'b00001101;
                       	 	wreg_o            =  1'b1;
                        	reg1_read_o       =  1'b1;
                        	reg2_read_o       =  1'b0;
				imm[31:0]         =  {16'd0,inst_i[15:0]};
				next_inst_in_delayslot_o      = 1'b0;
				branch_flag_o     = 1'b0;
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0] = {32{1'b0}};
			end
			////////////////////////////////////////
			/////andi
			////////////////////////////////////////
			6'b001100:begin
        		        waddr_o           =  inst_i[20:16];
                       		alusel_o[2:0]     =  3'b001;
				aluop_o [7:0]     =  8'b00001100;
                       	 	wreg_o            =  1'b1;
                        	reg1_read_o       =  1'b1;
                        	reg2_read_o       =  1'b0;
				imm[31:0]         =  {16'd0,inst_i[15:0]};
				next_inst_in_delayslot_o      = 1'b0;
				branch_flag_o     = 1'b0;
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0] = {32{1'b0}};
			end
			////////////////////////////////////////
			/////xori
			////////////////////////////////////////
			6'b001110:begin
        		        waddr_o           =  inst_i[20:16];
                       		alusel_o[2:0]     =  3'b001;
				aluop_o [7:0]     =  8'b00001110;
                       	 	wreg_o            =  1'b1;
                        	reg1_read_o       =  1'b1;
                        	reg2_read_o       =  1'b0;
				imm[31:0]         =  {16'd0,inst_i[15:0]};
				next_inst_in_delayslot_o      = 1'b0;
				branch_flag_o     = 1'b0;
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0] = {32{1'b0}};
			end
			////////////////////////////////////////
			/////lui
			////////////////////////////////////////
			6'b001111:begin
        		        waddr_o           =  inst_i[20:16];
                       		alusel_o[2:0]     =  3'b001;
				aluop_o [7:0]     =  8'b00001111;
                       	 	wreg_o            =  1'b1;
                        	reg1_read_o       =  1'b1;
                        	reg2_read_o       =  1'b0;
				imm[31:0]         =  {16'd0,inst_i[15:0]};
				next_inst_in_delayslot_o      = 1'b0;
				branch_flag_o     = 1'b0;
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0] = {32{1'b0}};
			end
			////////////////////////////////////////
			/////pref
			////////////////////////////////////////
			6'b110011:begin
                       		alusel_o[2:0]     =  3'b000;
				aluop_o [7:0]     =  8'b00110011;
                       	 	wreg_o            =  1'b0;
                        	reg1_read_o       =  1'b0;
                        	reg2_read_o       =  1'b0;
				next_inst_in_delayslot_o      = 1'b0;
				branch_flag_o     = 1'b0;
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0] = {32{1'b0}};
			end
			////////////////////////////////////////
			/////addi
			////////////////////////////////////////
			6'b001000:begin
        		        waddr_o           =  inst_i[20:16];
                       		alusel_o[2:0]     =  3'b100;
				aluop_o [7:0]     =  8'b00001000;
                       	 	wreg_o            =  1'b1;
                        	reg1_read_o       =  1'b1;
                        	reg2_read_o       =  1'b0;
				if(inst_i[15]==1)begin
					imm[31:0]         =  {16'hffff,inst_i[15:0]};
				end else begin
					imm[31:0]         =  {16'h0,inst_i[15:0]};
				end
				next_inst_in_delayslot_o      = 1'b0;
				branch_flag_o     = 1'b0;
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0] = {32{1'b0}};
			end
			////////////////////////////////////////
			/////addiu
			////////////////////////////////////////
			6'b001001:begin
        		        waddr_o           =  inst_i[20:16];
                       		alusel_o[2:0]     =  3'b100;
				aluop_o [7:0]     =  8'b00001001;
                       	 	wreg_o            =  1'b1;
                        	reg1_read_o       =  1'b1;
                        	reg2_read_o       =  1'b0;
				if(inst_i[15]==1)begin
					imm[31:0]         =  {16'hffff,inst_i[15:0]};
				end else begin
					imm[31:0]         =  {16'h0,inst_i[15:0]};
				end
				next_inst_in_delayslot_o      = 1'b0;
				branch_flag_o     = 1'b0;
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0] = {32{1'b0}};
			end
			////////////////////////////////////////
			/////slti
			////////////////////////////////////////
			6'b001010:begin
        		        waddr_o           =  inst_i[20:16];
                       		alusel_o[2:0]     =  3'b100;
				aluop_o [7:0]     =  8'b00001010;
                       	 	wreg_o            =  1'b1;
                        	reg1_read_o       =  1'b1;
                        	reg2_read_o       =  1'b0;
				if(inst_i[15]==1)begin
					imm[31:0]         =  {16'hffff,inst_i[15:0]};
				end else begin
					imm[31:0]         =  {16'h0,inst_i[15:0]};
				end
				next_inst_in_delayslot_o      = 1'b0;
				branch_flag_o     = 1'b0;
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0] = {32{1'b0}};
			end
			////////////////////////////////////////
			/////sltiu
			////////////////////////////////////////
			6'b001011:begin
        		        waddr_o           =  inst_i[20:16];
                       		alusel_o[2:0]     =  3'b100;
				aluop_o [7:0]     =  8'b00001011;
                       	 	wreg_o            =  1'b1;
                        	reg1_read_o       =  1'b1;
                        	reg2_read_o       =  1'b0;
				if(inst_i[15]==1)begin
					imm[31:0]         =  {16'hffff,inst_i[15:0]};
				end else begin
					imm[31:0]         =  {16'h0,inst_i[15:0]};
				end
				next_inst_in_delayslot_o      = 1'b0;
				branch_flag_o     = 1'b0;
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0] = {32{1'b0}};
			end
			////////////////////////////////////////
			/////j
			////////////////////////////////////////
			6'b000010:begin
        			waddr_o           =  inst_i[15:11];
        	        	alusel_o[2:0]     =  3'b101;
				aluop_o [7:0]     =  8'b00000010;
        	        	wreg_o            =  1'b0;
        	        	reg1_read_o       =  1'b0;
        	       		reg2_read_o       =  1'b0;
				branch_flag_o     =  1'b1;
				branch_target_address_o[31:0] = {pc_plus_4[31:28],j_target[27:0]};
				next_inst_in_delayslot_o      = 1'b1; 
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////jal
			////////////////////////////////////////
			6'b000011:begin
        			waddr_o           =  5'b11111;
        	        	alusel_o[2:0]     =  3'b101;
				aluop_o [7:0]     =  8'b00000011;
        	        	wreg_o            =  1'b1;
        	        	reg1_read_o       =  1'b0;
        	       		reg2_read_o       =  1'b0;
				branch_flag_o     =  1'b1;
				branch_target_address_o[31:0] = {pc_plus_4[31:28],j_target[27:0]};
				next_inst_in_delayslot_o      = 1'b1; 
				link_addr_o[31:0]  = pc_plus_8[31:0];
			end
			////////////////////////////////////////
			/////beq
			////////////////////////////////////////
			6'b000100:begin
        			waddr_o           =  inst_i[15:11];
        	        	alusel_o[2:0]     =  3'b101;
				aluop_o [7:0]     =  8'b00000100;
        	        	wreg_o            =  1'b0;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b1;
				if(reg1_data_o[31:0]==reg2_data_o[31:0])begin
					branch_flag_o     =  1'b1;
					branch_target_address_o[31:0] = branch_target[31:0];
					next_inst_in_delayslot_o      = 1'b1; 
				end else begin
					branch_flag_o     =  1'b0;
					next_inst_in_delayslot_o     = 1'b0; 
				end
				link_addr_o[4:0]  = {5{1'b0}};
			end
			////////////////////////////////////////
			/////bgtz
			////////////////////////////////////////
			6'b000111:begin
        			waddr_o           =  inst_i[15:11];
        	        	alusel_o[2:0]     =  3'b101;
				aluop_o [7:0]     =  8'b00000111;
        	        	wreg_o            =  1'b0;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b0;
				if(!reg1_data_o[31])begin
					branch_flag_o     =  1'b1;
					branch_target_address_o[31:0] = branch_target;
					next_inst_in_delayslot_o      = 1'b1; 
				end else begin
					branch_flag_o     =  1'b0;
					next_inst_in_delayslot_o     = 1'b0; 
				end
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////blez
			////////////////////////////////////////
			6'b000110:begin
        			waddr_o           =  inst_i[15:11];
        	        	alusel_o[2:0]     =  3'b101;
				aluop_o [7:0]     =  8'b00000110;
        	        	wreg_o            =  1'b0;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b0;
				if((reg1_data_o[31]) || (reg1_data_o==32'd0))begin
					branch_flag_o     =  1'b1;
					branch_target_address_o[31:0] = branch_target;
					next_inst_in_delayslot_o      = 1'b1; 
				end else begin
					branch_flag_o     =  1'b0;
					next_inst_in_delayslot_o     = 1'b0; 
				end
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////bne
			////////////////////////////////////////
			6'b000101:begin
        			waddr_o           =  inst_i[15:11];
        	        	alusel_o[2:0]     =  3'b101;
				aluop_o [7:0]     =  8'b00000101;
        	        	wreg_o            =  1'b0;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b1;
				if(reg1_data_o != reg2_data_o )begin
					branch_flag_o     =  1'b1;
					branch_target_address_o[31:0] = branch_target;
					next_inst_in_delayslot_o      = 1'b1; 
				end else begin
					branch_flag_o     =  1'b0;
					next_inst_in_delayslot_o     = 1'b0; 
				end
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////lb
			////////////////////////////////////////
			6'b100000:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00100000;
        	        	wreg_o            =  1'b1;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b0;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////lbu
			////////////////////////////////////////
			6'b100100:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00100100;
        	        	wreg_o            =  1'b1;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b0;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////lh
			////////////////////////////////////////
			6'b100001:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00100001;
        	        	wreg_o            =  1'b1;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b0;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////lhu
			////////////////////////////////////////
			6'b100101:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00100101;
        	        	wreg_o            =  1'b1;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b0;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////lw
			////////////////////////////////////////
			6'b100011:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00100011;
        	        	wreg_o            =  1'b1;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b0;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////sb
			////////////////////////////////////////
			6'b101000:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00101000;
        	        	wreg_o            =  1'b0;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b1;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////sh
			////////////////////////////////////////
			6'b101001:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00101001;
        	        	wreg_o            =  1'b0;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b1;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////sw
			////////////////////////////////////////
			6'b101011:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00101011;
        	        	wreg_o            =  1'b0;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b1;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////lwl
			////////////////////////////////////////
			6'b100010:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00100010;
        	        	wreg_o            =  1'b1;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b0;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////lwr
			////////////////////////////////////////
			6'b100110:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00100110;
        	        	wreg_o            =  1'b1;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b0;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////swl
			////////////////////////////////////////
			6'b101010:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00101010;
        	        	wreg_o            =  1'b0;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b1;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////swr
			////////////////////////////////////////
			6'b101110:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00101110;
        	        	wreg_o            =  1'b0;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b1;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////ll
			////////////////////////////////////////
			6'b110000:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00110000;
        	        	wreg_o            =  1'b1;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b0;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
			////////////////////////////////////////
			/////sc
			////////////////////////////////////////
			6'b111000:begin
        			waddr_o           =  inst_i[20:16];
        	        	alusel_o[2:0]     =  3'b110;
				aluop_o [7:0]     =  8'b00111000;
        	        	wreg_o            =  1'b1;
        	        	reg1_read_o       =  1'b1;
        	       		reg2_read_o       =  1'b1;
				branch_flag_o     =  1'b0;
				next_inst_in_delayslot_o     = 1'b0; 
				branch_target_address_o[31:0] = {32{1'b0}};
				link_addr_o[31:0]  = {32{1'b0}};
			end
		
//////////////////////////////////////////////////////////////////////////////////////
//////////SPECIAL
//////////////////////////////////////////////////////////////////////////////////////
			6'b000000:begin
				case(inst_i[5:0])
					////////////////////////////////////////
					/////and
					////////////////////////////////////////
					6'b100100:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b001;
						aluop_o [7:0]     =  8'b00100100;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					////////////////////////////////////////
					/////or
					////////////////////////////////////////
					6'b100101:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b001;
						aluop_o [7:0]     =  8'b00100101;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					////////////////////////////////////////
					/////xor
					////////////////////////////////////////
					6'b100110:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b001;
						aluop_o [7:0]     =  8'b00100110;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					////////////////////////////////////////
					/////xor
					////////////////////////////////////////
					6'b100111:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b001;
						aluop_o [7:0]     =  8'b00100111;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					////////////////////////////////////////
					/////sll
					////////////////////////////////////////
					6'b000000:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b010;
						aluop_o [7:0]     =  8'h00;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b0;
        	        	        	reg2_read_o       =  1'b1;
						imm[31:0]         =  {27'd0,inst_i[10:6]};
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					////////////////////////////////////////
					/////srl
					////////////////////////////////////////
					6'b000010:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b010;
						aluop_o [7:0]     =  8'b00000010;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b0;
        	        	        	reg2_read_o       =  1'b1;
						imm[31:0]         =  {27'd0,inst_i[10:6]};
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					////////////////////////////////////////
					/////sra
					////////////////////////////////////////
					6'b000011:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b010;
						aluop_o [7:0]     =  8'b00000011;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b0;
        	        	        	reg2_read_o       =  1'b1;
						imm[31:0]         =  {27'd0,inst_i[10:6]};
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////sllv
					////////////////////////////////////////
					6'b000100:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b010;
						aluop_o [7:0]     =  8'b00000100;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////srlv
					////////////////////////////////////////
					6'b000110:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b010;
						aluop_o [7:0]     =  8'b00000110;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////srav
					////////////////////////////////////////
					6'b000111:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b010;
						aluop_o [7:0]     =  8'b00000111;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////sync
					////////////////////////////////////////
					6'b001111:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b000;
						aluop_o [7:0]     =  8'b00001111;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b0;
        	        	        	reg2_read_o       =  1'b0;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////movn
					////////////////////////////////////////
					6'b001011:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b011;
						aluop_o [7:0]     =  8'b00001011;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////movz
					////////////////////////////////////////
					6'b001010:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b011;
						aluop_o [7:0]     =  8'b00001010;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////mfhi
					////////////////////////////////////////
					6'b010000:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b011;
						aluop_o [7:0]     =  8'b00010000;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b0;
        	        	        	reg2_read_o       =  1'b0;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////mflo
					////////////////////////////////////////
					6'b010010:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b011;
						aluop_o [7:0]     =  8'b00010010;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b0;
        	        	        	reg2_read_o       =  1'b0;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////mthi
					////////////////////////////////////////
					6'b010001:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b011;
						aluop_o [7:0]     =  8'b00010001;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b0;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////mtlo
					////////////////////////////////////////
					6'b010011:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b011;
						aluop_o [7:0]     =  8'b00010011;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b0;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////add
					////////////////////////////////////////
					6'b100000:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b00100000;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////addu
					////////////////////////////////////////
					6'b100001:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b00100001;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////sub
					////////////////////////////////////////
					6'b100010:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b00100010;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////subu
					////////////////////////////////////////
					6'b100011:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b00100011;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////slt
					////////////////////////////////////////
					6'b101010:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b00101010;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////sltu
					////////////////////////////////////////
					6'b101011:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b00101011;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////mult
					////////////////////////////////////////
					6'b011000:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b00011000;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					////////////////////////////////////////
					/////multu
					////////////////////////////////////////
					6'b011001:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b00011001;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					////////////////////////////////////////
					/////div
					////////////////////////////////////////
					6'b011010:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b00011010;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					////////////////////////////////////////
					/////divu
					////////////////////////////////////////
					6'b011011:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b00011011;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					////////////////////////////////////////
					/////jr
					////////////////////////////////////////
					6'b001000:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b101;
						aluop_o [7:0]     =  8'b00001000;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b0;
						branch_flag_o     =  1'b1;
						branch_target_address_o[31:0] = reg1_data_o;
						next_inst_in_delayslot_o      = 1'b1; 
						link_addr_o[31:0]  = {32{1'b0}}; 
					end
					////////////////////////////////////////
					/////jalr
					////////////////////////////////////////
					6'b001001:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b101;
						aluop_o [7:0]     =  8'b00001001;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b0;
						branch_flag_o     =  1'b1;
						branch_target_address_o[31:0] = reg1_data_o[31:0];
						next_inst_in_delayslot_o      = 1'b1; 
						link_addr_o[31:0]  = pc_plus_8[31:0]; 
					end
				endcase
				end

//////////////////////////////////////////////////////////////////////////////////////
///////////SPECIAL2
//////////////////////////////////////////////////////////////////////////////////////
				6'b011100:begin
					case(inst_i[5:0])
					/////////////////////////////////
					/////clz
					////////////////////////////////////////
					6'b100000:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b11100000;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b0;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////clo
					////////////////////////////////////////
					6'b100001:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b11100001;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b0;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////mul
					////////////////////////////////////////
					6'b000010:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b00000010;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////madd
					////////////////////////////////////////
					6'b000000:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b11000000;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////maddu
					////////////////////////////////////////
					6'b000001:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b11000001;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////msub
					////////////////////////////////////////
					6'b000100:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b11000100;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
					/////////////////////////////////
					/////msubu
					////////////////////////////////////////
					6'b000101:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b11000101;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
					end
						
					endcase
				end
//////////////////////////////////////////////////////////////////////////////////////
///////////REGIMM
//////////////////////////////////////////////////////////////////////////////////////
			6'b000001:begin
				case(inst_i[20:16])
					////////////////////////////////////////
					/////bltz
					////////////////////////////////////////
					5'b00000:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b101;
						aluop_o [7:0]     =  8'b11000000;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b0;
						if (reg1_data_o[31]) begin
							branch_flag_o     =  1'b1;
							branch_target_address_o[31:0] = branch_target[31:0];
							next_inst_in_delayslot_o      = 1'b1; 
						end else begin
							branch_flag_o     =  1'b0;
							branch_target_address_o[31:0] = reg1_data_o[31:0];
							next_inst_in_delayslot_o      = 1'b0; 
						end
						link_addr_o[31:0]  = {32{1'b0}}; 
					end
					////////////////////////////////////////
					/////bltzal
					////////////////////////////////////////
					5'b10000:begin
        				        waddr_o           =  5'b11111;;
        	        	       		alusel_o[2:0]     =  3'b101;
						aluop_o [7:0]     =  8'b11010000;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b0;
						if (reg1_data_o[31]) begin
							branch_flag_o     =  1'b1;
							branch_target_address_o[31:0] = branch_target[31:0];
							next_inst_in_delayslot_o      = 1'b1; 
						end else begin
							branch_flag_o     =  1'b0;
							branch_target_address_o[31:0] = reg1_data_o[31:0];
							next_inst_in_delayslot_o      = 1'b0; 
						end
						link_addr_o[31:0]  = pc_plus_8[31:0]; 
					end
					////////////////////////////////////////
					/////bgez
					////////////////////////////////////////
					5'b00001:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b101;
						aluop_o [7:0]     =  8'b11000001;
        	        	       	 	wreg_o            =  1'b0;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b0;
						if (!reg1_data_o[31] ) begin
							branch_flag_o     =  1'b1;
							branch_target_address_o[31:0] = branch_target[31:0];
							next_inst_in_delayslot_o      = 1'b1; 
						end else begin
							branch_flag_o     =  1'b0;
							branch_target_address_o[31:0] = reg1_data_o[31:0];
							next_inst_in_delayslot_o      = 1'b0; 
						end
						link_addr_o[31:0]  = {32{1'b0}}; 
					end
					////////////////////////////////////////
					/////bgezal
					////////////////////////////////////////
					5'b10001:begin
        				        waddr_o           =  5'b11111;;
        	        	       		alusel_o[2:0]     =  3'b101;
						aluop_o [7:0]     =  8'b11010001;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b0;
						if (!reg1_data_o[31]) begin
							branch_flag_o     =  1'b1;
							branch_target_address_o[31:0] = branch_target[31:0];
							next_inst_in_delayslot_o      = 1'b1; 
						end else begin
							branch_flag_o     =  1'b0;
							branch_target_address_o[31:0] = reg1_data_o[31:0];
							next_inst_in_delayslot_o      = 1'b0; 
						end
						link_addr_o[31:0]  = pc_plus_8[31:0]; 
					end
					
				endcase
			end
				default:begin
        				        waddr_o           =  inst_i[15:11];
        	        	       		alusel_o[2:0]     =  3'b100;
						aluop_o [7:0]     =  8'b00000010;
        	        	       	 	wreg_o            =  1'b1;
        	        	        	reg1_read_o       =  1'b1;
        	        	        	reg2_read_o       =  1'b1;
						imm[31:0]         =  {32{1'b0}};
						next_inst_in_delayslot_o      = 1'b0;
						branch_flag_o     = 1'b0;
						branch_target_address_o[31:0] = {32{1'b0}};
						link_addr_o[31:0] = {32{1'b0}};
				end
		endcase
	end
end


always @ (*) begin
	if(!reset_n) begin
		reg1_data_o[31:0] = {32{1'b0}};
        end else if((reg1_addr_o == ex_waddr)&&(reg1_read_o)&&(ex_we))begin
		reg1_data_o[31:0] = ex_wdata[31:0];
	end else if((reg1_addr_o == mem_waddr)&&(reg1_read_o)&&(mem_we))begin
		reg1_data_o[31:0] = mem_wdata[31:0];
	end else if(reg1_read_o) begin
		reg1_data_o[31:0] = reg1_data_i[31:0];
	end else if(!reg1_read_o)begin
		reg1_data_o[31:0] = imm[31:0];
	end else begin
		reg1_data_o[31:0] = {32{1'b0}};
	end
end

always@ (*) begin
	if(!reset_n) begin
		reg2_data_o[31:0] = {32{1'b0}};
	end else if((reg2_addr_o == ex_waddr)&&(reg2_read_o)&&(ex_we))begin
		reg2_data_o[31:0] = ex_wdata[31:0];
	end else if((reg2_addr_o == mem_waddr)&&(reg2_read_o)&&(mem_we))begin
		reg2_data_o[31:0] = mem_wdata[31:0];
	end else if(reg2_read_o) begin
		reg2_data_o[31:0] = reg2_data_i[31:0];
	end else if(!reg2_read_o)begin
		reg2_data_o[31:0] = imm[31:0];
	end else begin
		reg2_data_o[31:0] = {32{1'b0}};
	end
end


always @ (*) begin
	if(!reset_n) begin
		is_in_delayslot_o = 1'b0;
	end else begin
		is_in_delayslot_o = is_in_delayslot_i;
	end
end

endmodule
