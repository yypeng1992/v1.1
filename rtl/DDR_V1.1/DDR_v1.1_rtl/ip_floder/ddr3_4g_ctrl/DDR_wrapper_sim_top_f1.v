`timescale 1ns / 1ps
`define  CLK_PERIOD  50
`define  SYS_CLK_PERIOD  (`CLK_PERIOD/5)
`define  RESET_PRIOD  200
`define  K             1024
`define  DATA_LENGTH  (12*`K)

`define        MC_POS_1ST                     8'h11
`define        MC_POS_2ND                     3'd0

`define        COP_0_POS_1ST                  {4'd3,4'd1}
`define        COP_1_POS_1ST                  {4'd3,4'd2}
`define        COP_2_POS_1ST                  {4'd3,4'd3}
`define        COP_0_POS_2ND                  3'd1
`define        COP_1_POS_2ND                  3'd2
`define        COP_2_POS_2ND                  3'd3

module DDR_wrapper_sim_top_f1;
  
parameter  Tdelay = 0.00;

   reg    clk;
   reg    rst_n;
   wire   clk_100M;
   wire   clk_200M;
   wire   clk_400M;
   wire   pll_locked;
   
   
  wire    logic_rst_n;
  wire    sys_rst;
  wire    init_calib_complete;
  
  
  //cfg_network
  reg		[ 7:0]		cfgid_i;
  reg	 		     	cfgfwd_i;
  reg		[31:0]		cfgdata_i;
  reg	      			cfgreq_i;
  reg	      			cfgdone_i;
  
  //status_network
  wire                status_request_o;
  reg                 status_ack_i;
  wire      [31:0]    status_data_o;
  wire                status_valid_o;
  
  //PCC_network
  //----------------------------8个输入通道 <--| PCC网络
  reg   [65:0] pcc_ip_data1_i,    pcc_ip_data2_i,    pcc_ip_data3_i,    pcc_ip_data4_i,    pcc_ip_data5_i,    pcc_ip_data6_i,    pcc_ip_data7_i,    pcc_ip_data8_i;    
  reg          pcc_ip_stb1_i,     pcc_ip_stb2_i,     pcc_ip_stb3_i,     pcc_ip_stb4_i,     pcc_ip_stb5_i,     pcc_ip_stb6_i,     pcc_ip_stb7_i,     pcc_ip_stb8_i;     
  reg          pcc_ip_fwd1_i,     pcc_ip_fwd2_i,     pcc_ip_fwd3_i,     pcc_ip_fwd4_i,     pcc_ip_fwd5_i,     pcc_ip_fwd6_i,     pcc_ip_fwd7_i,     pcc_ip_fwd8_i;     
  wire         pcc_ip_fail1_o,    pcc_ip_fail2_o,    pcc_ip_fail3_o,    pcc_ip_fail4_o,    pcc_ip_fail5_o,    pcc_ip_fail6_o,    pcc_ip_fail7_o,    pcc_ip_fail8_o;    
  wire         pcc_ip_pack1_o,    pcc_ip_pack2_o,    pcc_ip_pack3_o,    pcc_ip_pack4_o,    pcc_ip_pack5_o,    pcc_ip_pack6_o,    pcc_ip_pack7_o,    pcc_ip_pack8_o;    
  wire         pcc_ip_suspend1_o, pcc_ip_suspend2_o, pcc_ip_suspend3_o, pcc_ip_suspend4_o, pcc_ip_suspend5_o, pcc_ip_suspend6_o, pcc_ip_suspend7_o, pcc_ip_suspend8_o; 
  wire         pcc_ip_cancel1_o,  pcc_ip_cancel2_o,  pcc_ip_cancel3_o,  pcc_ip_cancel4_o,  pcc_ip_cancel5_o,  pcc_ip_cancel6_o,  pcc_ip_cancel7_o,  pcc_ip_cancel8_o;  
  //----------------------------8个输出通道 |--> PCC网络                                                                                                               
  wire  [65:0] pcc_op_data1_o,    pcc_op_data2_o,    pcc_op_data3_o,    pcc_op_data4_o,    pcc_op_data5_o,    pcc_op_data6_o,    pcc_op_data7_o,    pcc_op_data8_o;    
  wire         pcc_op_stb1_o,     pcc_op_stb2_o,     pcc_op_stb3_o,     pcc_op_stb4_o,     pcc_op_stb5_o,     pcc_op_stb6_o,     pcc_op_stb7_o,     pcc_op_stb8_o;     
  wire         pcc_op_fwd1_o,     pcc_op_fwd2_o,     pcc_op_fwd3_o,     pcc_op_fwd4_o,     pcc_op_fwd5_o,     pcc_op_fwd6_o,     pcc_op_fwd7_o,     pcc_op_fwd8_o;     
  reg          pcc_op_fail1_i,    pcc_op_fail2_i,    pcc_op_fail3_i,    pcc_op_fail4_i,    pcc_op_fail5_i,    pcc_op_fail6_i,    pcc_op_fail7_i,    pcc_op_fail8_i;    
  reg          pcc_op_pack1_i,    pcc_op_pack2_i,    pcc_op_pack3_i,    pcc_op_pack4_i,    pcc_op_pack5_i,    pcc_op_pack6_i,    pcc_op_pack7_i,    pcc_op_pack8_i;    
  reg          pcc_op_suspend1_i, pcc_op_suspend2_i, pcc_op_suspend3_i, pcc_op_suspend4_i, pcc_op_suspend5_i, pcc_op_suspend6_i, pcc_op_suspend7_i, pcc_op_suspend8_i; 
  reg          pcc_op_cancel1_i,  pcc_op_cancel2_i,  pcc_op_cancel3_i,  pcc_op_cancel4_i,  pcc_op_cancel5_i,  pcc_op_cancel6_i,  pcc_op_cancel7_i,  pcc_op_cancel8_i;  
  
  //Broadcast_network
  wire  [65:0]   broadcast_data_o;
  wire           broadcast_fwd_o;
	
  
  //FPGA port
  wire  [ 63:0]      ddr_dq_fpga;      
  wire  [  7:0]      ddr_dqs_p_fpga;  
  wire  [  7:0]      ddr_dqs_n_fpga;                    
  wire  [ 15:0]      ddr_addr_fpga;            /// yyp 2016-10-21                
  wire  [  2:0]      ddr_ba_fpga;                            
  wire               ddr_ras_n_fpga;                         
  wire               ddr_cas_n_fpga;                         
  wire               ddr_we_n_fpga;      
  wire               ddr_reset_n;
  wire  [  0:0]      ddr_ck_p_fpga;            /// yyp 2016-10-21
  wire  [  0:0]      ddr_ck_n_fpga;            /// yyp 2016-10-21
  wire  [  0:0]      ddr_cke_fpga;             /// yyp 2016-10-21      
  wire  [  0:0]      ddr_cs_n_fpga;            /// yyp 2016-10-21
  wire  [  0:0]      ddr_odt_fpga;             /// yyp 2016-10-21
  wire  [  7:0]      ddr_dm_fpga;  
    
	
	
//----------------------------------------------------------------------------
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// CLK_OUT1___400.000______0.000______50.0______218.701____301.005
// CLK_OUT2___200.000______0.000______50.0______237.367____301.005
// CLK_OUT3___100.000______0.000______50.0______258.391____301.005
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary__________20.000____________0.010
   
  clk_gen  u_clk_gen
  (
    .CLK_IN1    (clk),
	.CLK_OUT1   (clk_400M),
	.CLK_OUT2   (clk_200M),
	.CLK_OUT3   (clk_100M),
	.LOCKED     (pll_locked)
  );

  //********************************************************************
  // 
  //********************************************************************
  
  DDR_Wrapper  u_DDR_Wrapper
  (
    
     .sys_100M                   (          clk_100M),
     .logic_rst_n                (       logic_rst_n),
     .sys_clk                    (           clk_400M),
     .clk_ref                    (           clk_200M),
     .sys_rst                    (           sys_rst),
     .phy_init_done_o            (   init_calib_complete),
     .cfgid_i                    (                    cfgid_i),
     .cfgfwd_i                   (                   cfgfwd_i),
     .cfgdata_i                  (                  cfgdata_i),
     .cfgreq_i                   (                   cfgreq_i),
     .cfgdone_i                  (                  cfgdone_i),
     .status_request_o           (           status_request_o),
     .status_ack_i               (               status_ack_i),
     .status_data_o              (              status_data_o),
     .status_valid_o             (             status_valid_o),
     .pcc_ip_data1_i             (             pcc_ip_data1_i),
     .pcc_ip_data2_i             (             pcc_ip_data2_i),
     .pcc_ip_data3_i             (             pcc_ip_data3_i),
     .pcc_ip_data4_i             (             pcc_ip_data4_i),
     .pcc_ip_data5_i             (             pcc_ip_data5_i),
     .pcc_ip_data6_i             (             pcc_ip_data6_i),
     .pcc_ip_data7_i             (             pcc_ip_data7_i),
     .pcc_ip_data8_i             (             pcc_ip_data8_i),
     .pcc_ip_stb1_i              (              pcc_ip_stb1_i),
     .pcc_ip_stb2_i              (              pcc_ip_stb2_i),
     .pcc_ip_stb3_i              (              pcc_ip_stb3_i),
     .pcc_ip_stb4_i              (              pcc_ip_stb4_i),
     .pcc_ip_stb5_i              (              pcc_ip_stb5_i),
     .pcc_ip_stb6_i              (              pcc_ip_stb6_i),
     .pcc_ip_stb7_i              (              pcc_ip_stb7_i),
     .pcc_ip_stb8_i              (              pcc_ip_stb8_i),
     .pcc_ip_fwd1_i              (              pcc_ip_fwd1_i),
     .pcc_ip_fwd2_i              (              pcc_ip_fwd2_i),
     .pcc_ip_fwd3_i              (              pcc_ip_fwd3_i),
     .pcc_ip_fwd4_i              (              pcc_ip_fwd4_i),
     .pcc_ip_fwd5_i              (              pcc_ip_fwd5_i),
     .pcc_ip_fwd6_i              (              pcc_ip_fwd6_i),
     .pcc_ip_fwd7_i              (              pcc_ip_fwd7_i),
     .pcc_ip_fwd8_i              (              pcc_ip_fwd8_i),
     .pcc_ip_fail1_o             (             pcc_ip_fail1_o),
     .pcc_ip_fail2_o             (             pcc_ip_fail2_o),
     .pcc_ip_fail3_o             (             pcc_ip_fail3_o),
     .pcc_ip_fail4_o             (             pcc_ip_fail4_o),
     .pcc_ip_fail5_o             (             pcc_ip_fail5_o),
     .pcc_ip_fail6_o             (             pcc_ip_fail6_o),
     .pcc_ip_fail7_o             (             pcc_ip_fail7_o),
     .pcc_ip_fail8_o             (             pcc_ip_fail8_o),
     .pcc_ip_pack1_o             (             pcc_ip_pack1_o),
     .pcc_ip_pack2_o             (             pcc_ip_pack2_o),
     .pcc_ip_pack3_o             (             pcc_ip_pack3_o),
     .pcc_ip_pack4_o             (             pcc_ip_pack4_o),
     .pcc_ip_pack5_o             (             pcc_ip_pack5_o),
     .pcc_ip_pack6_o             (             pcc_ip_pack6_o),
     .pcc_ip_pack7_o             (             pcc_ip_pack7_o),
     .pcc_ip_pack8_o             (             pcc_ip_pack8_o),
     .pcc_ip_suspend1_o          (          pcc_ip_suspend1_o),
     .pcc_ip_suspend2_o          (          pcc_ip_suspend2_o),
     .pcc_ip_suspend3_o          (          pcc_ip_suspend3_o),
     .pcc_ip_suspend4_o          (          pcc_ip_suspend4_o),
     .pcc_ip_suspend5_o          (          pcc_ip_suspend5_o),
     .pcc_ip_suspend6_o          (          pcc_ip_suspend6_o),
     .pcc_ip_suspend7_o          (          pcc_ip_suspend7_o),
     .pcc_ip_suspend8_o          (          pcc_ip_suspend8_o),
     .pcc_ip_cancel1_o           (           pcc_ip_cancel1_o),
     .pcc_ip_cancel2_o           (           pcc_ip_cancel2_o),
     .pcc_ip_cancel3_o           (           pcc_ip_cancel3_o),
     .pcc_ip_cancel4_o           (           pcc_ip_cancel4_o),
     .pcc_ip_cancel5_o           (           pcc_ip_cancel5_o),
     .pcc_ip_cancel6_o           (           pcc_ip_cancel6_o),
     .pcc_ip_cancel7_o           (           pcc_ip_cancel7_o),
     .pcc_ip_cancel8_o           (           pcc_ip_cancel8_o),
     .pcc_op_data1_o             (             pcc_op_data1_o),
     .pcc_op_data2_o             (             pcc_op_data2_o),
     .pcc_op_data3_o             (             pcc_op_data3_o),
     .pcc_op_data4_o             (             pcc_op_data4_o),
     .pcc_op_data5_o             (             pcc_op_data5_o),
     .pcc_op_data6_o             (             pcc_op_data6_o),
     .pcc_op_data7_o             (             pcc_op_data7_o),
     .pcc_op_data8_o             (             pcc_op_data8_o),
     .pcc_op_stb1_o              (              pcc_op_stb1_o),
     .pcc_op_stb2_o              (              pcc_op_stb2_o),
     .pcc_op_stb3_o              (              pcc_op_stb3_o),
     .pcc_op_stb4_o              (              pcc_op_stb4_o),
     .pcc_op_stb5_o              (              pcc_op_stb5_o),
     .pcc_op_stb6_o              (              pcc_op_stb6_o),
     .pcc_op_stb7_o              (              pcc_op_stb7_o),
     .pcc_op_stb8_o              (              pcc_op_stb8_o),
     .pcc_op_fwd1_o              (              pcc_op_fwd1_o),
     .pcc_op_fwd2_o              (              pcc_op_fwd2_o),
     .pcc_op_fwd3_o              (              pcc_op_fwd3_o),
     .pcc_op_fwd4_o              (              pcc_op_fwd4_o),
     .pcc_op_fwd5_o              (              pcc_op_fwd5_o),
     .pcc_op_fwd6_o              (              pcc_op_fwd6_o),
     .pcc_op_fwd7_o              (              pcc_op_fwd7_o),
     .pcc_op_fwd8_o              (              pcc_op_fwd8_o),
     .pcc_op_fail1_i             (             pcc_op_fail1_i),
     .pcc_op_fail2_i             (             pcc_op_fail2_i),
     .pcc_op_fail3_i             (             pcc_op_fail3_i),
     .pcc_op_fail4_i             (             pcc_op_fail4_i),
     .pcc_op_fail5_i             (             pcc_op_fail5_i),
     .pcc_op_fail6_i             (             pcc_op_fail6_i),
     .pcc_op_fail7_i             (             pcc_op_fail7_i),
     .pcc_op_fail8_i             (             pcc_op_fail8_i),
     .pcc_op_pack1_i             (             pcc_op_pack1_i),
     .pcc_op_pack2_i             (             pcc_op_pack2_i),
     .pcc_op_pack3_i             (             pcc_op_pack3_i),
     .pcc_op_pack4_i             (             pcc_op_pack4_i),
     .pcc_op_pack5_i             (             pcc_op_pack5_i),
     .pcc_op_pack6_i             (             pcc_op_pack6_i),
     .pcc_op_pack7_i             (             pcc_op_pack7_i),
     .pcc_op_pack8_i             (             pcc_op_pack8_i),
     .pcc_op_suspend1_i          (          pcc_op_suspend1_i),
     .pcc_op_suspend2_i          (          pcc_op_suspend2_i),
     .pcc_op_suspend3_i          (          pcc_op_suspend3_i),
     .pcc_op_suspend4_i          (          pcc_op_suspend4_i),
     .pcc_op_suspend5_i          (          pcc_op_suspend5_i),
     .pcc_op_suspend6_i          (          pcc_op_suspend6_i),
     .pcc_op_suspend7_i          (          pcc_op_suspend7_i),
     .pcc_op_suspend8_i          (          pcc_op_suspend8_i),
     .pcc_op_cancel1_i           (           pcc_op_cancel1_i),
     .pcc_op_cancel2_i           (           pcc_op_cancel2_i),
     .pcc_op_cancel3_i           (           pcc_op_cancel3_i),
     .pcc_op_cancel4_i           (           pcc_op_cancel4_i),
     .pcc_op_cancel5_i           (           pcc_op_cancel5_i),
     .pcc_op_cancel6_i           (           pcc_op_cancel6_i),
     .pcc_op_cancel7_i           (           pcc_op_cancel7_i),
     .pcc_op_cancel8_i           (           pcc_op_cancel8_i),
     .broadcast_data_o           (           broadcast_data_o),
     .broadcast_fwd_o            (            broadcast_fwd_o),
  
     .ddr_dq_fpga           (ddr_dq_fpga),   
     .ddr_dqs_p_fpga        (ddr_dqs_p_fpga),
     .ddr_dqs_n_fpga        (ddr_dqs_n_fpga),
     .ddr_addr_fpga         (ddr_addr_fpga), 
     .ddr_ba_fpga           (ddr_ba_fpga),   
     .ddr_ras_n_fpga        (ddr_ras_n_fpga),
     .ddr_cas_n_fpga        (ddr_cas_n_fpga),
     .ddr_we_n_fpga         (ddr_we_n_fpga), 
     .ddr_reset_n           (ddr_reset_n),
     .ddr_ck_p_fpga         (ddr_ck_p_fpga), 
     .ddr_ck_n_fpga         (ddr_ck_n_fpga), 
     .ddr_cke_fpga          (ddr_cke_fpga),  
     .ddr_cs_n_fpga         (ddr_cs_n_fpga), 
     .ddr_odt_fpga          (ddr_odt_fpga),  
     .ddr_dm_fpga           (ddr_dm_fpga)
  );

  
 sim_tb_top u_sim_tb_top (
    .ddr3_dq_fpga                           (ddr_dq_fpga), 
    .ddr3_dqs_n_fpga                        (ddr_dqs_n_fpga), 
    .ddr3_dqs_p_fpga                        (ddr_dqs_p_fpga), 
    .ddr3_addr_fpga                         (ddr_addr_fpga), 
    .ddr3_ba_fpga                           (ddr_ba_fpga), 
    .ddr3_ras_n_fpga                        (ddr_ras_n_fpga), 
    .ddr3_cas_n_fpga                        (ddr_cas_n_fpga), 
    .ddr3_we_n_fpga                         (ddr_we_n_fpga), 
    .ddr3_reset_n                           (ddr_reset_n), 
    .ddr3_ck_p_fpga                         (ddr_ck_p_fpga), 
    .ddr3_ck_n_fpga                         (ddr_ck_n_fpga), 
    .ddr3_cke_fpga                          (ddr_cke_fpga), 
    .ddr3_cs_n_fpga                         (ddr_cs_n_fpga), 
    .ddr3_dm_fpga                           (ddr_dm_fpga), 
    .ddr3_odt_fpga                          (ddr_odt_fpga), 
    .init_calib_complete                    (init_calib_complete)
    ); 
  
  //***********************************
  // clk generator
  //***********************************
  initial
      clk = 0;
  always
      #(`CLK_PERIOD/2.0)  clk = ~clk;
	  
	////// Attention: this clock is can not drive the valid signals.
	  
  
  assign  logic_rst_n = rst_n;
  assign  sys_rst     = rst_n;
  
  //************************************//
   
	
   
//************************************************************
//cfg info ready to be issued
//************************************************************
wire [31:0]  cfg_1_0  = 32'b00011000000000000000001100000001;
wire [31:0]  cfg_1_1  = 32'b00000000000000000000000000010001;
wire [31:0]  cfg_1_2  = 32'b00000000000000000000000000000000;
wire [31:0]  cfg_1_3  = 32'b00000000000000000000000000000000;
wire [31:0]  cfg_1_4  = 32'b00000000000000000000000000000000;
wire [31:0]  cfg_1_5  = 32'b00000000000000000000000000000000;
wire [31:0]  cfg_1_6  = 32'b00000000000000000000000000000000;
wire [31:0]  cfg_1_7  = 32'b00000000011111110000000000001100;
wire [31:0]  cfg_1_8  = 32'b00000000000000000000000000000000;
wire [31:0]  cfg_1_9  = 32'b00000000000000000000000000000000;
wire [31:0]  cfg_1_10 = 32'b00000000000000000000000000000000;
wire [31:0]  cfg_1_11 = 32'b00000000000000000000010000000000;
wire [31:0]  cfg_1_12 = 32'b00000000000000000011000000000000;
wire [31:0]  cfg_1_13 = 32'b00000000000000000000010000000000;
wire [31:0]  cfg_1_14 = 32'b00000000000000000011000000000000;
wire [31:0]  cfg_1_15 = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_2_0  = 32'b10010000001100000000010000000010;
// wire [31:0]  cfg_2_1  = 32'b00100100001000110010001000100001;
// wire [31:0]  cfg_2_2  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_2_3  = 32'b10001000100001111000011010000101;
// wire [31:0]  cfg_2_4  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_2_5  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_2_6  = 32'b00000000000000010000000000000011;
// wire [31:0]  cfg_2_7  = 32'b00000000001111110000000000000010;
// wire [31:0]  cfg_2_8  = 32'b00000000000000000000001001001001;
// wire [31:0]  cfg_2_9  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_2_10 = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_2_11 = 32'b00000000000000000000001000000000;
// wire [31:0]  cfg_2_12 = 32'b00000000000000000000100000000000;
// wire [31:0]  cfg_2_13 = 32'b00000000000000000000010000000000;
// wire [31:0]  cfg_2_14 = 32'b00000000000000000000010000000000;
// wire [31:0]  cfg_2_15 = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_3_0  = 32'b10010000001100000000010100000011;
// wire [31:0]  cfg_3_1  = 32'b00111000001101110011011000110101;
// wire [31:0]  cfg_3_2  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_3_3  = 32'b10001000100001111000011010000101;
// wire [31:0]  cfg_3_4  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_3_5  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_3_6  = 32'b00000000000000010000000000000011;
// wire [31:0]  cfg_3_7  = 32'b00000000001111110000000000000010;
// wire [31:0]  cfg_3_8  = 32'b00000000000000000000010010010010;
// wire [31:0]  cfg_3_9  = 32'b00000000000000000000001001001001;
// wire [31:0]  cfg_3_10 = 32'b00000000000000000000000000000001;
// wire [31:0]  cfg_3_11 = 32'b00000000000000000000001000000000;
// wire [31:0]  cfg_3_12 = 32'b00000000000000000000100000000000;
// wire [31:0]  cfg_3_13 = 32'b00000000000000000000010000000000;
// wire [31:0]  cfg_3_14 = 32'b00000000000000000000010000000000;
// wire [31:0]  cfg_3_15 = 32'b00000000000000000000000000000000;

// wire [31:0]  cfg_1_0  = 32'b00011000000000000000001100000001;
// wire [31:0]  cfg_1_1  = 32'b00000000000000000000000000010001;
// wire [31:0]  cfg_1_2  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_1_3  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_1_4  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_1_5  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_1_6  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_1_7  = 32'b00000000011111110000000000001100;
// wire [31:0]  cfg_1_8  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_1_9  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_1_10 = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_1_11 = 32'b00000000000000000000010000000000;
// wire [31:0]  cfg_1_12 = 32'b00000000000000000011000000000000;
// wire [31:0]  cfg_1_13 = 32'b00000000000000000000010000000000;
// wire [31:0]  cfg_1_14 = 32'b00000000000000000011000000000000;
// wire [31:0]  cfg_1_15 = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_2_0  = 32'b00010000001100000000010000000010;
// wire [31:0]  cfg_2_1  = 32'b00100100001000110010001000100001;
// wire [31:0]  cfg_2_2  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_2_3  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_2_4  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_2_5  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_2_6  = 32'b00000000000000010000000000000011;
// wire [31:0]  cfg_2_7  = 32'b00000000001111110000000000000010;
// wire [31:0]  cfg_2_8  = 32'b00000000000000000000001001001001;
// wire [31:0]  cfg_2_9  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_2_10 = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_2_11 = 32'b00000000000000000000001000000000;
// wire [31:0]  cfg_2_12 = 32'b00000000000000000000100000000000;
// wire [31:0]  cfg_2_13 = 32'b00000000000000000000010000000000;
// wire [31:0]  cfg_2_14 = 32'b00000000000000000000010000000000;
// wire [31:0]  cfg_2_15 = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_3_0  = 32'b00010000001100000000010100000011;
// wire [31:0]  cfg_3_1  = 32'b00111000001101110011011000110101;
// wire [31:0]  cfg_3_2  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_3_3  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_3_4  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_3_5  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_3_6  = 32'b00000000000000010000000000000011;
// wire [31:0]  cfg_3_7  = 32'b00000000001111110000000000000010;
// wire [31:0]  cfg_3_8  = 32'b00000000000000000000010010010010;
// wire [31:0]  cfg_3_9  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_3_10 = 32'b00000000000000000000000000000001;
// wire [31:0]  cfg_3_11 = 32'b00000000000000000000001000000000;
// wire [31:0]  cfg_3_12 = 32'b00000000000000000000100000000000;
// wire [31:0]  cfg_3_13 = 32'b00000000000000000000010000000000;
// wire [31:0]  cfg_3_14 = 32'b00000000000000000000010000000000;
// wire [31:0]  cfg_3_15 = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_4_0  = 32'b00110000010100000000010000000100;
// wire [31:0]  cfg_4_1  = 32'b01000100010000110100001001000001;
// wire [31:0]  cfg_4_2  = 32'b00000000000000000100011001000101;
// wire [31:0]  cfg_4_3  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_4_4  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_4_5  = 32'b00000000000000000010000000000000;
// wire [31:0]  cfg_4_6  = 32'b00000000000000010000000000000000;
// wire [31:0]  cfg_4_7  = 32'b00000000001111110000000000000100;
// wire [31:0]  cfg_4_8  = 32'b00000000000000011011011011011011;
// wire [31:0]  cfg_4_9  = 32'b00000000000000000000000000000000;
// wire [31:0]  cfg_4_10 = 32'b00000000000000000000000000000001;
// wire [31:0]  cfg_4_11 = 32'b00000000000000000000001000000000;
// wire [31:0]  cfg_4_12 = 32'b00000000000000000001000000000000;
// wire [31:0]  cfg_4_13 = 32'b00000000000000000000010000000000;
// wire [31:0]  cfg_4_14 = 32'b00000000000000000000100000000000;
// wire [31:0]  cfg_4_15 = 32'b00000000000000000000000000000000;
//**************************************************************//
   
   
   
//*******************************************************************
//req info
//*******************************************************************
// write data without loop
wire [31:0]  write_req_0  = {1'b0, 9'b0, 2'b01, 1'b0, 3'd0, 8'h11, 8'h04};
wire [31:0]  write_req_1  = {32'b0};
wire [31:0]  write_req_2  = {32'b0};

// Main controller
wire [31:0]  MC_req_0;
wire [31:0]  MC_req_1;
wire [31:0]  MC_req_2 = {32'b0};

reg  [1:0]   MC_src_type;   // 2'b01 / 2'b10
reg  [19:0]  MC_addr;

assign  MC_req_0 = {1'b0,  9'b0, MC_src_type[1:0], 1'b0, `MC_POS_2ND, `MC_POS_1ST, 8'h04};
assign  MC_req_1 = {1'b1, 11'b0, MC_addr[19:0]};

// COP
wire [31:0]  COP_0_req_0;
wire [31:0]  COP_0_req_1;
wire [31:0]  COP_0_req_2 = {32'b0};
wire [31:0]  COP_1_req_0;
wire [31:0]  COP_1_req_1;
wire [31:0]  COP_1_req_2 = {32'b0};
wire [31:0]  COP_2_req_0;
wire [31:0]  COP_2_req_1;
wire [31:0]  COP_2_req_2 = {32'b0};

reg  [1:0]   COP_0_src_type;  reg  [19:0]  COP_0_addr;
reg  [1:0]   COP_1_src_type;  reg  [19:0]  COP_1_addr;
reg  [1:0]   COP_2_src_type;  reg  [19:0]  COP_2_addr;

assign  COP_0_req_0 = {1'b0,  9'b0, COP_0_src_type[1:0], 1'b0, `COP_0_POS_2ND, `COP_0_POS_1ST, 8'h04};
assign  COP_1_req_0 = {1'b0,  9'b0, COP_1_src_type[1:0], 1'b0, `COP_1_POS_2ND, `COP_1_POS_1ST, 8'h04};
assign  COP_2_req_0 = {1'b0,  9'b0, COP_2_src_type[1:0], 1'b0, `COP_2_POS_2ND, `COP_2_POS_1ST, 8'h04};
assign  COP_0_req_1 = {1'b1, 11'b0, COP_0_addr[19:0]};
assign  COP_1_req_1 = {1'b1, 11'b0, COP_1_addr[19:0]};
assign  COP_2_req_1 = {1'b1, 11'b0, COP_2_addr[19:0]};

//multi third in one ach without loop
wire [31:0]  req_1_0  = {1'b0, 9'b0, 2'b01, 1'b0, 3'd1, 8'h21, 8'h04};
wire [31:0]  req_1_1  = {32'b0};
wire [31:0]  req_1_2  = {32'b0};
wire [31:0]  req_2_0  = {1'b0, 9'b0, 2'b01, 1'b0, 3'd1, 8'h22, 8'h04};
wire [31:0]  req_2_1  = {32'b0};
wire [31:0]  req_2_2  = {32'b0};
wire [31:0]  req_3_0  = {1'b0, 9'b0, 2'b01, 1'b0, 3'd1, 8'h23, 8'h04};
wire [31:0]  req_3_1  = {32'b0};
wire [31:0]  req_3_2  = {32'b0};
wire [31:0]  req_4_0  = {1'b0, 9'b0, 2'b01, 1'b0, 3'd1, 8'h24, 8'h04};
wire [31:0]  req_4_1  = {32'b0};
wire [31:0]  req_4_2  = {32'b0};

wire [31:0]  third_1_0  = {1'b0, 9'b0, 2'b00, 1'b0, 3'd0, 8'h85, 8'h04};
wire [31:0]  third_1_1;//  = {1'b0, block1_last, block1_col[13:0], block1_row[15:0]};
wire [31:0]  third_1_2  = {32'b0};
wire [31:0]  third_2_0  = {1'b0, 9'b0, 2'b01, 1'b0, 3'd0, 8'h86, 8'h04};
wire [31:0]  third_2_1;//  = {1'b0, block1_last, block2_col[13:0], block2_row[15:0]};
wire [31:0]  third_2_2  = {32'b0};
wire [31:0]  third_3_0  = {1'b0, 9'b0, 2'b01, 1'b0, 3'd0, 8'h87, 8'h04};
wire [31:0]  third_3_1;//  = {1'b0, block1_last, block3_col[13:0], block3_row[15:0]};
wire [31:0]  third_3_2  = {32'b0};
wire [31:0]  third_4_0  = {1'b0, 9'b0, 2'b01, 1'b0, 3'd0, 8'h88, 8'h04};
wire [31:0]  third_4_1;//  = {1'b0, block1_last, block4_col[13:0], block4_row[15:0]};
wire [31:0]  third_4_2  = {32'b0};

reg  [15:0]  block1_row, block2_row, block3_row, block4_row;
reg  [13:0]  block1_col, block2_col, block3_col, block4_col;
reg          block1_last,block2_last,block3_last,block4_last;

assign third_1_1  = {1'b0, block1_last, block1_col[13:0], block1_row[15:0]};
assign third_2_1  = {1'b0, block2_last, block2_col[13:0], block2_row[15:0]};
assign third_3_1  = {1'b0, block3_last, block3_col[13:0], block3_row[15:0]};
assign third_4_1  = {1'b0, block4_last, block4_col[13:0], block4_row[15:0]};

//multi third in one ach with loop
wire [31:0]  req_5_0  = {1'b0, 9'b0, 2'b10, 1'b0, 3'd2, 8'h35, 8'h04};
wire [31:0]  req_5_1  = {32'b0};
wire [31:0]  req_5_2  = {32'b0};
wire [31:0]  req_6_0  = {1'b0, 9'b0, 2'b10, 1'b0, 3'd2, 8'h36, 8'h04};
wire [31:0]  req_6_1  = {32'b0};
wire [31:0]  req_6_2  = {32'b0};
wire [31:0]  req_7_0  = {1'b0, 9'b0, 2'b10, 1'b0, 3'd2, 8'h37, 8'h04};
wire [31:0]  req_7_1  = {32'b0};
wire [31:0]  req_7_2  = {32'b0};
wire [31:0]  req_8_0  = {1'b0, 9'b0, 2'b10, 1'b0, 3'd2, 8'h38, 8'h04};
wire [31:0]  req_8_1  = {32'b0};
wire [31:0]  req_8_2  = {32'b0};

wire [31:0]  third_5_0  = {1'b0, 9'b0, 2'b10, 1'b0, 3'd1, 8'h85, 8'h04};
wire [31:0]  third_5_1;//  = {32'b0};
wire [31:0]  third_5_2  = {32'b0};
wire [31:0]  third_6_0  = {1'b0, 9'b0, 2'b10, 1'b0, 3'd1, 8'h86, 8'h04};
wire [31:0]  third_6_1;//  = {32'b0};
wire [31:0]  third_6_2  = {32'b0};
wire [31:0]  third_7_0  = {1'b0, 9'b0, 2'b10, 1'b0, 3'd1, 8'h87, 8'h04};
wire [31:0]  third_7_1;//  = {32'b0};
wire [31:0]  third_7_2  = {32'b0};
wire [31:0]  third_8_0  = {1'b0, 9'b0, 2'b10, 1'b0, 3'd1, 8'h88, 8'h04};
wire [31:0]  third_8_1;//  = {32'b0};
wire [31:0]  third_8_2  = {32'b0};

reg  [15:0]  block5_row, block6_row, block7_row, block8_row;
reg  [13:0]  block5_col, block6_col, block7_col, block8_col;
reg          block5_last,block6_last,block7_last,block8_last;

assign third_5_1  = {1'b0, block5_last, block5_col[13:0], block5_row[15:0]};
assign third_6_1  = {1'b0, block6_last, block6_col[13:0], block6_row[15:0]};
assign third_7_1  = {1'b0, block7_last, block7_col[13:0], block7_row[15:0]};
assign third_8_1  = {1'b0, block8_last, block8_col[13:0], block8_row[15:0]};

//broadcast with loop
wire [31:0]  req_broad_1_0  = {1'b0, 9'b0, 2'b01, 1'b0, 3'd3, 8'h41, 8'h04};
wire [31:0]  req_broad_1_1  = {32'b0};
wire [31:0]  req_broad_1_2  = {32'b0};
wire [31:0]  req_broad_2_0  = {1'b0, 9'b0, 2'b01, 1'b0, 3'd3, 8'h42, 8'h04};
wire [31:0]  req_broad_2_1  = {32'b0};
wire [31:0]  req_broad_2_2  = {32'b0};
wire [31:0]  req_broad_3_0  = {1'b0, 9'b0, 2'b01, 1'b0, 3'd3, 8'h43, 8'h04};
wire [31:0]  req_broad_3_1  = {32'b0};
wire [31:0]  req_broad_3_2  = {32'b0};
wire [31:0]  req_broad_4_0  = {1'b0, 9'b0, 2'b10, 1'b0, 3'd3, 8'h44, 8'h04};
wire [31:0]  req_broad_4_1  = {32'b0};
wire [31:0]  req_broad_4_2  = {32'b0};
wire [31:0]  req_broad_5_0  = {1'b0, 9'b0, 2'b10, 1'b0, 3'd3, 8'h45, 8'h04};
wire [31:0]  req_broad_5_1  = {32'b0};
wire [31:0]  req_broad_5_2  = {32'b0};
wire [31:0]  req_broad_6_0  = {1'b0, 9'b0, 2'b10, 1'b0, 3'd3, 8'h46, 8'h04};
wire [31:0]  req_broad_6_1  = {32'b0};
wire [31:0]  req_broad_6_2  = {32'b0};
//***********************************************************//
   
	
	
//***********************************************************
// read monitor pcc
//***********************************************************
  integer read_handle1;
  integer read_handle2;
  integer read_handle3;
  integer read_handle4;
  integer read_handle5;
  integer read_handle6;
  integer read_handle7;
  integer read_handle8;
  
   initial begin
	  read_handle1 = $fopen("E:/v7_2000/data/read_data1.log", "w");
	  read_handle2 = $fopen("E:/v7_2000/data/read_data2.log", "w");
	  read_handle3 = $fopen("E:/v7_2000/data/read_data3.log", "w");
	  read_handle4 = $fopen("E:/v7_2000/data/read_data4.log", "w");
	  read_handle5 = $fopen("E:/v7_2000/data/read_data5.log", "w");
	  read_handle6 = $fopen("E:/v7_2000/data/read_data6.log", "w");
	  read_handle7 = $fopen("E:/v7_2000/data/read_data7.log", "w");
	  read_handle8 = $fopen("E:/v7_2000/data/read_data8.log", "w");
   end
   
	wire        read_expect_head_1;
	wire        read_expect_head_2;
	wire        read_expect_head_3;
	wire        read_expect_head_4;
	wire        read_expect_head_5;
	wire        read_expect_head_6;
	wire        read_expect_head_7;
	wire        read_expect_head_8;
	wire        read_expect_end_1;
	wire        read_expect_end_2;
	wire        read_expect_end_3;
	wire        read_expect_end_4;
	wire        read_expect_end_5;
	wire        read_expect_end_6;
	wire        read_expect_end_7;
	wire        read_expect_end_8;
	wire        read_expect_valid_1;
	wire        read_expect_valid_2;
	wire        read_expect_valid_3;
	wire        read_expect_valid_4;
	wire        read_expect_valid_5;
	wire        read_expect_valid_6;
	wire        read_expect_valid_7;
	wire        read_expect_valid_8;
	wire [63:0] read_expect_data_1;
	wire [63:0] read_expect_data_2;
	wire [63:0] read_expect_data_3;
	wire [63:0] read_expect_data_4;
	wire [63:0] read_expect_data_5;
	wire [63:0] read_expect_data_6;
	wire [63:0] read_expect_data_7;
	wire [63:0] read_expect_data_8;
	reg [16:0] read_counter_1;
	reg [16:0] read_counter_2;
	reg [16:0] read_counter_3;
	reg [16:0] read_counter_4;
	reg [16:0] read_counter_5;
	reg [16:0] read_counter_6;
	reg [16:0] read_counter_7;
	reg [16:0] read_counter_8;
	
	assign  read_expect_head_1 = (pcc_op_stb1_o && pcc_op_data1_o[65:64]==2'b10) ? 1'b1 : 1'b0;
	assign  read_expect_head_2 = (pcc_op_stb2_o && pcc_op_data2_o[65:64]==2'b10) ? 1'b1 : 1'b0;
	assign  read_expect_head_3 = (pcc_op_stb3_o && pcc_op_data3_o[65:64]==2'b10) ? 1'b1 : 1'b0;
	assign  read_expect_head_4 = (pcc_op_stb4_o && pcc_op_data4_o[65:64]==2'b10) ? 1'b1 : 1'b0;
	assign  read_expect_head_5 = (pcc_op_stb5_o && pcc_op_data5_o[65:64]==2'b10) ? 1'b1 : 1'b0;
	assign  read_expect_head_6 = (pcc_op_stb6_o && pcc_op_data6_o[65:64]==2'b10) ? 1'b1 : 1'b0;
	assign  read_expect_head_7 = (pcc_op_stb7_o && pcc_op_data7_o[65:64]==2'b10) ? 1'b1 : 1'b0;
	assign  read_expect_head_8 = (pcc_op_stb8_o && pcc_op_data8_o[65:64]==2'b10) ? 1'b1 : 1'b0;
	
	assign  read_expect_end_1 = (pcc_op_stb1_o && pcc_op_data1_o[65:63]==3'b011 && pcc_op_fwd1_o) ? 1'b1 : 1'b0;
	assign  read_expect_end_2 = (pcc_op_stb2_o && pcc_op_data2_o[65:63]==3'b011 && pcc_op_fwd2_o) ? 1'b1 : 1'b0;
	assign  read_expect_end_3 = (pcc_op_stb3_o && pcc_op_data3_o[65:63]==3'b011 && pcc_op_fwd3_o) ? 1'b1 : 1'b0;
	assign  read_expect_end_4 = (pcc_op_stb4_o && pcc_op_data4_o[65:63]==3'b011 && pcc_op_fwd4_o) ? 1'b1 : 1'b0;
	assign  read_expect_end_5 = (pcc_op_stb5_o && pcc_op_data5_o[65:63]==3'b011 && pcc_op_fwd5_o) ? 1'b1 : 1'b0;
	assign  read_expect_end_6 = (pcc_op_stb6_o && pcc_op_data6_o[65:63]==3'b011 && pcc_op_fwd6_o) ? 1'b1 : 1'b0;
	assign  read_expect_end_7 = (pcc_op_stb7_o && pcc_op_data7_o[65:63]==3'b011 && pcc_op_fwd7_o) ? 1'b1 : 1'b0;
	assign  read_expect_end_8 = (pcc_op_stb8_o && pcc_op_data8_o[65:63]==3'b011 && pcc_op_fwd8_o) ? 1'b1 : 1'b0;
	
	assign  read_expect_valid_1 = (pcc_op_stb1_o && pcc_op_data1_o[65:64]==2'b00 && pcc_op_fwd1_o) ? 1'b1 : 1'b0;
	assign  read_expect_valid_2 = (pcc_op_stb2_o && pcc_op_data2_o[65:64]==2'b00 && pcc_op_fwd2_o) ? 1'b1 : 1'b0;
	assign  read_expect_valid_3 = (pcc_op_stb3_o && pcc_op_data3_o[65:64]==2'b00 && pcc_op_fwd3_o) ? 1'b1 : 1'b0;
	assign  read_expect_valid_4 = (pcc_op_stb4_o && pcc_op_data4_o[65:64]==2'b00 && pcc_op_fwd4_o) ? 1'b1 : 1'b0;
	assign  read_expect_valid_5 = (pcc_op_stb5_o && pcc_op_data5_o[65:64]==2'b00 && pcc_op_fwd5_o) ? 1'b1 : 1'b0;
	assign  read_expect_valid_6 = (pcc_op_stb6_o && pcc_op_data6_o[65:64]==2'b00 && pcc_op_fwd6_o) ? 1'b1 : 1'b0;
	assign  read_expect_valid_7 = (pcc_op_stb7_o && pcc_op_data7_o[65:64]==2'b00 && pcc_op_fwd7_o) ? 1'b1 : 1'b0;
	assign  read_expect_valid_8 = (pcc_op_stb8_o && pcc_op_data8_o[65:64]==2'b00 && pcc_op_fwd8_o) ? 1'b1 : 1'b0;
	
	assign  read_expect_data_1 = read_expect_valid_1 ? pcc_op_data1_o[63:0] : {64{1'b0}};
	assign  read_expect_data_2 = read_expect_valid_2 ? pcc_op_data2_o[63:0] : {64{1'b0}};
	assign  read_expect_data_3 = read_expect_valid_3 ? pcc_op_data3_o[63:0] : {64{1'b0}};
	assign  read_expect_data_4 = read_expect_valid_4 ? pcc_op_data4_o[63:0] : {64{1'b0}};
	assign  read_expect_data_5 = read_expect_valid_5 ? pcc_op_data5_o[63:0] : {64{1'b0}};
	assign  read_expect_data_6 = read_expect_valid_6 ? pcc_op_data6_o[63:0] : {64{1'b0}};
	assign  read_expect_data_7 = read_expect_valid_7 ? pcc_op_data7_o[63:0] : {64{1'b0}};
	assign  read_expect_data_8 = read_expect_valid_8 ? pcc_op_data8_o[63:0] : {64{1'b0}};
	
	always@(posedge clk_100M or negedge logic_rst_n)
	if(!logic_rst_n)
		read_counter_1<= 0;
	else if(pcc_op_stb1_o && pcc_op_data1_o[65:63]==3'b011 && pcc_op_fwd1_o)
		read_counter_1 <= 0;
	else if(read_expect_valid_1)
		read_counter_1 <= read_counter_1+1;
	else
		read_counter_1 <= read_counter_1;
	
	always@(posedge clk_100M or negedge logic_rst_n)
	if(!logic_rst_n)
		read_counter_2<= 0;
	else if(pcc_op_stb2_o && pcc_op_data2_o[65:63]==3'b011 && pcc_op_fwd2_o)
		read_counter_2 <= 0;
	else if(read_expect_valid_2)
		read_counter_2 <= read_counter_2+1;
	else
		read_counter_2 <= read_counter_2;
	
	always@(posedge clk_100M or negedge logic_rst_n)
	if(!logic_rst_n)
		read_counter_3<= 0;
	else if(pcc_op_stb3_o && pcc_op_data3_o[65:63]==3'b011 && pcc_op_fwd3_o)
		read_counter_3 <= 0;
	else if(read_expect_valid_3)
		read_counter_3 <= read_counter_3+1;
	else
		read_counter_3 <= read_counter_3;
	
	always@(posedge clk_100M or negedge logic_rst_n)
	if(!logic_rst_n)
		read_counter_4<= 0;
	else if(pcc_op_stb4_o && pcc_op_data4_o[65:63]==3'b011 && pcc_op_fwd4_o)
		read_counter_4 <= 0;
	else if(read_expect_valid_4)
		read_counter_4 <= read_counter_4+1;
	else
		read_counter_4 <= read_counter_4;
	
	always@(posedge clk_100M or negedge logic_rst_n)
	if(!logic_rst_n)
		read_counter_5<= 0;
	else if(pcc_op_stb5_o && pcc_op_data5_o[65:63]==3'b011 && pcc_op_fwd5_o)
		read_counter_5 <= 0;
	else if(read_expect_valid_5)
		read_counter_5 <= read_counter_5+1;
	else
		read_counter_5 <= read_counter_5;
	
	always@(posedge clk_100M or negedge logic_rst_n)
	if(!logic_rst_n)
		read_counter_6<= 0;
	else if(pcc_op_stb6_o && pcc_op_data6_o[65:63]==3'b011 && pcc_op_fwd6_o)
		read_counter_6 <= 0;
	else if(read_expect_valid_6)
		read_counter_6 <= read_counter_6+1;
	else
		read_counter_6 <= read_counter_6;
	
	always@(posedge clk_100M or negedge logic_rst_n)
	if(!logic_rst_n)
		read_counter_7<= 0;
	else if(pcc_op_stb7_o && pcc_op_data7_o[65:63]==3'b011 && pcc_op_fwd7_o)
		read_counter_7 <= 0;
	else if(read_expect_valid_7)
		read_counter_7 <= read_counter_7+1;
	else
		read_counter_7 <= read_counter_7;
	
	always@(posedge clk_100M or negedge logic_rst_n)
	if(!logic_rst_n)
		read_counter_8<= 0;
	else if(pcc_op_stb8_o && pcc_op_data8_o[65:63]==3'b011 && pcc_op_fwd8_o)
		read_counter_8 <= 0;
	else if(read_expect_valid_8)
		read_counter_8 <= read_counter_8+1;
	else
		read_counter_8 <= read_counter_8;
   
   always@(posedge clk_100M) begin
	if(read_expect_head_1)	$fdisplay(read_handle1, "this is pcc_port 01 , pos_1st : %h\t src_type : %2b\n------------------------------------------", pcc_op_data1_o[7:0], pcc_op_data1_o[17:16]);
	if(read_expect_head_2)	$fdisplay(read_handle2, "this is pcc_port 02 , pos_1st : %h\t src_type : %2b\n------------------------------------------", pcc_op_data2_o[7:0], pcc_op_data2_o[17:16]);
	if(read_expect_head_3)	$fdisplay(read_handle3, "this is pcc_port 03 , pos_1st : %h\t src_type : %2b\n------------------------------------------", pcc_op_data3_o[7:0], pcc_op_data3_o[17:16]);
	if(read_expect_head_4)	$fdisplay(read_handle4, "this is pcc_port 04 , pos_1st : %h\t src_type : %2b\n------------------------------------------", pcc_op_data4_o[7:0], pcc_op_data4_o[17:16]);
	if(read_expect_head_5)	$fdisplay(read_handle5, "this is pcc_port 05 , pos_1st : %h\t src_type : %2b\n------------------------------------------", pcc_op_data5_o[7:0], pcc_op_data5_o[17:16]);
	if(read_expect_head_6)	$fdisplay(read_handle6, "this is pcc_port 06 , pos_1st : %h\t src_type : %2b\n------------------------------------------", pcc_op_data6_o[7:0], pcc_op_data6_o[17:16]);
	if(read_expect_head_7)	$fdisplay(read_handle7, "this is pcc_port 07 , pos_1st : %h\t src_type : %2b\n------------------------------------------", pcc_op_data7_o[7:0], pcc_op_data7_o[17:16]);
	if(read_expect_head_8)	$fdisplay(read_handle8, "this is pcc_port 08 , pos_1st : %h\t src_type : %2b\n------------------------------------------", pcc_op_data8_o[7:0], pcc_op_data8_o[17:16]);
   end
   always@(posedge clk_100M) begin
	if(read_expect_valid_1)	$fdisplay(read_handle1, "%4d : %4d", read_counter_1,read_expect_data_1);
	if(read_expect_valid_2)	$fdisplay(read_handle2, "%4d : %4d", read_counter_2,read_expect_data_2);
	if(read_expect_valid_3)	$fdisplay(read_handle3, "%4d : %4d", read_counter_3,read_expect_data_3);
	if(read_expect_valid_4)	$fdisplay(read_handle4, "%4d : %4d", read_counter_4,read_expect_data_4);
	if(read_expect_valid_5)	$fdisplay(read_handle5, "%4d : %4d", read_counter_5,read_expect_data_5);
	if(read_expect_valid_6)	$fdisplay(read_handle6, "%4d : %4d", read_counter_6,read_expect_data_6);
	if(read_expect_valid_7)	$fdisplay(read_handle7, "%4d : %4d", read_counter_7,read_expect_data_7);
	if(read_expect_valid_8)	$fdisplay(read_handle8, "%4d : %4d", read_counter_8,read_expect_data_8);
   end
   always@(posedge clk_100M) begin
	if(read_expect_end_1)	$fdisplay(read_handle1, " ------------------------------------------\nread end ..\n\n");
	if(read_expect_end_2)	$fdisplay(read_handle2, " ------------------------------------------\nread end ..\n\n");
	if(read_expect_end_3)	$fdisplay(read_handle3, " ------------------------------------------\nread end ..\n\n");
	if(read_expect_end_4)	$fdisplay(read_handle4, " ------------------------------------------\nread end ..\n\n");
	if(read_expect_end_5)	$fdisplay(read_handle5, " ------------------------------------------\nread end ..\n\n");
	if(read_expect_end_6)	$fdisplay(read_handle6, " ------------------------------------------\nread end ..\n\n");
	if(read_expect_end_7)	$fdisplay(read_handle7, " ------------------------------------------\nread end ..\n\n");
	if(read_expect_end_8)	$fdisplay(read_handle8, " ------------------------------------------\nread end ..\n\n");
   end
//*******************************************************************//
	
	
	
//**********************************************************************
// monitor pcc network, give a pack signal when starting data transform
// or a cancel signal when stoping data transform.
//**********************************************************************
	reg   op_pack1_r1, op_pack1_r2;
	reg   op_pack2_r1, op_pack2_r2;
	reg   op_pack3_r1, op_pack3_r2;
	reg   op_pack4_r1, op_pack4_r2;
	reg   op_pack5_r1, op_pack5_r2;
	reg   op_pack6_r1, op_pack6_r2;
	reg   op_pack7_r1, op_pack7_r2;
	reg   op_pack8_r1, op_pack8_r2;
	
	reg   op_cancel1_r1, op_cancel1_r2;
	reg   op_cancel2_r1, op_cancel2_r2;
	reg   op_cancel3_r1, op_cancel3_r2;
	reg   op_cancel4_r1, op_cancel4_r2;
	reg   op_cancel5_r1, op_cancel5_r2;
	reg   op_cancel6_r1, op_cancel6_r2;
	reg   op_cancel7_r1, op_cancel7_r2;
	reg   op_cancel8_r1, op_cancel8_r2;
	
	always@(posedge clk_100M or negedge logic_rst_n) begin
		if(!logic_rst_n) begin
			op_pack1_r1 <= 1'b0;    op_pack1_r2 <= 1'b0;
			op_pack2_r1 <= 1'b0;    op_pack2_r2 <= 1'b0;
			op_pack3_r1 <= 1'b0;    op_pack3_r2 <= 1'b0;
			op_pack4_r1 <= 1'b0;    op_pack4_r2 <= 1'b0;
			op_pack5_r1 <= 1'b0;    op_pack5_r2 <= 1'b0;
			op_pack6_r1 <= 1'b0;    op_pack6_r2 <= 1'b0;
			op_pack7_r1 <= 1'b0;    op_pack7_r2 <= 1'b0;
			op_pack8_r1 <= 1'b0;    op_pack8_r2 <= 1'b0;
			
			op_cancel1_r1 <= 1'b0;    op_cancel1_r2 <= 1'b0;
			op_cancel2_r1 <= 1'b0;    op_cancel2_r2 <= 1'b0;
			op_cancel3_r1 <= 1'b0;    op_cancel3_r2 <= 1'b0;
			op_cancel4_r1 <= 1'b0;    op_cancel4_r2 <= 1'b0;
			op_cancel5_r1 <= 1'b0;    op_cancel5_r2 <= 1'b0;
			op_cancel6_r1 <= 1'b0;    op_cancel6_r2 <= 1'b0;
			op_cancel7_r1 <= 1'b0;    op_cancel7_r2 <= 1'b0;
			op_cancel8_r1 <= 1'b0;    op_cancel8_r2 <= 1'b0;
		end
		else begin
			op_pack1_r1 <= (pcc_op_stb1_o && pcc_op_data1_o[65:64]==2'b10);   op_pack1_r2 <= op_pack1_r1;
			op_pack2_r1 <= (pcc_op_stb2_o && pcc_op_data2_o[65:64]==2'b10);   op_pack2_r2 <= op_pack2_r1;
			op_pack3_r1 <= (pcc_op_stb3_o && pcc_op_data3_o[65:64]==2'b10);   op_pack3_r2 <= op_pack3_r1;
			op_pack4_r1 <= (pcc_op_stb4_o && pcc_op_data4_o[65:64]==2'b10);   op_pack4_r2 <= op_pack4_r1;
			op_pack5_r1 <= (pcc_op_stb5_o && pcc_op_data5_o[65:64]==2'b10);   op_pack5_r2 <= op_pack5_r1;
			op_pack6_r1 <= (pcc_op_stb6_o && pcc_op_data6_o[65:64]==2'b10);   op_pack6_r2 <= op_pack6_r1;
			op_pack7_r1 <= (pcc_op_stb7_o && pcc_op_data7_o[65:64]==2'b10);   op_pack7_r2 <= op_pack7_r1;
			op_pack8_r1 <= (pcc_op_stb8_o && pcc_op_data8_o[65:64]==2'b10);   op_pack8_r2 <= op_pack8_r1;
			
			op_cancel1_r1 <= (pcc_op_stb1_o && pcc_op_data1_o[65:63]==3'b011);   op_cancel1_r2 <= op_cancel1_r1;
			op_cancel2_r1 <= (pcc_op_stb2_o && pcc_op_data2_o[65:63]==3'b011);   op_cancel2_r2 <= op_cancel2_r1;
			op_cancel3_r1 <= (pcc_op_stb3_o && pcc_op_data3_o[65:63]==3'b011);   op_cancel3_r2 <= op_cancel3_r1;
			op_cancel4_r1 <= (pcc_op_stb4_o && pcc_op_data4_o[65:63]==3'b011);   op_cancel4_r2 <= op_cancel4_r1;
			op_cancel5_r1 <= (pcc_op_stb5_o && pcc_op_data5_o[65:63]==3'b011);   op_cancel5_r2 <= op_cancel5_r1;
			op_cancel6_r1 <= (pcc_op_stb6_o && pcc_op_data6_o[65:63]==3'b011);   op_cancel6_r2 <= op_cancel6_r1;
			op_cancel7_r1 <= (pcc_op_stb7_o && pcc_op_data7_o[65:63]==3'b011);   op_cancel7_r2 <= op_cancel7_r1;
			op_cancel8_r1 <= (pcc_op_stb8_o && pcc_op_data8_o[65:63]==3'b011);   op_cancel8_r2 <= op_cancel8_r1;
		end
	end
	always@(*) begin
	       pcc_op_pack1_i = op_pack1_r1 & (!op_pack1_r2);
	       pcc_op_pack2_i = op_pack2_r1 & (!op_pack2_r2);
	       pcc_op_pack3_i = op_pack3_r1 & (!op_pack3_r2);
	       pcc_op_pack4_i = op_pack4_r1 & (!op_pack4_r2);
	       pcc_op_pack5_i = op_pack5_r1 & (!op_pack5_r2);
	       pcc_op_pack6_i = op_pack6_r1 & (!op_pack6_r2);
	       pcc_op_pack7_i = op_pack7_r1 & (!op_pack7_r2);
	       pcc_op_pack8_i = op_pack8_r1 & (!op_pack8_r2);
	      
	       pcc_op_cancel1_i = op_cancel1_r1 & (!op_cancel1_r2);
	       pcc_op_cancel2_i = op_cancel2_r1 & (!op_cancel2_r2);
	       pcc_op_cancel3_i = op_cancel3_r1 & (!op_cancel3_r2);
	       pcc_op_cancel4_i = op_cancel4_r1 & (!op_cancel4_r2);
	       pcc_op_cancel5_i = op_cancel5_r1 & (!op_cancel5_r2);
	       pcc_op_cancel6_i = op_cancel6_r1 & (!op_cancel6_r2);
	       pcc_op_cancel7_i = op_cancel7_r1 & (!op_cancel7_r2);
	       pcc_op_cancel8_i = op_cancel8_r1 & (!op_cancel8_r2);	
	end
//**********************************************************************//



//*******************************************************************
// monitor status network, give a ack signal when DDR asserts a request.
//*******************************************************************
    reg  status_ack_r1, status_ack_r2;
	
   always@(posedge clk_100M or negedge logic_rst_n) begin
		if(!logic_rst_n) begin
			status_ack_r1 <= 1'b0;
			status_ack_r2 <= 1'b0;
		end
		else if(status_request_o) begin
			status_ack_r1 <= 1'b1;
			status_ack_r2 <= status_ack_r1;
		end
		else begin
			status_ack_r1 <= 1'b0;
			status_ack_r2 <= 1'b0;
		end
	end
	always@(*) begin
		status_ack_i = status_ack_r1 & (!status_ack_r2);
	end
//**********************************************************************//
	
	
	
//*******************************************************************
// monitor broadcast network, write data on it to file in time.
//*******************************************************************
	integer broadcast_handle;
	initial 
	    broadcast_handle = $fopen("E:/v7_2000/data/broadcast.log", "w");
		
		
	wire    broadcast_pos_flag  = broadcast_fwd_o && (broadcast_data_o[65:64]==2'b01);
	wire    broadcast_type_flag = broadcast_fwd_o && (broadcast_data_o[65:64]==2'b10);
	wire    broadcast_data_flag = broadcast_fwd_o && (broadcast_data_o[65:64]==2'b00);
	wire    broadcast_end_flag  = broadcast_fwd_o && (broadcast_data_o[65:64]==2'b11);

	reg [16:0]broadcast_counter;
		
   always@(posedge clk_100M or negedge logic_rst_n) begin
    if(!logic_rst_n)
		broadcast_counter <= 0;
	else if(broadcast_end_flag)
		broadcast_counter <= 0;
	else if(broadcast_data_flag)
		broadcast_counter <= broadcast_counter+1;
   end
   
   always@(posedge clk_100M) begin
	if(broadcast_pos_flag) 
		begin
		$fdisplay(broadcast_handle, "%t : pos list as following line\n--------------------",$time);
		$fdisplay(broadcast_handle, "%t : pos1: %h", $time, broadcast_data_o[1*8-1 : 0*8]);
		$fdisplay(broadcast_handle, "%t : pos2: %h", $time, broadcast_data_o[2*8-1 : 1*8]);
		$fdisplay(broadcast_handle, "%t : pos3: %h", $time, broadcast_data_o[3*8-1 : 2*8]);
		$fdisplay(broadcast_handle, "%t : pos4: %h", $time, broadcast_data_o[4*8-1 : 3*8]);
		$fdisplay(broadcast_handle, "%t : pos5: %h", $time, broadcast_data_o[5*8-1 : 4*8]);
		$fdisplay(broadcast_handle, "%t : pos6: %h", $time, broadcast_data_o[6*8-1 : 5*8]);
		$fdisplay(broadcast_handle, "%t : pos7: %h", $time, broadcast_data_o[7*8-1 : 6*8]);
		$fdisplay(broadcast_handle, "%t : pos8: %h", $time, broadcast_data_o[8*8-1 : 7*8]);
		$fdisplay(broadcast_handle, "%t : --------------------", $time);  
		end
	else if(broadcast_type_flag)
		begin
		$fdisplay(broadcast_handle, "%t : type list as following line\n--------------------",$time);
		$fdisplay(broadcast_handle, "%t : pos1: %h", $time, broadcast_data_o[1*2-1 : 0*2]);
		$fdisplay(broadcast_handle, "%t : pos2: %h", $time, broadcast_data_o[2*2-1 : 1*2]);
		$fdisplay(broadcast_handle, "%t : pos3: %h", $time, broadcast_data_o[3*2-1 : 2*2]);
		$fdisplay(broadcast_handle, "%t : pos4: %h", $time, broadcast_data_o[4*2-1 : 3*2]);
		$fdisplay(broadcast_handle, "%t : pos5: %h", $time, broadcast_data_o[5*2-1 : 4*2]);
		$fdisplay(broadcast_handle, "%t : pos6: %h", $time, broadcast_data_o[6*2-1 : 5*2]);
		$fdisplay(broadcast_handle, "%t : pos7: %h", $time, broadcast_data_o[7*2-1 : 6*2]);
		$fdisplay(broadcast_handle, "%t : pos8: %h", $time, broadcast_data_o[8*2-1 : 7*2]);
		$fdisplay(broadcast_handle, "%t : --------------------\n",$time);
		end
	else if(broadcast_data_flag)
		begin
		$fdisplay(broadcast_handle, "%4d : %4d", broadcast_counter, broadcast_data_o[63:0]);
		end
	else if(broadcast_end_flag)
		begin
		$fdisplay(broadcast_handle, "%t :broadcast end ..\n\n\n",$time);
		end
   end
//****************************************************************************//
   
   
   
  //****************************************************************************
  // $fopen log file
  //****************************************************************************
  integer pross_handle, write_handle;
   initial begin
	  pross_handle = $fopen("E:/v7_2000/data/process.log", "w");
	  write_handle = $fopen("E:/v7_2000/data/write_data.log", "w");
   end
   
   //write data cnt
	reg [63:0] write_data_cnt;
	reg [16:0] write_counter;
    reg [16:0] read_req_counter;
	
	
	reg       wait_flag;
	
	
	always@(posedge status_request_o)		$fdisplay(pross_handle,"%t : recieve status info <<<<<<<<",$time);
	
	
	
  //****************************************************************************
  // function sim code
  //****************************************************************************
   initial begin
      rst_n = 0;
	  wait_flag = 0;
	  write_data_cnt = 0;
	  write_counter = 0;
	  
	  block1_row = 0; block2_row = 0; block3_row = 1; block4_row = 1; //0~3
	  block1_col = 0; block2_col = 0; block3_col = 1; block4_col = 1; //0~1
	  block1_last= 0; block2_last= 0; block3_last= 0; block4_last= 0; //0/1
	  
	  block5_row = 0; block6_row = 0; block7_row = 0; block8_row = 0;
	  block5_col = 0; block6_col = 0; block7_col = 0; block8_col = 0;
	  block5_last= 0; block6_last= 0; block7_last= 0; block8_last= 0;
	  
	  tri_network_init;
	  wait(pll_locked);
	  #(`RESET_PRIOD)  rst_n = 1;
	  #100;
	  
	  
	  
	 //**********************************************************
	 // ready to send config info --------------first time
	 //**********************************************************
	  ddr_config; #(`SYS_CLK_PERIOD * 30);
	  
	  
	 //**********************************************************
	 // ready to send write request before ddr calib completed.
	 //**********************************************************
	  fork
		// send write ddr request
		write_ddr_request;			$fdisplay(pross_handle, "%t : issue write DDR request.\n",$time);
		// monitor calib
		wait(init_calib_complete)	$fdisplay(pross_handle, "%t : init_calib_complete done! \t Module %m completed!\n",$time);	  
	  join
		
		
	 //**********************************************************
	 // ready to send data to pcc when detecting write ack signal.
	 //**********************************************************
	   wait(status_request_o)		$fdisplay(pross_handle, "%t : write ack from DDR --->>> status_netowrk!\n",$time);
	   @(posedge clk_100M) #Tdelay;
	   @(posedge clk_100M) #Tdelay;
	   @(posedge clk_100M) #Tdelay;$fdisplay(pross_handle, "%t : WRITE READY, pcc link start...\n",$time);
	   write_ddr_process;			$fdisplay(pross_handle, "%t : SEND WRITE DATA DONE!!!!\n",$time);
	   wait(status_request_o)		$fdisplay(pross_handle, "%t : after write period, recieve the ach release status!\n",$time);

	   
// TEST-COP
// test wehther it work normally.
//***********************************************************************************

	   
						read_req_counter = 0;
						COP_0_src_type = 2'b01;	COP_0_addr = 20'd0;
						COP_1_src_type = 2'b11;	COP_1_addr = 20'd1024;
						COP_2_src_type = 2'b10;	COP_2_addr = 20'd3840;
repeat(3)
begin
	@(posedge clk_100M)	read_req_counter = read_req_counter+1; 
						COP_0_request;
						COP_1_request;
						COP_2_request;
						$fdisplay(pross_handle, "%t : TEST-COP : COP_request-----%2dth\n",
									$time, read_req_counter);

						#(`SYS_CLK_PERIOD * 1500);
end
	   
						read_req_counter = 0;
						COP_0_src_type = 2'b01;	COP_0_addr = 20'd0;
						COP_1_src_type = 2'b11;	COP_1_addr = 20'd1024;
						COP_2_src_type = 2'b10;	COP_2_addr = 20'd3840;
	 
repeat(8)
begin
	@(posedge clk_100M)	read_req_counter = read_req_counter+1; 
						COP_0_request;
						COP_1_request;
						COP_2_request;
						$fdisplay(pross_handle, "%t : TEST-COP : COP_request-----%2dth\n",
									$time, read_req_counter);

						#(`SYS_CLK_PERIOD * 1500);
						
						fork
						COP_0_addr = (read_req_counter[1:0]==2'b00)?COP_0_addr + 256 : COP_0_addr + 512;
						COP_1_addr = (read_req_counter[1:0]==2'b00)?COP_1_addr +1024 : COP_1_addr + 768;
						COP_2_addr = (read_req_counter[1:0]==2'b00)?COP_2_addr + 768 : COP_2_addr + 256;
						COP_0_src_type = COP_1_src_type;
						COP_1_src_type = COP_2_src_type;
						COP_2_src_type = COP_0_src_type;
						join
end
	  #(`SYS_CLK_PERIOD * 50);
	  $stop(1);
	  
	  
	  
// no use	 
//***********************************************************************************	
	  
// TEST-MC
// test wehther it work normally.
//***********************************************************************************

// TEST-1: keep both src_type and addr from being changed.
//*********************************************************
						read_req_counter = 0;
						MC_src_type = 2'b01;
						MC_addr = 20'd0;
repeat(3)
begin
	@(posedge clk_100M)	read_req_counter = read_req_counter+1; 
						MC_request;
						$fdisplay(pross_handle, "%t : TEST-MC : MC_request-----%2dth-----src:%2b\n",
									$time, read_req_counter, MC_src_type);

						#(`SYS_CLK_PERIOD * 1000);
end

						read_req_counter = 0;
						MC_src_type = 2'b10;
						MC_addr = 20'd1024;
repeat(3)
begin
	@(posedge clk_100M)	read_req_counter = read_req_counter+1; 
						MC_request;
						$fdisplay(pross_handle, "%t : TEST-MC : MC_request-----%2dth-----src:%2b\n",
									$time, read_req_counter, MC_src_type);

						#(`SYS_CLK_PERIOD * 1000);
end

						read_req_counter = 0;
						MC_src_type = 2'b01;
						MC_addr = 20'd1024;
repeat(4)
begin
	@(posedge clk_100M)	read_req_counter = read_req_counter+1; 
						MC_request;
						$fdisplay(pross_handle, "%t : TEST-MC : MC_request-----%2dth-----src:%2b\n",
									$time, read_req_counter, MC_src_type);

						#(`SYS_CLK_PERIOD * 1000);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
						if(MC_src_type==2'b01)		MC_addr = MC_addr+256;
					else if(MC_src_type==2'b10)		MC_addr = MC_addr+512;

end

repeat(6)
begin
	@(posedge clk_100M)	read_req_counter = read_req_counter+1; 
						MC_request;
						$fdisplay(pross_handle, "%t : TEST-MC : MC_request-----%2dth-----src:%2b\n",
									$time, read_req_counter, MC_src_type);

						#(`SYS_CLK_PERIOD * 1000);
						if(MC_src_type==2'b01)		MC_addr = MC_addr+256;
					else if(MC_src_type==2'b10)		MC_addr = MC_addr+512;
						MC_src_type = {MC_src_type[0], MC_src_type[1]};

end


	  #(`SYS_CLK_PERIOD * 50);
	  $stop(1);
	  
	  
	  
	  
// no use	 
//***********************************************************************************	
	  
	  
	 //**********************************************************
	 // ready to send read data request after finishing write.
	 //**********************************************************

// TEST-1
// test wehther it work normally what if not setting the last_trans flag.
//***********************************************************************************
	 
	  block1_row = 2; block2_row = 0; block3_row = 2; block4_row = 1; //0~3
	  block1_col = 1; block2_col = 0; block3_col = 0; block4_col = 1; //0~1
	  block1_last= 0; block2_last= 0; block3_last= 0; block4_last= 0; //0/1
	  
	 
	   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1; 
		begin third_ddr_request1;	$fdisplay(pross_handle, "%t : TEST-1 issue third request : third_ddr_request1\n",$time);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
		begin third_ddr_request2;	$fdisplay(pross_handle, "%t : TEST-1 issue third request : third_ddr_request2\n",$time);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
		begin third_ddr_request3;	$fdisplay(pross_handle, "%t : TEST-1 issue third request : third_ddr_request3\n",$time);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 3000);
		
		begin third_ddr_request4;	$fdisplay(pross_handle, "%t : TEST-1 issue third request : third_ddr_request4\n",$time);  end 
	 
	 
	 
	  read_req_counter = 0;
	  //repeat(2) begin
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1; 
		begin read_ddr_request1;	$fdisplay(pross_handle, "%t : TEST-1 issue read request %dth time : read_ddr_request1\n",$time,read_req_counter);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request2;	$fdisplay(pross_handle, "%t : TEST-1 issue read request %dth time : read_ddr_request2\n",$time,read_req_counter);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request3;	$fdisplay(pross_handle, "%t : TEST-1 issue read request %dth time : read_ddr_request3\n",$time,read_req_counter);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 3000);
		
		begin read_ddr_request4;	$fdisplay(pross_handle, "%t : TEST-1 issue read request %dth time : read_ddr_request4\n",$time,read_req_counter);  end 
		//#(`SYS_CLK_PERIOD * 1500);
		
		
	  fork
		begin:TEST_1_wait_release
			wait(status_request_o)		$fdisplay(pross_handle, "%t : >>>>>>>Wrong: TEST-1 period without last_trans flag-----recieve the status request!<<<<<\n\n\n",$time);
			#(`SYS_CLK_PERIOD * 10);
			wait_flag = 1;
			disable TEST_1_clock_release;
			wait_flag = 0;
		end
		begin:TEST_1_clock_release
			#(`SYS_CLK_PERIOD * 1500);
			if(!wait_flag) 	disable TEST_1_wait_release;
			$fdisplay(pross_handle, "%t : >>>>>>>Right Done: TEST-1 period without last_trans flag<<<<<\n\n\n",$time);
		end
	  join
	  
	  $fdisplay(pross_handle, "============ TEST-1 setting ==============");
	  $fdisplay(pross_handle, " block1_row =%d\tblock2_row =%d\tblock3_row =%d\tblock4_row =%d\n", block1_row ,block2_row ,block3_row ,block4_row );
	  $fdisplay(pross_handle, " block1_col =%d\tblock2_col =%d\tblock3_col =%d\tblock4_col =%d\n", block1_col ,block2_col ,block3_col ,block4_col );
	  $fdisplay(pross_handle, " block1_last=%d\tblock2_last=%d\tblock3_last=%d\tblock4_last=%d\n", block1_last,block2_last,block3_last,block4_last);
	  
		$fdisplay(pross_handle, "%t :============ TEST-1 finished ==============\n\n\n",$time);
			
			$fdisplay(pross_handle, "display the info of command [$stop(1)] at the next line!");
			$stop(1);
			
		$fdisplay(pross_handle, "%t :============ TEST-2 start ==============\n\n\n",$time);
		
// TEST-2
// test wehther it work normally what if setting part of these last_trans flag.
//***********************************************************************************
	
	  block1_row = 0; block2_row = 0; block3_row = 3; block4_row = 1; //0~3
	  block1_col = 1; block2_col = 0; block3_col = 1; block4_col = 1; //0~1
	  block1_last= 1; block2_last= 0; block3_last= 1; block4_last= 0; //0/1
	  
	  read_req_counter = 0;
	//***************** 2 	
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request1;	$fdisplay(pross_handle, "%t : TEST-2 issue read request %dth time : read_ddr_request1\n",$time,read_req_counter);  end 
		
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1; 
			begin third_ddr_request1;	$fdisplay(pross_handle, "%t : TEST-2 issue third request : third_ddr_request1\n",$time);  end 
		#500;

	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request2;	$fdisplay(pross_handle, "%t : TEST-2 issue read request %dth time : read_ddr_request2\n",$time,read_req_counter);  end 
		
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
			begin third_ddr_request2;	$fdisplay(pross_handle, "%t : TEST-2 issue third request : third_ddr_request2\n",$time);  end 
		#500;
		
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request3;	$fdisplay(pross_handle, "%t : TEST-2 issue read request %dth time : read_ddr_request3\n",$time,read_req_counter);  end 
		
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
			begin third_ddr_request3;	$fdisplay(pross_handle, "%t : TEST-2 issue third request : third_ddr_request3\n",$time);  end 
		#500;
		
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 3000);
		
		begin read_ddr_request4;	$fdisplay(pross_handle, "%t : TEST-2 issue read request %dth time : read_ddr_request4\n",$time,read_req_counter);  end 
		#500;
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
			begin third_ddr_request4;	$fdisplay(pross_handle, "%t : TEST-2 issue third request : third_ddr_request4\n",$time);  end 

		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 0);
		//else						#(`SYS_CLK_PERIOD * 1500);
	  //end
	  
	  
		
	  fork
		begin:TEST_2_wait_release
			wait(status_request_o)		$fdisplay(pross_handle, "%t : >>>>>>>Wrong: TEST-2 period without all last_trans flag-----recieve the status request!<<<<<\n\n\n",$time);
			#(`SYS_CLK_PERIOD * 10);
			wait_flag = 1;
			disable TEST_2_clock_release;
			wait_flag = 0;
		end
		begin:TEST_2_clock_release
			#(`SYS_CLK_PERIOD * 1500);
			if(!wait_flag) 	disable TEST_2_wait_release;
			$fdisplay(pross_handle, "%t : >>>>>>>Right Done: TEST-2 period without all last_trans flag<<<<<\n\n\n",$time);
		end
	  join
	  
	  $fdisplay(pross_handle, "============ TEST-2 setting ==============");
	  $fdisplay(pross_handle, " block1_row = %d\tblock2_row = %d\tblock3_row = %d\tblock4_row = %d\n", block1_row ,block2_row ,block3_row ,block4_row );
	  $fdisplay(pross_handle, " block1_col = %d\tblock2_col = %d\tblock3_col = %d\tblock4_col = %d\n", block1_col ,block2_col ,block3_col ,block4_col );
	  $fdisplay(pross_handle, " block1_last= %d\tblock2_last= %d\tblock3_last= %d\tblock4_last= %d\n", block1_last,block2_last,block3_last,block4_last);
	  
		$fdisplay(pross_handle, "%t :============ TEST-2 finished ==============\n\n\n",$time);
			
			$fdisplay(pross_handle, "display the info of command [$stop(2)] at the next line!");
			$stop(2);
			
		$fdisplay(pross_handle, "%t :============ TEST-3 start ==============\n\n\n",$time);
		
	  
	  
// TEST-3
// test wehther it work normally what if setting these last_trans flag.
//***********************************************************************************
	
	  block1_row = 0; block2_row = 0; block3_row = 3; block4_row = 1; //0~3
	  block1_col = 1; block2_col = 0; block3_col = 1; block4_col = 1; //0~1
	  block1_last= 1; block2_last= 1; block3_last= 1; block4_last= 1; //0/1
	  
	  read_req_counter = 0;
	//***************** 2 	
	   // @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		// begin read_ddr_request1;	$fdisplay(pross_handle, "%t : TEST-3 issue read request %dth time : read_ddr_request1\n",$time,read_req_counter);  end 
		
		   // @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1; 
			// begin third_ddr_request1;	$fdisplay(pross_handle, "%t : TEST-3 issue third request : third_ddr_request1\n",$time);  end 
		// #500;

	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request2;	$fdisplay(pross_handle, "%t : TEST-3 issue read request %dth time : read_ddr_request2\n",$time,read_req_counter);  end 
		
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
			begin third_ddr_request2;	$fdisplay(pross_handle, "%t : TEST-3 issue third request : third_ddr_request2\n",$time);  end 
		#500;
		
	   // @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		// begin read_ddr_request3;	$fdisplay(pross_handle, "%t : TEST-3 issue read request %dth time : read_ddr_request3\n",$time,read_req_counter);  end 
		
		   // @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
			// begin third_ddr_request3;	$fdisplay(pross_handle, "%t : TEST-3 issue third request : third_ddr_request3\n",$time);  end 
		// #500;
		
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 3000);
		

		begin read_ddr_request4;	$fdisplay(pross_handle, "%t : TEST-3 issue read request %dth time : read_ddr_request4\n",$time,read_req_counter);  end 
		#500;
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
			begin third_ddr_request4;	$fdisplay(pross_handle, "%t : TEST-3 issue third request : third_ddr_request4\n",$time);  end 

		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 0);
		//else						#(`SYS_CLK_PERIOD * 1500);
	  //end
	  
	  
		
	  fork
		begin:TEST_3_wait_release
			wait(status_request_o)		$fdisplay(pross_handle, "%t : >>>>>>>Right Done: TEST-3 period with all last_trans flag-----recieve the status request!<<<<<\n\n\n",$time);
			#(`SYS_CLK_PERIOD * 10);
			wait_flag = 1;
			disable TEST_3_clock_release;
			wait_flag = 0;
		end
		begin:TEST_3_clock_release
			#(`SYS_CLK_PERIOD * 1500);
			if(!wait_flag) 	disable TEST_3_wait_release;
			$fdisplay(pross_handle, "%t : >>>>>>>Wrong: TEST-3 period with all last_trans flag<<<<<\n\n\n",$time);
		end
	  join
	  
	  $fdisplay(pross_handle, "============ TEST-3 setting ==============");
	  $fdisplay(pross_handle, " block1_row = %d\tblock2_row = %d\tblock3_row = %d\tblock4_row = %d\n", block1_row ,block2_row ,block3_row ,block4_row );
	  $fdisplay(pross_handle, " block1_col = %d\tblock2_col = %d\tblock3_col = %d\tblock4_col = %d\n", block1_col ,block2_col ,block3_col ,block4_col );
	  $fdisplay(pross_handle, " block1_last= %d\tblock2_last= %d\tblock3_last= %d\tblock4_last= %d\n", block1_last,block2_last,block3_last,block4_last);
	  
		$fdisplay(pross_handle, "%t :============ TEST-3 finished ==============\n\n\n",$time);
			
			$fdisplay(pross_handle, "display the info of command [$stop(0)] at the next line!");
			$stop(0);
			
		$fdisplay(pross_handle, "%t :============ TEST-4 start ==============\n\n\n",$time);
		
	  
// no use 
//*********************************************************************************

	   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1; 
		begin third_ddr_request5;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request5\n",$time);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
		begin third_ddr_request6;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request6\n",$time);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
		begin third_ddr_request7;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request7\n",$time);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 3000);
		
		begin third_ddr_request8;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request8\n",$time);  end 
	 
	 #1000;
	 
	  read_req_counter = 0;
	  //repeat(2) begin
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1; 
		begin read_ddr_request5;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request5\n",$time,read_req_counter);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request6;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request6\n",$time,read_req_counter);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request7;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request7\n",$time,read_req_counter);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 3000);
		
		begin read_ddr_request8;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request8\n",$time,read_req_counter);  end 
		#(`SYS_CLK_PERIOD * 1500);
		
		
	//***************** 2 	
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request5;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request5\n",$time,read_req_counter);  end 
		
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1; 
			begin third_ddr_request5;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request5\n",$time);  end 
		#500;

	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request6;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request6\n",$time,read_req_counter);  end 
		
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
			begin third_ddr_request6;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request6\n",$time);  end 
		#500;
		
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request7;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request7\n",$time,read_req_counter);  end 
		
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
			begin third_ddr_request7;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request7\n",$time);  end 
		#500;
		
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 3000);
		
		begin read_ddr_request8;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request8\n",$time,read_req_counter);  end 
		#500;
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
			begin third_ddr_request8;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request8\n",$time);  end 

		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 0);
		//else						#(`SYS_CLK_PERIOD * 1500);
	  //end
	  
	  
	  
	   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1; 
		begin third_ddr_request5;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request5\n",$time);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
		begin third_ddr_request6;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request6\n",$time);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
		begin third_ddr_request7;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request7\n",$time);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 3000);
		
		begin third_ddr_request8;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request8\n",$time);  end 
	 
		#(`SYS_CLK_PERIOD * 2000);
	 
	  //repeat(2) begin
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1; 
		begin read_ddr_request5;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request5\n",$time,read_req_counter);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request6;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request6\n",$time,read_req_counter);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request7;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request7\n",$time,read_req_counter);  end 
		
		#(`SYS_CLK_PERIOD * 20);
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 3000);
		
		begin read_ddr_request8;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request8\n",$time,read_req_counter);  end 
		#(`SYS_CLK_PERIOD * 1500);
		
		
	//***************** 2 	
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request5;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request5\n",$time,read_req_counter);  end 
		
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1; 
			begin third_ddr_request5;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request5\n",$time);  end 
		#500;

	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request6;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request6\n",$time,read_req_counter);  end 
		
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
			begin third_ddr_request6;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request6\n",$time);  end 
		#500;
		
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		begin read_ddr_request7;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request7\n",$time,read_req_counter);  end 
		
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
			begin third_ddr_request7;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request7\n",$time);  end 
		#500;
		
	   @(posedge clk_100M) 		read_req_counter = read_req_counter+1;
		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 3000);
		
		begin read_ddr_request8;	$fdisplay(pross_handle, "%t : issue read request %dth time : read_ddr_request8\n",$time,read_req_counter);  end 
		#500;
		   @(posedge clk_100M) 		;//read_req_counter = read_req_counter+1;
			begin third_ddr_request8;	$fdisplay(pross_handle, "%t : issue third request : third_ddr_request8\n",$time);  end 

		//if(read_req_counter==8) 	#(`SYS_CLK_PERIOD * 0);
		//else						#(`SYS_CLK_PERIOD * 1500);
	  //end
	  
	  
	  fork
		begin:wait_read12_release
			wait(status_request_o)		$fdisplay(pross_handle, "%t : >>>>>>>after read2 period with loop<<<<<\n \t>>>>>recieve the ach release status!<<<<<\n\n\n",$time);
			#(`SYS_CLK_PERIOD * 10);
			wait_flag = 1;
			disable wait_clock_release2;
			wait_flag = 0;
		end
		begin:wait_clock_release2
			#(`SYS_CLK_PERIOD * 1500);
			if(!wait_flag) 	disable wait_read12_release;
			$fdisplay(pross_handle, "%t : >>>>>>>failed: read2 period with loop, should have recieved release status request!<<<<<\n\n\n\n",$time);
			$stop(2);
		end
	  join
	  
	 
	  
	  #(`SYS_CLK_PERIOD * 10);
	  
	  #(`SYS_CLK_PERIOD * 20);
	  $stop(1);
	  
	  // read_req_counter = 0;
	  // repeat(4) begin
			// read_req_counter = read_req_counter+1;
	   // fork
			// begin
				// broadcast_request1;	$fdisplay(pross_handle, "%t : issue broad request : broadcast_request1\n",$time);  
			// end 
			// begin
				// #(`SYS_CLK_PERIOD * 10);
				// broadcast_request2;	$fdisplay(pross_handle, "%t : issue broad request : broadcast_request2\n",$time);  
			// end 
			// begin
				// #(`SYS_CLK_PERIOD * 100);
				// broadcast_request3;	$fdisplay(pross_handle, "%t : issue broad request : broadcast_request3\n",$time);  
			// end 
			// begin
				// #(`SYS_CLK_PERIOD * 200);
				// broadcast_request4;	$fdisplay(pross_handle, "%t : issue broad request : broadcast_request4\n",$time);  
			// end 
			// begin
				// #(`SYS_CLK_PERIOD * 400);
				// broadcast_request5;	$fdisplay(pross_handle, "%t : issue broad request : broadcast_request5\n",$time);  
			// end 
			// begin
				// #(`SYS_CLK_PERIOD * 800);
				// broadcast_request6;	$fdisplay(pross_handle, "%t : issue broad request : broadcast_request6\n",$time);  
			// end 
	   // join
	   
			// if(read_req_counter==4)		#(`SYS_CLK_PERIOD * 0);
			// else						#(`SYS_CLK_PERIOD * 2400);
	  // end
	  
	  // wait(status_request_o)		$fdisplay(pross_handle, "%t : after broad period with loop, recieve the ach release status!\n",$time);
	  
	  // $fdisplay(pross_handle, "%t : >>>>>>>after read2 period with loop<<<<<\n \t>>>>>recieve the ach release status!<<<<<\n\n\n",$time);
	  
	  
	  #(`SYS_CLK_PERIOD * 100);
	  $stop;
		
   end
   
   
//****************************************************
// read through broadcast network
//****************************************************
   //broadcast read_1 request
   task broadcast_request1;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_broad_1_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_broad_1_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_broad_1_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   //broadcast read_2 request
   task broadcast_request2;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_broad_2_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_broad_2_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_broad_2_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   //broadcast read_3 request
   task broadcast_request3;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_broad_3_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_broad_3_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_broad_3_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   //broadcast read_4 request
   task broadcast_request4;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_broad_4_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_broad_4_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_broad_4_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   //broadcast read_5 request
   task broadcast_request5;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_broad_5_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_broad_5_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_broad_5_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   //broadcast read_6 request
   task broadcast_request6;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_broad_6_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_broad_6_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_broad_6_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   



//****************************************************
// MC
//****************************************************
   task MC_request;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = MC_req_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = MC_req_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = MC_req_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   

//****************************************************
// COP
//****************************************************
   task COP_0_request;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = COP_0_req_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = COP_0_req_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = COP_0_req_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   task COP_1_request;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = COP_1_req_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = COP_1_req_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = COP_1_req_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   task COP_2_request;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = COP_2_req_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = COP_2_req_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = COP_2_req_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   


//****************************************************
// read in a general way through PCC
//****************************************************
   //read ddr request1
   task read_ddr_request1;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_1_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_1_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_1_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   
   //read ddr request2
   task read_ddr_request2;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_2_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_2_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_2_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   
   //read ddr request3
   task read_ddr_request3;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_3_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_3_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_3_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   
   //read ddr request4
   task read_ddr_request4;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_4_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_4_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_4_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   
   //read ddr request5
   task read_ddr_request5;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_5_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_5_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_5_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   
   //read ddr request6
   task read_ddr_request6;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_6_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_6_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_6_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   
   //read ddr request7
   task read_ddr_request7;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_7_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_7_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_7_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   
   //read ddr request8
   task read_ddr_request8;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_8_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = req_8_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = req_8_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
//****************************************************//
   
   
   task third_ddr_request1;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_1_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_1_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = third_1_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   task third_ddr_request2;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_2_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_2_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = third_2_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   task third_ddr_request3;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_3_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_3_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = third_3_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   task third_ddr_request4;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_4_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_4_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = third_4_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   task third_ddr_request5;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_5_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_5_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = third_5_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   task third_ddr_request6;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_6_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_6_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = third_6_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   task third_ddr_request7;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_7_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_7_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = third_7_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   task third_ddr_request8;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_8_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = third_8_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = third_8_2 ; end
	
	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
//****************************************************//
   
   
//****************************************************
// write in a general way.
//****************************************************

   //write ddr request
   task write_ddr_request;
   begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = write_req_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b0;	cfgdata_i = write_req_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b1; cfgdone_i = 1'b1;	cfgdata_i = write_req_2 ; end

	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
   end
   endtask
   
   ///write ddr data
   task write_ddr_process;
   begin
	 
	 //send head-package --------- set up link
    @(posedge clk_100M) #Tdelay
	 pcc_ip_stb1_i = 1'b1; pcc_ip_fwd1_i = 1'b0; pcc_ip_data1_i = {2'b10, 48'b0, 8'h11, 8'h04}; 
    
	//monitor the pack signal
	wait(pcc_ip_pack1_o) #Tdelay
	write_data_cnt = write_data_cnt + 64'd100;
    write_counter = 0;
	
	//send cfg-package
	 @(posedge clk_100M) #Tdelay  // ------------ cfg0-package
	 pcc_ip_stb1_i = 1'b1; pcc_ip_fwd1_i = 1'b1; pcc_ip_data1_i = {2'b01, 64'b0}; 
	 @(posedge clk_100M) #Tdelay  // ------------ cfg1-package
	 pcc_ip_stb1_i = 1'b1; pcc_ip_fwd1_i = 1'b1; pcc_ip_data1_i = {2'b01, 64'b1}; 	
	
	$fdisplay(write_handle, "%t : write data as following list",$time);
	$fdisplay(write_handle, "----------------------");
	//send data
	repeat(`DATA_LENGTH) begin
		@(posedge clk_100M) #Tdelay
		 if(pcc_ip_suspend1_o)	begin pcc_ip_fwd1_i = 1'b0; wait(!pcc_ip_suspend1_o); end
		
		 pcc_ip_stb1_i = 1'b1; pcc_ip_fwd1_i = 1'b1; pcc_ip_data1_i = {2'b00, write_data_cnt[63:0]}; 
		 $fdisplay(write_handle, "\t %d : %d ", write_counter, write_data_cnt);
		 write_data_cnt = write_data_cnt + 64'd1;
		 write_counter = write_counter + 1;
		 //if(write_counter == `DATA_LENGTH -100)  read_start_flag = 1'b1;
		 //if(write_counter == `DATA_LENGTH -99)  read_start_flag = 1'b0;
	end
	$fdisplay(write_handle, " ----------------------");
	$fdisplay(write_handle, "%t : send done!\ttotal number : %d\n", $time, write_counter);
	
	//send end-package
    @(posedge clk_100M) #Tdelay
	 pcc_ip_stb1_i = 1'b1; pcc_ip_fwd1_i = 1'b1; pcc_ip_data1_i = {3'b011, 63'b0}; 
	 
	 // pull down the data valid flag --------- fwd
    @(posedge clk_100M) #Tdelay
	 pcc_ip_fwd1_i = 1'b0;
	 
	 //monitor to cancel link, and then pull down the flag stb
	wait(pcc_ip_cancel1_o) #Tdelay
	 pcc_ip_stb1_i = 1'b0; pcc_ip_fwd1_i = 1'b0; pcc_ip_data1_i = {66{1'b0}}; 
	
	// exit write ddr process.
   end
   endtask
//****************************************************//
   
   
   
//**************************************
// 下发配置信息要求： req为低  fwd为高
//**************************************
  task ddr_config;
  begin
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_0 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_1 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_2 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd3 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_3 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd4 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_4 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd5 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_5 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd6 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_6 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd7 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_7 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd8 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_8 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd9 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_9 ; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd10; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_10; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd11; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_11; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd12; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_12; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd13; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_13; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd14; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_1_14; end
    @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd15; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b1;	cfgdata_i = cfg_1_15; end

	@(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
	@(posedge clk_100M)  #Tdelay;
	@(posedge clk_100M)  #Tdelay;

    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_0 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_1 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_2 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd3 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_3 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd4 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_4 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd5 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_5 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd6 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_6 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd7 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_7 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd8 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_8 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd9 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_9 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd10; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_10; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd11; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_11; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd12; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_12; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd13; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_13; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd14; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_2_14; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd15; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b1;	cfgdata_i = cfg_2_15; end
	
	// @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
	// @(posedge clk_100M)  #Tdelay;
	// @(posedge clk_100M)  #Tdelay;

    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_0 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_1 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_2 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd3 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_3 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd4 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_4 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd5 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_5 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd6 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_6 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd7 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_7 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd8 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_8 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd9 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_9 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd10; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_10; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd11; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_11; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd12; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_12; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd13; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_13; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd14; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_3_14; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd15; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b1;	cfgdata_i = cfg_3_15; end
	
	// @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
	// @(posedge clk_100M)  #Tdelay;
	// @(posedge clk_100M)  #Tdelay;

    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_0 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd1 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_1 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd2 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_2 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd3 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_3 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd4 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_4 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd5 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_5 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd6 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_6 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd7 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_7 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd8 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_8 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd9 ; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_9 ; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd10; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_10; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd11; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_11; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd12; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_12; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd13; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_13; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd14; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = cfg_4_14; end
    // @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd15; cfgfwd_i = 1'b1;	cfgreq_i = 1'b0; cfgdone_i = 1'b1;	cfgdata_i = cfg_4_15; end
	
	// @(posedge clk_100M)  #Tdelay	begin cfgid_i = 8'd0 ; cfgfwd_i = 1'b0;	cfgreq_i = 1'b0; cfgdone_i = 1'b0;	cfgdata_i = {32'b0} ; end
	// @(posedge clk_100M)  #Tdelay;
	// @(posedge clk_100M)  #Tdelay;
  end
  endtask
//****************************************************//
 
 
 
 
//**********************************************
// initialization
//**********************************************
  task tri_network_init;
  begin
    cfg_network_init;
	//status_network_init;
	pcc_init;
  end
  endtask
  
  task cfg_network_init;
  begin
	cfgid_i    = 8'd0;
	cfgfwd_i   = 1'b0;
	cfgdata_i  = {32{1'b0}};
	cfgreq_i   = 1'b0;
	cfgdone_i  = 1'b0;
  end
  endtask
  
  task pcc_init;
  begin
	pcc_ip_data1_i = {2'b00, {64{1'b0}}}; pcc_ip_stb1_i = 1'b0; pcc_ip_fwd1_i = 1'b0; pcc_op_fail1_i = 1'b0; pcc_op_suspend1_i = 1'b0; //pcc_op_pack1_i = 1'b0;  pcc_op_cancel1_i = 1'b0;
	pcc_ip_data2_i = {2'b00, {64{1'b0}}}; pcc_ip_stb2_i = 1'b0; pcc_ip_fwd2_i = 1'b0; pcc_op_fail2_i = 1'b0; pcc_op_suspend2_i = 1'b0; //pcc_op_pack2_i = 1'b0;  pcc_op_cancel2_i = 1'b0;
	pcc_ip_data3_i = {2'b00, {64{1'b0}}}; pcc_ip_stb3_i = 1'b0; pcc_ip_fwd3_i = 1'b0; pcc_op_fail3_i = 1'b0; pcc_op_suspend3_i = 1'b0; //pcc_op_pack3_i = 1'b0;  pcc_op_cancel3_i = 1'b0;
	pcc_ip_data4_i = {2'b00, {64{1'b0}}}; pcc_ip_stb4_i = 1'b0; pcc_ip_fwd4_i = 1'b0; pcc_op_fail4_i = 1'b0; pcc_op_suspend4_i = 1'b0; //pcc_op_pack4_i = 1'b0;  pcc_op_cancel4_i = 1'b0;
	pcc_ip_data5_i = {2'b00, {64{1'b0}}}; pcc_ip_stb5_i = 1'b0; pcc_ip_fwd5_i = 1'b0; pcc_op_fail5_i = 1'b0; pcc_op_suspend5_i = 1'b0; //pcc_op_pack5_i = 1'b0;  pcc_op_cancel5_i = 1'b0;
	pcc_ip_data6_i = {2'b00, {64{1'b0}}}; pcc_ip_stb6_i = 1'b0; pcc_ip_fwd6_i = 1'b0; pcc_op_fail6_i = 1'b0; pcc_op_suspend6_i = 1'b0; //pcc_op_pack6_i = 1'b0;  pcc_op_cancel6_i = 1'b0;
	pcc_ip_data7_i = {2'b00, {64{1'b0}}}; pcc_ip_stb7_i = 1'b0; pcc_ip_fwd7_i = 1'b0; pcc_op_fail7_i = 1'b0; pcc_op_suspend7_i = 1'b0; //pcc_op_pack7_i = 1'b0;  pcc_op_cancel7_i = 1'b0;
	pcc_ip_data8_i = {2'b00, {64{1'b0}}}; pcc_ip_stb8_i = 1'b0; pcc_ip_fwd8_i = 1'b0; pcc_op_fail8_i = 1'b0; pcc_op_suspend8_i = 1'b0; //pcc_op_pack8_i = 1'b0;  pcc_op_cancel8_i = 1'b0;
  end
  endtask
//****************************************************//
  
  
endmodule
