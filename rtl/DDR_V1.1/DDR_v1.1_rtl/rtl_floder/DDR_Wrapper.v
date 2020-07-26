`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/08 19:54:19
// Design Name: 
// Module Name: DDR_Wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DDR_Wrapper(
  sys_100M,
  logic_rst_n,
  sys_clk,
  clk_ref,
  sys_rst,

  //cfg_network
  cfgid_i,
  cfgfwd_i,
  cfgdata_i,
  cfgreq_i,
  cfgdone_i,
  
  //status_network
  status_request_o,
  status_ack_i,
  status_data_o,
  status_valid_o,  
  
  //-------------------
  // PCC_interface
  //-------------------
  //----------------------------8个输入通道 <--| PCC网络
  pcc_ip_data1_i,    pcc_ip_data2_i,    pcc_ip_data3_i,    pcc_ip_data4_i,    pcc_ip_data5_i,    pcc_ip_data6_i,    pcc_ip_data7_i,    pcc_ip_data8_i,    
  pcc_ip_stb1_i,     pcc_ip_stb2_i,     pcc_ip_stb3_i,     pcc_ip_stb4_i,     pcc_ip_stb5_i,     pcc_ip_stb6_i,     pcc_ip_stb7_i,     pcc_ip_stb8_i,     
  pcc_ip_fwd1_i,     pcc_ip_fwd2_i,     pcc_ip_fwd3_i,     pcc_ip_fwd4_i,     pcc_ip_fwd5_i,     pcc_ip_fwd6_i,     pcc_ip_fwd7_i,     pcc_ip_fwd8_i,     
  pcc_ip_fail1_o,    pcc_ip_fail2_o,    pcc_ip_fail3_o,    pcc_ip_fail4_o,    pcc_ip_fail5_o,    pcc_ip_fail6_o,    pcc_ip_fail7_o,    pcc_ip_fail8_o,    
  pcc_ip_pack1_o,    pcc_ip_pack2_o,    pcc_ip_pack3_o,    pcc_ip_pack4_o,    pcc_ip_pack5_o,    pcc_ip_pack6_o,    pcc_ip_pack7_o,    pcc_ip_pack8_o,    
  pcc_ip_suspend1_o, pcc_ip_suspend2_o, pcc_ip_suspend3_o, pcc_ip_suspend4_o, pcc_ip_suspend5_o, pcc_ip_suspend6_o, pcc_ip_suspend7_o, pcc_ip_suspend8_o, 
  pcc_ip_cancel1_o,  pcc_ip_cancel2_o,  pcc_ip_cancel3_o,  pcc_ip_cancel4_o,  pcc_ip_cancel5_o,  pcc_ip_cancel6_o,  pcc_ip_cancel7_o,  pcc_ip_cancel8_o,  
  //----------------------------8个输出通道 |--> PCC网络                                                                                                  
  pcc_op_data1_o,    pcc_op_data2_o,    pcc_op_data3_o,    pcc_op_data4_o,    pcc_op_data5_o,    pcc_op_data6_o,    pcc_op_data7_o,    pcc_op_data8_o,    
  pcc_op_stb1_o,     pcc_op_stb2_o,     pcc_op_stb3_o,     pcc_op_stb4_o,     pcc_op_stb5_o,     pcc_op_stb6_o,     pcc_op_stb7_o,     pcc_op_stb8_o,     
  pcc_op_fwd1_o,     pcc_op_fwd2_o,     pcc_op_fwd3_o,     pcc_op_fwd4_o,     pcc_op_fwd5_o,     pcc_op_fwd6_o,     pcc_op_fwd7_o,     pcc_op_fwd8_o,     
  pcc_op_fail1_i,    pcc_op_fail2_i,    pcc_op_fail3_i,    pcc_op_fail4_i,    pcc_op_fail5_i,    pcc_op_fail6_i,    pcc_op_fail7_i,    pcc_op_fail8_i,    
  pcc_op_pack1_i,    pcc_op_pack2_i,    pcc_op_pack3_i,    pcc_op_pack4_i,    pcc_op_pack5_i,    pcc_op_pack6_i,    pcc_op_pack7_i,    pcc_op_pack8_i,    
  pcc_op_suspend1_i, pcc_op_suspend2_i, pcc_op_suspend3_i, pcc_op_suspend4_i, pcc_op_suspend5_i, pcc_op_suspend6_i, pcc_op_suspend7_i, pcc_op_suspend8_i, 
  pcc_op_cancel1_i,  pcc_op_cancel2_i,  pcc_op_cancel3_i,  pcc_op_cancel4_i,  pcc_op_cancel5_i,  pcc_op_cancel6_i,  pcc_op_cancel7_i,  pcc_op_cancel8_i,  

  //Broadcast_network
  broadcast_data_o,
  broadcast_fwd_o,
  
  //-----------------------
  // DDR SDRAM_interface
  //-----------------------
  
  ddr3_dq,
  ddr3_dqs_n,
  ddr3_dqs_p,
  ddr3_addr,
  ddr3_ba,
  ddr3_ras_n,
  ddr3_cas_n,
  ddr3_we_n,
  ddr3_reset_n,
  ddr3_ck_p,
  ddr3_ck_n,
  ddr3_cke,
  ddr3_cs_n,
  ddr3_dm,
  ddr3_odt,
  phy_init_done_o
    );

	
  //clock management
  input                  sys_100M;   
  input                  logic_rst_n;
  input                  sys_clk;
  input                  clk_ref;
  input                  sys_rst;
  output                 phy_init_done_o;
  
  
  //cfg_network
  input			[ 7:0]		cfgid_i;
  input		 		     		cfgfwd_i;
  input			[31:0]		cfgdata_i;
  input		      			cfgreq_i;
  input		      			cfgdone_i;
  
  //status_network
  output              status_request_o;
  input               status_ack_i;
  output    [31:0]    status_data_o;
  output              status_valid_o;
  
  //PCC_network
  //----------------------------8个输入通道 <--| PCC网络
  input [65:0] pcc_ip_data1_i,    pcc_ip_data2_i,    pcc_ip_data3_i,    pcc_ip_data4_i,     pcc_ip_data5_i,    pcc_ip_data6_i,    pcc_ip_data7_i,    pcc_ip_data8_i;    
  input        pcc_ip_stb1_i,     pcc_ip_stb2_i,     pcc_ip_stb3_i,     pcc_ip_stb4_i,      pcc_ip_stb5_i,     pcc_ip_stb6_i,     pcc_ip_stb7_i,     pcc_ip_stb8_i;     
  input        pcc_ip_fwd1_i,     pcc_ip_fwd2_i,     pcc_ip_fwd3_i,     pcc_ip_fwd4_i,      pcc_ip_fwd5_i,     pcc_ip_fwd6_i,     pcc_ip_fwd7_i,     pcc_ip_fwd8_i;     
  output       pcc_ip_fail1_o,    pcc_ip_fail2_o,    pcc_ip_fail3_o,    pcc_ip_fail4_o,     pcc_ip_fail5_o,    pcc_ip_fail6_o,    pcc_ip_fail7_o,    pcc_ip_fail8_o;    
  output       pcc_ip_pack1_o,    pcc_ip_pack2_o,    pcc_ip_pack3_o,    pcc_ip_pack4_o,     pcc_ip_pack5_o,    pcc_ip_pack6_o,    pcc_ip_pack7_o,    pcc_ip_pack8_o;    
  output       pcc_ip_suspend1_o, pcc_ip_suspend2_o, pcc_ip_suspend3_o, pcc_ip_suspend4_o,  pcc_ip_suspend5_o, pcc_ip_suspend6_o, pcc_ip_suspend7_o, pcc_ip_suspend8_o; 
  output       pcc_ip_cancel1_o,  pcc_ip_cancel2_o,  pcc_ip_cancel3_o,  pcc_ip_cancel4_o,   pcc_ip_cancel5_o,  pcc_ip_cancel6_o,  pcc_ip_cancel7_o,  pcc_ip_cancel8_o;  
  //----------------------------8个输出通道 |--> PCC网络                                                                                                               
  output[65:0] pcc_op_data1_o,    pcc_op_data2_o,    pcc_op_data3_o,    pcc_op_data4_o,     pcc_op_data5_o,    pcc_op_data6_o,    pcc_op_data7_o,    pcc_op_data8_o;    
  output       pcc_op_stb1_o,     pcc_op_stb2_o,     pcc_op_stb3_o,     pcc_op_stb4_o,      pcc_op_stb5_o,     pcc_op_stb6_o,     pcc_op_stb7_o,     pcc_op_stb8_o;     
  output       pcc_op_fwd1_o,     pcc_op_fwd2_o,     pcc_op_fwd3_o,     pcc_op_fwd4_o,      pcc_op_fwd5_o,     pcc_op_fwd6_o,     pcc_op_fwd7_o,     pcc_op_fwd8_o;     
  input        pcc_op_fail1_i,    pcc_op_fail2_i,    pcc_op_fail3_i,    pcc_op_fail4_i,     pcc_op_fail5_i,    pcc_op_fail6_i,    pcc_op_fail7_i,    pcc_op_fail8_i;    
  input        pcc_op_pack1_i,    pcc_op_pack2_i,    pcc_op_pack3_i,    pcc_op_pack4_i,     pcc_op_pack5_i,    pcc_op_pack6_i,    pcc_op_pack7_i,    pcc_op_pack8_i;    
  input        pcc_op_suspend1_i, pcc_op_suspend2_i, pcc_op_suspend3_i, pcc_op_suspend4_i,  pcc_op_suspend5_i, pcc_op_suspend6_i, pcc_op_suspend7_i, pcc_op_suspend8_i; 
  input        pcc_op_cancel1_i,  pcc_op_cancel2_i,  pcc_op_cancel3_i,  pcc_op_cancel4_i,   pcc_op_cancel5_i,  pcc_op_cancel6_i,  pcc_op_cancel7_i,  pcc_op_cancel8_i;  

  //Broadcast_network
	output    [65:0]   broadcast_data_o;
	output             broadcast_fwd_o;
	
  
  //FPGA port
     // Inouts
  inout [63:0]       ddr3_dq;
  inout [7:0]        ddr3_dqs_n;
  inout [7:0]        ddr3_dqs_p;
  // Outputs
  output [15:0]      ddr3_addr;
  output [2:0]       ddr3_ba;
  output             ddr3_ras_n;
  output             ddr3_cas_n;
  output             ddr3_we_n;
  output             ddr3_reset_n;
  output [0:0]       ddr3_ck_p;
  output [0:0]       ddr3_ck_n;
  output [0:0]       ddr3_cke;
  output [0:0]       ddr3_cs_n;
  output [7:0]       ddr3_dm;
  output [0:0]       ddr3_odt;
    
    //user interface
    wire            ui_clk;  // output			ui_clk
    wire            ui_rst;  // output			ui_clk_sync_rst
    wire   [28:0]   app_addr;  // input [28:0]		app_addr
    wire   [ 2:0]   app_cmd;  // input [2:0]		app_cmd
    wire            app_en;  // input				app_en
    wire   [31:0]   app_wdf_mask;  // input [31:0]		app_wdf_mask
    wire   [255:0]  app_wdf_data;  // input [255:0]		app_wdf_data
    wire            app_wdf_end;  // input				app_wdf_end
    wire            app_wdf_wren;  // input				app_wdf_wren
    wire   [255:0]  app_rd_data; // output [255:0]		app_rd_data
    wire            app_rd_data_valid;  // output			app_rd_data_valid
    wire            app_rdy;  // output			app_rdy
    wire            app_wdf_rdy;  // output			app_wdf_rdy
    wire            phy_init_done;
    
 (* ASYNC_REG = "TRUE" *) reg   phy_init_done_r1;
 (* ASYNC_REG = "TRUE" *) reg   phy_init_done_r2;
                          reg   phy_init_done_r3;
    
    
    

// Instantiate the module
ddr_ctrl_top ddr_ctrl_top (
     .sys_clk                    (         sys_100M),
     .sys_rst_n                  (      logic_rst_n),
     .ddr_clk                    (           ui_clk),
     .ddr_rst_n                  (          ~ui_rst),
     .phy_init_done_i            (  phy_init_done_r3),
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
     .app_rdy                    (                    app_rdy),
     .app_wdf_rdy                (                app_wdf_rdy),
     .app_rd_data_valid          (          app_rd_data_valid),
     .app_rd_data                (                app_rd_data),
     .app_en                     (                     app_en),
     .app_cmd                    (                    app_cmd),
     .app_addr                   (                   app_addr),
     .app_wdf_wren               (               app_wdf_wren),
     .app_wdf_data               (               app_wdf_data),
     .app_wdf_mask               (               app_wdf_mask),
     .app_wdf_end                (                app_wdf_end)
    );


    
//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG       
  ddr3_ip_top u_DDR3_IP (
    // System Clock Ports
    .sys_clk_i                      (sys_clk),  // input			sys_clk_i
    // Reference Clock Ports
    .clk_ref_i                      (clk_ref),  // input				clk_ref_i
    .sys_rst                        (sys_rst), // input sys_rst
  
    // Memory interface ports
    .ddr3_addr                      (ddr3_addr),            // output [15:0]	ddr3_addr
    .ddr3_ba                        (ddr3_ba),              // output [2:0]		ddr3_ba
    .ddr3_cas_n                     (ddr3_cas_n),           // output			ddr3_cas_n
    .ddr3_ck_n                      (ddr3_ck_n),            // output [0:0]		ddr3_ck_n
    .ddr3_ck_p                      (ddr3_ck_p),            // output [0:0]		ddr3_ck_p
    .ddr3_cke                       (ddr3_cke),             // output [0:0]		ddr3_cke
    .ddr3_ras_n                     (ddr3_ras_n),           // output			ddr3_ras_n
    .ddr3_reset_n                   (ddr3_reset_n),          // output			ddr3_reset_n
    .ddr3_we_n                      (ddr3_we_n),            // output			ddr3_we_n
    .ddr3_dq                        (ddr3_dq),              // inout [63:0]		ddr3_dq
    .ddr3_dqs_n                     (ddr3_dqs_n),           // inout [7:0]		ddr3_dqs_n
    .ddr3_dqs_p                     (ddr3_dqs_p),           // inout [7:0]		ddr3_dqs_p
	.ddr3_cs_n                      (ddr3_cs_n),            // output [0:0]		ddr3_cs_n
    .ddr3_dm                        (ddr3_dm),              // output [7:0]		ddr3_dm
    .ddr3_odt                       (ddr3_odt),             // output [0:0]		ddr3_odt
    
    
    // Application interface ports
    .ui_clk                         (ui_clk),  // output			ui_clk
    .ui_clk_sync_rst                (ui_rst),  // output			ui_clk_sync_rst
    .app_addr                       (app_addr),  // input [28:0]		app_addr
    .app_cmd                        (app_cmd),  // input [2:0]		app_cmd
    .app_en                         (app_en),  // input				app_en
    .app_wdf_mask                   (app_wdf_mask),  // input [31:0]		app_wdf_mask
    .app_wdf_data                   (app_wdf_data),  // input [255:0]		app_wdf_data
    .app_wdf_end                    (app_wdf_end),  // input				app_wdf_end
    .app_wdf_wren                   (app_wdf_wren),  // input				app_wdf_wren
    .app_rd_data                    (app_rd_data),  // output [255:0]		app_rd_data
    .app_rd_data_end                (    ),  // output			app_rd_data_end
    .app_rd_data_valid              (app_rd_data_valid),  // output			app_rd_data_valid
    .app_rdy                        (app_rdy),  // output			app_rdy
    .app_wdf_rdy                    (app_wdf_rdy),  // output			app_wdf_rdy
    
    .init_calib_complete  (phy_init_done)  // output			init_calib_complete
    );
// INST_TAG_END ------ End INSTANTIATION Template ---------


/* //// For simulation
assign ui_rst = sys_rst;
assign ui_clk = sys_clk;
ddr_sim_memory  u_ddr_sim_memory(
	.clk			(ui_clk),
	.rst_n			(ui_rst),
	.cmd			(app_cmd),
	.app_en			(app_en),
	.data_i			(app_wdf_data),
	.addr_i			(app_addr),
	.data_o			(app_rd_data),
	.data_o_valid	(app_rd_data_valid),
	.app_rdy		(app_rdy),
	.app_wdf_rdy	(app_wdf_rdy),
	.phy_init_done_o(phy_init_done)
  );  */

  always @(posedge sys_100M)
  begin
      phy_init_done_r1 <= phy_init_done;
      phy_init_done_r2 <= phy_init_done_r1;
      phy_init_done_r3 <= phy_init_done_r2;
  end

  assign phy_init_done_o = phy_init_done_r3;

  //--------------------------------------------------------------------
  // You should put these XDC constraints in your XDC file. As following:
  // set_max_delay -datapath_only -from [get_pins -hier -filter {NAME =~ *u_DDR3_IP/u_ddr3_ctrl_ip/u_ddr3_ctrl_ip_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_calib_top/init_calib_complete_reg_rep__5/C}] -to [get_cells -hier -filter {NAME =~ */u_DDR_Wrapper/phy_init_done_r1_reg}] 6
  // set_property ASYNC_REG TRUE [get_cells -hier -filter {NAME =~ */u_DDR_Wrapper/phy_init_done_r?_reg}]
  //--------------------------------------------------------------------//

  
endmodule
