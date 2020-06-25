module ex(reset_n,	  alusel,aluop,reg1_data,reg2_data,id_we,id_waddr,
	  hilo_hi,hilo_lo,
	  mem_whilo,mem_hi,mem_lo,
	  wb_whilo,wb_hi,wb_lo,
	  ex_we,ex_waddr,ex_wdata,ex_whilo,ex_hi,ex_lo,
	  mem_cnt,mem_hilo_tempt,mem_minuend,ex_cnt,ex_hilo_tempt,stallreg_from_ex,minuend);

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
///output to mem
///////////////////////////////////
output reg       ex_we;
output reg [4:0] ex_waddr;
output reg [31:0]ex_wdata;
output reg       ex_whilo;
output reg [31:0]ex_hi;
output reg [31:0]ex_lo;


///////////////////////////////////
///input and output for ctrl
///////////////////////////////////
input     [5:0]  mem_cnt;
input     [63:0] mem_hilo_tempt;
input     [63:0] mem_minuend;
output reg[5:0]  ex_cnt;
output reg[63:0] ex_hilo_tempt;
output reg       stallreg_from_ex;
output reg[63:0] minuend;


reg        [31:0]logicout;
reg        [31:0]moveout;
reg        [31:0]shiftout;
reg        [31:0]arithmeticout;

reg        [63:0]tempt;
reg        [63:0]right_move;
wire       [31:0]reg1_data_mux;
reg       [31:0]reg2_data_mux;
wire             over_sum;
wire       [31:0]sum_tempt;
reg             reg1_lt_reg2;
wire       [63:0]mul_tempt;
wire       [63:0]mul_result;


assign  tempt[63:0]   = {32'hffff,32'h0} | reg2_data;
assign  right_move[63:0] = (tempt >> reg1_data[4:0]);


//////////////////////////////////////////////////////////////////////////
/////for div divu
//////////////////////////////////////////////////////////////////////////
wire [31:0]m;
wire [31:0]n;
reg [31:0]sub_tempt;
wire [31:0]s_tempt;
parameter K=31;

//////////////////////////////////////////////////////////////////////////
/////////////logicout
//////////////////////////////////////////////////////////////////////////
always @ (*) begin
	if(!reset_n) begin
		logicout[31:0] = {32{1'b0}};
	end else if(alusel!=3'b001) begin
		logicout[31:0] = {32{1'b0}};
	end else begin
		case(aluop[7:0])
			8'b00100100, 
			8'b00001100: logicout[31:0] = reg1_data & reg2_data;
			8'b00001101,
			8'b00100101: logicout[31:0] = reg1_data | reg2_data;
			8'b00100110, 
			8'b00001110: logicout[31:0] = reg1_data ^ reg2_data;
			8'b00100111: logicout[31:0] = ~(reg1_data | reg2_data);
			8'b00001111: logicout[31:0] = {reg2_data[15:0],16'd0};
			default:     logicout[31:0] = {32{1'b0}};
		endcase
	end
end


//////////////////////////////////////////////////////////////////////////
/////////////moveout
//////////////////////////////////////////////////////////////////////////
always @ (*) begin
	if(!reset_n) begin
		moveout[31:0] = {32{1'b0}};
	end else if(alusel==3'b010) begin 
		case(aluop[7:0])
			8'b00000000,
			8'b00000100: moveout[31:0] = (reg2_data << reg1_data[4:0]);
			8'b00000010, 
			8'b00000110: moveout[31:0] = (reg2_data >> reg1_data[4:0]);
			8'b00000011,8'b00000111:begin
				if(reg2_data[31]==1)begin
					moveout[31:0] = right_move[31:0];
				end else begin
					moveout[31:0] = (reg2_data >> reg1_data[4:0]);
				end
			end
			default: moveout[31:0] = {32{1'b0}};
		endcase
	end else begin
		moveout[31:0] = {32{1'b0}};
	end
end


//////////////////////////////////////////////////////////////////////////
/////////////shiftout
//////////////////////////////////////////////////////////////////////////
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
	end else begin
		shiftout[31:0] = {32{1'b0}};
	end
end

assign reg1_data_mux[31:0] = ((alusel==3'b100 && ((aluop==8'b00101010)||(aluop==8'b00001010)||(aluop==8'b000010)||(aluop==8'b11000) 
				||(aluop==8'b0)||(aluop==8'b100)) ||(aluop==8'b11000000)||(aluop==8'b11000100)||(aluop==8'b00011010)) 
				&& (reg1_data[31]==1))
				? (~reg1_data[31:0]+1) : reg1_data[31:0];
always @ (*) begin
	if(!reset_n)begin
		reg2_data_mux[31:0] = {32{1'b0}};
	end else if(alusel==3'b100)begin
		case(aluop[7:0])
			8'b00000010,8'b00011000,8'b0,8'b100,8'b11000000,8'b11000100,8'b00011010:begin
				if(reg2_data[31]==1)begin
					reg2_data_mux[31:0] = ~reg2_data+1;
				end else begin
					reg2_data_mux[31:0] = reg2_data[31:0];
				end
			end
			8'b00101011,8'b00001011,8'b00100010,8'b00100011:reg2_data_mux[31:0] = ~reg2_data+1;
			8'b00101010,8'b00001010:reg2_data_mux[31:0] = ~reg2_data+1;
			default:reg2_data_mux[31:0] = reg2_data[31:0];
		endcase
	end else begin
		reg2_data_mux[31:0] = reg2_data[31:0];
	end
end
assign sum_tempt    [31:0] = reg1_data_mux[31:0] + reg2_data_mux[31:0]; 
assign over_sum            = (reg1_data[31]) && reg2_data[31] &&(!sum_tempt[31]);
always @ (*) begin
	if(!reset_n)begin
		reg1_lt_reg2 = 1'b0;
	end else if(alusel==3'b100) begin
		case(aluop)
			8'b101010,8'b001010:reg1_lt_reg2 = (reg1_data[31]&&(!reg2_data[31])) || 
						(reg1_data[31]&&reg2_data[31]&&(!sum_tempt[31])) || 
						((!reg1_data[31])&&(!reg2_data[31])&&(sum_tempt[31]));
			8'b101011,8'b001011:begin
				if(reg2_data[31:0]==32'd0)begin
					reg1_lt_reg2 = 1'b0;
				end else if(reg2_data[31]==1'b1) begin
					reg1_lt_reg2 = (reg1_data[31] && sum_tempt[31]) || ((!reg1_data[31])&&(!sum_tempt[31]));
				end else begin
					reg1_lt_reg2 = ((!reg1_data[31]) && (sum_tempt[31]))||(reg1_data[31]&& (!sum_tempt[31]));
				end
			end
		default:begin
			reg1_lt_reg2 = 1'b0;	
		end
		endcase
	end else begin
		reg1_lt_reg2 = 1'b0;
	end
end
assign mul_tempt   [63:0] = reg1_data_mux[31:0] * reg2_data_mux[31:0];
assign mul_result  [63:0] = (alusel==3'b100&&((aluop==8'b10)||(aluop==8'b11000)||(aluop==8'd0)||(aluop==8'b100)||
			    (aluop==8'b11000000)||(aluop==8'b11000100))) &&
			    ((reg1_data[31] && (!reg2_data[31])) || ((!reg1_data[31])&&(reg2_data[31]))) 
		 	? ~mul_tempt[63:0]+1 : mul_tempt;




always @ (*) begin
	if(!reset_n) begin
		ex_cnt[5:0] =  6'd0;
	end else if(alusel==3'b100) begin
		case(aluop[7:0])
			8'b11000000,8'b11000001,8'b11000100,8'b11000101:begin
				if(mem_cnt == 6'd1) begin
					ex_cnt[5:0] = 6'd0;
				end else begin
					ex_cnt[5:0] = mem_cnt[5:0] + 1'b1;
				end
			end
			8'b00011010,8'b00011011:begin
				if(mem_cnt == 6'd32)begin
					ex_cnt[5:0] = 6'd0;
				end else begin
					ex_cnt[5:0] = mem_cnt[5:0] + 1'b1;
				end
			end
			default:ex_cnt[5:0] =  6'd0;
		endcase
	end else begin
		ex_cnt[5:0] = 6'd0;
	end
end


always @ (*) begin
	if(!reset_n) begin
		ex_hilo_tempt [63:0] =  {64{1'b0}};
	end else if(ex_cnt==6'd1) begin
		ex_hilo_tempt [63:0] =  mul_result[63:0];
	end else if((mem_cnt==6'd1) && (alusel==3'b100) ) begin
		case(aluop[7:0])
			8'b11000000,8'b11000001:begin
				if(mem_whilo)begin
						ex_hilo_tempt[63:0] =  mem_hilo_tempt[63:0] +{mem_hi,mem_lo};
				end else if(wb_whilo) begin
						ex_hilo_tempt[63:0] =  mem_hilo_tempt[63:0] +{wb_hi,wb_lo};
				end else begin
						ex_hilo_tempt[63:0] =  mem_hilo_tempt[63:0] +{hilo_hi,hilo_lo};
				end
			end
			8'b11000100,8'b11000101:begin
				if(mem_whilo)begin
						ex_hilo_tempt[63:0] =  {mem_hi,mem_lo} + (~mem_hilo_tempt[63:0]+1);
				end else if(wb_whilo) begin
						ex_hilo_tempt[63:0] =  {wb_hi,wb_lo} + (~mem_hilo_tempt[63:0]+1);
				end else begin
						ex_hilo_tempt[63:0] =  {hilo_hi,hilo_lo} + (~mem_hilo_tempt[63:0]+1);	
				end 
			end
			default:ex_hilo_tempt[63:0] = {64{1'b0}};
			
		endcase

	end else begin
		ex_hilo_tempt[63:0] = {64{1'b0}};
	end
end


always @ (*) begin
	if(!reset_n) begin
		stallreg_from_ex =  1'b0;
	end else if(ex_cnt != 0) begin
		stallreg_from_ex =  1'b1;
	end else begin
		stallreg_from_ex =  1'b0;
	end
end


//////////////////////////////////////////////////////////////////////////
/////////////div divu
//////////////////////////////////////////////////////////////////////////
assign m[31:0] = ex_cnt != 6'd0 ? reg1_data_mux[31:0] : {32{1'b0}};
assign n[31:0] = ex_cnt != 6'd0 ? reg2_data_mux[31:0] : {32{1'b0}};
assign s_tempt[31:0] = ((alusel==3'b100) && (aluop==8'b011010)&&(((!reg1_data[31])&&(reg2_data[31]))||((reg1_data[31])&&(!reg2_data[31])))) ? (~minuend[31:0]+1) : minuend[31:0];



always @ (*) begin
	if(!reset_n) begin
		sub_tempt[31:0] = {32{1'b0}};
	end else if(ex_cnt==6'd1)begin
		sub_tempt[31:0] = m[K] - n;
	end else if((mem_cnt != 6'd0) && (mem_cnt != 6'd32)) begin
		sub_tempt[31:0] = mem_minuend[63:K] - n;
	end else begin
		sub_tempt[31:0] = {32{1'b0}};
	end
end


always @ (*) begin
	if(!reset_n) begin
		minuend[63:0] = {64{1'b0}};
	end else if(ex_cnt==6'd1 )begin
		if(sub_tempt[31]) begin
			minuend[63:0] = {m[K:0],1'b0};
		end else begin
			minuend[63:0] = {sub_tempt,m[K-1:0],1'b1};
		end

	end else if((mem_cnt != 6'd0) && (mem_cnt != 6'd32))begin
		if(sub_tempt[31])begin
			minuend[63:0] = {mem_minuend[63:0],1'b0};
		end else begin
			minuend[63:0] = {sub_tempt,mem_minuend[K-1:0],1'b1};
		end
	end else begin
		minuend[63:0] = {64{1'b0}};
	end
end



//////////////////////////////////////////////////////////////////////////
/////////////arithmeticout
//////////////////////////////////////////////////////////////////////////
always @ (*) begin
	if(!reset_n) begin
		arithmeticout[31:0] = {32{1'b0}};
	end else if(alusel[2:0]==3'b100) begin
		case(aluop[7:0])
			8'b00100000, 8'b00100010,8'b00100001, 8'b00100011,8'b00001000,8'b00001001:begin
				arithmeticout[31:0] = sum_tempt[31:0];
			end
			8'b11100000:begin
				arithmeticout[31:0] = reg1_data[31] ? 32'd0  : 
						      reg1_data[30] ? 32'd1  :
						      reg1_data[29] ? 32'd2  :
						      reg1_data[28] ? 32'd3  :
						      reg1_data[27] ? 32'd4  :
						      reg1_data[26] ? 32'd5  :
						      reg1_data[25] ? 32'd6  :
						      reg1_data[24] ? 32'd7  :
						      reg1_data[23] ? 32'd8  :
						      reg1_data[22] ? 32'd9  :
						      reg1_data[21] ? 32'd10 :
						      reg1_data[20] ? 32'd11 :
						      reg1_data[19] ? 32'd12  :
						      reg1_data[18] ? 32'd13  :
						      reg1_data[17] ? 32'd14  :
						      reg1_data[16] ? 32'd15  :
						      reg1_data[15] ? 32'd16  :
						      reg1_data[14] ? 32'd17  :
						      reg1_data[13] ? 32'd18  :
						      reg1_data[12] ? 32'd19  :
						      reg1_data[11] ? 32'd20  :
						      reg1_data[10] ? 32'd21  :
						      reg1_data[ 9] ? 32'd22  :
						      reg1_data[ 8] ? 32'd23  :
						      reg1_data[ 7] ? 32'd24  :
						      reg1_data[ 6] ? 32'd25  :
						      reg1_data[ 5] ? 32'd26  :
						      reg1_data[ 4] ? 32'd27  :
						      reg1_data[ 3] ? 32'd28  :
						      reg1_data[ 2] ? 32'd29  :
						      reg1_data[ 1] ? 32'd30  :
						      reg1_data[ 0] ? 32'd31  : 32'd32;
			end
			8'b11100001:begin
				arithmeticout[31:0] = !reg1_data[31] ? 32'd0  : 
						      !reg1_data[30] ? 32'd1  :
						      !reg1_data[29] ? 32'd2  :
						      !reg1_data[28] ? 32'd3  :
						      !reg1_data[27] ? 32'd4  :
						      !reg1_data[26] ? 32'd5  :
						      !reg1_data[25] ? 32'd6  :
						      !reg1_data[24] ? 32'd7  :
						      !reg1_data[23] ? 32'd8  :
						      !reg1_data[22] ? 32'd9  :
						      !reg1_data[21] ? 32'd10 :
						      !reg1_data[20] ? 32'd11 :
						      !reg1_data[19] ? 32'd12  :
						      !reg1_data[18] ? 32'd13  :
						      !reg1_data[17] ? 32'd14  :
						      !reg1_data[16] ? 32'd15  :
						      !reg1_data[15] ? 32'd16  :
						      !reg1_data[14] ? 32'd17  :
						      !reg1_data[13] ? 32'd18  :
						      !reg1_data[12] ? 32'd19  :
						      !reg1_data[11] ? 32'd20  :
						      !reg1_data[10] ? 32'd21  :
						      !reg1_data[ 9] ? 32'd22  :
						      !reg1_data[ 8] ? 32'd23  :
						      !reg1_data[ 7] ? 32'd24  :
						      !reg1_data[ 6] ? 32'd25  :
						      !reg1_data[ 5] ? 32'd26  :
						      !reg1_data[ 4] ? 32'd27  :
						      !reg1_data[ 3] ? 32'd28  :
						      !reg1_data[ 2] ? 32'd29  :
						      !reg1_data[ 1] ? 32'd30  :
						      !reg1_data[ 0] ? 32'd31  : 32'd32;
			end
			8'b00000010:arithmeticout[31:0] = mul_result[31:0];
			default:    arithmeticout[31:0] = {32{1'b0}};
		endcase
	end else begin
		arithmeticout[31:0] = {32{1'b0}};
	end
end

//////////////////////////////////////////////////////////////////////////
/////////////wdata out
//////////////////////////////////////////////////////////////////////////
always @ (*) begin
	if(!reset_n ) begin
		ex_we         =  1'b0;
		ex_waddr[4:0] = {5{1'b0}};
		ex_wdata[31:0]=  {32{1'b0}};
	end else  begin
		ex_we         =  id_we;
		ex_waddr[4:0] =  id_waddr[4:0];
		case(alusel[2:0])
			3'b000: ex_wdata[31:0] =  {32{1'b0}};
			3'b001: ex_wdata[31:0] = logicout[31:0];
			3'b010: ex_wdata[31:0] = moveout[31:0];
			3'b011: ex_wdata[31:0] = shiftout[31:0];
			3'b100:begin
				if((aluop==8'b00100000) || (aluop==8'b00100010) || (aluop==8'b00001000))begin
						if(!over_sum)begin
							ex_wdata[31:0] =  arithmeticout[31:0];
						end
				end else if((aluop==8'b00001010) || (aluop==8'b00101010) || (aluop==8'b1011) || (aluop==8'b00101011)) begin
						ex_wdata[31:0] =  reg1_lt_reg2;
				end else  begin
					ex_wdata[31:0] = arithmeticout[31:0];
				end
			end
			default:begin
				ex_wdata[31:0] = {32{1'b0}};
			end
		endcase
	end
end


//////////////////////////////////////////////////////////////////////////
/////////////out to hilo
//////////////////////////////////////////////////////////////////////////
always @ (*) begin
	if(!reset_n ) begin
		ex_whilo     = 1'b0;
		ex_hi [31:0] = {32{1'b0}};
		ex_lo [31:0] = {32{1'b0}};
	end else if(alusel==3'b011) begin
		case(aluop[7:0])
			8'b00010001:begin
				ex_whilo     = 1'b1;
                                ex_hi [31:0] = reg1_data[31:0];
			end
			8'b00010011:begin
				ex_whilo     = 1'b1;
				ex_lo [31:0] = reg1_data[31:0];
			end
			default:begin
				ex_whilo     =1'b0;
				ex_hi[31:0]  = {32{1'b0}};
				ex_lo[31:0]  ={32{1'b0}};
			end
		endcase
	end else if(alusel==3'b100)  begin
		case(aluop[7:0])
			8'b00011000,8'b00011001:begin
				ex_whilo    = 1'b1;
				ex_hi[31:0] = mul_result[63:32];
				ex_lo[31:0] = mul_result[31:0 ];
			end
			8'b11000000,8'b11000001,8'b11000100,8'b11000101:begin
				if(mem_cnt==5'd1)begin
					ex_whilo    = 1'b1;
					ex_hi[31:0] = ex_hilo_tempt[63:32];
					ex_lo[31:0] = ex_hilo_tempt[31:0 ];
				end else begin
					ex_whilo     =  1'b0;
                                	ex_hi[31:0]  =  {32{1'b0}};
                                	ex_lo[31:0]  =  {32{1'b0}};
				end

			end
			8'b00011010,8'b00011011:begin
				if(mem_cnt == 5'd31)begin
					ex_whilo    = 1'b1;
					ex_hi[31:0] = reg1_data - reg2_data*s_tempt;
					ex_lo[31:0] = s_tempt;
				end else begin
					ex_whilo     =  1'b0;
                                	ex_hi[31:0]  =  {32{1'b0}};
                                	ex_lo[31:0]  =  {32{1'b0}};
				end
			end
			default:begin
				ex_whilo     =  1'b0;
				ex_hi[31:0]  =  {32{1'b0}};
				ex_lo[31:0]  =  {32{1'b0}};
			end
		endcase
	end else begin
		ex_whilo     =  1'b0;
		ex_hi[31:0]  =  {32{1'b0}};
		ex_lo[31:0]  =  {32{1'b0}};
	end
end
endmodule
