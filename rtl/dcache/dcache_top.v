module dcache_top(
input           clk,
input           reset_n,
input           hsel,
input     [1 :0]htrans,
input     [2 :0]hsize ,
input     [2 :0]hburst,
input           hwrite,
input     [19:0]haddr ,
input     [31:0]hwdata,
output reg[31:0]hrdata,
output reg      hready_out,

input     [31:0]data_i,
input           valid,
input           wr_done,
input           rd_done,
output          req,
output          wr,
output    [19:0]daddr,
output   [127:0]dirty_data
);

 
wire       hit_done;
wire [31:0]hit_rdata;
wire       miss_data0_En;
wire       miss_data1_En;
wire       miss_data2_En;
wire       miss_data3_En;
wire       miss_data0_Wr;
wire       miss_data1_Wr;
wire       miss_data2_Wr;
wire       miss_data3_Wr;
wire [127:0]miss_wdata;
wire       miss_tag_En;
wire [15:0]wr_way0_tag;
wire [15:0]wr_way1_tag;
wire [15:0]wr_way2_tag;
wire [15:0]wr_way3_tag;
wire [31:0]hwdata_d ;      
wire       hwrite_d ;      
wire       miss     ;      
wire [19:0]miss_addr;      
wire [15:0]way0_tag ;      
wire [15:0]way1_tag ;      
wire [15:0]way2_tag ;      
wire [15:0]way3_tag ;      
wire [127:0]updata   ;      
wire       busy     ;      
wire       sync_done;   

wire       miss_done;
wire [31:0]miss_rdata;

wire 	   arbit_done;
wire [31:0]arbit_rdata;
wire       data0_valid; 
wire       data1_valid; 
wire       data2_valid; 
wire       data3_valid; 
wire       arbit_flag;
wire       miss_renewtag;
wire [3:0] wr_tag_index;

wire done;
assign done = hit_done || miss_done;

always @ (*)begin
	if(!reset_n)begin
		hrdata[31:0] = 32'h0;
	end else if(hit_done && (!hwrite_d)) begin
		hrdata[31:0] = hit_rdata[31:0];
	end else if(miss_done && (!hwrite_d))begin
		hrdata[31:0] = miss_rdata[31:0];	
	end else if(arbit_done && (!hwrite_d))begin
		hrdata[31:0] = arbit_rdata[31:0];
	end else begin
		hrdata[31:0] = 32'h0;
	end
end

always @ (*)begin
	if(!reset_n)begin
		hready_out <= 1'b1;
	end else if(busy) begin
		hready_out <= 1'b0;
	end else if(hit_done || miss_done || arbit_done)begin
		hready_out <= 1'b1;
	end else begin
		hready_out <= 1'b0;
	end
end


dhit_ctrl hit0(
 .clk           (clk               ),
 .reset_n       (reset_n           ),
 .hsel          (hsel              ),
 .htrans        (htrans[1:0]       ),
 .hsize         (hsize[2:0]        ),
 .hburst        (hburst[2:0]       ),
 .hwrite        (hwrite            ),
 .haddr         (haddr[19:0]       ),
 .hwdata        (hwdata[31:0]      ),
 .hit_rdata     (hit_rdata[31:0]   ),
 .hit_done      (hit_done          ),
 .miss_data0_En (miss_data0_En     ),
 .miss_data1_En (miss_data1_En     ),
 .miss_data2_En (miss_data2_En     ),
 .miss_data3_En (miss_data3_En     ),
 .miss_data0_Wr (miss_data0_Wr     ),
 .miss_data1_Wr (miss_data1_Wr     ),
 .miss_data2_Wr (miss_data2_Wr     ),
 .miss_data3_Wr (miss_data3_Wr     ),
 .miss_wdata    (miss_wdata[127:0]  ),
 .miss_tag_En   (miss_tag_En       ),
 .wr_way0_tag   (wr_way0_tag[15:0] ),
 .wr_way1_tag   (wr_way1_tag[15:0] ),
 .wr_way2_tag   (wr_way2_tag[15:0] ),
 .wr_way3_tag   (wr_way3_tag[15:0] ),
 .hwdata_d      (hwdata_d[31:0]    ),
 .hwrite_d      (hwrite_d          ),
 .miss          (miss              ),
 .miss_addr     (miss_addr[19:0]   ),
 .way0_tag      (way0_tag[15:0]    ),
 .way1_tag      (way1_tag[15:0]    ),
 .way2_tag      (way2_tag[15:0]    ),
 .way3_tag      (way3_tag[15:0]    ),
 .updata        (updata[127:0]      ),
 .busy          (busy              ),
 .sync_done     (sync_done         ),
 .miss_renewtag (miss_renewtag     ),
 .wr_tag_index  (wr_tag_index[3:0]  )
);

dmiss_ctrl miss0(
 .clk             (clk               ),
 .reset_n         (reset_n           ),
 .miss_done       (miss_done         ),
 .miss_rdata      (miss_rdata[31:0]  ),
 .rd_done         (rd_done           ),
 .wr_done         (wr_done           ),
 .wr              (wr                ),
 .dirty_data      (dirty_data[127:0] ),
 .data_i          (data_i[31:0]      ),
 .valid           (valid             ),
 .req             (req               ),
 .daddr           (daddr[19:0]       ),
 .hwrite_d        (hwrite_d          ),
 .hwdata_d        (hwdata_d[31:0]    ),
 .miss            (miss              ),
 .miss_addr       (miss_addr[19:0]   ),
 .way0_tag        (way0_tag[15:0]    ),
 .way1_tag        (way1_tag[15:0]    ),
 .way2_tag        (way2_tag[15:0]    ),
 .way3_tag        (way3_tag[15:0]    ),
 .updata          (updata[127:0]      ),
 .miss_data0_En   (miss_data0_En     ),
 .miss_data1_En   (miss_data1_En     ),
 .miss_data2_En   (miss_data2_En     ),
 .miss_data3_En   (miss_data3_En     ),
 .miss_data0_Wr   (miss_data0_Wr     ),
 .miss_data1_Wr   (miss_data1_Wr     ),
 .miss_data2_Wr   (miss_data2_Wr     ),
 .miss_data3_Wr   (miss_data3_Wr     ),
 .miss_wdata      (miss_wdata[127:0]  ),
 .miss_tag_En     (miss_tag_En       ),
 .wr_way0_tag     (wr_way0_tag[15:0] ),
 .wr_way1_tag     (wr_way1_tag[15:0] ),
 .wr_way2_tag     (wr_way2_tag[15:0] ),
 .wr_way3_tag     (wr_way3_tag[15:0] ),
 .data0_valid     (data0_valid       ),
 .data1_valid     (data1_valid       ),
 .data2_valid     (data2_valid       ),
 .data3_valid     (data3_valid       ),
 .arbit_flag      (arbit_flag        ),
 .miss_renewtag (miss_renewtag     ),
 .arbit_done   (arbit_done       ),
 .wr_tag_index  (wr_tag_index[3:0]  )
);

darbit arbit0(
 .clk          (clk              ),
 .reset_n      (reset_n          ),
 .arbit_done   (arbit_done       ),
 .arbit_rdata  (arbit_rdata[31:0]),
 .data0_valid  (data0_valid      ),
 .data1_valid  (data1_valid      ),
 .data2_valid  (data2_valid      ),
 .data3_valid  (data3_valid      ),
 .miss_wdata   (miss_wdata[127:0] ),
 .done         (done             ),
 .hwrite_d     (hwrite_d         ),
 .miss         (miss             ),
 .miss_addr    (miss_addr[19:0]  ),
 .arbit_flag   (arbit_flag       )
);


dsync sync0(
 .clk         (clk       ),
 .reset_n     (reset_n   ),
 .sync_done   (sync_done ),
 .busy        (busy      )
);




endmodule
