module id(clk,reset_n,pc_i,inst_i,
          reg1_data_i,reg2_data_i,
	  ex_we,ex_waddr,ex_wdata,
	  mem_we,mem_waddr,mem_wdata,
	  aluop_o,alusel_o,reg1_data_o,reg2_data_o,wreg_o,waddr_o,
	  reg1_read_o,reg1_addr_o,reg2_read_o,reg2_addr_o);
////////////////////////////////////////
///input from pc
////////////////////////////////////////
input              clk;
input              reset_n;
input       [31:0] pc_i;
input       [31:0] inst_i;

////////////////////////////////////////
///input from ex
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

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		alusel_o[2:0]     <= {3{1'b0}};
		aluop_o [7:0]     <= {8{1'b0}};
		wreg_o            <= 1'b0;
		waddr_o           <= {5{1'b0}};
		reg1_read_o       <= 1'b0;
		reg1_addr_o[4:0]  <= {5{1'b0}};  
		reg2_read_o       <= 1'b0;
		reg2_addr_o[4:0]  <= {5{1'b0}};
		imm               <= {32{1'b0}};
	end else if(pc_i !=0) begin
		reg1_addr_o[4:0]  <= inst_i[25:21];
		reg2_addr_o[4:0]  <= inst_i[20:16];
		case(inst_i[31:26])
			////////////////////////////////////////
			/////ori
			////////////////////////////////////////
			6'b001101:begin
        		        waddr_o           <= inst_i[20:16];
                       		alusel_o[2:0]     <= 3'b001;
				aluop_o [7:0]     <= 8'b00001101;
                       	 	wreg_o            <= 1'b1;
                        	reg1_read_o       <= 1'b1;
                        	reg2_read_o       <= 1'b0;
				imm[31:0]         <= {16'd0,inst_i[15:0]};
			end
			////////////////////////////////////////
			/////andi
			////////////////////////////////////////
			6'b001100:begin
        		        waddr_o           <= inst_i[20:16];
                       		alusel_o[2:0]     <= 3'b001;
				aluop_o [7:0]     <= 8'b00001100;
                       	 	wreg_o            <= 1'b1;
                        	reg1_read_o       <= 1'b1;
                        	reg2_read_o       <= 1'b0;
				imm[31:0]         <= {16'd0,inst_i[15:0]};
			end
			////////////////////////////////////////
			/////xori
			////////////////////////////////////////
			6'b001110:begin
        		        waddr_o           <= inst_i[20:16];
                       		alusel_o[2:0]     <= 3'b001;
				aluop_o [7:0]     <= 8'b00001110;
                       	 	wreg_o            <= 1'b1;
                        	reg1_read_o       <= 1'b1;
                        	reg2_read_o       <= 1'b0;
				imm[31:0]         <= {16'd0,inst_i[15:0]};
			end
			////////////////////////////////////////
			/////lui
			////////////////////////////////////////
			6'b001111:begin
        		        waddr_o           <= inst_i[20:16];
                       		alusel_o[2:0]     <= 3'b001;
				aluop_o [7:0]     <= 8'b00001111;
                       	 	wreg_o            <= 1'b1;
                        	reg1_read_o       <= 1'b1;
                        	reg2_read_o       <= 1'b0;
				imm[31:0]         <= {16'd0,inst_i[15:0]};
			end
			////////////////////////////////////////
			/////pref
			////////////////////////////////////////
			6'b110011:begin
                       		alusel_o[2:0]     <= 3'b000;
				aluop_o [7:0]     <= 8'b00110011;
                       	 	wreg_o            <= 1'b0;
                        	reg1_read_o       <= 1'b0;
                        	reg2_read_o       <= 1'b0;
			end
		

			6'b000000:begin
				case(inst_i[5:0])
					////////////////////////////////////////
					/////and
					////////////////////////////////////////
					6'b100100:begin
        				        waddr_o           <= inst_i[15:11];
        	        	       		alusel_o[2:0]     <= 3'b001;
						aluop_o [7:0]     <= 8'b00100100;
        	        	       	 	wreg_o            <= 1'b1;
        	        	        	reg1_read_o       <= 1'b1;
        	        	        	reg2_read_o       <= 1'b1;
					end
					////////////////////////////////////////
					/////or
					////////////////////////////////////////
					6'b100101:begin
        				        waddr_o           <= inst_i[15:11];
        	        	       		alusel_o[2:0]     <= 3'b001;
						aluop_o [7:0]     <= 8'b00100101;
        	        	       	 	wreg_o            <= 1'b1;
        	        	        	reg1_read_o       <= 1'b1;
        	        	        	reg2_read_o       <= 1'b1;
					end
					////////////////////////////////////////
					/////xor
					////////////////////////////////////////
					6'b100110:begin
        				        waddr_o           <= inst_i[15:11];
        	        	       		alusel_o[2:0]     <= 3'b001;
						aluop_o [7:0]     <= 8'b00100110;
        	        	       	 	wreg_o            <= 1'b1;
        	        	        	reg1_read_o       <= 1'b1;
        	        	        	reg2_read_o       <= 1'b1;
					end
					////////////////////////////////////////
					/////xor
					////////////////////////////////////////
					6'b100111:begin
        				        waddr_o           <= inst_i[15:11];
        	        	       		alusel_o[2:0]     <= 3'b001;
						aluop_o [7:0]     <= 8'b00100111;
        	        	       	 	wreg_o            <= 1'b1;
        	        	        	reg1_read_o       <= 1'b1;
        	        	        	reg2_read_o       <= 1'b1;
					end
					////////////////////////////////////////
					/////sll
					////////////////////////////////////////
					6'b000000:begin
        				        waddr_o           <= inst_i[15:11];
        	        	       		alusel_o[2:0]     <= 3'b010;
						aluop_o [7:0]     <= 8'h00;
        	        	       	 	wreg_o            <= 1'b1;
        	        	        	reg1_read_o       <= 1'b0;
        	        	        	reg2_read_o       <= 1'b1;
						imm[31:0]         <= {27'd0,inst_i[10:6]};
					end
					////////////////////////////////////////
					/////srl
					////////////////////////////////////////
					6'b000010:begin
        				        waddr_o           <= inst_i[15:11];
        	        	       		alusel_o[2:0]     <= 3'b010;
						aluop_o [7:0]     <= 8'b00000010;
        	        	       	 	wreg_o            <= 1'b1;
        	        	        	reg1_read_o       <= 1'b0;
        	        	        	reg2_read_o       <= 1'b1;
						imm[31:0]         <= {27'd0,inst_i[10:6]};
					end
					////////////////////////////////////////
					/////sra
					////////////////////////////////////////
					6'b000011:begin
        				        waddr_o           <= inst_i[15:11];
        	        	       		alusel_o[2:0]     <= 3'b010;
						aluop_o [7:0]     <= 8'b00000011;
        	        	       	 	wreg_o            <= 1'b1;
        	        	        	reg1_read_o       <= 1'b0;
        	        	        	reg2_read_o       <= 1'b1;
						imm[31:0]         <= {27'd0,inst_i[10:6]};
					end
					/////////////////////////////////
					/////sllv
					////////////////////////////////////////
					6'b000100:begin
        				        waddr_o           <= inst_i[15:11];
        	        	       		alusel_o[2:0]     <= 3'b010;
						aluop_o [7:0]     <= 8'b00000100;
        	        	       	 	wreg_o            <= 1'b1;
        	        	        	reg1_read_o       <= 1'b1;
        	        	        	reg2_read_o       <= 1'b1;
					end
					/////////////////////////////////
					/////srlv
					////////////////////////////////////////
					6'b000110:begin
        				        waddr_o           <= inst_i[15:11];
        	        	       		alusel_o[2:0]     <= 3'b010;
						aluop_o [7:0]     <= 8'b00000110;
        	        	       	 	wreg_o            <= 1'b1;
        	        	        	reg1_read_o       <= 1'b1;
        	        	        	reg2_read_o       <= 1'b1;
					end
					/////////////////////////////////
					/////srav
					////////////////////////////////////////
					6'b000111:begin
        				        waddr_o           <= inst_i[15:11];
        	        	       		alusel_o[2:0]     <= 3'b010;
						aluop_o [7:0]     <= 8'b00000111;
        	        	       	 	wreg_o            <= 1'b1;
        	        	        	reg1_read_o       <= 1'b1;
        	        	        	reg2_read_o       <= 1'b1;
					end
					/////////////////////////////////
					/////sync
					////////////////////////////////////////
					6'b001111:begin
        				        waddr_o           <= inst_i[15:11];
        	        	       		alusel_o[2:0]     <= 3'b000;
						aluop_o [7:0]     <= 8'b00001111;
        	        	       	 	wreg_o            <= 1'b0;
        	        	        	reg1_read_o       <= 1'b0;
        	        	        	reg2_read_o       <= 1'b0;
					end

				endcase
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
