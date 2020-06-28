module hit_ctrl(
input           clk,
input           reset_n,
input           hsel,
input  [1 :0]   htrans,
input  [2 :0]   hsize, 
input  [2 :0]   hbust,
input           hwrite,
input  [19:0]   haddr,
input  [31:0]   hwdata,
output reg[31:0]rdata,
output reg      hready_out,

/////////////////to miss_ctrl
output    [14:0]way0_tag,
output    [14:0]way1_tag,
output    [14:0]way2_tag,
output    [14:0]way3_tag,
output reg      miss,
output    [17:0]miss_addr
);
reg [19:0]haddr_d;
reg tag_En;
reg     hit;
wire [11:0]htag;
wire [3:0]index;
wire [1:0]block_set;
assign htag[11:0]      = haddr_d[19:7];
assign index[3:0]      = haddr_d[7:4];
assign block_set[1 :0] = haddr_d[3:2];
assign miss_addr[17:0] = haddr_d[19:2];


always @ (*)begin
	if(!reset_n)begin
		miss = 1'b0;
	end else if(tag_En && (!hit)) begin
		miss = 1'b1;
	end else begin
		miss = 1'b0;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		way0_cnt[1:0] <= 2'd0;
		way1_cnt[1:0] <= 2'd0;
		way2_cnt[1:0] <= 2'd0;
		way3_cnt[1:0] <= 2'd0;
	end else if(tag_En) begin
		way0_cnt[1:0]   <= way0_tag[2:1];
		way1_cnt[1:0]   <= way1_tag[2:1];
		way2_cnt[1:0]   <= way2_tag[2:1];
		way3_cnt[1:0]   <= way3_tag[2:1];
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		haddr_d[19:0] <= {20{1'b0}};
	end else if((htrans==2'b10) && hsel && hready_out) begin
		haddr_d[19:0] <= haddr[19:0];
	end
end


always @ (*)begin
	if(!reset_n)begin
		tag_En = 1'b0;
	end else if((htrans==2'b10) && hsel && hready_out) begin
		tag_En = 1'b1;
	end else begin
		tag_En = 1'b0;
	end
end


always @ (*)begin
	if((htag[11:0]==way0_tag[14:3] && way0_tag[0])||(htag[11:0]==way1_tag[14:3]&& way1_tag[0])||(htag[11:0]==way2_tag[14:3] && way2_tag[0])||(htag[11:0]==way3_tag[14:3] && && way3_tag[0])) begin
		hit = 1'b1;
	end else begin
		hit = 1'b0;
	end
end


always @ (*)begin
	if(!reset_n)begin
		data_En0 = 1'b0;
		data_En1 = 1'b0;
		data_En2 = 1'b0;
		data_En3 = 1'b0;
	end else if(hit) begin
		if((htag[11:0]==way0_tag[14:3] && way0_tag[0])begin
			data_En0 = 1'b1;
		end
		if((htag[11:0]==way1_tag[14:3] && way1_tag[0])begin
			data_En1 = 1'b1;
		end
		if((htag[11:0]==way2_tag[14:3] && way2_tag[0])begin
			data_En2 = 1'b1;
		end
		if((htag[11:0]==way3_tag[14:3] && way3_tag[0])begin
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
		rdata[31:0] <= {32{1'b0}};
	end else if(hit) begin
		case(block_set[1:0])
			2'd0:rdata[31:0] <= way_data[127:96];
			2'd1:rdata[31:0] <= way_data[95:64];
			2'd2:rdata[31:0] <= way_data[63:32];
			2'd3:rdata[31:0] <= way_data[31:0];
		endcase
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		hready_out <= 1'b1;
	end else if(tag_En)begin
		hready_out <= 1'b0;
	end else if(hit)begin
		hready_out <= 1'b1;
	end
end

//////////////////////tag_table
rf1_MxN
	#(
		.M    (16 ),
		.N    (15),
		.WIDTH(4 )
	)
	tag_table0
	(
		.clk    (clk           ),
		.reset_n(reset_n       ),
		.En     (tag_En         ),
		.Wr     (1'b0           ),
		.Addr   (index[3:0]     ),
		.WrData (32'h0          ),
		.Data   (way0_tag[14:0] )
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
		.En     (tag_En         ),
		.Wr     (1'b0           ),
		.Addr   (index[3:0]     ),
		.WrData (32'h0          ),
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
		.En     (tag_En         ),
		.Wr     (1'b0           ),
		.Addr   (index[3:0]     ),
		.WrData (32'h0          ),
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
		.En     (tag_En         ),
		.Wr     (1'b0           ),
		.Addr   (index[3:0]     ),
		.WrData (32'h0          ),
		.Data   (way3_tag[14:0] )
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
		.En     (data_En0        ),
		.Wr     (1'b0            ),
		.Addr   (index[3:0]      ),
		.WrData (128'h0          ),
		.Data   (way_data[127:0] )
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
		.En     (data_En1        ),
		.Wr     (1'b0            ),
		.Addr   (index[3:0]      ),
		.WrData (128'h0          ),
		.Data   (way_data[127:0] )
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
		.En     (data_En2        ),
		.Wr     (1'b0            ),
		.Addr   (index[3:0]      ),
		.WrData (128'h0          ),
		.Data   (way_data[127:0] )
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
		.En     (data_En3        ),
		.Wr     (1'b0            ),
		.Addr   (index[3:0]      ),
		.WrData (128'h0          ),
		.Data   (way_data[127:0] )
	);

endmodule
