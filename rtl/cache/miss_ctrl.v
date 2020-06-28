module miss_ctrl(
input           hclk,
input           hreset_n,
input           miss,
input   [17:0]  miss_addr,
output reg      hready_out,

/////////////////with flash_ctrl
input  [14:0]way0_tag,
input  [14:0]way1_tag,
input  [14:0]way2_tag,
input  [14:0]way3_tag,
input        ack,
input        valid,
input  [31:0]data,
output       req,
output [19:0]c_addr

);

parameter [2:0] ST_IDLE         = 3'd0;
parameter [2:0] ST_WAIT         = 3'd1;
parameter [2:0] ST_RECEIVE_DATA = 3'd2;
parameter [2:0] ST_WD_DATA      = 3'd3;
parameter [2:0] ST_WD_TAG       = 3'd4;
reg [2:0]state;
reg [2:0]next_state;
reg [1:0]data_cnt;
reg [127:0]wdata;
wire [1:0]block_set;
wire tag_En;
wire [3:0]index;
reg data_En0;
reg data_En1;
reg data_En2;
reg data_En3;
reg [1:0]way0_cnt;
reg [1:0]way1_cnt;
reg [1:0]way2_cnt;
reg [1:0]way3_cnt;
reg [14:0]wd_tag0;
reg [14:0]wd_tag1;
reg [14:0]wd_tag2;
reg [14:0]wd_tag3;

assign req = miss; 
assign c_addr[19:0] = {miss_addr[17:2],4'b0000};
assign block_set[1:0] = miss_addr[1:0];
assign tag_En = ((state==ST_WD_DATA)&&(next_state!=state));
assign index[3:0] = miss_addr[3:0];


always @ (posedge hclk or negedge hreset_n)begin
	if(!hreset_n)begin
		data_cnt[1:0] <= 2'd0;
	end else if((state!=ST_RECEIVE_DATA) ||(next_state!=state)) begin
		data_cnt[1:0] <= 2'd0;
	end else if((state==ST_RECEIVE_DATA) && valid)begin
		data_cnt[1:0] <= data_cnt[1:0] + 1'b1;
	end
end

always @ (posedge hclk or negedge hreset_n)begin
	if(!hreset_n)begin
		wdata[127:0] <= {4{32'd0}};
	end else if(state==ST_RECEIVE_DATA) begin
		case(data_cnt)
			2'd0:wdata[127:0] <= {data[31:0],{3{32'd0}}};
			2'd1:wdata[127:0] <= {wdata[127:96],data[31:0],{2{32'd0};
			2'd2:wdata[127:0] <= {wdata[127:64],data[31:0],{1{32'd0};
			2'd3:wdata[127:0] <= {wdata[127:32],data[31:0]};
		endcase
	end
end


always @ (*)begin
	if(!hreset_n)begin
		data_En0 = 1'b0;
		data_En1 = 1'b0;
		data_En2 = 1'b0;
		data_En3 = 1'b0;
	end else if((state==ST_RECEIVE_DATA) && (next_state!=state)) begin
		if(way0_tag[2:1]==2'd3)begin
			data_En0 = 1'b1;
		end
		if(way1_tag[2:1]==2'd3)begin
			data_En1 = 1'b1;
		end
		if(way2_tag[2:1]==2'd3)begin
			data_En2 = 1'b1;
		end
		if(way3_tag[2:1]==2'd3)begin
			data_En3 = 1'b1;
		end
	end else begin
		data_En0 = 1'b0;
		data_En1 = 1'b0;
		data_En2 = 1'b0;
		data_En3 = 1'b0;
	end
end


always @ (*)begin
	if(!hreset_n)begin
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
	if(!hreset_n)begin
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

always @ (posedge hclk or negedge hreset_n)begin
	if(!hreset_n)begin
		rdata[31:0] <= {32{1'b0}};
	end else if((state==ST_RECEIVE_DATA) && (next_state != state)) begin
		case(block_set[1:0])
			2'd0:rdata[31:0] <= wdata[127:96];
			2'd1:rdata[31:0] <= wdata[95:64];
			2'd2:rdata[31:0] <= wdata[63:32];
			2'd3:rdata[31:0] <= wdata[31:0];
		endcase
	end
end

always @ (posedge hclk or negedge hreset_n)begin
	if(!hreset_n)begin
		state[2:0] <= ST_IDLE[2:0];
	end else begin
		state[2:0] <= next_state[2:0];
	end
end


always @ (*)begin
	next_state[2:0] = state[2:0];
	case(state[2:0])
		ST_IDLE[2:0]:begin
			if(miss)begin
				next_state[2:0] = ST_WAIT[2:0];
			end
		end
		ST_WAIT[2:0]:begin
			if(vaild)begin
				next_state[2:0] = ST_RECEIVE_DATA[2:0];
			end
		end
		ST_RECEIVE_DATA[2:0]:begin
			if(vaild && (data_cnt==2'h3))
				next_state[2:0] = ST_WD_DATA[2:0];
		end
		ST_WD_DATA[2:0]:next_state[2:0] = ST_WD_TAG[2:0];
		ST_WD_TAG[2:0]:next_state[2:0] = ST_IDLE[2:0];
	endcase
end


always @ (posedge hclk or negedge hreset_n)begin
	if(!hreset_n)begin
		hready_out <= 1'b1;	
	end else if(miss) begin
		hready_out <= 1'b0;
	end else if((state==ST_RECEIVE_DATA) && (next_state!=state)) begin
		hready_out <= 1'b1;
	end
end

///////////////////////data_table
rf1_MxN
	#(
		.M    (16  ),
		.N    (128 ),
		.WIDTH(4   )
	)
	data_table0
	(
		.clk    (hclk            ),
		.reset_n(hreset_n        ),
		.En     (data_En0        ),
		.Wr     (1'b1            ),
		.Addr   (index[3:0]      ),
		.WrData (wdata[127:0]    ),
		.Data   (128'h0          )
	);
rf1_MxN
	#(
		.M    (16  ),
		.N    (128 ),
		.WIDTH(4   )
	)
	data_table1
	(
		.clk    (hclk            ),
		.reset_n(hreset_n        ),
		.En     (data_En1        ),
		.Wr     (1'b1            ),
		.Addr   (index[3:0]      ),
		.WrData (wdata[127:0]    ),
		.Data   (128'h0          )
	);
rf1_MxN
	#(
		.M    (16  ),
		.N    (128 ),
		.WIDTH(4   )
	)
	data_table2
	(
		.clk    (hclk            ),
		.reset_n(hreset_n        ),
		.En     (data_En2        ),
		.Wr     (1'b1            ),
		.Addr   (index[3:0]      ),
		.WrData (wdata[127:0]    ),
		.Data   (128'h0          )
	);
rf1_MxN
	#(
		.M    (16  ),
		.N    (128 ),
		.WIDTH(4   )
	)
	data_table3
	(
		.clk    (hclk            ),
		.reset_n(hreset_n        ),
		.En     (data_En3        ),
		.Wr     (1'b1            ),
		.Addr   (index[3:0]      ),
		.WrData (wdata[127:0]    ),
		.Data   (128'h0          )
	);

//////////////////////tag_table
rf1_MxN
	#(
		.M    (16 ),
		.N    (15),
		.WIDTH(4 )
	)
	tag_table0
	(
		.clk    (hclk           ),
		.reset_n(hreset_n       ),
		.En     (tag_En         ),
		.Wr     (1'b1           ),
		.Addr   (index[3:0]     ),
		.WrData (wd_tag0[14:0]  ),
		.Data   (15'd0          )
	);

rf1_MxN
	#(
		.M    (16 ),
		.N    (15),
		.WIDTH(4 )
	)
	tag_table1
	(
		.clk    (hclk           ),
		.reset_n(hreset_n       ),
		.En     (tag_En         ),
		.Wr     (1'b1           ),
		.Addr   (index[3:0]     ),
		.WrData (wd_tag1[14:0]  ),
		.Data   (15'd0          )
	);
rf1_MxN
	#(
		.M    (16 ),
		.N    (15),
		.WIDTH(4 )
	)
	tag_table2
	(
		.clk    (hclk           ),
		.reset_n(hreset_n       ),
		.En     (tag_En         ),
		.Wr     (1'b1           ),
		.Addr   (index[3:0]     ),
		.WrData (wd_tag2[14:0]  ),
		.Data   (15'd0          )
	);
rf1_MxN
	#(
		.M    (16 ),
		.N    (15),
		.WIDTH(4 )
	)
	tag_table3
	(
		.clk    (hclk           ),
		.reset_n(hreset_n       ),
		.En     (tag_En         ),
		.Wr     (1'b1           ),
		.Addr   (index[3:0]     ),
		.WrData (wd_tag3[14:0]  ),
		.Data   (15'd0          )
	);


endmodule
