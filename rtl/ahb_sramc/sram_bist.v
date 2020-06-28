module sram_bist(
	input       clk,
	input       bist_clk,
	input       bist_reset_n,
	input       bist_ten,
	input [12:0]Addr_fun,
	input       wen_fun,
	input	    cen_fun,
	input	    oen_fun,
	input [7 :0]wdata_fun,
	output[7 :0]Data,
	output      bist_done,   
	output      bist_fail 
);

wire [7 :0]wdata;
wire [12:0]Addr;
wire      wen;
wire      cen;
wire      oen;

mbist_8kx8 mbist0(
 .bist_clk         (bist_clk        ),
 .bist_reset_n     (bist_reset_n    ),
 .bist_test_enable (bist_ten        ),
 .Addr_fun         (Addr_fun[12:0]  ),
 .wen_fun          (wen_fun         ),
 .cen_fun          (cen_fun         ),
 .oen_fun          (oen_fun         ),
 .wdata_fun        (wdata_fun[7:0]  ),
 .rdata_fun        (Data     [7:0]  ),
 .data_test        (wdata    [7:0]  ),
 .Addr_test        (Addr[12:0]      ),
 .wen_test         (wen             ),
 .cen_test         (cen             ),
 .oen_test         (oen             ),
 .bist_done        (bist_done       ),
 .bist_fail        (bist_fail       )
 );

sram sram0(
 .clk    (clk       ),
 .cs_n   (cen       ),
 .wen    (wen       ),
 .oen    (oen       ),
 .Addr   (Addr[12:0]),
 .Wdata  (wdata[7:0]),
 .Data   (Data[7:0] )
);



endmodule


