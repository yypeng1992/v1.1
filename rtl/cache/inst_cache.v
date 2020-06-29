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

wire tag_En ;
wire hit    ;
wire data_flag;
wire [31:0]hit_rdata;
wire [31:0]miss_rdata;


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		hrdata[31:0] <= 32'h0;
	end else if(hit) begin
		hrdata[31:0] <= hit_rdata[31:0];
	end else begin
		hrdata[31:0] <= miss_rdata[31:0];
	end

end
always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		hready_out <= 1'b1;
	end else if(tag_En) begin
		hready_out <= 1'b0;
	end else if(hit)begin
		hready_out <= 1'b1;
	end else if(miss)begin
		hready_out <= 1'b0;
	end else if(data_flag)begin
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
 .hit         (hit             ),
 .way0_tag    (way0_tag[14:0]  ),
 .way1_tag    (way1_tag[14:0]  ),
 .way2_tag    (way2_tag[14:0]  ),
 .way3_tag    (way3_tag[14:0]  ),
 .miss        (miss            ),
 .miss_addr   (miss_addr[17:0] )
);

miss_ctrl miss_ctrl0(
 .clk        (clk            ),
 .reset_n    (reset_n        ),
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
 .c_addr      (c_addr[19:0]    )
);

endmodule
