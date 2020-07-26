module sram_tb();
reg       bist_clk   ; 
reg       bist_reset_n;
reg       bist_ten    ;
wire      bist_fail   ;
wire      bist_done   ;
reg       h_clk    ; 
reg       h_reset_n; 
reg       hsel     ; 
reg [31:0]haddr    ; 
reg       hwen     ; 
reg [1 :0]htrans   ; 
reg [2 :0]hsize    ; 
reg [2 :0]hburst   ; 
reg [31:0]hwdata   ; 
reg       hready_in; 
reg       sram_clk;
wire      hready_out;
wire[1:0] hresp;
wire[31:0]hrdata;

`ifdef SIM_SRAM

initial begin
	h_clk = 1'b0;
	forever #10 h_clk = ~h_clk;
end

initial begin
	sram_clk = 1'b0;
	forever #10 sram_clk = ~sram_clk;
end

initial begin
	bist_clk = 1'b0;
	forever #10 bist_clk = ~bist_clk;
end
initial begin
	h_reset_n = 1'b0;
	#45 h_reset_n = 1'b1;
	#20000 $finish;
end

initial begin
	bist_ten = 1'b0;
	#90 bist_ten = 1'b1;
	#140 bist_ten = 1'b0;
end



initial begin
	bist_reset_n = 1'b0;
	#45 bist_reset_n = 1'b1;
	#20000 $finish;
end
initial begin
	hsel = 1'bx;
	hready_in = 1'bx;
	hsize[2:0] = 3'bxxx;
	htrans[1:0] = 2'dx;
	hwen = 1'bx;
	hwdata = 32'hx;
	haddr[31:0] = 32'hx;
	 #100 hsel = 1'b1;
	hready_in = 1'b0;
	hsize[2:0] = 3'b010;
	htrans[1:0] = 2'b10;
	hwen = 1'b1;
	hwdata = 32'h5;
	haddr[31:0] = 32'hc;
	#300 hsel = 1'b1;
	hready_in = 1'b0;
	hsize[2:0] = 3'b010;
	htrans[1:0] = 2'b10;
	hwen = 1'b1;
	haddr[31:0] = 32'hc;
	hwdata = 32'h6;
	#500 hsel = 1'b1;
	hready_in = 1'b0;
	hsize[2:0] = 3'b010;
	htrans[1:0] = 2'b10;
	hwen = 1'b0;
	haddr[31:0] = 32'hc;
	

end

initial begin
	$fsdbDumpfile("sram.fsdb");
	$fsdbDumpvars(0,sram_tb);
end

`endif

sram_top top(
 .bist_clk    (bist_clk    ),
 .bist_reset_n(bist_reset_n),
 .bist_ten    (bist_ten    ),
 .bist_fail   (bist_fail   ),
 .bist_done   (bist_done   ),
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
 .hrdata     (hrdata[31:0]    ),
 .sram_clk   (sram_clk        )
);


endmodule



