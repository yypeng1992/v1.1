module hit_ctrl(
input           clk,
input           reset_n,
input           hsel,
input  [1 :0]   htrans,
input  [2 :0]   hsize, 
input  [2 :0]   hburst,
input           hwrite,
input  [19:0]   haddr,
input  [31:0]   hwdata,
output reg[31:0]rdata,
output reg      tag_En,
output reg      hit_d,

/////////////////to miss_ctrl
output    [14:0]way0_tag,
output    [14:0]way1_tag,
output    [14:0]way2_tag,
output    [14:0]way3_tag,
output reg      miss,
output    [17:0]miss_addr,
input           miss_tag_En,
input     [14:0]wd_tag0,
input     [14:0]wd_tag1,
input     [14:0]wd_tag2,
input     [14:0]wd_tag3,
input           miss_data_En0,
input           miss_data_En1,
input           miss_data_En2,
input           miss_data_En3,
input   [127:0] wdata,
input           done,
input   [17:0]  last_addr,
input           data3_valid,

/////////with sync
input busy,
output sync_done
);

reg [3:0]index_cnt;
reg tag_hit;
reg tag_hit_d;
wire   hit;
reg [19:0]haddr_d;
reg tag_En_d;
wire hit_tag_En;
wire tag_Wr;
wire [11:0]htag;
reg  [3:0]index;
wire [1:0]block_set;
reg [1:0] way0_cnt;
reg [1:0] way1_cnt;
reg [1:0] way2_cnt;
reg [1:0] way3_cnt;
reg data_En0;
reg data_En1;
reg data_En2;
reg data_En3;
reg data_En0_d;
reg data_En1_d;
reg data_En2_d;
reg data_En3_d;
reg busy_d;
wire hit_data_En0;
wire hit_data_En1;
wire hit_data_En2;
wire hit_data_En3;
wire [127:0]way0_data;
wire [127:0]way1_data;
wire [127:0]way2_data;
wire [127:0]way3_data;
reg [127:0]way_data;
wire data_Wr;
wire [14:0]wr_tag0;
wire [14:0]wr_tag1;
wire [14:0]wr_tag2;
wire [14:0]wr_tag3;
wire       busy_down;
assign htag[11:0]      = haddr_d[19:8];
assign block_set[1 :0] = haddr_d[3:2];
assign miss_addr[17:0] = haddr_d[19:2];
assign hit_tag_En = busy ? 1'b1:( tag_En || miss_tag_En);
assign tag_Wr = (busy||miss_tag_En) ? 1'b1 : 1'b0;
assign hit_data_En0 = data_En0 || miss_data_En0;
assign hit_data_En1 = data_En1 || miss_data_En1;
assign hit_data_En2 = data_En2 || miss_data_En2;
assign hit_data_En3 = data_En3 || miss_data_En3;
assign data_Wr = miss_data_En3 ? 1'b1 : 1'b0;
assign hit = tag_hit && (!tag_hit_d);
assign wr_tag0[14:0] = busy ? 15'b000 : wd_tag0[14:0];
assign wr_tag1[14:0] = busy ? 15'b010 : wd_tag1[14:0];
assign wr_tag2[14:0] = busy ? 15'b100 : wd_tag2[14:0];
assign wr_tag3[14:0] = busy ? 15'b110 : wd_tag3[14:0];

assign sync_done = (index_cnt[3:0]==4'd15);
assign busy_down = (!busy)&&(busy_d);


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		index_cnt[3:0] <= {4{1'b0}};
	end else if(busy) begin
		index_cnt[3:0] <= index_cnt[3:0] + 1'b1;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		busy_d <= 1'b0;
	end else begin
		busy_d <= busy;
	end
end

always @ (*)begin
	if(!reset_n)begin
		index[3:0] = 4'd0;
	end else if(busy)begin
		index[3:0] = index_cnt[3:0];
	end else if(data3_valid)begin
		index[3:0] = last_addr[5:2];
	end else if(htrans==2'b10) begin
		index[3:0] = haddr[7:4];
	end else begin
		index[3:0] = haddr_d[7:4];
	end
end

always @ (*)begin
	if(busy)begin
		miss = 1'b0;
        end else if(tag_En_d && (!hit)) begin
		miss = 1'b1;
	end else begin
		miss = 1'b0;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		way0_cnt[1:0] <= 2'd0;
		way1_cnt[1:0] <= 2'd1;
		way2_cnt[1:0] <= 2'd2;
		way3_cnt[1:0] <= 2'd3;
	end else if(tag_En) begin
		way0_cnt[1:0]  <= way0_tag[2:1];
		way1_cnt[1:0]  <= way1_tag[2:1];
		way2_cnt[1:0]  <= way2_tag[2:1];
		way3_cnt[1:0]  <= way3_tag[2:1];
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		haddr_d[19:0] <= {20{1'b0}};
	end else if((htrans==2'b10) && hsel ) begin
		haddr_d[19:0] <= haddr[19:0];
	end
end


always @ (*)begin
	if(!reset_n)begin
		tag_En = 1'b0;
	end else if(busy_down)begin
		tag_En = 1'b1;
	end else if((htrans==2'b10) && hsel ) begin
		tag_En = 1'b1;
	end else begin
		tag_En = 1'b0;
	end
end


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		tag_En_d <= 1'b0;
	end else begin
		tag_En_d <= tag_En;
	end
end

always @ (*)begin
	if((htrans==2'b10))begin
		tag_hit = 1'b0;
	end else if((htag[11:0]==way0_tag[14:3] && way0_tag[0])||(htag[11:0]==way1_tag[14:3]&& way1_tag[0])||(htag[11:0]==way2_tag[14:3] && way2_tag[0])||(htag[11:0]==way3_tag[14:3] && way3_tag[0])) begin
		tag_hit = 1'b1;
	end else begin
		tag_hit = 1'b0;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		tag_hit_d <= 1'b0;
	end else begin
		tag_hit_d <= tag_hit;
	end
end



always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		hit_d <= 1'b0;
	end else begin
		hit_d <= hit;
	end
end

always @ (*)begin
	if(!reset_n)begin
		data_En0 = 1'b0;
		data_En1 = 1'b0;
		data_En2 = 1'b0;
		data_En3 = 1'b0;
	end else if(hit) begin
		if(htag[11:0]==way0_tag[14:3] && way0_tag[0])begin
			data_En0 = 1'b1;
		end
		if(htag[11:0]==way1_tag[14:3] && way1_tag[0])begin
			data_En1 = 1'b1;
		end
		if(htag[11:0]==way2_tag[14:3] && way2_tag[0])begin
			data_En2 = 1'b1;
		end
		if(htag[11:0]==way3_tag[14:3] && way3_tag[0])begin
			data_En3 = 1'b1;
		end
	end else begin
		data_En0 = 1'b0;
		data_En1 = 1'b0;
		data_En2 = 1'b0;
		data_En3 = 1'b0;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		data_En0_d <= 1'b0;
		data_En1_d <= 1'b0;
		data_En2_d <= 1'b0;
		data_En3_d <= 1'b0;
	end else begin
		data_En0_d <= data_En0;
		data_En1_d <= data_En1;
		data_En2_d <= data_En2;
		data_En3_d <= data_En3;
	end
end

always @ (*)begin
	if(!reset_n)begin
		way_data[127:0] = {4{32'h0}};
	end else if(data_En0_d) begin
		way_data[127:0] = way0_data[127:0];
	end else if(data_En1_d) begin
		way_data[127:0] = way1_data[127:0];
	end else if(data_En2_d) begin
		way_data[127:0] = way2_data[127:0];
	end else if(data_En3_d) begin
		way_data[127:0] = way3_data[127:0];
	end else begin
		way_data[127:0] = {4{32'h0}};
	end
end

always @ (*)begin
	if(!reset_n)begin
		rdata[31:0] <= {32{1'b0}};
	end else if(hit_d) begin
		case(block_set[1:0])
			2'd0:rdata[31:0] <= way_data[127:96];
			2'd1:rdata[31:0] <= way_data[95:64];
			2'd2:rdata[31:0] <= way_data[63:32];
			2'd3:rdata[31:0] <= way_data[31:0];
		endcase
	end else begin
		rdata[31:0] <= {32{1'b0}};
	end
end

/*
assign way0_tag[14:0] = way_tag[0][14:0];
assign way1_tag[14:0] = way_tag[1][14:0];
assign way2_tag[14:0] = way_tag[2][14:0];
assign way3_tag[14:0] = way_tag[3][14:0];
logic [14:0] way_tag [0:3];
genvar i;
generate
    for(i=0; i<4; i=i+1)begin:tag_table_gen
    	rf1_MxN tag_table
    	#(
    		.M    (16),
    		.N    (15),
    		.WIDTH(4 )
    	)
    	(
    		.clk    (clk           ),
    		.reset_n(reset_n       ),
    		.En     (tag_En         ),
    		.Wr     (1'b0           ),
    		.Addr   (index[3:0]     ),
    		.WrData (32'h0          ),
    		.Data   (way_tag[i][14:0] )
    	);
    end
endgenerate
*/

//////////////////////tag_table
rf1_MxN
	#(
		.M    (16 ),
		.N    (15),
		.WIDTH(4 )
	)
	tag_table0
	(
		.clk    (clk              ),
		.reset_n(reset_n          ),
		.En     (hit_tag_En       ),
		.Wr     (tag_Wr           ),
		.Addr   (index[3:0]       ),
		.WrData (wr_tag0[14:0]    ),
		.Data   (way0_tag[14:0]   )
	);
rf1_MxN
	#(
		.M    (16 ),
		.N    (15),
		.WIDTH(4 )
	)
	tag_table1
	(
		.clk    (clk           ),
		.reset_n(reset_n       ),
		.En     (hit_tag_En     ),
		.Wr     (tag_Wr         ),
		.Addr   (index[3:0]     ),
		.WrData (wr_tag1[14:0]  ),
		.Data   (way1_tag[14:0] )
	);
rf1_MxN
	#(
		.M    (16 ),
		.N    (15),
		.WIDTH(4 )
	)
	tag_table2
	(
		.clk    (clk           ),
		.reset_n(reset_n       ),
		.En     (hit_tag_En     ),
		.Wr     (tag_Wr         ),
		.Addr   (index[3:0]     ),
		.WrData (wr_tag2[14:0]   ),
		.Data   (way2_tag[14:0] )
	);
rf1_MxN
	#(
		.M    (16 ),
		.N    (15),
		.WIDTH(4 )
	)
	tag_table3
	(
		.clk    (clk           ),
		.reset_n(reset_n       ),
		.En     (hit_tag_En       ),
		.Wr     (tag_Wr           ),
		.Addr   (index[3:0]       ),
		.WrData (wr_tag3[14:0]    ),
		.Data   (way3_tag[14:0]   )
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
		.En     (hit_data_En0    ),
		.Wr     (data_Wr         ),
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
		.En     (hit_data_En1   ),
		.Wr     (data_Wr         ),
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
		.En     (hit_data_En2    ),
		.Wr     ( data_Wr        ),
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
		.En     (hit_data_En3   ),
		.Wr     (data_Wr         ),
		.Addr   (index[3:0]      ),
		.WrData (wdata[127:0]    ),
		.Data   (way3_data[127:0] )
	);

endmodule
