module icache_test(
input       clk    ,
input       reset_n,
input       hsel   ,
input [1 :0]htrans ,
input [2 :0]hsize  ,
input [1 :0]hburst  ,
input       hwrite ,
input [19:0]haddr  ,
input [31:0]hwdata ,
output [31:0]rdata  ,
output      hready_out,
input       r_pin,
output      dclk,
output      ncs,
output      w_pin
);

wire       ack;
wire       valid;
wire [31:0]data;
wire       req;
wire [19:0]c_addr;


inst_cache inst_cache0(
 .clk        (clk          ),
 .reset_n    (reset_n      ),
 .hsel       (hsel         ),
 .htrans     (htrans[1:0]  ),
 .hsize      (hsize [2:0]  ),
 .hburst      (hburst [1:0]  ),
 .hwrite     (hwrite       ),
 .haddr      (haddr[19:0]  ),
 .hwdata     (hwdata[31:0] ),
 .hrdata      (rdata[31:0]  ),
 .hready_out (hready_out  ),
 .ack        (ack         ),
 .valid      (valid       ),
 .data       (data[31:0]  ),
 .req        (req         ),
 .c_addr     (c_addr[19:0])
);

spi_flash_test spi_ctrl(
 .clk      (clk         ),
 .reset_n  (reset_n     ),
 .req      (req         ),
 .c_addr   (c_addr[19:0]),
 .ack      (ack         ),
 .valid    (valid       ),
 .data     (data[31:0]  ),
 .r_pin    (r_pin       ),
 .dclk     (dclk        ),
 .ncs      (ncs         ),
 .w_pin    (w_pin       )
);



endmodule
