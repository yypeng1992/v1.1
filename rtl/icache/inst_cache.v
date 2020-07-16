module inst_cache(
input           clk,
input           reset_n,
input           hsel,
input  [1 :0]   htrans,
input  [2 :0]   hsize, 
input  [2 :0]   hburst,
input           hwrite,
input  [19:0]   haddr,
input  [31:0]   hwdata,
output reg   [31:0]hrdata,
output reg      hready_out,

input        ack,
input        valid,
input [31:0] data,
output       req,
output [19:0]c_addr
);

wire [14:0] way0_tag;
wire [14:0] way1_tag;
wire [14:0] way2_tag;
wire [14:0] way3_tag;
wire        miss;
wire [17:0] miss_addr;
wire [17:0] last_addr;
wire        data0_valid;
wire        data1_valid;
wire        data2_valid;
wire        data3_valid;
wire [127:0]wdata;
wire        arbit_done;

wire tag_En ;
wire hit    ;
wire data_flag;
wire [31:0]hit_rdata;
wire [31:0]miss_rdata;
wire [31:0]arbit_rdata;
wire       done;

wire       miss_tag_En;
wire [14:0]wd_tag0;
wire [14:0]wd_tag1;
wire [14:0]wd_tag2;
wire [14:0]wd_tag3;
wire       miss_data_En0;
wire       miss_data_En1;
wire       miss_data_En2;
wire       miss_data_En3;
wire       busy;
wire       sync_done;
wire       arbit_flag;

assign done = hit || arbit_done || data_flag;


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		hrdata[31:0] <= 32'h0;
	end else if(hit) begin
		hrdata[31:0] <= hit_rdata[31:0];
	end else if(arbit_done)begin
		hrdata[31:0] <= arbit_rdata[31:0];
	end else if(data_flag)  begin
		hrdata[31:0] <= miss_rdata[31:0];
	end

end
always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		hready_out <= 1'b1;
	end else if(busy)begin
		hready_out <= 1'b0;
	end else if(sync_done)begin
		hready_out <= 1'b1;
	end else if(tag_En) begin
		hready_out <= 1'b0;
	end else if(hit)begin
		hready_out <= 1'b1;
	end else if(miss)begin
		hready_out <= 1'b0;
	end else if(data_flag || arbit_done)begin
		hready_out <= 1'b1;
	end 
end


hit_ctrl hit_ctrl0(
 .clk        (clk            ),
 .reset_n    (reset_n        ),
 .hsel        (hsel            ),
 .htrans      (htrans[1:0]     ),
 .hsize       (hsize[2:0]      ),
 .hburst       (hburst[2:0]      ),
 .hwrite      (hwrite          ),
 .haddr       (haddr[19:0]     ),
 .hwdata      (hwdata [31:0]   ),
 .rdata       (hit_rdata [31:0]    ),
 .tag_En      (tag_En          ),
 .hit_d         (hit             ),
 .way0_tag    (way0_tag[14:0]  ),
 .way1_tag    (way1_tag[14:0]  ),
 .way2_tag    (way2_tag[14:0]  ),
 .way3_tag    (way3_tag[14:0]  ),
 .miss        (miss            ),
 .miss_addr   (miss_addr[17:0] ),
 .miss_tag_En (miss_tag_En     ),
 .wd_tag0     (wd_tag0[14:0]   ),
 .wd_tag1     (wd_tag1[14:0]   ),
 .wd_tag2     (wd_tag2[14:0]   ),
 .wd_tag3     (wd_tag3[14:0]   ),
 .miss_data_En0(miss_data_En0  ),
 .miss_data_En1(miss_data_En1  ),
 .miss_data_En2(miss_data_En2  ),
 .miss_data_En3(miss_data_En3  ),
 .wdata         (wdata[127:0]  ),
 .done          (done          ),
 .last_addr     (last_addr[17:0]),
 .data3_valid   (data3_valid   ),
 .busy          (busy          ),
 .sync_done     (sync_done     )
);

miss_ctrl miss_ctrl0(
 .clk        (clk            ),
 .reset_n    (reset_n        ),
 .done       (done           ),
 .rdata      (miss_rdata     ),
 .miss        (miss            ),
 .miss_addr   (miss_addr[19:0] ),
 .data_flag   (data_flag       ),
 .way0_tag    (way0_tag[14:0]  ),
 .way1_tag    (way1_tag[14:0]  ),
 .way2_tag    (way2_tag[14:0]  ),
 .way3_tag    (way3_tag[14:0]  ),
 .ack         (ack             ),
 .valid       (valid           ),
 .data        (data[31:0]      ),
 .req         (req             ),
 .c_addr      (c_addr[19:0]    ),
 .last_addr   (last_addr[17:0] ),
 .data0_valid (data0_valid     ),
 .data1_valid (data1_valid     ),
 .data2_valid (data2_valid     ),
 .data3_valid (data3_valid     ),
 .wdata       (wdata[127:0]    ),
 .miss_tag_En  (miss_tag_En    ),
 .wd_tag0      (wd_tag0[14:0]  ),
 .wd_tag1      (wd_tag1[14:0]  ),
 .wd_tag2      (wd_tag2[14:0]  ),
 .wd_tag3      (wd_tag3[14:0]  ),
 .miss_data_En0(miss_data_En0  ),
 .miss_data_En1(miss_data_En1  ),
 .miss_data_En2(miss_data_En2  ),
 .miss_data_En3(miss_data_En3  ),
 .arbit_flag  (arbit_flag      ),
 .miss_flag    (miss_flag      )
);

addr_arbit arbit0(
 .clk         (clk             ),
 .reset_n     (reset_n         ),
 .last_addr   (last_addr[17:0] ),
 .data0_valid (data0_valid     ),
 .data1_valid (data1_valid     ),
 .data2_valid (data2_valid     ),
 .data3_valid (data3_valid     ),
 .wdata       (wdata[127:0]    ),
 .miss_addr   (miss_addr[17:0] ),
 .miss        (miss            ),
 .rdata       (arbit_rdata[31:0]),
 .done          (done          ),
 .arbit_done  (arbit_done      ),
 .arbit_flag  (arbit_flag      )
 
);

sync sync0(
 .clk       (clk       ),
 .reset_n   (reset_n   ),
 .sync_done (sync_done ),
 .busy      (busy      )
);




endmodule
