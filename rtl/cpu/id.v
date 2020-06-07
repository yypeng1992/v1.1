module id(reset_n,pc_i,inst_i,stallreg_from_id,
          reg1_data_i,reg2_data_i,
	  ex_aluop_i,ex_we,ex_waddr,ex_wdata,
	  mem_we,mem_waddr,mem_wdata,
	  aluop_o,alusel_o,reg1_data_o,reg2_data_o,wreg_o,waddr_o,inst_o,
	  reg1_read_o,reg1_addr_o,reg2_read_o,reg2_addr_o,
	  is_in_delayslot_i,branch_flag,branch_target_addr,next_is_delayslot,is_in_delayslot_o,link_addr);
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
///input from ex
////////////////////////////////////////
input [7:0]       ex_aluop_i;
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
output      [31:0] inst_o;

////////////////////////////////////////
///output to regfile
////////////////////////////////////////
output reg         reg1_read_o;
output reg  [4:0]  reg1_addr_o;
output reg         reg2_read_o;
output reg  [4:0]  reg2_addr_o;


////////////////////////////////////////
///for jump branch
////////////////////////////////////////
input             is_in_delayslot_i;
output  reg       branch_flag;
output  reg [31:0]branch_target_addr;
output  reg       next_is_delayslot;
output            is_in_delayslot_o;
output  reg [31:0]link_addr;

reg [31:0] imm;
wire [31:0]pc_plus_4;
wire [31:0]pc_plus_8;
wire [31:0]target_addr;
wire [31:0]tg_aadr_shift;
wire [17:0]signed_shift;
reg  [31:0]signed_target_addr;
reg        stallreg_for_reg1_loadrelative;
reg        stallreg_for_reg2_loadrelative;
wire       pre_is_load;


assign tg_aadr_shift[27:0] = inst_i[25:0]<<2;
assign signed_shift[17:0]  = inst_i[15:0]<<2;
assign pc_plus_4[31:0]     = pc_i[31:0] + 4;
assign pc_plus_8[31:0]     = pc_i[31:0] + 8;
assign target_addr[31:0]   = {pc_plus_4[31:28],tg_aadr_shift[27:0]};

 
assign is_in_delayslot_o = is_in_delayslot_i;
assign inst_o[31:0]      = inst_i[31:0];
assign pre_is_load       = (ex_aluop_i==8'h20)||(ex_aluop_i==8'h24)||(ex_aluop_i==8'h21)||(ex_aluop_i==8'h25)||
			   (ex_aluop_i==8'h23)||(ex_aluop_i==8'h22)||(ex_aluop_i==8'h26)||(ex_aluop_i==8'h30)||(ex_aluop_i==8'h38);
assign stallreg_from_id  = stallreg_for_reg1_loadrelative | stallreg_for_reg2_loadrelative;


always @ (*)begin
	if(!reset_n)begin
		stallreg_for_reg1_loadrelative = 1'b0;
	end else if(pre_is_load && reg1_read_o && (reg1_addr_o==ex_waddr)) begin
		stallreg_for_reg1_loadrelative = 1'b1;
	end else begin
		stallreg_for_reg1_loadrelative = 1'b0;
	end
end


always @ (*)begin
	if(!reset_n)begin
		stallreg_for_reg2_loadrelative = 1'b0;
	end else if(pre_is_load && reg2_read_o && (reg2_addr_o==ex_waddr)) begin
		stallreg_for_reg2_loadrelative = 1'b1;
	end else begin
		stallreg_for_reg2_loadrelative = 1'b0;
	end
end


always @ (*)begin
	if(!reset_n)begin
		signed_target_addr[31:0] = {32{1'b0}};
	end else begin
		if(inst_i[15])begin
			signed_target_addr[31:0] = {14'h3fff,signed_shift[17:0]} + pc_plus_4[31:0];
		end else begin
			signed_target_addr[31:0] = signed_shift[17:0] + pc_plus_4[31:0];
		end
	end
end

always @ (*) begin
	if(!reset_n ) begin
		alusel_o[2:0]            =  {3{1'b0}};
		aluop_o [7:0]            =  {8{1'b0}};
		wreg_o                   =  1'b0;
		waddr_o                  =  {5{1'b0}};
		reg1_read_o              =  1'b0;
		reg1_addr_o[4:0]         =  {5{1'b0}};  
		reg2_read_o              =  1'b0;
		reg2_addr_o[4:0]         =  {5{1'b0}};
		imm                      =  {32{1'b0}};
		branch_flag              = 1'b0;
		branch_target_addr[31:0] = {32{1'b0}};
		next_is_delayslot        = 1'b0;
		link_addr[31:0]          = {32{1'b0}};
	end else  begin
		reg1_addr_o[4:0]         =  inst_i[25:21];
		reg2_addr_o[4:0]         =  inst_i[20:16];
		branch_flag              = 1'b0;
		branch_target_addr[31:0] = {32{1'b0}};
		next_is_delayslot        = 1'b0;
		link_addr[31:0]          = {32{1'b0}};
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
			end
			////////////////////////////////////////
			/////beq
			////////////////////////////////////////
			6'b000100:begin
        		        waddr_o           =  inst_i[20:16];
                       		alusel_o[2:0]     =  3'b101;
				aluop_o [7:0]     =  8'b0000100;
                       	 	wreg_o            =  1'b0;
                        	reg1_read_o       =  1'b1;
                        	reg2_read_o       =  1'b1;
				if(reg1_data_o==reg2_data_o)begin
					branch_flag              = 1'b1;
					branch_target_addr[31:0] = signed_target_addr[31:0];
					next_is_delayslot        = 1'b1;
					link_addr[31:0]          = {32{1'b0}};
				end else begin
					branch_flag              = 1'b0;
					branch_target_addr[31:0] = {32{1'b0}};
					next_is_delayslot        = 1'b0;
					link_addr[31:0]          = {32{1'b0}};
				end
			end
			////////////////////////////////////////
			/////bgtz
			////////////////////////////////////////
			6'b000111:begin
        		        waddr_o           =  inst_i[20:16];
                       		alusel_o[2:0]     =  3'b101;
				aluop_o [7:0]     =  8'b0000111;
                       	 	wreg_o            =  1'b0;
                        	reg1_read_o       =  1'b1;
                        	reg2_read_o       =  1'b0;
				if(!reg1_data_o[31])begin
					branch_flag              = 1'b1;
					branch_target_addr[31:0] = signed_target_addr[31:0];
					next_is_delayslot        = 1'b1;
					link_addr[31:0]          = {32{1'b0}};
				end else begin
					branch_flag              = 1'b0;
					branch_target_addr[31:0] = {32{1'b0}};
					next_is_delayslot        = 1'b0;
					link_addr[31:0]          = {32{1'b0}};
				end
			end
			////////////////////////////////////////
			/////blez
			////////////////////////////////////////
			6'b000110:begin
        		        waddr_o           =  inst_i[20:16];
                       		alusel_o[2:0]     =  3'b101;
				aluop_o [7:0]     =  8'b0000110;
                       	 	wreg_o            =  1'b0;
                        	reg1_read_o       =  1'b1;
                        	reg2_read_o       =  1'b0;
				if(reg1_data_o[31] || (reg1_data_o==0))begin
					branch_flag              = 1'b1;
					branch_target_addr[31:0] = signed_target_addr[31:0];
					next_is_delayslot        = 1'b1;
					link_addr[31:0]          = {32{1'b0}};
				end else begin
					branch_flag              = 1'b0;
					branch_target_addr[31:0] = {32{1'b0}};
					next_is_delayslot        = 1'b0;
					link_addr[31:0]          = {32{1'b0}};
				end
			end
			////////////////////////////////////////
			/////bne
			////////////////////////////////////////
			6'b000101:begin
        		        waddr_o           =  inst_i[20:16];
                       		alusel_o[2:0]     =  3'b101;
				aluop_o [7:0]     =  8'b0000101;
                       	 	wreg_o            =  1'b0;
                        	reg1_read_o       =  1'b1;
                        	reg2_read_o       =  1'b1;
				if(reg1_data_o != reg2_data_o )begin
					branch_flag              = 1'b1;
					branch_target_addr[31:0] = signed_target_addr[31:0];
					next_is_delayslot        = 1'b1;
					link_addr[31:0]          = {32{1'b0}};
				end else begin
					branch_flag              = 1'b0;
					branch_target_addr[31:0] = {32{1'b0}};
					next_is_delayslot        = 1'b0;
					link_addr[31:0]          = {32{1'b0}};
				end
			end
			////////////////////////////////////////
			/////j
			////////////////////////////////////////
			6'b000010:begin
        			waddr_o                  = inst_i[15:11];
        	        	alusel_o[2:0]            = 3'b101;
				aluop_o [7:0]            = 8'b00000010;
        	        	wreg_o                   = 1'b0;
        	        	reg1_read_o              = 1'b0;
        	        	reg2_read_o              = 1'b0;
				branch_flag              = 1'b1;
				branch_target_addr[31:0] = target_addr[31:0];
				next_is_delayslot        = 1'b1;
				link_addr[31:0]          = {32{1'b0}};
			end
			////////////////////////////////////////
			/////jal
			////////////////////////////////////////
			6'b000011:begin
        			waddr_o                  = 6'd31;
        	        	alusel_o[2:0]            = 3'b101;
				aluop_o [7:0]            = 8'b00000011;
        	        	wreg_o                   = 1'b1;
        	        	reg1_read_o              = 1'b0;
        	        	reg2_read_o              = 1'b0;
				branch_flag              = 1'b1;
				branch_target_addr[31:0] = target_addr[31:0];
				next_is_delayslot        = 1'b1;
				link_addr[31:0]          = pc_plus_8;
			end
			////////////////////////////////////////
			/////lb
			////////////////////////////////////////
			6'b100000:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00100000;
        	        	wreg_o                   = 1'b1;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b0;
			end
			////////////////////////////////////////
			/////lbu
			////////////////////////////////////////
			6'b100100:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00100100;
        	        	wreg_o                   = 1'b1;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b0;
			end
			////////////////////////////////////////
			/////lh
			////////////////////////////////////////
			6'b100001:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00100001;
        	        	wreg_o                   = 1'b1;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b0;
			end
			////////////////////////////////////////
			/////lhu
			////////////////////////////////////////
			6'b100101:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00100101;
        	        	wreg_o                   = 1'b1;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b0;
			end
			////////////////////////////////////////
			/////lw
			////////////////////////////////////////
			6'b100011:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00100011;
        	        	wreg_o                   = 1'b1;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b1;
			end
			////////////////////////////////////////
			/////sb
			////////////////////////////////////////
			6'b101000:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00101000;
        	        	wreg_o                   = 1'b0;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b1;
			end
			////////////////////////////////////////
			/////sh
			////////////////////////////////////////
			6'b101001:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00101001;
        	        	wreg_o                   = 1'b0;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b1;
			end
			////////////////////////////////////////
			/////sw
			////////////////////////////////////////
			6'b101011:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00101011;
        	        	wreg_o                   = 1'b0;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b1;
			end
			////////////////////////////////////////
			/////lwl
			////////////////////////////////////////
			6'b100010:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00100010;
        	        	wreg_o                   = 1'b1;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b1;
			end
			////////////////////////////////////////
			/////lwr
			////////////////////////////////////////
			6'b100110:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00100110;
        	        	wreg_o                   = 1'b1;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b1;
			end
			////////////////////////////////////////
			/////swl
			////////////////////////////////////////
			6'b101010:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00101010;
        	        	wreg_o                   = 1'b0;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b1;
			end
			////////////////////////////////////////
			/////swr
			////////////////////////////////////////
			6'b101110:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00101110;
        	        	wreg_o                   = 1'b0;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b1;
			end
			////////////////////////////////////////
			/////ll
			////////////////////////////////////////
			6'b110000:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00110000;
        	        	wreg_o                   = 1'b1;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b1;
			end
			////////////////////////////////////////
			/////sc
			////////////////////////////////////////
			6'b111000:begin
        			waddr_o                  = inst_i[20:16];
        	        	alusel_o[2:0]            = 3'b110;
				aluop_o [7:0]            = 8'b00111000;
        	        	wreg_o                   = 1'b1;
        	        	reg1_read_o              = 1'b1;
        	        	reg2_read_o              = 1'b1;
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
					end
					////////////////////////////////////////
					/////jr
					////////////////////////////////////////
					6'b001000:begin
        				        waddr_o                  = inst_i[15:11];
        	        	       		alusel_o[2:0]            = 3'b101;
						aluop_o [7:0]            = 8'b00001000;
        	        	       	 	wreg_o                   = 1'b0;
        	        	        	reg1_read_o              = 1'b1;
        	        	        	reg2_read_o              = 1'b0;
						branch_flag              = 1'b1;
						branch_target_addr[31:0] = reg1_data_o;
						next_is_delayslot        = 1'b1;
						link_addr[31:0]          = {32{1'b0}};
					end
					////////////////////////////////////////
					/////jalr
					////////////////////////////////////////
					6'b001001:begin
        				        waddr_o                  = inst_i[15:11];
        	        	       		alusel_o[2:0]            = 3'b101;
						aluop_o [7:0]            = 8'b00001001;
        	        	       	 	wreg_o                   = 1'b1;
        	        	        	reg1_read_o              = 1'b1;
        	        	        	reg2_read_o              = 1'b0;
						branch_flag              = 1'b1;
						branch_target_addr[31:0] = reg1_data_o;
						next_is_delayslot        = 1'b1;
						link_addr[31:0]          = pc_plus_8;
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
        				        waddr_o                  = inst_i[15:11];
        	        	       		alusel_o[2:0]            = 3'b101;
						aluop_o [7:0]            = 8'b11000000;
        	        	       	 	wreg_o                   = 1'b0;
        	        	        	reg1_read_o              = 1'b1;
        	        	        	reg2_read_o              = 1'b0;
						if(reg1_data_o[31])begin
							branch_flag              = 1'b1;
							branch_target_addr[31:0] = signed_target_addr[31:0];
							next_is_delayslot        = 1'b1;
							link_addr[31:0]          = {32{1'b0}};
						end else begin
							branch_flag              = 1'b0;
							branch_target_addr[31:0] = {32{1'b0}};
							next_is_delayslot        = 1'b0;
							link_addr[31:0]          = {32{1'b0}};
						end
					end
					////////////////////////////////////////
					/////bltzal
					////////////////////////////////////////
					5'b10000:begin
        				        waddr_o                  = 5'd31;
        	        	       		alusel_o[2:0]            = 3'b101;
						aluop_o [7:0]            = 8'b1000000;
        	        	        	reg1_read_o              = 1'b1;
        	        	        	reg2_read_o              = 1'b0;
						if(reg1_data_o[31])begin
							branch_flag              = 1'b1;
							branch_target_addr[31:0] = signed_target_addr[31:0];
							next_is_delayslot        = 1'b1;
							link_addr[31:0]          = pc_plus_8;
        	        	       	 		wreg_o                   = 1'b1;
						end else begin
							branch_flag              = 1'b0;
							branch_target_addr[31:0] = {32{1'b0}};
							next_is_delayslot        = 1'b0;
							link_addr[31:0]          = {32{1'b0}};
        	        	       	 		wreg_o                   = 1'b0;
						end
					end
					////////////////////////////////////////
					/////bgez
					////////////////////////////////////////
					5'b00001:begin
        				        waddr_o                  = inst_i[15:11];
        	        	       		alusel_o[2:0]            = 3'b101;
						aluop_o [7:0]            = 8'b000001;
        	        	       	 	wreg_o                   = 1'b0;
        	        	        	reg1_read_o              = 1'b1;
        	        	        	reg2_read_o              = 1'b0;
						if(!reg1_data_o[31])begin
							branch_flag              = 1'b1;
							branch_target_addr[31:0] = signed_target_addr[31:0];
							next_is_delayslot        = 1'b1;
							link_addr[31:0]          = {32{1'b0}};
						end else begin
							branch_flag              = 1'b0;
							branch_target_addr[31:0] = {32{1'b0}};
							next_is_delayslot        = 1'b0;
							link_addr[31:0]          = {32{1'b0}};
						end
					end
					////////////////////////////////////////
					/////bgezal
					////////////////////////////////////////
					5'b10001:begin
        				        waddr_o                  = 5'd31;
        	        	       		alusel_o[2:0]            = 3'b101;
						aluop_o [7:0]            = 8'b00010001;
        	        	        	reg1_read_o              = 1'b1;
        	        	        	reg2_read_o              = 1'b0;
						if(!reg1_data_o[31])begin
							branch_flag              = 1'b1;
							branch_target_addr[31:0] = signed_target_addr[31:0];
							next_is_delayslot        = 1'b1;
							link_addr[31:0]          = pc_plus_8;
        	        	       	 		wreg_o                   = 1'b1;
						end else begin
							branch_flag              = 1'b0;
							branch_target_addr[31:0] = {32{1'b0}};
							next_is_delayslot        = 1'b0;
							link_addr[31:0]          = {32{1'b0}};
        	        	       	 		wreg_o                   = 1'b0;
						end
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

endmodule
