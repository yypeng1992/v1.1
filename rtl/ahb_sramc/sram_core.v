module sram_core(
       input         bist_clk ,   
       input         bist_reset_n,
       input         bist_ten  ,  
       output        bist_fail  , 
       output        bist_done  , 
       input         sram_clk,
       input         sram_wen,
       input  [3 :0] sram_ByteEna,
       input  [13:0] sram_Addr,
       input  [31:0] sram_Wdata,
       output [31:0] sram_Rdata
);


wire sram_oe;
assign sram_oe = 1'b0;


wire [3:0]bank0_csn;
wire [3:0]bank1_csn;
assign bank0_csn[3:0] = (!sram_Addr[13]) ? sram_ByteEna[3:0] : 4'b1111;
assign bank1_csn[3:0] =   sram_Addr[13]  ? sram_ByteEna[3:0] : 4'b1111;

wire [7:0]  block_csn;
assign block_csn[7:0] = {bank1_csn[3:0], bank0_csn[3:0]};

wire [63:0] sram_wdata_temp;
assign sram_wdata_temp[63:0] = {2{sram_Wdata[31:0]}};

wire [63:0] sram_rdata_temp;
assign sram_Rdata[31:0] = (!sram_Addr[13]) ? sram_rdata_temp[31:0] : sram_rdata_temp[63:32];

genvar index;
generate 
    for(index=0; index<8; index=index+1) begin: gen_sram_block
        sram_bist u_sram_bist(
         .clk        (sram_clk                     ),
         .cen_fun    (block_csn[index]             ),
         .wen_fun    (sram_wen                     ),
         .oen_fun    (sram_oe                      ),
         .Addr_fun   (sram_Addr[12:0]              ),
         .wdata_fun  (sram_wdata_temp[index*8 +: 8]),
         .Data       (sram_rdata_temp[index*8 +: 8]),
	 .bist_clk    (bist_clk                    ),
	 .bist_reset_n(bist_reset_n                ),
	 .bist_ten    (bist_ten                    ),
	 .bist_fail   (bist_fail                   ),
	 .bist_done   (bist_done                   )
        );
    end
endgenerate

//// sram_bist sram_bist0(
////  .clk    (sram_clk       ),
////  .cs_n   (bank0_csn[0]   ),
////  .wen    (sram_wen       ),
////  .oen    (sram_oe        ),
////  .Addr   (sram_Addr[12:0]),
////  .Wdata  (sram_Wdata[7:0]),
////  .Data   (sram_q0[7:0]   )
//// );
//// 
//// 
//// sram_bist sram_bist1(
////  .clk    (sram_clk       ),
////  .cs_n   (bank0_csn[1]   ),
////  .wen    (sram_wen       ),
////  .oen    (sram_oe        ),
////  .Addr   (sram_Addr[12:0]),
////  .Wdata  (sram_Wdata[15:8]),
////  .Data   (sram_q1[7:0]   )
//// 
//// 
//// sram_bist sram_bist2(
////  .clk    (sram_clk       ),
////  .cs_n   (bank0_csn[2]   ),
////  .wen    (sram_wen       ),
////  .oen    (sram_oe        ),
////  .Addr   (sram_Addr[12:0]),
////  .Wdata  (sram_Wdata[23:16]),
////  .Data   (sram_q2[7:0]   )
//// 
//// 
//// sram_bist sram_bist3(
////  .clk    (sram_clk       ),
////  .cs_n   (bank0_csn[3]   ),
////  .wen    (sram_wen       ),
////  .oen    (sram_oe        ),
////  .Addr   (sram_Addr[12:0]),
////  .Wdata  (sram_Wdata[31:24]),
////  .Data   (sram_q3[7:0]   )
//// 
//// sram_bist sram_bist4(
////  .clk    (sram_clk       ),
////  .cs_n   (bank1_csn[0]   ),
////  .wen    (sram_wen       ),
////  .oen    (sram_oe        ),
////  .Addr   (sram_Addr[12:0]),
////  .Wdata  (sram_Wdata[7:0]),
////  .Data   (sram_q4[7:0]   )
//// );
//// 
//// 
//// sram_bist sram_bist5(
////  .clk    (sram_clk       ),
////  .cs_n   (bank1_csn[1]   ),
////  .wen    (sram_wen       ),
////  .oen    (sram_oe        ),
////  .Addr   (sram_Addr[12:0]),
////  .Wdata  (sram_Wdata[15:8]),
////  .Data   (sram_q5[7:0]   )
//// 
//// 
//// sram_bist sram_bist6(
////  .clk    (sram_clk       ),
////  .cs_n   (bank1_csn[2]   ),
////  .wen    (sram_wen       ),
////  .oen    (sram_oe        ),
////  .Addr   (sram_Addr[12:0]),
////  .Wdata  (sram_Wdata[23:16]),
////  .Data   (sram_q6[7:0]   )
//// 
//// 
//// sram_bist sram_bist7(
////  .clk    (sram_clk       ),
////  .cs_n   (bank1_csn[3]   ),
////  .wen    (sram_wen       ),
////  .oen    (sram_oe        ),
////  .Addr   (sram_Addr[12:0]),
////  .Wdata  (sram_Wdata[31:24]),
////  .Data   (sram_q7[7:0]   )
//// 

endmodule
