module inst_cache(
input           hclk,
input           hreset_n,
input           hsel,
input  [1 :0]   htrans,
input  [2 :0]   hsize, 
input  [2 :0]   hbust,
input           hwrite,
input  [19:0]   haddr,
input  [31:0]   hwdata,
output reg[31:0]rdata,
output reg      hready_out,

input        ack,
input        valid,
input [31:0] data,
output       req,
output [19:0]c_addr;
);

wire [14:0] way0_tag;
wire [14:0] way1_tag;
wire [14:0] way2_tag;
wire [14:0] way3_tag;
wire        miss;
wire [17:0] miss_addr;



hit_ctrl hit_ctrl0(
 .hclk        (hclk            ),
 .hreset_n    (hreset_n        ),
 .hsel        (hsel            ),
 .htrans      (htrans[1:0]     ),
 .hsize       (hsize[2:0]      ),
 .hbust       (hbust[2:0]      ),
 .hwrite      (hwrite          ),
 .haddr       (haddr[19:0]     ),
 .hwdata      (hwdata [31:0]   ),
 .rdata       (rdata [31:0]    ),
 .hready_out  (hready_out      ),
 .way0_tag    (way0_tag[14:0]  ),
 .way1_tag    (way1_tag[14:0]  ),
 .way2_tag    (way2_tag[14:0]  ),
 .way3_tag    (way3_tag[14:0]  ),
 .miss        (miss            ),
 .miss_addr   (miss_addr[17:0] )
);

miss_ctrl miss_ctrl0(
 .hclk        (hclk            ),
 .hreset_n    (hreset_n        ),
 .miss        (miss            ),
 .miss_addr   (miss_addr[19:0] ),
 .hready_out  (hready_out      ),
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
