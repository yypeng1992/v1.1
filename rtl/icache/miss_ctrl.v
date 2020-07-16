module miss_ctrl(
input           clk,
input           reset_n,
input           done,
input           miss,
input   [17:0]  miss_addr,
output reg      data_flag,
output reg[31:0]rdata,

/////////////////with flash_ctrl
input  [14:0]way0_tag,
input  [14:0]way1_tag,
input  [14:0]way2_tag,
input  [14:0]way3_tag,
input        ack,
input        valid,
input  [31:0]data,
output reg   req,
output [19:0]c_addr,

output           miss_tag_En,
output reg [14:0]wd_tag0,
output reg [14:0]wd_tag1,
output reg [14:0]wd_tag2,
output reg [14:0]wd_tag3,
output reg       miss_data_En0,
output reg       miss_data_En1,
output reg       miss_data_En2,
output reg       miss_data_En3,
/////////////////////with arbit
input            arbit_flag,
output reg[17:0]last_addr,
output reg      data0_valid,
output reg      data1_valid,
output reg      data2_valid,
output reg      data3_valid,
output  reg[127:0] wdata,
output reg      miss_flag
);

parameter [2:0] ST_IDLE         = 3'd0;
parameter [2:0] ST_RECEIVE_DATA = 3'd1;
parameter [2:0] ST_WD_DATA      = 3'd2;
parameter [2:0] ST_WD_TAG       = 3'd3;
reg [2:0]state;
reg [2:0]next_state;
reg [1:0]data_cnt;
wire [1:0]block_set;
wire [3:0]index;
reg [1:0]way0_cnt;
reg [1:0]way1_cnt;
reg [1:0]way2_cnt;
reg [1:0]way3_cnt;
reg      data0_valid_d;
reg      data1_valid_d;
reg      data2_valid_d;
reg      data3_valid_d;
wire     data0_valid_up;
wire     data1_valid_up;
wire     data2_valid_up;
wire     data3_valid_up;

assign c_addr[19:0] = {miss_addr[17:2],4'b0000};
assign block_set[1:0] = miss_addr[1:0];
assign miss_tag_En = ((state==ST_WD_DATA)&&(next_state!=state));
assign index[3:0] = miss_addr[3:0];
assign data0_valid_up = data0_valid && (!data0_valid_d);
assign data1_valid_up = data1_valid && (!data1_valid_d);
assign data2_valid_up = data2_valid && (!data2_valid_d);
assign data3_valid_up = data3_valid && (!data3_valid_d);


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		data0_valid_d <= 1'b0;
		data1_valid_d <= 1'b0;
		data2_valid_d <= 1'b0;
		data3_valid_d <= 1'b0;
	end else begin
		data0_valid_d <= data0_valid;
		data1_valid_d <= data1_valid;
		data2_valid_d <= data2_valid;
		data3_valid_d <= data3_valid;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		miss_flag <= 1'b0;
	end else if(done)begin
		miss_flag <= 1'b0;
	end else if(((last_addr[17:2]!=miss_addr[17:2])&&(state==ST_RECEIVE_DATA)&&miss)) begin
		miss_flag <= 1'b1;
	end
end


always @ (*)begin
	if(!reset_n)begin
		req = 1'b0;
	end else if((last_addr[17:2]!=miss_addr[17:2])&&(state!=ST_RECEIVE_DATA)&&miss) begin
		req = 1'b1;
	end else if((last_addr[17:2]!=miss_addr[17:2])&&(state==ST_IDLE)&&(next_state!=state))begin
		req = 1'b1;
	end else begin
		req = 1'b0;
	end
end

always @ (*)begin
	if(!reset_n)begin
		data_flag = 1'b0;
	end else if((!arbit_flag)&&state==ST_RECEIVE_DATA) begin
		case(block_set[1:0])
			2'd0:begin
				if(data0_valid_up)begin
					data_flag = 1'b1;
				end else begin
					data_flag = 1'b0;
				end
			end
			2'd1:begin
				if(data1_valid_up)begin
					data_flag = 1'b1;
				end else begin
					data_flag = 1'b0;
				end
			end
			2'd2:begin
				if(data2_valid_up)begin
					data_flag = 1'b1;
				end else begin
					data_flag = 1'b0;
				end
			end
			2'd3:begin
				if(data3_valid_up)begin
					data_flag = 1'b1;
				end else begin
					data_flag = 1'b0;
				end
			end
		endcase
	end else begin
		data_flag = 1'b0;
	end
end


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		data0_valid <= 1'b0;
	end else if((state!=ST_IDLE)&&(next_state==ST_IDLE)) begin
		data0_valid <= 1'b0;
	end else if(valid && (data_cnt==0))begin
		data0_valid <= 1'b1;
	end
end
always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		data1_valid <= 1'b0;
	end else if((state!=ST_IDLE)&&(next_state==ST_IDLE)) begin
		data1_valid <= 1'b0;
	end else if(valid && (data_cnt==1))begin
		data1_valid <= 1'b1;
	end
end
always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		data2_valid <= 1'b0;
	end else if((state!=ST_IDLE)&&(next_state==ST_IDLE)) begin
		data2_valid <= 1'b0;
	end else if(valid && (data_cnt==2))begin
		data2_valid <= 1'b1;
	end
end
always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		data3_valid <= 1'b0;
	end else if((state!=ST_IDLE)&&(next_state==ST_IDLE)) begin
		data3_valid <= 1'b0;
	end else if(valid && (data_cnt==3))begin
		data3_valid <= 1'b1;
	end
end



always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		last_addr[17:0] <= 18'h0;
	end else if(done) begin
		last_addr[17:0] <= miss_addr[17:0];
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		data_cnt[1:0] <= 2'd0;
	end else if((state!=ST_RECEIVE_DATA) ||(next_state!=state)) begin
		data_cnt[1:0] <= 2'd0;
	end else if((state==ST_RECEIVE_DATA) && valid)begin
		data_cnt[1:0] <= data_cnt[1:0] + 1'b1;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		wdata[127:0] <= {4{32'd0}};
	end else if(state==ST_RECEIVE_DATA) begin
		case(data_cnt)
			2'd0:wdata[127:0] <= {data[31:0],{3{32'd0}}};
			2'd1:wdata[127:0] <= {wdata[127:96],data[31:0],{2{32'd0}}};
			2'd2:wdata[127:0] <= {wdata[127:64],data[31:0],{1{32'd0}}};
			2'd3:wdata[127:0] <= {wdata[127:32],data[31:0]};
		endcase
	end
end


always @ (*)begin
	if(!reset_n)begin
		miss_data_En0 = 1'b0;
		miss_data_En1 = 1'b0;
		miss_data_En2 = 1'b0;
		miss_data_En3 = 1'b0;
	end else if((state==ST_WD_DATA) ) begin
		if(way0_tag[2:1]==2'd3)begin
			miss_data_En0 = 1'b1;
		end
		if(way1_tag[2:1]==2'd3)begin
			miss_data_En1 = 1'b1;
		end
		if(way2_tag[2:1]==2'd3)begin
			miss_data_En2 = 1'b1;
		end
		if(way3_tag[2:1]==2'd3)begin
			miss_data_En3 = 1'b1;
		end
	end else begin
		miss_data_En0 = 1'b0;
		miss_data_En1 = 1'b0;
		miss_data_En2 = 1'b0;
		miss_data_En3 = 1'b0;
	end
end


always @ (*)begin
	if(!reset_n)begin
		way0_cnt[1:0] = 2'd0;
		way1_cnt[1:0] = 2'd1;
		way2_cnt[1:0] = 2'd2;
		way3_cnt[1:0] = 2'd3;
	end else if(state==ST_WD_DATA && (next_state!=state)) begin
		way0_cnt[1:0] = way0_tag[2:1] + 1'b1;
		way1_cnt[1:0] = way1_tag[2:1] + 1'b1;
		way2_cnt[1:0] = way2_tag[2:1] + 1'b1;
		way3_cnt[1:0] = way3_tag[2:1] + 1'b1;
	end else begin
		way0_cnt[1:0] = way0_tag[2:1];
		way1_cnt[1:0] = way1_tag[2:1];
		way2_cnt[1:0] = way2_tag[2:1];
		way3_cnt[1:0] = way3_tag[2:1];
	end
end

always @ (*)begin
	if(!reset_n)begin
		wd_tag0[14:0] = {15{1'b0}};
		wd_tag1[14:0] = {15{1'b0}};
		wd_tag2[14:0] = {15{1'b0}};
		wd_tag3[14:0] = {15{1'b0}};
	end else if(state==ST_WD_DATA && (next_state!=state)) begin
		if(way0_tag[2:1]==2'd3)begin
			wd_tag0[14:0] = {miss_addr[17:6],way0_cnt[1:0],1'b1};
			wd_tag1[14:0] = {way1_tag[14:3],way1_cnt[1:0],way1_tag[0]};
			wd_tag2[14:0] = {way2_tag[14:3],way2_cnt[1:0],way2_tag[0]};
			wd_tag3[14:0] = {way3_tag[14:3],way3_cnt[1:0],way3_tag[0]};
		end
		if(way1_tag[2:1]==2'd3)begin
			wd_tag1[14:0] = {miss_addr[17:6],way1_cnt[1:0],1'b1};
			wd_tag0[14:0] = {way0_tag[14:3],way0_cnt[1:0],way0_tag[0]};
			wd_tag2[14:0] = {way2_tag[14:3],way2_cnt[1:0],way2_tag[0]};
			wd_tag3[14:0] = {way3_tag[14:3],way3_cnt[1:0],way3_tag[0]};
		end
		if(way2_tag[2:1]==2'd3)begin
			wd_tag2[14:0] = {miss_addr[17:6],way2_cnt[1:0],1'b1};
			wd_tag1[14:0] = {way1_tag[14:3],way1_cnt[1:0],way1_tag[0]};
			wd_tag0[14:0] = {way0_tag[14:3],way0_cnt[1:0],way0_tag[0]};
			wd_tag3[14:0] = {way3_tag[14:3],way3_cnt[1:0],way3_tag[0]};
		end
		if(way3_tag[2:1]==2'd3)begin
			wd_tag3[14:0] = {miss_addr[17:6],way3_cnt[1:0],1'b1};
			wd_tag1[14:0] = {way1_tag[14:3],way1_cnt[1:0],way1_tag[0]};
			wd_tag2[14:0] = {way2_tag[14:3],way2_cnt[1:0],way2_tag[0]};
			wd_tag0[14:0] = {way0_tag[14:3],way0_cnt[1:0],way0_tag[0]};
		end
	end else begin
		wd_tag0[14:0] = {15{1'b0}};
		wd_tag1[14:0] = {15{1'b0}};
		wd_tag2[14:0] = {15{1'b0}};
		wd_tag3[14:0] = {15{1'b0}};
	end
end

always @ (*)begin
	if(!reset_n)begin
		rdata[31:0] = {32{1'b0}};
	end else if((state==ST_RECEIVE_DATA) ) begin
		case(block_set[1:0])
			2'd0:begin
				if(data0_valid)begin
					rdata[31:0] = wdata[127:96];
				end
			end
			2'd1:begin
				if(data1_valid)begin
					rdata[31:0] = wdata[95:64];
				end
			end
			2'd2:begin
				if(data2_valid)begin
					rdata[31:0] = wdata[63:32];
				end
			end
			2'd3:begin
				if(data3_valid)begin
					rdata[31:0] = wdata[31:0];
				end
			end
		endcase
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		state[2:0] <= ST_IDLE[2:0];
	end else begin
		state[2:0] <= next_state[2:0];
	end
end


always @ (*)begin
	next_state[2:0] = state[2:0];
	case(state[2:0])
		ST_IDLE[2:0]:begin
			if(miss_flag || miss)begin
				next_state[2:0] = ST_RECEIVE_DATA[2:0];
			end
		end
		ST_RECEIVE_DATA[2:0]:begin
			if(valid && (data_cnt==2'h3))
				next_state[2:0] = ST_WD_DATA[2:0];
		end
		ST_WD_DATA[2:0]:next_state[2:0] = ST_WD_TAG[2:0];
		ST_WD_TAG[2:0]:next_state[2:0] = ST_IDLE[2:0];
	endcase
end





endmodule
