module mbist_8kx8(bist_clk,bist_reset_n,bist_test_enable,Addr_fun,wen_fun,cen_fun,oen_fun,wdata_fun,rdata_fun,
		data_test,Addr_test,wen_test,cen_test,oen_test,bist_done,bist_fail);
input       bist_clk;
input       bist_reset_n;
input       bist_test_enable;
input [12:0]Addr_fun;
input       wen_fun;
input       cen_fun;
input       oen_fun;
input [7 :0]wdata_fun;
input [7 :0]rdata_fun;
output[7 :0]data_test;
output[12:0]Addr_test;
output      wen_test;
output      cen_test;
output      oen_test;
output      bist_done;
output      bist_fail;

parameter [3:0]ST_IDLE                = 4'd0;
parameter [3:0]ST_WRITE_ALL_0         = 4'd1;
parameter [3:0]ST_UP_RD_DATA0         = 4'd2;
parameter [3:0]ST_UP_COMPARE_WITH_0   = 4'd3;
parameter [3:0]ST_UP_WRITE_DATA_1     = 4'd4;
parameter [3:0]ST_UP_RD_DATA1         = 4'd5;
parameter [3:0]ST_UP_COMPARE_WITH_1   = 4'd6;
parameter [3:0]ST_WRITE_ALL_1         = 4'd7;
parameter [3:0]ST_DOWN_RD_DATA1       = 4'd8;
parameter [3:0]ST_DOWN_COMPARE_WITH_1 = 4'h9;
parameter [3:0]ST_DOWN_WRITE_DATA_0   = 4'ha;
parameter [3:0]ST_DOWN_RD_DATA0       = 4'hb;
parameter [3:0]ST_DOWN_COMPARE_WITH_0 = 4'hc;

reg [3:0]state;
reg [3:0]next_state;
reg [2:0]bit_cnt;
reg [12:0]addr_cnt;
reg [7:0]data_temp;
wire     wen_temp;
reg      bist_ten;



assign wen_temp = ((state==ST_UP_RD_DATA0)||(state==ST_UP_RD_DATA1)||(state==ST_DOWN_RD_DATA1)||(state==ST_DOWN_RD_DATA0));

assign data_test[7 :0] = bist_ten ? data_temp[7:0] : wdata_fun[7:0];
assign Addr_test[12:0] = bist_ten ? addr_cnt[12:0] : Addr_fun[12:0];
assign wen_test        = bist_ten ? wen_temp       : wen_fun;
assign cen_test        = bist_ten ? 1'b0           : cen_fun;
assign oen_test        = bist_ten ? 1'b0           : oen_fun;

assign bist_fail = ((state==ST_UP_COMPARE_WITH_0)&&(rdata_fun[bit_cnt]!=1'b0))||((state==ST_UP_COMPARE_WITH_1)&&(rdata_fun[bit_cnt]!=1'b1))||
		   ((state==ST_DOWN_COMPARE_WITH_1)&&(rdata_fun[bit_cnt]!=1'b1))||((state==ST_DOWN_COMPARE_WITH_0)&&(rdata_fun[bit_cnt]!=1'b0));
assign bist_done = (!bist_fail)&&((state==ST_DOWN_COMPARE_WITH_0)&&(next_state==ST_IDLE));

always@ (posedge bist_clk or negedge bist_reset_n)begin
	if(!bist_reset_n)begin
		bist_ten <= 1'b0;
	end else if(bist_done) begin
		bist_ten <= 1'b0;
	end else if(bist_test_enable) begin
		bist_ten <= 1'b1;
	end
end



integer index;
always @ (* )begin
	if(state==ST_WRITE_ALL_0)begin
		for(index=0;index<=13'h1fff;index=index+1)
			data_temp[7:0] = 8'd0;
	end else if(state==ST_WRITE_ALL_1)begin
		data_temp[7:0] = 8'hff;
	end else if(state==ST_UP_WRITE_DATA_1) begin
		data_temp[bit_cnt] = 1'b1;
	end else if(state==ST_DOWN_WRITE_DATA_0)begin
		data_temp[bit_cnt] = 1'b0;
	end 
end

always @ (posedge bist_clk or negedge bist_reset_n) begin
	if(!bist_reset_n)begin
		bit_cnt[2:0] <= 3'd0;
	end else if((state==ST_IDLE)&&(next_state!=state))begin
		bit_cnt[2:0] <= 3'd0;
	end else if(((state==ST_UP_COMPARE_WITH_1)||(state==ST_DOWN_COMPARE_WITH_0))&&(next_state != state)) begin
		bit_cnt[2:0] <= bit_cnt[2:0] + 1'b1;
	end
end 



always @ (posedge bist_clk or negedge bist_reset_n) begin
	if(!bist_reset_n)begin
		addr_cnt[12:0] <= 13'h0;
	end else if((state==ST_IDLE)&&(next_state!=state))begin
		addr_cnt[12:0] <= 13'h0;
	end else if(((state==ST_UP_COMPARE_WITH_1)||(state==ST_DOWN_COMPARE_WITH_0))&&(bit_cnt==3'd7)&&(addr_cnt[12:0]==13'h1fff))begin
		addr_cnt[12:0] <= 13'h0;
	end else if(((state==ST_UP_COMPARE_WITH_1)||(state==ST_DOWN_COMPARE_WITH_0))&&(bit_cnt==3'd7)) begin
		addr_cnt[12:0] <= addr_cnt[12:0] + 1'b1;
	end
end 


always @ (posedge bist_clk or negedge bist_reset_n) begin
	if(!bist_reset_n)begin
		state[3:0] <= ST_IDLE[3:0];
	end else begin
		state[3:0] <= next_state[3:0];
	end
end 


always @ (*) begin
	next_state[3:0] = state[3:0];
	case(state[3:0])
		ST_IDLE[3:0]:begin
			if(bist_test_enable)begin
				next_state[3:0] = ST_WRITE_ALL_0[3:0];
			end
		end
		ST_WRITE_ALL_0      [3:0]:next_state[3:0] = ST_UP_RD_DATA0[3:0];
		ST_UP_RD_DATA0      [3:0]:next_state[3:0] = ST_UP_COMPARE_WITH_0[3:0] ;
		ST_UP_COMPARE_WITH_0[3:0]:next_state[3:0] = ST_UP_WRITE_DATA_1  [3:0] ;
		ST_UP_WRITE_DATA_1  [3:0]:next_state[3:0] = ST_UP_RD_DATA1      [3:0] ;
		ST_UP_RD_DATA1      [3:0]:next_state[3:0] = ST_UP_COMPARE_WITH_1[3:0] ;
		ST_UP_COMPARE_WITH_1[3:0]:begin
			if((bit_cnt==3'd7)&&(addr_cnt==13'h1fff))begin
				next_state[3:0] = ST_WRITE_ALL_1[3:0];
			end else if((bit_cnt==3'd7))begin
				next_state[3:0] = ST_WRITE_ALL_0[3:0];
			end else begin
				next_state[3:0] = ST_UP_RD_DATA0[3:0];
			end
		end
		ST_WRITE_ALL_1        [3:0]:next_state[3:0] = ST_DOWN_RD_DATA1      [3:0];
		ST_DOWN_RD_DATA1      [3:0]:next_state[3:0] = ST_DOWN_COMPARE_WITH_1[3:0];
		ST_DOWN_COMPARE_WITH_1[3:0]:next_state[3:0] = ST_DOWN_WRITE_DATA_0  [3:0];
		ST_DOWN_WRITE_DATA_0  [3:0]:next_state[3:0] = ST_DOWN_RD_DATA0      [3:0];
		ST_DOWN_RD_DATA0      [3:0]:next_state[3:0] = ST_DOWN_COMPARE_WITH_0[3:0];
		ST_DOWN_COMPARE_WITH_0[3:0]:begin
			if((bit_cnt==3'd7)&&(addr_cnt==13'h1fff))begin
				next_state[3:0] = ST_IDLE[3:0];
			end else if(bit_cnt==3'd7)begin
				next_state[3:0] = ST_WRITE_ALL_1[3:0];
			end else begin
				next_state[3:0] = ST_DOWN_RD_DATA1[3:0];
			end
		end
	endcase

end 




endmodule
