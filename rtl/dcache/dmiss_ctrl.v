module dmiss_ctrl(
input 		 clk,
input 		 reset_n,
output           miss_done,
output     [31:0]miss_rdata,

/////////////with sram
input     [31:0]data_i,
input           valid,
input           wr_done,
input           rd_done,
output          req,
output          wr,
output [19:0]daddr,
output   [127:0]dirty_data,

////////////with hit
input           hwrite_d,
input     [31:0]hwdata_d,
input           miss,
input     [19:0]miss_addr,
input     [15:0]way0_tag,
input     [15:0]way1_tag,
input     [15:0]way2_tag,
input     [15:0]way3_tag,
input     [127:0]updata,
output reg      miss_data0_En,
output reg      miss_data1_En,
output reg      miss_data2_En,
output reg      miss_data3_En,
output          miss_data0_Wr,
output          miss_data1_Wr,
output          miss_data2_Wr,
output          miss_data3_Wr,
output reg[127:0]miss_wdata,
output          miss_tag_En,
output reg[15:0]wr_way0_tag,
output reg[15:0]wr_way1_tag,
output reg[15:0]wr_way2_tag,
output reg[15:0]wr_way3_tag,
output reg[3 :0]wr_tag_index,
output          miss_renewtag,

/////////////with arbit
input           arbit_flag,
input           arbit_done,
output reg      data0_valid,
output reg      data1_valid,
output reg      data2_valid,
output reg      data3_valid
);

parameter [1:0]S_IDLE    = 2'd0;
parameter [1:0]S_RD_SRAM = 2'd1;
parameter [1:0]S_WR_SRAM = 2'd2;
parameter [1:0]S_RETAG   = 2'd3;
reg [1:0]state;
reg [1:0]next_state;
reg [1:0]way0_cnt;
reg [1:0]way1_cnt;
reg [1:0]way2_cnt;
reg [1:0]way3_cnt;
reg      dirty_data_valid;
reg [19:0]dirty_addr;
reg [1:0]data_cnt;
reg req_flag;

wire [1:0]block_set;
wire [31:0]wdata;

assign block_set[1:0] = miss_addr[3:2];
assign req = ((state==S_IDLE)&&(next_state!=state)) || (state==S_RETAG&&(next_state==S_WR_SRAM));
assign wr  = ((state==S_IDLE)&&(next_state!=state)) ? 1'b0 : 1'b1;
assign dirty_data[127:0] = dirty_data_valid ? updata[127:0] : {4{32'h0}};
assign miss_data0_Wr = (miss&& (!arbit_flag)) ? 1'b0 : 1'b1; 
assign miss_data1_Wr = (miss&& (!arbit_flag)) ? 1'b0 : 1'b1; 
assign miss_data2_Wr = (miss&& (!arbit_flag)) ? 1'b0 : 1'b1; 
assign miss_data3_Wr = (miss&& (!arbit_flag)) ? 1'b0 : 1'b1; 
assign miss_tag_En = ((state==S_RETAG));
assign wdata[31:0] = (arbit_done ||(data_cnt==block_set && hwrite_d )) ? hwdata_d[31:0] : data_i[31:0];
assign miss_renewtag = (state==S_RETAG)||((state==S_RD_SRAM)&&(next_state!=state));


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		wr_tag_index[3:0] <= 4'd0;
	end else if(next_state==S_IDLE) begin
		wr_tag_index[3:0] <= 4'd0;
	end else if((state==S_IDLE)&&(next_state!=state))begin
		wr_tag_index[3:0] <= miss_addr[7:4];
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		req_flag <= 1'b0;
	end else if(miss&&(!arbit_flag)&&(state!=S_IDLE))begin
		req_flag <= 1'b1;
	end else if(req) begin
		req_flag <= 1'b0;
	end
end

always @ (posedge clk or posedge reset_n)begin
	if(!reset_n)begin
		miss_wdata[127:0] <= {4{32'h0}};
	end else if(state==S_IDLE)begin
		miss_wdata[127:0] <= {4{32'h0}};
	end else if(valid) begin
		case(data_cnt[1:0])
			2'd0:miss_wdata[31: 0] <= wdata[31:0];
			2'd1:miss_wdata[63:32] <= wdata[31:0];
			2'd2:miss_wdata[95:64] <= wdata[31:0];
			2'd3:miss_wdata[127:96]<= wdata[31:0];
		endcase
	end
end

///////////data_table
always @ (*)begin
	if(miss && (!arbit_flag))begin
		if((way0_tag[3:2]==2'd3) && way0_tag[0])begin
			miss_data0_En = 1'b1;
		end 
		if((way1_tag[3:2]==2'd3) && way1_tag[0])begin
			miss_data1_En = 1'b1;
		end 
		if((way2_tag[3:2]==2'd3) && way2_tag[0])begin
			miss_data2_En = 1'b1;
		end 
		if((way3_tag[3:2]==2'd3) && way3_tag[0])begin
			miss_data3_En = 1'b1;
		end 
	end else if(state==S_RETAG || state==S_WR_SRAM)begin
		if(way0_tag[3:2]==2'd3)begin
			miss_data0_En = 1'b1;
		end
		if(way1_tag[3:2]==2'd3)begin
			miss_data1_En = 1'b1;
		end
		if(way2_tag[3:2]==2'd3)begin
			miss_data2_En = 1'b1;
		end
		if(way3_tag[3:2]==2'd3)begin
			miss_data3_En = 1'b1;
		end
	end else begin
		miss_data0_En = 1'b0;
		miss_data1_En = 1'b0;
		miss_data2_En = 1'b0;
		miss_data3_En = 1'b0;
	end
end


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		dirty_addr[19:0] <= {16'h0,2'b00,2'b00};
	end else if(wr_done) begin
		dirty_addr[19:0] <= {16'h0,2'b00,2'b00};
	end else if((miss && (!arbit_flag)))begin
		if(miss_data0_En)begin
			dirty_addr[19:0] = {way0_tag[15:0],4'b0};
		end
		if(miss_data1_En)begin
			dirty_addr[19:0] = {way1_tag[15:0],4'b0};
		end
		if(miss_data2_En)begin
			dirty_addr[19:0] = {way2_tag[15:0],4'b0};
		end
		if(miss_data3_En)begin
			dirty_addr[19:0] = {way3_tag[15:0],4'b0};
		end

	end
end



/////////////miss_rdata
assign miss_rdata[31:0] = (data_cnt==block_set && (!hwrite_d)&&valid) ? data_i[31:0] : 32'h0;
assign miss_done        = ((data_cnt==block_set)&&(valid) ) ? 1'b1 : 1'b0;



always @ (*)begin
	if(state==S_RETAG && (!hwrite_d))begin
		if(way0_cnt[1:0]==2'b00)begin
			wr_way0_tag[15:0] = {way0_tag[15:4],way0_cnt[1:0],1'b1,way0_tag[0]};
		end else begin
			wr_way0_tag[15:0] = {way0_tag[15:4],way0_cnt[1:0],1'b0,way0_tag[0]};
		end
		if(way1_cnt[1:0]==2'b00)begin
			wr_way1_tag[15:0] = {way1_tag[15:4],way1_cnt[1:0],1'b1,way1_tag[0]};
		end else begin
			wr_way1_tag[15:0] = {way1_tag[15:4],way1_cnt[1:0],1'b0,way1_tag[0]};
		end
		if(way2_cnt[1:0]==2'b00)begin
			wr_way2_tag[15:0] = {way2_tag[15:4],way2_cnt[1:0],1'b1,way2_tag[0]};
		end else begin
			wr_way2_tag[15:0] = {way2_tag[15:4],way2_cnt[1:0],1'b0,way2_tag[0]};
		end
		if(way3_cnt[1:0]==2'b00)begin
			wr_way3_tag[15:0] = {way0_tag[15:4],way3_cnt[1:0],1'b1,way3_tag[0]};
		end else begin
			wr_way3_tag[15:0] = {way0_tag[15:4],way3_cnt[1:0],1'b0,way3_tag[0]};
		end
	end else if(state==S_RETAG && (hwrite_d))begin
		if(way0_cnt[1:0]==2'b00)begin
			wr_way0_tag[15:0] = {way0_tag[15:4],way0_cnt[1:0],1'b1,1'b1};
		end else begin
			wr_way0_tag[15:0] = {way0_tag[15:4],way0_cnt[1:0],1'b0,1'b1};
		end
		if(way1_cnt[1:0]==2'b00)begin
			wr_way1_tag[15:0] = {way1_tag[15:4],way1_cnt[1:0],1'b1,1'b1};
		end else begin
			wr_way1_tag[15:0] = {way1_tag[15:4],way1_cnt[1:0],1'b0,1'b1};
		end
		if(way2_cnt[1:0]==2'b00)begin
			wr_way2_tag[15:0] = {way2_tag[15:4],way2_cnt[1:0],1'b1,1'b1};
		end else begin
			wr_way2_tag[15:0] = {way2_tag[15:4],way2_cnt[1:0],1'b0,1'b1};
		end
		if(way3_cnt[1:0]==2'b00)begin
			wr_way3_tag[15:0] = {way0_tag[15:4],way3_cnt[1:0],1'b1,1'b1};
		end else begin
			wr_way3_tag[15:0] = {way0_tag[15:4],way3_cnt[1:0],1'b0,1'b1};
		end
	end else begin
		wr_way0_tag[15:0] = {12'b00,2'b00,1'b0,1'b0};
                wr_way1_tag[15:0] = {12'b00,2'b01,1'b0,1'b0};
                wr_way2_tag[15:0] = {12'b00,2'b10,1'b0,1'b0};
                wr_way3_tag[15:0] = {12'b00,2'b11,1'b0,1'b0};
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		dirty_data_valid <= 1'b0;
	end else if(wr_done) begin
		dirty_data_valid <= 1'b0;
	end else if((miss && (!arbit_flag))&&((state==S_IDLE)&&(next_state!=state))&&(miss_data0_En||miss_data1_En||miss_data2_En||miss_data3_En))begin
		dirty_data_valid <= 1'b1;
	end
end

assign daddr[19:0] = (state==S_WR_SRAM) ? dirty_addr[19:0] : {miss_addr[19:4],4'h0};


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		way0_cnt[1:0] <= 2'd0; 
		way1_cnt[1:0] <= 2'd0; 
		way2_cnt[1:0] <= 2'd0; 
		way3_cnt[1:0] <= 2'd0; 
	end else if(state==S_RD_SRAM&& (next_state!=state)) begin
		way0_cnt[1:0] <= way0_tag[3:2] + 1'b1; 
		way1_cnt[1:0] <= way1_tag[3:2] + 1'b1; 
		way2_cnt[1:0] <= way2_tag[3:2] + 1'b1; 
		way3_cnt[1:0] <= way3_tag[3:2] + 1'b1; 
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		data_cnt[1:0] <= 2'd0;
	end else if(valid) begin
		data_cnt[1:0] <= data_cnt[1:0] + 1'b1;
	end
end



always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		data0_valid <= 1'b0;
		data1_valid <= 1'b0;
		data2_valid <= 1'b0;
		data3_valid <= 1'b0;
	end else if(state==S_RETAG ) begin
		data0_valid <= 1'b0;
		data1_valid <= 1'b0;
		data2_valid <= 1'b0;
		data3_valid <= 1'b0;
	end else begin
		if(data_cnt==2'd0 && valid)begin
			data0_valid <= 1'b1;
		end 
		if(data_cnt==2'd1 && valid)begin
			data1_valid <= 1'b1;
		end 
		if(data_cnt==2'd2 && valid)begin
			data2_valid <= 1'b1;
		end 
		if(data_cnt==2'd3 && valid)begin
			data3_valid <= 1'b1;
		end 
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		state[1:0] <= S_IDLE[1:0];
	end else begin
		state[1:0] <= next_state[1:0];
	end
end


always @ (*)begin
	next_state[1:0] = state[1:0];
	case(state)
		S_IDLE[1:0]:begin
			if(miss&&(!arbit_flag)||req_flag)begin
				next_state[1:0] = S_RD_SRAM[1:0];
			end
		end
		S_RD_SRAM[1:0]:begin
			if(rd_done)begin
				next_state[1:0] = S_RETAG[1:0]; 
			end
		end
		S_WR_SRAM[1:0]:begin
			if(wr_done)begin
				next_state[1:0] = S_IDLE[1:0];
			end
		end
		S_RETAG[1:0]:begin
			if(dirty_data_valid)begin
				next_state[1:0] = S_WR_SRAM[1:0];
			end else begin
				next_state[1:0] = S_IDLE[1:0];
			end
		end
	endcase
end

endmodule
