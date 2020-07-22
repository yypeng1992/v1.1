module dhit_ctrl(
input           clk,
input           reset_n,
input           hsel,
input  [1 :0]   htrans,
input  [2 :0]   hsize, 
input  [2 :0]   hburst,
input           hwrite,
input  [19:0]   haddr,
input  [31:0]   hwdata,
output reg[31:0]hit_rdata,
output reg      hit_done,

////////////with hmiss
input		miss_data0_En,
input		miss_data1_En,
input		miss_data2_En,
input		miss_data3_En,
input		miss_data0_Wr,
input		miss_data1_Wr,
input		miss_data2_Wr,
input		miss_data3_Wr,
input     [127:0]miss_wdata,
input           miss_tag_En,
input     [15:0]wr_way0_tag,
input     [15:0]wr_way1_tag,
input     [15:0]wr_way2_tag,
input     [15:0]wr_way3_tag,
input     [3 :0]wr_tag_index,
input           miss_renewtag,
output reg[31:0]hwdata_d,
output reg      hwrite_d,
output          miss,
output    [19:0]miss_addr,
output    [15:0]way0_tag,
output    [15:0]way1_tag,
output    [15:0]way2_tag,
output    [15:0]way3_tag,
output reg    [127:0]updata,


/////////with sync
input  busy,
output sync_done
);


wire [15:0]sync_wr_tag0; 
wire [15:0]sync_wr_tag1; 
wire [15:0]sync_wr_tag2; 
wire [15:0]sync_wr_tag3; 
wire [11:0]htag;
wire [1 :0]block_set;
wire       tag0_En;
wire       tag1_En;
wire       tag2_En;
wire       tag3_En;
wire       tag0_Wr;
wire       tag1_Wr;
wire       tag2_Wr;
wire       tag3_Wr;
wire       data0_En;
wire       data1_En;
wire       data2_En;
wire       data3_En;
wire       data0_Wr;
wire       data1_Wr;
wire       data2_Wr;
wire       data3_Wr;
wire       way_hit;
wire       hit;
wire [15:0]wr_tag0;
wire [15:0]wr_tag1;
wire [15:0]wr_tag2;
wire [15:0]wr_tag3;
wire [128:0]way0_data;
wire [128:0]way1_data;
wire [128:0]way2_data;
wire [128:0]way3_data;
reg  [3 :0]busy_cnt;
reg        way0_hit;
reg        way1_hit;
reg        way2_hit;
reg        way3_hit;
reg        hit_rd_tag0_En;
reg        hit_rd_tag1_En;
reg        hit_rd_tag2_En;
reg        hit_rd_tag3_En;
reg        hit_wr_tag0_En;
reg        hit_wr_tag1_En;
reg        hit_wr_tag2_En;
reg        hit_wr_tag3_En;
reg        hit_data_En0;
reg        hit_data_En1;
reg        hit_data_En2;
reg        hit_data_En3;
reg  [19:0]haddr_d;
reg  [3 :0]index;
reg        miss_d;
reg        sync_done_d;
reg        hit_rd_tag0_En_d;
reg        hit_rd_tag1_En_d;
reg        hit_rd_tag2_En_d;
reg        hit_rd_tag3_En_d;
reg        data0_En_d;
reg        data1_En_d;
reg        data2_En_d;
reg        data3_En_d;
reg        way0_hit_d;
reg        way1_hit_d;
reg        way2_hit_d;
reg        way3_hit_d;
reg  [15:0]hit_wr_tag0;
reg  [15:0]hit_wr_tag1;
reg  [15:0]hit_wr_tag2;
reg  [15:0]hit_wr_tag3;
reg  [127:0]wdata;
reg         up_hit;


assign sync_done = busy && (index[3:0]==4'd15);
assign htag[11:0]      = haddr_d[19:8];
assign block_set[1 :0] = haddr_d[3:2];
assign miss_addr[19:0] = haddr_d[19:0];
assign tag0_En         = hit_rd_tag0_En || hit_wr_tag0_En || miss_tag_En;
assign tag1_En         = hit_rd_tag1_En || hit_wr_tag1_En || miss_tag_En;
assign tag2_En         = hit_rd_tag2_En || hit_wr_tag2_En || miss_tag_En;
assign tag3_En         = hit_rd_tag3_En || hit_wr_tag3_En || miss_tag_En;
assign tag0_Wr         = (hit_wr_tag0_En || miss_tag_En) ? 1'b1 : 1'b0;
assign tag1_Wr         = (hit_wr_tag1_En || miss_tag_En) ? 1'b1 : 1'b0;
assign tag2_Wr         = (hit_wr_tag2_En || miss_tag_En) ? 1'b1 : 1'b0;
assign tag3_Wr         = (hit_wr_tag3_En || miss_tag_En) ? 1'b1 : 1'b0;
assign data0_En        = hit_data_En0 || miss_data0_En;
assign data1_En        = hit_data_En1 || miss_data1_En;
assign data2_En        = hit_data_En2 || miss_data2_En;
assign data3_En        = hit_data_En3 || miss_data3_En;
assign data0_Wr        = (hit_data_En0 && hwrite_d)||(miss_data0_En) ? 1'b1 : 1'b0;
assign data1_Wr        = (hit_data_En1 && hwrite_d)||(miss_data1_En) ? 1'b1 : 1'b0;
assign data2_Wr        = (hit_data_En2 && hwrite_d)||(miss_data2_En) ? 1'b1 : 1'b0;
assign data3_Wr        = (hit_data_En3 && hwrite_d)||(miss_data3_En) ? 1'b1 : 1'b0;
assign wr_tag0[15:0]   = hit ? hit_wr_tag0[15:0] : (busy ? sync_wr_tag0[15:0] : wr_way0_tag[15:0]); 
assign wr_tag1[15:0]   = hit ? hit_wr_tag1[15:0] : (busy ? sync_wr_tag1[15:0] : wr_way1_tag[15:0]); 
assign wr_tag2[15:0]   = hit ? hit_wr_tag2[15:0] : (busy ? sync_wr_tag2[15:0] : wr_way2_tag[15:0]); 
assign wr_tag3[15:0]   = hit ? hit_wr_tag3[15:0] : (busy ? sync_wr_tag3[15:0] : wr_way3_tag[15:0]); 
assign way_hit         = (htrans==2'b10)? 1'b0:(way0_hit || way1_hit || way2_hit || way3_hit);
assign miss            = (!hit)&&(hit_rd_tag0_En_d||hit_rd_tag1_En_d||hit_rd_tag2_En_d||hit_rd_tag3_En_d);
assign hit             = ( way_hit && (!up_hit));

assign sync_wr_tag0[15:0] = {12'd0,2'b00,1'b0,1'b0};
assign sync_wr_tag1[15:0] = {12'd0,2'b01,1'b0,1'b0};
assign sync_wr_tag2[15:0] = {12'd0,2'b10,1'b0,1'b0};
assign sync_wr_tag3[15:0] = {12'd0,2'b11,1'b0,1'b0};




always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		up_hit <= 1'b0;
	end else if(way_hit) begin
		up_hit <= way_hit;
	end else begin
		up_hit <= 1'b0;
	end
end

//////tag
always @ (*)begin
	if((!busy)&&(htrans==2'b10) && hsel) begin
		hit_rd_tag0_En = 1'b1;
                hit_rd_tag1_En = 1'b1;
                hit_rd_tag2_En = 1'b1;
                hit_rd_tag3_En = 1'b1;
	end else if(sync_done_d)begin
		hit_rd_tag0_En = 1'b1;
                hit_rd_tag1_En = 1'b1;
                hit_rd_tag2_En = 1'b1;
                hit_rd_tag3_En = 1'b1;
	end else begin
		hit_rd_tag0_En = 1'b0;
                hit_rd_tag1_En = 1'b0;
                hit_rd_tag2_En = 1'b0;
                hit_rd_tag3_En = 1'b0;
	end
end
always @ (*)begin
	if(busy)begin
		hit_wr_tag0_En = 1'b1;
		hit_wr_tag1_En = 1'b1;
		hit_wr_tag2_En = 1'b1;
		hit_wr_tag3_En = 1'b1;
		hit_wr_tag0[15:0] = {way0_tag[15:3],2'b00,1'b0};
		hit_wr_tag1[15:0] = {way0_tag[15:3],2'b01,1'b0};
		hit_wr_tag2[15:0] = {way0_tag[15:3],2'b10,1'b0};
		hit_wr_tag3[15:0] = {way0_tag[15:3],2'b11,1'b0};
	end else if(hit&&hwrite_d)begin
		if(way0_hit)begin
			hit_wr_tag0_En = 1'b1;
			hit_wr_tag0[15:0] = {way0_tag[15:1],1'b1};
		end
		if(way1_hit)begin
			hit_wr_tag1_En = 1'b1;
			hit_wr_tag1[15:0] = {way1_tag[15:1],1'b1};
		end
		if(way2_hit)begin
			hit_wr_tag2_En = 1'b1;
			hit_wr_tag2[15:0] = {way2_tag[15:1],1'b1};
		end
		if(way3_hit)begin
			hit_wr_tag3_En = 1'b1;
			hit_wr_tag3[15:0] = {way3_tag[15:1],1'b1};
		end
	end else begin
		hit_wr_tag0_En = 1'b0;
                hit_wr_tag1_En = 1'b0;
                hit_wr_tag2_En = 1'b0;
                hit_wr_tag3_En = 1'b0;
		hit_wr_tag0[15:0] = {13'h0,2'b00,1'b0};
		hit_wr_tag1[15:0] = {13'h0,2'b00,1'b0};
		hit_wr_tag2[15:0] = {13'h0,2'b00,1'b0};
		hit_wr_tag3[15:0] = {13'h0,2'b00,1'b0};
	end
end



always @ (*)begin
	if(busy)begin
		index[3:0] = busy_cnt[3:0];
	end else if(miss_renewtag)begin
		index[3:0] = wr_tag_index[3:0];
	end else if(htrans==2'b10) begin
		index[3:0] = haddr[7:4];
	end else if(hit || miss || sync_done_d)begin
		index[3:0] = haddr_d[7:4];
	end else begin
		index[3:0] = 4'd0;
	end
end

/////////////////data_table
always @ (*)begin
	if(hit) begin
		if(way0_hit)begin
			hit_data_En0 = 1'b1;
		end
		if(way1_hit)begin
			hit_data_En1 = 1'b1;
		end
		if(way2_hit)begin
			hit_data_En2 = 1'b1;
		end
		if(way3_hit)begin
			hit_data_En3 = 1'b1;
		end
	end else begin
		hit_data_En0 = 1'b0;
		hit_data_En1 = 1'b0;
		hit_data_En2 = 1'b0;
		hit_data_En3 = 1'b0;
	end
end



//////////////////////hit
always @ (*)begin
	if((htag[11:0]==way0_tag[15:4] && way0_tag[1])) begin
		way0_hit = 1'b1;
	end else if((htag[11:0]==way1_tag[15:4]&& way1_tag[1]))begin
		way1_hit = 1'b1;
	end else if((htag[11:0]==way2_tag[15:4] && way2_tag[1]))begin
		way2_hit = 1'b1;
	end else if((htag[11:0]==way3_tag[15:4] && way3_tag[1]))begin
		way3_hit = 1'b1;
	end else begin
		way0_hit = 1'b0;
		way1_hit = 1'b0;
		way2_hit = 1'b0;
		way3_hit = 1'b0;
	end
end

////////////////hit_rdata
always @ (*)begin
	if(hit_done && (!hwrite_d)) begin
		if(way0_hit_d)begin
			case(block_set[1:0])
				2'd3:hit_rdata[31:0] <= way0_data[127:96];
				2'd2:hit_rdata[31:0] <= way0_data[95:64];
				2'd1:hit_rdata[31:0] <= way0_data[63:32];
				2'd0:hit_rdata[31:0] <= way0_data[31:0];
			endcase
		end
		if(way1_hit_d)begin
			case(block_set[1:0])
				2'd3:hit_rdata[31:0] <= way1_data[127:96];
				2'd2:hit_rdata[31:0] <= way1_data[95:64];
				2'd1:hit_rdata[31:0] <= way1_data[63:32];
				2'd0:hit_rdata[31:0] <= way1_data[31:0];
			endcase
		end
		if(way2_hit_d)begin
			case(block_set[1:0])
				2'd3:hit_rdata[31:0] <= way2_data[127:96];
				2'd2:hit_rdata[31:0] <= way2_data[95:64];
				2'd1:hit_rdata[31:0] <= way2_data[63:32];
				2'd0:hit_rdata[31:0] <= way2_data[31:0];
			endcase
		end
		if(way3_hit_d)begin
			case(block_set[1:0])
				2'd3:hit_rdata[31:0] <= way3_data[127:96];
				2'd2:hit_rdata[31:0] <= way3_data[95:64];
				2'd1:hit_rdata[31:0] <= way3_data[63:32];
				2'd0:hit_rdata[31:0] <= way3_data[31:0];
			endcase
		end
	end else begin
		hit_rdata[31:0] <= {32{1'b0}};
	end
end


always @ (*)begin
	if(hit && hwrite_d) begin
		if(way0_hit)begin
			case(block_set[1:0])
				2'd0:wdata[127:96] = hwdata_d[31:0];
				2'd1:wdata[95 :64] = hwdata_d[31:0];
				2'd2:wdata[63 :32] = hwdata_d[31:0];
				2'd3:wdata[31 :0 ] = hwdata_d[31:0];
			endcase
		end
		if(way1_hit)begin
			case(block_set[1:0])
				2'd0:wdata[127:96] = hwdata_d[31:0];
				2'd1:wdata[95 :64] = hwdata_d[31:0];
				2'd2:wdata[63 :32] = hwdata_d[31:0];
				2'd3:wdata[31 :0 ] = hwdata_d[31:0];
			endcase
		end
		if(way2_hit)begin
			case(block_set[1:0])
				2'd0:wdata[127:96] = hwdata_d[31:0];
				2'd1:wdata[95 :64] = hwdata_d[31:0];
				2'd2:wdata[63 :32] = hwdata_d[31:0];
				2'd3:wdata[31 :0 ] = hwdata_d[31:0];
			endcase
		end
		if(way3_hit)begin
			case(block_set[1:0])
				2'd0:wdata[127:96] = hwdata_d[31:0];
				2'd1:wdata[95 :64] = hwdata_d[31:0];
				2'd2:wdata[63 :32] = hwdata_d[31:0];
				2'd3:wdata[31 :0 ] = hwdata_d[31:0];
			endcase
		end
	end else if(miss_data0_En || miss_data1_En||miss_data2_En||miss_data3_En)begin
		wdata[127:0] = miss_wdata[127:0];
	end else begin
		wdata[127:0] = {4{32'h0}};
	end
end


//////////////-d
always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		hwdata_d[31:0] <= {32'h0};
	end else if((htrans==2'b10) && hsel) begin
		hwdata_d[31:0] <= hwdata[31:0];
	end
end
always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		hwrite_d <= 1'b0;
	end else if((htrans==2'b10) && hsel) begin
		hwrite_d <= hwrite;
	end
end
always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		haddr_d[19:0] <= {20{1'b0}};
	end else if((htrans==2'b10) && hsel) begin
		haddr_d[19:0] <= haddr[19:0];
	end
end
always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		hit_rd_tag0_En_d <= 1'b0;
		hit_rd_tag1_En_d <= 1'b0;
		hit_rd_tag2_En_d <= 1'b0;
		hit_rd_tag3_En_d <= 1'b0;
	end else begin
		hit_rd_tag0_En_d <= hit_rd_tag0_En;
		hit_rd_tag1_En_d <= hit_rd_tag1_En;
		hit_rd_tag2_En_d <= hit_rd_tag2_En;
		hit_rd_tag3_En_d <= hit_rd_tag3_En;
	end
end
always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		data0_En_d <= 1'b0;
		data1_En_d <= 1'b0;
		data2_En_d <= 1'b0;
		data3_En_d <= 1'b0;
	end else begin
		data0_En_d <= data0_En;
		data1_En_d <= data1_En;
		data2_En_d <= data2_En;
		data3_En_d <= data3_En;
	end
end
always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		way0_hit_d <= 1'b0;
		way1_hit_d <= 1'b0;
		way2_hit_d <= 1'b0;
		way3_hit_d <= 1'b0;
	end else begin
		way0_hit_d <= way0_hit;
		way1_hit_d <= way1_hit;
		way2_hit_d <= way2_hit;
		way3_hit_d <= way3_hit;
	end
end
always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		miss_d <= 1'b0;
	end else begin
		miss_d <= miss;
	end
end


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		sync_done_d <= 1'b0;
	end else begin
		sync_done_d <= sync_done;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		busy_cnt[3:0] <= 4'd0;
	end else if(busy) begin
		busy_cnt[3:0] <= busy_cnt[3:0] + 1'b1;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		hit_done <= 1'b0;
	end else if(hit) begin
		hit_done <= 1'b1;
	end else begin
		hit_done <= 1'b0;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		updata[31:0] <= 32'h0;
	end else if(miss_d ) begin
		if(data0_En_d)begin
			updata[127:0] <= way0_data[127:0];
		end 
		if(data1_En_d)begin
			updata[127:0] <= way1_data[127:0];
		end 
		if(data2_En_d)begin
			updata[127:0] <= way2_data[127:0];
		end 
		if(data3_En_d)begin
			updata[127:0] <= way3_data[127:0];
		end 
	end
end

//////////////////////tag_table
rf1_MxN
	#(
		.M    (16 ),
		.N    (16),
		.WIDTH(4 )
	)
	tag_table0
	(
		.clk    (clk              ),
		.reset_n(reset_n          ),
		.En     (tag0_En          ),
		.Wr     (tag0_Wr          ),
		.Addr   (index[3:0]       ),
		.WrData (wr_tag0[15:0]    ),
		.Data   (way0_tag[15:0]   )
	);
rf1_MxN
	#(
		.M    (16 ),
		.N    (16),
		.WIDTH(4 )
	)
	tag_table1
	(
		.clk    (clk           ),
		.reset_n(reset_n       ),
		.En     (tag1_En       ),
		.Wr     (tag1_Wr         ),
		.Addr   (index[3:0]     ),
		.WrData (wr_tag1[15:0]  ),
		.Data   (way1_tag[15:0] )
	);
rf1_MxN
	#(
		.M    (16 ),
		.N    (16),
		.WIDTH(4 )
	)
	tag_table2
	(
		.clk    (clk           ),
		.reset_n(reset_n       ),
		.En     (tag2_En     ),
		.Wr     (tag2_Wr         ),
		.Addr   (index[3:0]     ),
		.WrData (wr_tag2[15:0]   ),
		.Data   (way2_tag[15:0] )
	);
rf1_MxN
	#(
		.M    (16 ),
		.N    (16),
		.WIDTH(4 )
	)
	tag_table3
	(
		.clk    (clk           ),
		.reset_n(reset_n       ),
		.En     (tag3_En       ),
		.Wr     (tag3_Wr           ),
		.Addr   (index[3:0]       ),
		.WrData (wr_tag3[15:0]    ),
		.Data   (way3_tag[15:0]   )
	);

///////////////////////data_table
rf1_MxN
	#(
		.M    (16  ),
		.N    (128 ),
		.WIDTH(4   )
	)
	data_table0
	(
		.clk    (clk            ),
		.reset_n(reset_n        ),
		.En     (data0_En       ),
		.Wr     (data0_Wr         ),
		.Addr   (index[3:0]      ),
		.WrData (wdata[127:0]    ),
		.Data   (way0_data[127:0] )
	);
rf1_MxN
	#(
		.M    (16  ),
		.N    (128 ),
		.WIDTH(4   )
	)
	data_table1
	(
		.clk    (clk            ),
		.reset_n(reset_n        ),
		.En     (data1_En       ),
		.Wr     (data1_Wr         ),
		.Addr   (index[3:0]      ),
		.WrData (wdata[127:0]    ),
		.Data   (way1_data[127:0] )
	);
rf1_MxN
	#(
		.M    (16  ),
		.N    (128 ),
		.WIDTH(4   )
	)
	data_table2
	(
		.clk    (clk            ),
		.reset_n(reset_n        ),
		.En     (data2_En       ),
		.Wr     (data2_Wr        ),
		.Addr   (index[3:0]      ),
		.WrData (wdata[127:0]    ),
		.Data   (way2_data[127:0] )
	);
rf1_MxN
	#(
		.M    (16  ),
		.N    (128 ),
		.WIDTH(4   )
	)
	data_table3
	(
		.clk    (clk            ),
		.reset_n(reset_n        ),
		.En     (data3_En       ),
		.Wr     (data3_Wr         ),
		.Addr   (index[3:0]      ),
		.WrData (wdata[127:0]    ),
		.Data   (way3_data[127:0] )
	);

endmodule
