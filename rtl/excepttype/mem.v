module mem(reset_n,	   ex_we,ex_waddr,ex_wdata,ex_whilo,ex_hi,ex_lo,
	   mem_we,mem_waddr,mem_wdata,mem_whilo,mem_hi,mem_lo,
	   ex_cnt,ex_hilo_tempt,ex_minuend,mem_cnt,mem_hilo_tempt,mem_minuend,
	   alusel_i,aluop_i,ram_addr_i,reg2_i,ram_data_i,ram_addr_o,ram_we_o,ram_ce_o,ram_sel_o,ram_data_o,
	   LLbit_we_o,LLbit_value_o,LLbit_i,wb_LLbit_we_i,wb_LLbit_value_i,
	   cp0_reg_we_i,cp0_reg_write_addr_i,cp0_reg_data_i,cp0_reg_we_o,cp0_reg_write_addr_o,cp0_reg_data_o,
	   excepttype_i,current_inst_addr_i,is_in_delayslot_i,cp0_status_i,cp0_cause_i,cp0_epc_i,wb_cp0_reg_we,wb_cp0_reg_write_addr,wb_cp0_reg_write_data,
	   excepttype_o,current_inst_addr_o,is_in_delayslot_o,cp0_epc_o);
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


///////////////////////////////////////
////input and output with ctrl
//////////////////////////////////////
input      [5 :0]ex_cnt;
input      [63:0]ex_hilo_tempt;
input      [63:0]ex_minuend;
output reg [5 :0]mem_cnt;
output reg [63:0]mem_hilo_tempt;
output reg [63:0]mem_minuend;

//////////////////////////////////////////
////input and output for load_store
//////////////////////////////////////////
input     [2 :0]alusel_i;
input     [7 :0]aluop_i;
input     [31:0]ram_addr_i;
input     [31:0]reg2_i;
input     [31:0]ram_data_i;
output reg[31:0]ram_addr_o;
output reg      ram_ce_o;
output          ram_we_o;
output reg[3 :0]ram_sel_o;
output reg[31:0]ram_data_o;

//////////////////////////////////////////
////input and output for load_store_ll_sc
//////////////////////////////////////////
output reg LLbit_we_o;
output reg LLbit_value_o;
input      LLbit_i;
input      wb_LLbit_we_i;
input      wb_LLbit_value_i;


//////////////////////////////////////////
////input and output for cp0
//////////////////////////////////////////
input            cp0_reg_we_i;
input      [4 :0]cp0_reg_write_addr_i;
input      [31:0]cp0_reg_data_i;
output reg       cp0_reg_we_o;
output reg [4 :0]cp0_reg_write_addr_o;
output reg [31:0]cp0_reg_data_o;

//////////////////////////////////////////
////input and output for excepttype
//////////////////////////////////////////
input      [31:0]excepttype_i;
input      [31:0]current_inst_addr_i;
input            is_in_delayslot_i;
input      [31:0]cp0_status_i;
input      [31:0]cp0_cause_i;
input      [31:0]cp0_epc_i;
input            wb_cp0_reg_we;
input      [4:0] wb_cp0_reg_write_addr;
input      [31:0]wb_cp0_reg_write_data;
output reg [31:0]excepttype_o;
output     [31:0]current_inst_addr_o;
output           is_in_delayslot_o;
output     [31:0]cp0_epc_o;


//////////////////////////////////////////
//// for load_store
//////////////////////////////////////////
reg             ram_we;
wire      [31:0]loadaddr_align;
wire      [1:0]n;
assign n[1:0] =ram_addr_i[1:0];
assign loadaddr_align[31:0] = ram_addr_i[31:0] - n ; 

//////////////////////////////////////////
//// for LLbit
//////////////////////////////////////////
always @ (*) begin
	if(!reset_n) begin
		LLbit_we_o    = 1'b0;
		LLbit_value_o = 1'b0;
	end else if(alusel_i==3'b110 && aluop_i==8'b110000) begin
		LLbit_we_o    = 1'b1;
		LLbit_value_o = 1'b1;
	end else if(alusel_i==3'b110 && aluop_i==8'b111000 && ((wb_LLbit_we_i && wb_LLbit_value_i)||(LLbit_i)))begin
		LLbit_we_o    = 1'b1;
		LLbit_value_o = 1'b0;
	end else begin
		LLbit_we_o    = 1'b0;
		LLbit_value_o = 1'b0;
	end
end


//////////////////////////////////////////
//// for excepttype
//////////////////////////////////////////
reg [31:0]cp0_status;
reg [31:0]cp0_cause;
reg [31:0]cp0_epc;
wire      inst_is_except;
assign current_inst_addr_o [31:0] = current_inst_addr_i[31:0];
assign is_in_delayslot_o          = is_in_delayslot_i;
assign cp0_epc_o           [31:0] = cp0_epc[31:0];
always @ (*) begin
	if(!reset_n) begin
		cp0_status [31:0] = {32{1'b0}};
	end else if(wb_cp0_reg_we && (wb_cp0_reg_write_addr==5'b01100)) begin
		cp0_status [31:0] = wb_cp0_reg_write_data[31:0];
	end else begin
		cp0_status [31:0] = cp0_status_i[31:0];	
	end
end


always @ (*) begin
	if(!reset_n) begin
		cp0_epc[31:0] = {32{1'b0}};
	end else if(wb_cp0_reg_we && (wb_cp0_reg_write_addr==5'b01110)) begin
		cp0_epc[31:0] = wb_cp0_reg_write_data[31:0];
	end else begin
		cp0_epc[31:0] = cp0_epc_i[31:0];
	end
end


always @ (*) begin
	if(!reset_n) begin
		cp0_cause[31:0] = {32{1'b0}};
	end else if(wb_cp0_reg_we && (wb_cp0_reg_write_addr==5'b01101)) begin
		cp0_cause[9:8] = wb_cp0_reg_write_data[9:8];
		cp0_cause[22]  = wb_cp0_reg_write_data[22];
		cp0_cause[23]  = wb_cp0_reg_write_data[23];
	end else begin
		cp0_cause[31:0] =cp0_cause_i[31:0];
	end
end


always @ (*) begin
	if(!reset_n) begin
		excepttype_o[31:0] = {32{1'b0}};
	end else if(current_inst_addr_i != 32'd0)begin
		if((cp0_cause[15:8]!=8'h00)&&(cp0_status[15:8]!=8'h00)&&(cp0_status[1:0]==2'b01))begin
			excepttype_o[31:0] = 32'h00000001;
		end else if(excepttype_i[8])begin
			excepttype_o[31:0] = 32'h00000008;
		end else if(excepttype_i[9])begin
			excepttype_o[31:0] = 32'h0000000a;
		end else if(excepttype_i[10])begin
			excepttype_o[31:0] = 32'h0000000d;
		end else if(excepttype_i[11])begin
			excepttype_o[31:0] = 32'h0000000c;
		end else if(excepttype_i[12])begin
			excepttype_o[31:0] = 32'h0000000e;
		end else begin
			excepttype_o[31:0] <= {32{1'b0}};
		end
	end else begin
		excepttype_o[31:0] <= {32{1'b0}};
	end
end

always @ (*) begin
	if(!reset_n ) begin
		mem_we              =  1'b0;
		mem_waddr   [4:0]   =  {5{1'b0}};
		mem_wdata   [31:0]  =  {32{1'b0}};
		mem_whilo           =  1'b0;
		mem_hi   [31:0]     =  {32{1'b0}};
		mem_lo   [31:0]     =  {32{1'b0}};
		mem_cnt      [5:0 ] =   {6{1'b0}};
		mem_hilo_tempt[63:0] =   {64{1'b0}};
		mem_minuend[63:0]   = {64{1'b0}};
		ram_ce_o         = 1'b0;
                ram_we           = 1'b0;
                ram_sel_o [3 :0] = {4{1'b0}};
                ram_data_o[31:0] = {32{1'b0}};
		ram_addr_o[31:0] = {32{1'b0}};
                cp0_reg_we_o     = 1'b0;
                cp0_reg_write_addr_o[4:0] = {5{1'b0}};
                cp0_reg_data_o [31:0] = {32{1'b0}};
	end else  begin
		mem_we              =  ex_we;
		mem_waddr   [4:0]   =  ex_waddr[4:0];
		mem_whilo           =  ex_whilo;
		mem_hi   [31:0]     =  ex_hi[31:0];
		mem_lo   [31:0]     =  ex_lo[31:0];
		mem_cnt      [5:0 ] =  ex_cnt      [5:0];
		mem_hilo_tempt[63:0] =  ex_hilo_tempt[63:0];
		mem_minuend[63:0] = ex_minuend[63:0];
                cp0_reg_we_o     = cp0_reg_we_i;
                cp0_reg_write_addr_o[4:0] = cp0_reg_write_addr_i[4:0];
                cp0_reg_data_o [31:0] = cp0_reg_data_i[31:0];
//////////////////////////////////////////////////////////////////
////////////for load_store
//////////////////////////////////////////////////////////////////
		if(alusel_i==3'b110)begin
			ram_ce_o         = 1'b1;
			case(aluop_i)
				/////lb
				8'b100000:begin
                                	ram_we           = 1'b0;
					ram_addr_o[31:0]    = ram_addr_i[31:0];
					case(ram_addr_i[1:0])
						2'b00:begin
							ram_sel_o[3 :0] = 4'b1000; 
							if(ram_data_i[31]==1'b1)begin
								mem_wdata[31:0] = {24'hffffff,ram_data_i[31:24]};
							end else begin
								mem_wdata[31:0] = {24'd0,ram_data_i[31:24]};
							end
						end
						2'b01:begin
							ram_sel_o[3 :0] = 4'b0100;
							if(ram_data_i[23]==1'b1)begin
								mem_wdata[31:0] = {24'hffffff,ram_data_i[23:16]};
							end else begin
								mem_wdata[31:0] = {24'd0,ram_data_i[23:16]};
							end
						end
						2'b10:begin
							ram_sel_o[3 :0] = 4'b0010;
							if(ram_data_i[15]) begin
								mem_wdata[31:0] = {24'hffffff,ram_data_i[15:8]};
							end else begin
								mem_wdata[31:0] = {24'd0,ram_data_i[15:8]};
							end
						end
						2'b11:begin
							ram_sel_o[3 :0] = 4'b0001;
							if(ram_data_i[7]) begin
								mem_wdata[31:0] = {24'hffffff,ram_data_i[7:0]};
							end else begin
								mem_wdata[31:0] = {24'd0,ram_data_i[7:0]};
							end
						end
					endcase
				end
				////lbu
				8'b100100:begin
                                	ram_we              = 1'b0;
					ram_addr_o[31:0]    = ram_addr_i[31:0];
					case(ram_addr_i[1:0])
						2'b00:begin
							ram_sel_o[3 :0] = 4'b1000; 
							mem_wdata[31:0] = {24'd0,ram_data_i[31:24]};
						end
						2'b01:begin
							ram_sel_o[3 :0] = 4'b0100;
							mem_wdata[31:0] = {24'd0,ram_data_i[23:16]};
						end
						2'b10:begin
							ram_sel_o[3 :0] = 4'b0010;
							mem_wdata[31:0] = {24'd0,ram_data_i[15:8]};
						end
						2'b11:begin
							ram_sel_o[3 :0] = 4'b0001;
							mem_wdata[31:0] = {24'd0,ram_data_i[7:0]};
						end
					endcase
				end
				/////lh
				8'b100001:begin                                
					ram_we              = 1'b0;
					ram_addr_o[31:0]    = ram_addr_i[31:0];
					case(ram_addr_i[1:0])
						2'b00:begin
							ram_sel_o[3 :0] = 4'b1100; 
							if(ram_data_i[31]) begin
								mem_wdata[31:0] = {16'hffff,ram_data_i[31:16]};
							end else begin
								mem_wdata[31:0] = {16'h0,ram_data_i[31:16]};
							end
						end
						2'b10:begin
							ram_sel_o[3 :0] = 4'b0011;
							if(ram_data_i[15]) begin
								mem_wdata[31:0] = {16'hffff,ram_data_i[15:0]};
							end else begin
								mem_wdata[31:0] = {16'd0,ram_data_i[15:0]};
							end
						end
						default:begin
							ram_sel_o [3 :0] = {4{1'b0}};
							mem_wdata[31:0] = {32{1'b0}};
						end
					endcase
				end
				/////lhu
				8'b100101:begin
                                	ram_we             = 1'b0;
					ram_addr_o[31:0]    = ram_addr_i[31:0];
					case(ram_addr_i[1:0])
						2'b00:begin
							ram_sel_o[3 :0] = 4'b1100; 
							mem_wdata[31:0] = {{16'd0},ram_data_i[31:16]};
						end
						2'b10:begin
							ram_sel_o[3 :0] = 4'b0011;
							mem_wdata[31:0] = {{16'd0},ram_data_i[15:0]};
						end
						default:begin
							ram_sel_o [3 :0] = {4{1'b0}};
							mem_wdata[31:0] = {32{1'b0}};
						end
					endcase
				end
				////////lw
				8'b100011:begin
                                	ram_we             = 1'b0;
					ram_addr_o[31:0]    = ram_addr_i[31:0];
					if(ram_addr_i[1:0]==2'b00) begin
						ram_sel_o[3 :0] = 4'b1111;
						mem_wdata[31:0] = ram_data_i[31:0];
					end else begin
						ram_sel_o[3:0] = 4'b0000;
						mem_wdata[31:0] = {32{1'b0}};
					end
				end
				////////sb
				8'b101000:begin                              
					ram_we          = 1'b1;
					mem_wdata[31:0] = {32{1'b0}};
					ram_addr_o[31:0]    = ram_addr_i[31:0];
					case(ram_addr_i[1:0])
						2'b00:begin
							ram_sel_o [3 :0 ] = 4'b1000;
							ram_data_o[31:24] = reg2_i[7:0];
						end
						2'b01:begin
							ram_sel_o [3 :0] = 4'b0100;
							ram_data_o[23:16] = reg2_i[7:0];
						end
						2'b10:begin
							ram_sel_o [3 :0] = 4'b0010;
							ram_data_o[15:8] = reg2_i[7:0];
						end
						2'b11:begin
							ram_sel_o [3:0] = 4'b0001;
							ram_data_o[7:0] = reg2_i[7:0];
						end
					endcase
				end
				////////sh
				8'b101001:begin
                                	ram_we             = 1'b1;
					ram_addr_o[31:0]    = ram_addr_i[31:0];
					mem_wdata[31:0] = {32{1'b0}};
					case(ram_addr_i[1:0])
						2'b00:begin
							ram_sel_o [3:0] = 4'b1100;
							ram_data_o[31:16] = reg2_i[15:0];
						end 
						2'b10:begin
							ram_sel_o[3:0] = 4'b0011;
							ram_data_o[15:0] = reg2_i[15:0];
						end
						default:begin
							ram_sel_o [3:0] = 4'b0000;
							ram_data_o[31:0] = 32'd0; 
						end
					endcase
				end
				////////sw
				8'b101011:begin
					ram_we             = 1'b1;
					ram_addr_o[31:0]    = ram_addr_i[31:0];
					mem_wdata[31:0] = {32{1'b0}};
					case(ram_addr_i[1:0])
						2'b00:begin
							ram_sel_o [3:0] = 4'b1111;
							ram_data_o[31:0] = reg2_i[31:0];
						end 
						default:begin
							ram_sel_o [3:0] = 4'b0000;
							ram_data_o[31:0] = 8'd0; 
						end
					endcase
				end
				//////lwl
				8'b100010:begin
					ram_we           = 1'b0;
					ram_addr_o[31:0] = loadaddr_align[31:0];
					case(n)
						2'b00:begin
							ram_sel_o [3 :0] = 4'b1111;
							mem_wdata [31:0] = ram_data_i[31:0];
						end
						2'b01:begin
							ram_sel_o [3 :0] = 4'b1111;
							mem_wdata [31:8] = ram_data_i[23:0];
						end
						2'b10:begin
							ram_sel_o[3:0] = 4'b1111;
							mem_wdata[31:16] = ram_data_i[15:0];
						end 
						2'b11:begin
							ram_sel_o[3:0] = 4'b1111;
							mem_wdata[31:24] = ram_data_i[7:0];
						end
					endcase
				end
				//////lwr
				8'b100110:begin
					ram_we           = 1'b0;
					ram_addr_o[31:0] = loadaddr_align[31:0];
					case(n)
						2'b00:begin
							ram_sel_o[3:0] = 4'b1111;
							mem_wdata[7:0] = ram_data_i[31:24];
						end
						2'b01:begin
							ram_sel_o[3:0] = 4'b1111;
							mem_wdata[15:0] = ram_data_i[31:16];
						end
						2'b10:begin
							ram_sel_o [3 :0] = 4'b1111;
							mem_wdata [23:0] = ram_data_i[31:8];
						end 
						2'b11:begin
							ram_sel_o [3 :0] = 4'b1111;
							mem_wdata [31:0] = ram_data_i[31:0];
						end
					endcase
				end
				//////swl
				8'b101010:begin
					ram_we           = 1'b1;
					ram_addr_o[31:0] = loadaddr_align[31:0];
					case(n)
						2'b00:begin
							ram_sel_o [3 :0] = 4'b1111;
							ram_data_o [31:0] = reg2_i[31:0];
						end
						2'b01:begin
							ram_sel_o [3 :0] = 4'b0111;
							ram_data_o[31:0] = reg2_i[23:0];
						end
						2'b10:begin
							ram_sel_o[3:0] = 4'b0011;
							ram_data_o[31:0] = reg2_i[15:0];
						end 
						2'b11:begin
							ram_sel_o[3:0] = 4'b0001;
							ram_data_o[31:0] = reg2_i[7:0];
						end
					endcase
				end
				//////swr
				8'b101110:begin
					ram_we           = 1'b1;
					ram_addr_o[31:0] = loadaddr_align[31:0];
					case(n)
						2'b00:begin
							ram_sel_o[3:0] = 4'b1000;
							ram_data_o[31:0] = {reg2_i[7:0],24'd0};
						end
						2'b01:begin
							ram_sel_o[3:0] = 4'b1100;
							ram_data_o[31:0] = {reg2_i[15:0],16'd0};
						end
						2'b10:begin
							ram_sel_o [3 :0] = 4'b1110;
							ram_data_o[31:0] = {reg2_i[23:0],8'd0};
						end 
						2'b11:begin
							ram_sel_o [3 :0] = 4'b1111;
							ram_data_o[15:0] = reg2_i[31:0];
						end
					endcase
				end
				/////////ll
				8'b110000:begin
					ram_we           = 1'b0;
					ram_addr_o[31:0] = ram_addr_i[31:0];
					ram_sel_o[3:0]   = 4'b1111;
					mem_wdata[31:0]  = ram_data_i[31:0];
				end
				/////////sc
				8'b111000:begin
					if(wb_LLbit_we_i)begin
						if(wb_LLbit_value_i) begin
							ram_ce_o         = 1'b1;
							ram_addr_o[31:0] = ram_addr_i[31:0];
							ram_we           = 1'b1;
							ram_data_o[31:0] = reg2_i[31:0];
							ram_sel_o [3 :0] = 4'b1111;
							mem_wdata [31:0] = 32'd1;
						end else begin
							ram_ce_o         = 1'b0;
							mem_wdata [31:0] = 32'd0;
						end
					end else begin
						if(LLbit_i) begin
							ram_ce_o         = 1'b1;
							ram_addr_o[31:0] = ram_addr_i[31:0];
							ram_we           = 1'b1;
							ram_data_o[31:0] = reg2_i[31:0];
							ram_sel_o [3 :0] = 4'b1111;
							mem_wdata [31:0] = 32'd1;
						end else begin
							ram_ce_o         = 1'b0;
							mem_wdata [31:0] = 32'd0;
						end
					end
				end
					
			default:begin
				ram_ce_o         = 1'b0;
               			ram_we           = 1'b0;
                		ram_sel_o [3 :0] = {4{1'b0}};
                		ram_data_o[31:0] = {32{1'b0}};
				ram_addr_o[31:0] = {32{1'b0}};
				mem_wdata[31:0]  = ex_wdata[31:0]  ;
			end
			endcase
		end else begin
			ram_ce_o         = 1'b0;
               		ram_we           = 1'b0;
                	ram_sel_o [3 :0] = {4{1'b0}};
                	ram_data_o[31:0] = {32{1'b0}};
			ram_addr_o[31:0] = {32{1'b0}};
			mem_wdata   [31:0]  =  ex_wdata[31:0] ;
		end
	end
end

assign inst_is_except = (excepttype_o[31:0] != 32'd0);
assign ram_we_o = ram_we && (~inst_is_except);

endmodule
