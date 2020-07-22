module dcache_test(
input           clk,
input           reset_n,
input           hsel,
input     [1 :0]htrans,
input     [2 :0]hsize ,
input     [2 :0]hburst,
input           hwrite,
input     [19:0]haddr ,
input     [31:0]hwdata,
output [31:0]hrdata,
output       hready_out
);

wire [31:0]data_i;
wire       valid;
wire       req;
wire [19:0]daddr;
wire       wr_done;
wire       rd_done;
wire       wr;
wire [127:0]dirty_data;


dcache_top top(
 .clk        (clk             ),
 .reset_n    (reset_n         ),
 .hsel       (hsel            ),
 .htrans     (htrans[1:0]     ),
 .hsize      (hsize[2:0]      ),
 .hburst     (hburst[2:0]     ),
 .hwrite     (hwrite          ),
 .haddr      (haddr[19:0]     ),
 .hwdata     (hwdata[31:0]    ),
 .hrdata     (hrdata[31:0]    ),
 .hready_out (hready_out      ),
 .data_i     (data_i[31:0]    ),
 .valid      (valid           ),
 .req        (req             ),
 .daddr      (daddr [19:0]    ),
 .wr_done    (wr_done         ),
 .rd_done    (rd_done         ),
 .wr         (wr              ),
 .dirty_data (dirty_data[127:0])
);

sram_model 
	#(
		.AW  (20),
		.NUM (4)
	)
	sram
	(
		.clk       (clk              ),
		.reset_n   (reset_n          ),
		.req       (req              ),
		.wr        (wr               ),
		.miss_addr (daddr [19:0]     ),
		.dirty_data(dirty_data[127:0]),
		.valid     (valid            ),
		.data      (data_i[31:0]     ),
		.wr_done   (wr_done         ),
		.rd_done   (rd_done         )

	);


endmodule
