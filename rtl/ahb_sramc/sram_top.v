module sram_top(
       input         bist_clk ,   
       input         bist_reset_n,
       input         bist_ten  ,  
       output        bist_fail  , 
       output        bist_done  , 
       input         h_clk    , 
       input         h_reset_n, 
       input         hsel     , 
       input [31:0]  haddr    , 
       input         hwen     , 
       input [1 :0]  htrans   , 
       input [2 :0]  hsize    , 
       input [2 :0]  hburst   , 
       input [31:0]  hwdata   , 
       input         hready_in, 
       output        hready_out,
       output [1:0]  hresp     ,
       output [31:0] hrdata    ,
       input         sram_clk   
);

wire [3 :0]ByteEna;
wire       sram_wen  ; 
wire [13:0]sram_addr ; 
wire [31:0]sram_wdata; 

ahb_slave_if if0(
 .h_clk      (h_clk           ),
 .h_reset_n  (h_reset_n       ),
 .hsel       (hsel            ),
 .haddr      (haddr[31:0]     ),
 .hwen       (hwen            ),
 .htrans     (htrans[1:0]     ),
 .hsize      (hsize [2:0]     ),
 .hburst     (hburst[2:0]     ),
 .hwdata     (hwdata[31:0]    ),
 .hready_in  (hready_in       ),
 
 .hready_out (hready_out      ),
 .hresp      (hresp[1:0]      ),
 .ByteEna    (ByteEna[3:0]    ),
 .wen        (sram_wen         ),
 .addr       (sram_addr[13:0]  ),
 .wdata      (sram_wdata[31:0] )
 );

sram_core sram_core0(
 .bist_clk    (bist_clk    ),  
 .bist_reset_n(bist_reset_n),
 .bist_ten    (bist_ten    ), 
 .bist_fail   (bist_fail   ),
 .bist_done   (bist_done   ),
 .sram_clk    (sram_clk      ),
 .sram_wen    (sram_wen      ),
 .sram_ByteEna(ByteEna[3:0]  ),
 .sram_Addr   (sram_addr[13:0] ),
 .sram_Wdata  (sram_wdata[31:0]),
 .sram_Rdata  (hrdata[31:0]    )
);

endmodule
