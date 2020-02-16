module ex(clk,reset_n,
	  alusel,aluop,reg1_data,reg2_data,id_we,id_waddr,
	  hilo_hi,hilo_lo,
	  mem_whilo,mem_hi,mem_lo,
	  wb_whilo,wb_hi,wb_lo,
	  ex_we,ex_waddr,ex_wdata,ex_whilo,ex_hi,ex_lo);
input            clk;
input            reset_n;
///////////////////////////////////
///input from id
///////////////////////////////////
input      [2:0] alusel;
input      [7:0] aluop;
input      [31:0]reg1_data;
input      [31:0]reg2_data;
input            id_we;
input      [4:0] id_waddr;


///////////////////////////////////
///input from hilo
///////////////////////////////////
input     [31:0] hilo_hi;
input     [31:0] hilo_lo;        

///////////////////////////////////
///input from mem
///////////////////////////////////
input            mem_whilo;
input     [31:0] mem_hi;
input     [31:0] mem_lo;        

///////////////////////////////////
///input from wb
///////////////////////////////////
input            wb_whilo;
input     [31:0] wb_hi;
input     [31:0] wb_lo;        

///////////////////////////////////
///output to ex
///////////////////////////////////
output reg       ex_we;
output reg [4:0] ex_waddr;
output reg [31:0]ex_wdata;
output reg       ex_whilo;
output reg [31:0]ex_hi;
output reg [31:0]ex_lo;


reg        [31:0]logicout;
reg        [31:0]moveout;
reg        [31:0]shiftout;

reg        [63:0]tempt;
reg        [63:0]right_move;

always @ (*) begin
	if(!reset_n) begin
		logicout[31:0] = {32{1'b0}};
	end else if(alusel==3'b001) begin
		case(aluop[7:0])
			8'b00100100 :begin	
				logicout[31:0] = reg1_data & reg2_data;
			end
			8'b00001100:begin	
				logicout[31:0] = reg1_data & reg2_data;
			end
			8'b00001101 :begin
				logicout[31:0] = reg1_data | reg2_data;
			end
			8'b100101:begin
				logicout[31:0] = reg1_data | reg2_data;
			end
			8'b00100110:begin	
				logicout[31:0] = reg1_data ^ reg2_data;
			end
			8'b00001110:begin	
				logicout[31:0] = reg1_data ^ reg2_data;
			end
			8'b00100111:begin
				logicout[31:0] = ~(reg1_data | reg2_data);
			end
			8'b00001111:begin
				logicout[31:0] = {reg2_data[15:0],16'd0};
			end
			default:begin
				logicout[31:0] = {32{1'b0}};
			end
		endcase
	end
end


always @ (*) begin
	if(!reset_n) begin
		moveout[31:0] = {32{1'b0}};
	end else if(alusel==3'b010) begin
		case(aluop[7:0])
			8'b00000000 :begin
				moveout[31:0] = (reg2_data << reg1_data[4:0]);
			end
			8'b00000100:begin
				moveout[31:0] = (reg2_data << reg1_data[4:0]);
			end
			8'b00000010:begin
				moveout[31:0] = (reg2_data >> reg1_data[4:0]);
			end
			8'b00000110:begin
				moveout[31:0] = (reg2_data >> reg1_data[4:0]);
			end
			8'b00000011:begin
				tempt[63:0]   = {32'hffff,32'h0} | reg2_data;
				right_move[63:0] = (tempt >> reg1_data[4:0]);
				if(reg2_data[31]==1)begin
					moveout[31:0] = right_move[31:0];
				end else begin
					moveout[31:0] = (reg2_data >> reg1_data[4:0]);
				end
			end
			8'b00000111:begin
				tempt[63:0]   = {32'hffff,32'h0} | reg2_data;
				right_move[63:0] = (tempt >> reg1_data);
				if(reg2_data[31]==1)begin
					moveout[31:0] = right_move[31:0];
				end else begin
					moveout[31:0] = (reg2_data >> reg1_data[4:0]);
				end
			end
			default:begin
				moveout[31:0] = {32{1'b0}};
			end
		endcase
	end
end


always @ (*) begin
	if(!reset_n) begin
		shiftout[31:0] = {32{1'b0}};
	end else if(alusel==3'b011) begin
		case(aluop)
			8'b00001010:begin
				if(reg2_data==32'd0)begin
					shiftout[31:0] = reg1_data[31:0];
				end
			end
			8'b00001011:begin
				if(reg2_data!=32'd0)begin
					shiftout[31:0] = reg1_data[31:0];
				end
			end
			8'b00010000:begin
				if(mem_whilo)begin
					shiftout[31:0] = mem_hi[31:0];
				end else if(wb_whilo)begin
					shiftout[31:0] = wb_hi[31:0];
				end else begin
					shiftout[31:0] = hilo_hi[31:0];
				end
			end
			8'b00010010:begin
				if(mem_whilo)begin
					shiftout[31:0] = mem_lo[31:0];
				end else if(wb_whilo)begin
					shiftout[31:0] = wb_lo[31:0];
				end else begin
					shiftout[31:0] = hilo_lo[31:0];
				end
			end
			default:begin
				shiftout[31:0] = {32{1'b0}};
			end
		endcase
	end
end
always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		ex_we         <= 1'b0;
		ex_waddr[4:0] <= {5{1'b0}};
		ex_wdata[31:0] <= {32{1'b0}};
	end else begin
		ex_we         <= id_we;
		ex_waddr[4:0] <= id_waddr[4:0];
		case(alusel[2:0])
			3'b000:begin
				ex_wdata[31:0] <= {32{1'b0}};
			end
			3'b001:begin
              			ex_wdata[31:0] <= logicout[31:0];
			end
			3'b010:begin
              			ex_wdata[31:0] <= moveout[31:0];
			end
			3'b011:begin
				ex_wdata[31:0] <= shiftout[31:0];
			end
			default:begin
				ex_wdata[31:0] <= {32{1'b0}};
			end
		endcase
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		ex_whilo     <= 1'b0;
		ex_hi [31:0] <= {32{1'b0}};
		ex_lo [31:0] <= {32{1'b0}};
	end else if(alusel==3'b011) begin
		case(aluop[7:0])
			8'b00010001:begin
				ex_whilo     <= 1'b1;
                                ex_hi [31:0] <= reg1_data[31:0];
			end
			8'b00010011:begin
				ex_whilo     <= 1'b1;
				ex_lo [31:0] <= reg1_data[31:0];
			end
		endcase
	end
end

endmodule
