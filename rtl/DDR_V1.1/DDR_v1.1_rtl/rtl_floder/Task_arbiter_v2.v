`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/05 19:06:12
// Design Name: 
// Module Name: Task_arbiter_v2
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
`include "ddr_define.vh"

module Task_arbiter_v2(
      sys_clk,
      sys_rst_n,
      
      phy_init_done_i,
	  first_release_flag,
      
//----------MC_fifo----------//
        MC_fifo_rd_en,
        MC_fifo_valid,
        MC_fifo_dout,
        MC_fifo_empty,

//----------COP_fifo---------//
        COP_fifo_rd_en,
        COP_fifo_valid,
        COP_fifo_dout,
        COP_fifo_empty,
        
//---------channel_fifo----------//
        channel_fifo_rd_en,
        channel_fifo_valid,
        channel_fifo_dout,
        channel_fifo_empty,
      
//---------6个通用数据通道---------//
      ch1_idle_i,
      ch1_eof_i,
      ch1_request_o,     ////// attention: TWO BITS HERE, High is read/write flag;  Low bit is request valid.
      ch1_pos_1st_o,
      ch1_pos_2nd_o,
      ch1_src_type_o,
      ch1_start_addr_o,
      ch1_data_length_o,
      ch1_2nd_addr_burst_o,
      ch1_column_num_2nd_o,
      
      ch1_broadcast_o,
      ch1_pos0_1st_o,
      ch1_pos1_1st_o,
      ch1_pos2_1st_o,
      ch1_pos3_1st_o,
      ch1_pos4_1st_o,
      ch1_pos5_1st_o,
      ch1_pos6_1st_o,
      ch1_pos7_1st_o,
      ch1_pos0_src_type_o,
      ch1_pos1_src_type_o,
      ch1_pos2_src_type_o,
      ch1_pos3_src_type_o,
      ch1_pos4_src_type_o,
      ch1_pos5_src_type_o,
      ch1_pos6_src_type_o,
      ch1_pos7_src_type_o,
      
      ch1_release_o,
      ch1_VR_id_o,
	  ch1_VR_FR_o,
      ch1_channel_ID_o,
      
      ch2_idle_i,
      ch2_eof_i,
      ch2_request_o,
      ch2_pos_1st_o,
      ch2_pos_2nd_o,
      ch2_src_type_o,
      ch2_start_addr_o,
      ch2_data_length_o,
      ch2_2nd_addr_burst_o,
      ch2_column_num_2nd_o,
      
      ch2_broadcast_o,
      ch2_pos0_1st_o,
      ch2_pos1_1st_o,
      ch2_pos2_1st_o,
      ch2_pos3_1st_o,
      ch2_pos4_1st_o,
      ch2_pos5_1st_o,
      ch2_pos6_1st_o,
      ch2_pos7_1st_o,
      ch2_pos0_src_type_o,
      ch2_pos1_src_type_o,
      ch2_pos2_src_type_o,
      ch2_pos3_src_type_o,
      ch2_pos4_src_type_o,
      ch2_pos5_src_type_o,
      ch2_pos6_src_type_o,
      ch2_pos7_src_type_o,
      
      ch2_release_o,
      ch2_VR_id_o,
	  ch2_VR_FR_o,
      ch2_channel_ID_o,
      
      ch3_idle_i,
      ch3_eof_i,
      ch3_request_o,
      ch3_pos_1st_o,
      ch3_pos_2nd_o,
      ch3_src_type_o,
      ch3_start_addr_o,
      ch3_data_length_o,
      ch3_2nd_addr_burst_o,
      ch3_column_num_2nd_o,
      
      ch3_broadcast_o,
      ch3_pos0_1st_o,
      ch3_pos1_1st_o,
      ch3_pos2_1st_o,
      ch3_pos3_1st_o,
      ch3_pos4_1st_o,
      ch3_pos5_1st_o,
      ch3_pos6_1st_o,
      ch3_pos7_1st_o,
      ch3_pos0_src_type_o,
      ch3_pos1_src_type_o,
      ch3_pos2_src_type_o,
      ch3_pos3_src_type_o,
      ch3_pos4_src_type_o,
      ch3_pos5_src_type_o,
      ch3_pos6_src_type_o,
      ch3_pos7_src_type_o,

      ch3_release_o,
      ch3_VR_id_o,
	  ch3_VR_FR_o,
      ch3_channel_ID_o,
      
      ch4_idle_i,
      ch4_eof_i,
      ch4_request_o,
      ch4_pos_1st_o,
      ch4_pos_2nd_o,
      ch4_src_type_o,
      ch4_start_addr_o,
      ch4_data_length_o,
      ch4_2nd_addr_burst_o,
      ch4_column_num_2nd_o,
      
      ch4_broadcast_o,
      ch4_pos0_1st_o,
      ch4_pos1_1st_o,
      ch4_pos2_1st_o,
      ch4_pos3_1st_o,
      ch4_pos4_1st_o,
      ch4_pos5_1st_o,
      ch4_pos6_1st_o,
      ch4_pos7_1st_o,
      ch4_pos0_src_type_o,
      ch4_pos1_src_type_o,
      ch4_pos2_src_type_o,
      ch4_pos3_src_type_o,
      ch4_pos4_src_type_o,
      ch4_pos5_src_type_o,
      ch4_pos6_src_type_o,
      ch4_pos7_src_type_o,

      ch4_release_o,
      ch4_VR_id_o,
	  ch4_VR_FR_o,
      ch4_channel_ID_o,
      
      ch5_idle_i,
      ch5_eof_i,
      ch5_request_o,
      ch5_pos_1st_o,
      ch5_pos_2nd_o,
      ch5_src_type_o,
      ch5_start_addr_o,
      ch5_data_length_o,
      ch5_2nd_addr_burst_o,
      ch5_column_num_2nd_o,
      
      ch5_broadcast_o,
      ch5_pos0_1st_o,
      ch5_pos1_1st_o,
      ch5_pos2_1st_o,
      ch5_pos3_1st_o,
      ch5_pos4_1st_o,
      ch5_pos5_1st_o,
      ch5_pos6_1st_o,
      ch5_pos7_1st_o,
      ch5_pos0_src_type_o,
      ch5_pos1_src_type_o,
      ch5_pos2_src_type_o,
      ch5_pos3_src_type_o,
      ch5_pos4_src_type_o,
      ch5_pos5_src_type_o,
      ch5_pos6_src_type_o,
      ch5_pos7_src_type_o,

      ch5_release_o,
      ch5_VR_id_o,
	  ch5_VR_FR_o,
      ch5_channel_ID_o,
      
      ch6_idle_i,
      ch6_eof_i,
      ch6_request_o,
      ch6_pos_1st_o,
      ch6_pos_2nd_o,
      ch6_src_type_o,
      ch6_start_addr_o,
      ch6_data_length_o,
      ch6_2nd_addr_burst_o,
      ch6_column_num_2nd_o,
      
      ch6_broadcast_o,
      ch6_pos0_1st_o,
      ch6_pos1_1st_o,
      ch6_pos2_1st_o,
      ch6_pos3_1st_o,
      ch6_pos4_1st_o,
      ch6_pos5_1st_o,
      ch6_pos6_1st_o,
      ch6_pos7_1st_o,
      ch6_pos0_src_type_o,
      ch6_pos1_src_type_o,
      ch6_pos2_src_type_o,
      ch6_pos3_src_type_o,
      ch6_pos4_src_type_o,
      ch6_pos5_src_type_o,
      ch6_pos6_src_type_o,
      ch6_pos7_src_type_o,

      ch6_release_o,
      ch6_VR_id_o,
	  ch6_VR_FR_o,
      ch6_channel_ID_o
      
    );
    
    //------------------------------------------------
    // I/O-PORT declaration
    //------------------------------------------------
    
      input           sys_clk;
      input           sys_rst_n;
      input           phy_init_done_i;
	  input           first_release_flag;   //// by yyp, 2017-01-03, special for COP
	  reg             first_release_flag_r; //// by yyp, 2017-01-03, special for COP
	  
	  always @(posedge sys_clk)   //// by yyp, 2017-01-03, special for COP
	  begin                                    //// by yyp, 2017-01-03, special for COP
	    if(!sys_rst_n)                         //// by yyp, 2017-01-03, special for COP
		   first_release_flag_r <= 1'b0;       //// by yyp, 2017-01-03, special for COP
		else if(first_release_flag)            //// by yyp, 2017-01-03, special for COP
		   first_release_flag_r <= 1'b1;       //// by yyp, 2017-01-03, special for COP
	  end                                      //// by yyp, 2017-01-03, special for COP
      
      output                  MC_fifo_rd_en;
      input                   MC_fifo_valid;
      input       [74:0]      MC_fifo_dout;
      input                   MC_fifo_empty;
      
      output                  COP_fifo_rd_en;
      input                   COP_fifo_valid;
      input       [44:0]      COP_fifo_dout;
      input                   COP_fifo_empty;
      
      output                  channel_fifo_rd_en;
      input                   channel_fifo_valid;
      input       [233:0]     channel_fifo_dout;
      input                   channel_fifo_empty;
      
      
      input                 ch1_idle_i;
      input                 ch1_eof_i;
      output     [ 1:0]     ch1_request_o;
      output     [ 7:0]     ch1_pos_1st_o;
      output     [ 2:0]     ch1_pos_2nd_o;
      output     [ 1:0]     ch1_src_type_o;
      output     [29:0]     ch1_start_addr_o;
      output     [29:0]     ch1_data_length_o;
      output     [29:0]     ch1_2nd_addr_burst_o;
      output     [29:0]     ch1_column_num_2nd_o;
      
      output                ch1_broadcast_o;
      output     [ 7:0]     ch1_pos0_1st_o;
      output     [ 7:0]     ch1_pos1_1st_o;
      output     [ 7:0]     ch1_pos2_1st_o;
      output     [ 7:0]     ch1_pos3_1st_o;
      output     [ 7:0]     ch1_pos4_1st_o;
      output     [ 7:0]     ch1_pos5_1st_o;
      output     [ 7:0]     ch1_pos6_1st_o;
      output     [ 7:0]     ch1_pos7_1st_o;
      output     [ 1:0]     ch1_pos0_src_type_o;
      output     [ 1:0]     ch1_pos1_src_type_o;
      output     [ 1:0]     ch1_pos2_src_type_o;
      output     [ 1:0]     ch1_pos3_src_type_o;
      output     [ 1:0]     ch1_pos4_src_type_o;
      output     [ 1:0]     ch1_pos5_src_type_o;
      output     [ 1:0]     ch1_pos6_src_type_o;
      output     [ 1:0]     ch1_pos7_src_type_o;
      
      output                ch1_release_o;
      output     [ 8:0]     ch1_VR_id_o;
	  output     [ 2:0]     ch1_VR_FR_o;
      output     [ 4:0]     ch1_channel_ID_o;
      
      input                 ch2_idle_i;
      input                 ch2_eof_i;
      output     [ 1:0]     ch2_request_o;
      output     [ 7:0]     ch2_pos_1st_o;
      output     [ 2:0]     ch2_pos_2nd_o;
      output     [ 1:0]     ch2_src_type_o;
      output     [29:0]     ch2_start_addr_o;
      output     [29:0]     ch2_data_length_o;
      output     [29:0]     ch2_2nd_addr_burst_o;
      output     [29:0]     ch2_column_num_2nd_o;
      
      output                ch2_broadcast_o;
      output     [ 7:0]     ch2_pos0_1st_o;
      output     [ 7:0]     ch2_pos1_1st_o;
      output     [ 7:0]     ch2_pos2_1st_o;
      output     [ 7:0]     ch2_pos3_1st_o;
      output     [ 7:0]     ch2_pos4_1st_o;
      output     [ 7:0]     ch2_pos5_1st_o;
      output     [ 7:0]     ch2_pos6_1st_o;
      output     [ 7:0]     ch2_pos7_1st_o;
      output     [ 1:0]     ch2_pos0_src_type_o;
      output     [ 1:0]     ch2_pos1_src_type_o;
      output     [ 1:0]     ch2_pos2_src_type_o;
      output     [ 1:0]     ch2_pos3_src_type_o;
      output     [ 1:0]     ch2_pos4_src_type_o;
      output     [ 1:0]     ch2_pos5_src_type_o;
      output     [ 1:0]     ch2_pos6_src_type_o;
      output     [ 1:0]     ch2_pos7_src_type_o;

      output                ch2_release_o;
      output     [ 8:0]     ch2_VR_id_o;
	  output     [ 2:0]     ch2_VR_FR_o;
      output     [ 4:0]     ch2_channel_ID_o;
      
      input                 ch3_idle_i;
      input                 ch3_eof_i;
      output     [ 1:0]     ch3_request_o;
      output     [ 7:0]     ch3_pos_1st_o;
      output     [ 2:0]     ch3_pos_2nd_o;
      output     [ 1:0]     ch3_src_type_o;
      output     [29:0]     ch3_start_addr_o;
      output     [29:0]     ch3_data_length_o;
      output     [29:0]     ch3_2nd_addr_burst_o;
      output     [29:0]     ch3_column_num_2nd_o;
      
      output                ch3_broadcast_o;
      output     [ 7:0]     ch3_pos0_1st_o;
      output     [ 7:0]     ch3_pos1_1st_o;
      output     [ 7:0]     ch3_pos2_1st_o;
      output     [ 7:0]     ch3_pos3_1st_o;
      output     [ 7:0]     ch3_pos4_1st_o;
      output     [ 7:0]     ch3_pos5_1st_o;
      output     [ 7:0]     ch3_pos6_1st_o;
      output     [ 7:0]     ch3_pos7_1st_o;
      output     [ 1:0]     ch3_pos0_src_type_o;
      output     [ 1:0]     ch3_pos1_src_type_o;
      output     [ 1:0]     ch3_pos2_src_type_o;
      output     [ 1:0]     ch3_pos3_src_type_o;
      output     [ 1:0]     ch3_pos4_src_type_o;
      output     [ 1:0]     ch3_pos5_src_type_o;
      output     [ 1:0]     ch3_pos6_src_type_o;
      output     [ 1:0]     ch3_pos7_src_type_o;

      output                ch3_release_o;
      output     [ 8:0]     ch3_VR_id_o;
	  output     [ 2:0]     ch3_VR_FR_o;
      output     [ 4:0]     ch3_channel_ID_o;
      
      input                 ch4_idle_i;
      input                 ch4_eof_i;
      output     [ 1:0]     ch4_request_o;
      output     [ 7:0]     ch4_pos_1st_o;
      output     [ 2:0]     ch4_pos_2nd_o;
      output     [ 1:0]     ch4_src_type_o;
      output     [29:0]     ch4_start_addr_o;
      output     [29:0]     ch4_data_length_o;
      output     [29:0]     ch4_2nd_addr_burst_o;
      output     [29:0]     ch4_column_num_2nd_o;
      
      output                ch4_broadcast_o;
      output     [ 7:0]     ch4_pos0_1st_o;
      output     [ 7:0]     ch4_pos1_1st_o;
      output     [ 7:0]     ch4_pos2_1st_o;
      output     [ 7:0]     ch4_pos3_1st_o;
      output     [ 7:0]     ch4_pos4_1st_o;
      output     [ 7:0]     ch4_pos5_1st_o;
      output     [ 7:0]     ch4_pos6_1st_o;
      output     [ 7:0]     ch4_pos7_1st_o;
      output     [ 1:0]     ch4_pos0_src_type_o;
      output     [ 1:0]     ch4_pos1_src_type_o;
      output     [ 1:0]     ch4_pos2_src_type_o;
      output     [ 1:0]     ch4_pos3_src_type_o;
      output     [ 1:0]     ch4_pos4_src_type_o;
      output     [ 1:0]     ch4_pos5_src_type_o;
      output     [ 1:0]     ch4_pos6_src_type_o;
      output     [ 1:0]     ch4_pos7_src_type_o;

      output                ch4_release_o;
      output     [ 8:0]     ch4_VR_id_o;
	  output     [ 2:0]     ch4_VR_FR_o;
      output     [ 4:0]     ch4_channel_ID_o;
      
      input                 ch5_idle_i;
      input                 ch5_eof_i;
      output     [ 1:0]     ch5_request_o;
      output     [ 7:0]     ch5_pos_1st_o;
      output     [ 2:0]     ch5_pos_2nd_o;
      output     [ 1:0]     ch5_src_type_o;
      output     [29:0]     ch5_start_addr_o;
      output     [29:0]     ch5_data_length_o;
      output     [29:0]     ch5_2nd_addr_burst_o;
      output     [29:0]     ch5_column_num_2nd_o;
      
      output                ch5_broadcast_o;
      output     [ 7:0]     ch5_pos0_1st_o;
      output     [ 7:0]     ch5_pos1_1st_o;
      output     [ 7:0]     ch5_pos2_1st_o;
      output     [ 7:0]     ch5_pos3_1st_o;
      output     [ 7:0]     ch5_pos4_1st_o;
      output     [ 7:0]     ch5_pos5_1st_o;
      output     [ 7:0]     ch5_pos6_1st_o;
      output     [ 7:0]     ch5_pos7_1st_o;
      output     [ 1:0]     ch5_pos0_src_type_o;
      output     [ 1:0]     ch5_pos1_src_type_o;
      output     [ 1:0]     ch5_pos2_src_type_o;
      output     [ 1:0]     ch5_pos3_src_type_o;
      output     [ 1:0]     ch5_pos4_src_type_o;
      output     [ 1:0]     ch5_pos5_src_type_o;
      output     [ 1:0]     ch5_pos6_src_type_o;
      output     [ 1:0]     ch5_pos7_src_type_o;

      output                ch5_release_o;
      output     [ 8:0]     ch5_VR_id_o;
	  output     [ 2:0]     ch5_VR_FR_o;
      output     [ 4:0]     ch5_channel_ID_o;
      
      input                 ch6_idle_i;
      input                 ch6_eof_i;
      output     [ 1:0]     ch6_request_o;
      output     [ 7:0]     ch6_pos_1st_o;
      output     [ 2:0]     ch6_pos_2nd_o;
      output     [ 1:0]     ch6_src_type_o;
      output     [29:0]     ch6_start_addr_o;
      output     [29:0]     ch6_data_length_o;
      output     [29:0]     ch6_2nd_addr_burst_o;
      output     [29:0]     ch6_column_num_2nd_o;
      
      output                ch6_broadcast_o;
      output     [ 7:0]     ch6_pos0_1st_o;
      output     [ 7:0]     ch6_pos1_1st_o;
      output     [ 7:0]     ch6_pos2_1st_o;
      output     [ 7:0]     ch6_pos3_1st_o;
      output     [ 7:0]     ch6_pos4_1st_o;
      output     [ 7:0]     ch6_pos5_1st_o;
      output     [ 7:0]     ch6_pos6_1st_o;
      output     [ 7:0]     ch6_pos7_1st_o;
      output     [ 1:0]     ch6_pos0_src_type_o;
      output     [ 1:0]     ch6_pos1_src_type_o;
      output     [ 1:0]     ch6_pos2_src_type_o;
      output     [ 1:0]     ch6_pos3_src_type_o;
      output     [ 1:0]     ch6_pos4_src_type_o;
      output     [ 1:0]     ch6_pos5_src_type_o;
      output     [ 1:0]     ch6_pos6_src_type_o;
      output     [ 1:0]     ch6_pos7_src_type_o;

      output                ch6_release_o;
      output     [ 8:0]     ch6_VR_id_o;
	  output     [ 2:0]     ch6_VR_FR_o;
      output     [ 4:0]     ch6_channel_ID_o;
    
    
    //------------------------------------------------
    // Register/Wire declaration
    //------------------------------------------------
      reg                   ch1_idle_r;
      reg                   ch2_idle_r;
      reg                   ch3_idle_r;
      reg                   ch4_idle_r;
      reg                   ch5_idle_r;
      reg                   ch6_idle_r;
      
      reg                   ch1_open_enable;
      reg                   ch2_open_enable;
      reg                   ch3_open_enable;
      reg                   ch4_open_enable;
      reg                   ch5_open_enable;
      reg                   ch6_open_enable;
      
      reg                   ch1_grant_r;
      reg                   ch2_grant_r;
      reg                   ch3_grant_r;
      reg                   ch4_grant_r;
      reg                   ch5_grant_r;
      reg                   ch6_grant_r;

      reg                   ch1_grant_r1;
      reg                   ch2_grant_r1;
      reg                   ch3_grant_r1;
      reg                   ch4_grant_r1;
      reg                   ch5_grant_r1;
      reg                   ch6_grant_r1;

      wire                  ch1_grant_ok;
      wire                  ch2_grant_ok;
      wire                  ch3_grant_ok;
      wire                  ch4_grant_ok;
      wire                  ch5_grant_ok;
      wire                  ch6_grant_ok;

      reg                   ch1_grant_ok_r;
      reg                   ch2_grant_ok_r;
      reg                   ch3_grant_ok_r;
      reg                   ch4_grant_ok_r;
      reg                   ch5_grant_ok_r;
      reg                   ch6_grant_ok_r;
	  
	  wire                  ch1_req_done;   // when ch_idle_i pulls down, the request has got a dch to deal with itself,
	  wire                  ch2_req_done;   // and then the request valid flag should be pull down, being sure that after
	  wire                  ch3_req_done;   // the dch complete the write/read ddr work, its fsm can jump normally to the IDLE state.
	  wire                  ch4_req_done; 
	  wire                  ch5_req_done;
	  wire                  ch6_req_done;

      reg        [ 1:0]     ch1_request_r;
      reg        [ 7:0]     ch1_pos_1st_r;
      reg        [ 2:0]     ch1_pos_2nd_r;
      reg        [ 1:0]     ch1_src_type_r;
      reg        [29:0]     ch1_start_addr_r;
      reg        [29:0]     ch1_data_length_r;
      reg        [29:0]     ch1_2nd_addr_burst_r;
      reg        [29:0]     ch1_column_num_2nd_r;
      
      reg                   ch1_broadcast_r;
      reg        [ 7:0]     ch1_pos0_1st_r;
      reg        [ 7:0]     ch1_pos1_1st_r;
      reg        [ 7:0]     ch1_pos2_1st_r;
      reg        [ 7:0]     ch1_pos3_1st_r;
      reg        [ 7:0]     ch1_pos4_1st_r;
      reg        [ 7:0]     ch1_pos5_1st_r;
      reg        [ 7:0]     ch1_pos6_1st_r;
      reg        [ 7:0]     ch1_pos7_1st_r;
      reg        [ 1:0]     ch1_pos0_src_type_r;
      reg        [ 1:0]     ch1_pos1_src_type_r;
      reg        [ 1:0]     ch1_pos2_src_type_r;
      reg        [ 1:0]     ch1_pos3_src_type_r;
      reg        [ 1:0]     ch1_pos4_src_type_r;
      reg        [ 1:0]     ch1_pos5_src_type_r;
      reg        [ 1:0]     ch1_pos6_src_type_r;
      reg        [ 1:0]     ch1_pos7_src_type_r;
      
      reg                   ch1_release_r;
      reg        [ 8:0]     ch1_VR_id_r;
	  reg        [ 2:0]     ch1_VR_FR_r;
      reg        [ 4:0]     ch1_channel_ID_r;
      
      reg        [ 1:0]     ch2_request_r;
      reg        [ 7:0]     ch2_pos_1st_r;
      reg        [ 2:0]     ch2_pos_2nd_r;
      reg        [ 1:0]     ch2_src_type_r;
      reg        [29:0]     ch2_start_addr_r;
      reg        [29:0]     ch2_data_length_r;
      reg        [29:0]     ch2_2nd_addr_burst_r;
      reg        [29:0]     ch2_column_num_2nd_r;
      
      reg                   ch2_broadcast_r;
      reg        [ 7:0]     ch2_pos0_1st_r;
      reg        [ 7:0]     ch2_pos1_1st_r;
      reg        [ 7:0]     ch2_pos2_1st_r;
      reg        [ 7:0]     ch2_pos3_1st_r;
      reg        [ 7:0]     ch2_pos4_1st_r;
      reg        [ 7:0]     ch2_pos5_1st_r;
      reg        [ 7:0]     ch2_pos6_1st_r;
      reg        [ 7:0]     ch2_pos7_1st_r;
      reg        [ 1:0]     ch2_pos0_src_type_r;
      reg        [ 1:0]     ch2_pos1_src_type_r;
      reg        [ 1:0]     ch2_pos2_src_type_r;
      reg        [ 1:0]     ch2_pos3_src_type_r;
      reg        [ 1:0]     ch2_pos4_src_type_r;
      reg        [ 1:0]     ch2_pos5_src_type_r;
      reg        [ 1:0]     ch2_pos6_src_type_r;
      reg        [ 1:0]     ch2_pos7_src_type_r;

      reg                   ch2_release_r;
      reg        [ 8:0]     ch2_VR_id_r;
	  reg        [ 2:0]     ch2_VR_FR_r;
      reg        [ 4:0]     ch2_channel_ID_r;
      
      reg        [ 1:0]     ch3_request_r;
      reg        [ 7:0]     ch3_pos_1st_r;
      reg        [ 2:0]     ch3_pos_2nd_r;
      reg        [ 1:0]     ch3_src_type_r;
      reg        [29:0]     ch3_start_addr_r;
      reg        [29:0]     ch3_data_length_r;
      reg        [29:0]     ch3_2nd_addr_burst_r;
      reg        [29:0]     ch3_column_num_2nd_r;
      
      reg                   ch3_broadcast_r;
      reg        [ 7:0]     ch3_pos0_1st_r;
      reg        [ 7:0]     ch3_pos1_1st_r;
      reg        [ 7:0]     ch3_pos2_1st_r;
      reg        [ 7:0]     ch3_pos3_1st_r;
      reg        [ 7:0]     ch3_pos4_1st_r;
      reg        [ 7:0]     ch3_pos5_1st_r;
      reg        [ 7:0]     ch3_pos6_1st_r;
      reg        [ 7:0]     ch3_pos7_1st_r;
      reg        [ 1:0]     ch3_pos0_src_type_r;
      reg        [ 1:0]     ch3_pos1_src_type_r;
      reg        [ 1:0]     ch3_pos2_src_type_r;
      reg        [ 1:0]     ch3_pos3_src_type_r;
      reg        [ 1:0]     ch3_pos4_src_type_r;
      reg        [ 1:0]     ch3_pos5_src_type_r;
      reg        [ 1:0]     ch3_pos6_src_type_r;
      reg        [ 1:0]     ch3_pos7_src_type_r;

      reg                   ch3_release_r;
      reg        [ 8:0]     ch3_VR_id_r;
	  reg        [ 2:0]     ch3_VR_FR_r;
      reg        [ 4:0]     ch3_channel_ID_r;
      
      reg        [ 1:0]     ch4_request_r;
      reg        [ 7:0]     ch4_pos_1st_r;
      reg        [ 2:0]     ch4_pos_2nd_r;
      reg        [ 1:0]     ch4_src_type_r;
      reg        [29:0]     ch4_start_addr_r;
      reg        [29:0]     ch4_data_length_r;
      reg        [29:0]     ch4_2nd_addr_burst_r;
      reg        [29:0]     ch4_column_num_2nd_r;
      
      reg                   ch4_broadcast_r;
      reg        [ 7:0]     ch4_pos0_1st_r;
      reg        [ 7:0]     ch4_pos1_1st_r;
      reg        [ 7:0]     ch4_pos2_1st_r;
      reg        [ 7:0]     ch4_pos3_1st_r;
      reg        [ 7:0]     ch4_pos4_1st_r;
      reg        [ 7:0]     ch4_pos5_1st_r;
      reg        [ 7:0]     ch4_pos6_1st_r;
      reg        [ 7:0]     ch4_pos7_1st_r;
      reg        [ 1:0]     ch4_pos0_src_type_r;
      reg        [ 1:0]     ch4_pos1_src_type_r;
      reg        [ 1:0]     ch4_pos2_src_type_r;
      reg        [ 1:0]     ch4_pos3_src_type_r;
      reg        [ 1:0]     ch4_pos4_src_type_r;
      reg        [ 1:0]     ch4_pos5_src_type_r;
      reg        [ 1:0]     ch4_pos6_src_type_r;
      reg        [ 1:0]     ch4_pos7_src_type_r;

      reg                   ch4_release_r;
      reg        [ 8:0]     ch4_VR_id_r;
	  reg        [ 2:0]     ch4_VR_FR_r;
      reg        [ 4:0]     ch4_channel_ID_r;
      
      reg        [ 1:0]     ch5_request_r;
      reg        [ 7:0]     ch5_pos_1st_r;
      reg        [ 2:0]     ch5_pos_2nd_r;
      reg        [ 1:0]     ch5_src_type_r;
      reg        [29:0]     ch5_start_addr_r;
      reg        [29:0]     ch5_data_length_r;
      reg        [29:0]     ch5_2nd_addr_burst_r;
      reg        [29:0]     ch5_column_num_2nd_r;
      
      reg                   ch5_broadcast_r;
      reg        [ 7:0]     ch5_pos0_1st_r;
      reg        [ 7:0]     ch5_pos1_1st_r;
      reg        [ 7:0]     ch5_pos2_1st_r;
      reg        [ 7:0]     ch5_pos3_1st_r;
      reg        [ 7:0]     ch5_pos4_1st_r;
      reg        [ 7:0]     ch5_pos5_1st_r;
      reg        [ 7:0]     ch5_pos6_1st_r;
      reg        [ 7:0]     ch5_pos7_1st_r;
      reg        [ 1:0]     ch5_pos0_src_type_r;
      reg        [ 1:0]     ch5_pos1_src_type_r;
      reg        [ 1:0]     ch5_pos2_src_type_r;
      reg        [ 1:0]     ch5_pos3_src_type_r;
      reg        [ 1:0]     ch5_pos4_src_type_r;
      reg        [ 1:0]     ch5_pos5_src_type_r;
      reg        [ 1:0]     ch5_pos6_src_type_r;
      reg        [ 1:0]     ch5_pos7_src_type_r;

      reg                   ch5_release_r;
      reg        [ 8:0]     ch5_VR_id_r;
	  reg        [ 2:0]     ch5_VR_FR_r;
      reg        [ 4:0]     ch5_channel_ID_r;
      
      reg        [ 1:0]     ch6_request_r;
      reg        [ 7:0]     ch6_pos_1st_r;
      reg        [ 2:0]     ch6_pos_2nd_r;
      reg        [ 1:0]     ch6_src_type_r;
      reg        [29:0]     ch6_start_addr_r;
      reg        [29:0]     ch6_data_length_r;
      reg        [29:0]     ch6_2nd_addr_burst_r;
      reg        [29:0]     ch6_column_num_2nd_r;
      
      reg                   ch6_broadcast_r;
      reg        [ 7:0]     ch6_pos0_1st_r;
      reg        [ 7:0]     ch6_pos1_1st_r;
      reg        [ 7:0]     ch6_pos2_1st_r;
      reg        [ 7:0]     ch6_pos3_1st_r;
      reg        [ 7:0]     ch6_pos4_1st_r;
      reg        [ 7:0]     ch6_pos5_1st_r;
      reg        [ 7:0]     ch6_pos6_1st_r;
      reg        [ 7:0]     ch6_pos7_1st_r;
      reg        [ 1:0]     ch6_pos0_src_type_r;
      reg        [ 1:0]     ch6_pos1_src_type_r;
      reg        [ 1:0]     ch6_pos2_src_type_r;
      reg        [ 1:0]     ch6_pos3_src_type_r;
      reg        [ 1:0]     ch6_pos4_src_type_r;
      reg        [ 1:0]     ch6_pos5_src_type_r;
      reg        [ 1:0]     ch6_pos6_src_type_r;
      reg        [ 1:0]     ch6_pos7_src_type_r;

      reg                   ch6_release_r;
      reg        [ 8:0]     ch6_VR_id_r;
	  reg        [ 2:0]     ch6_VR_FR_r;
      reg        [ 4:0]     ch6_channel_ID_r;
      
      
///----------------------MC-FIFO输出端口信息分配
  //-----------------------------------------------
  //assign  wr_data[ 1: 0] = {1'b0, req_valid_r};
  //assign  wr_data[ 9: 2] = MC_IP_POS_1ST;
  //assign  wr_data[12:10] = MC_IP_POS_2ND;
  //assign  wr_data[14:13] = req_src_type_r;
  //assign  wr_data[44:15] = access_start_address_r;  //真实值
  //assign  wr_data[74:45] = access_length_burst_r;   //真实值
      wire       [ 1:0]     MC_request_int;
      wire       [ 7:0]     MC_pos_1st_int;
      wire       [ 2:0]     MC_pos_2nd_int;
      wire       [ 1:0]     MC_src_type_int;
      wire       [29:0]     MC_start_addr_int;
      wire       [29:0]     MC_cmd_length_int;
      wire       [29:0]     MC_2nd_addr_burst_int;
      wire       [29:0]     MC_column_num_2nd_int;
	  
      assign  MC_request_int          = MC_fifo_dout[ 1: 0];
      assign  MC_pos_1st_int          = MC_fifo_dout[ 9: 2];
      assign  MC_pos_2nd_int          = MC_fifo_dout[12:10];
      assign  MC_src_type_int         = MC_fifo_dout[14:13];
      assign  MC_start_addr_int       = MC_fifo_dout[44:15];
      assign  MC_cmd_length_int       = {3'b0, MC_fifo_dout[74:45]};
      assign  MC_2nd_addr_burst_int   = MC_cmd_length_int;               //真实值
      assign  MC_column_num_2nd_int   = {3'b0, MC_cmd_length_int[29:3]-1'b1};     //真实值/burst_length -1
	  //assign  MC_column_num_2nd_int   = MC_cmd_length_int[29:3] - 1;     //真实值/burst_length -1
      
      wire       [233:0]    first_bus;
       
       assign  first_bus[ 1: 0]     =  MC_request_int;
       assign  first_bus[ 9: 2]     =  MC_pos_1st_int;
       assign  first_bus[12:10]     =  MC_pos_2nd_int;
       assign  first_bus[14:13]     =  MC_src_type_int;
       assign  first_bus[44:15]     =  MC_start_addr_int;
       assign  first_bus[74:45]     =  MC_cmd_length_int;
       assign  first_bus[104:75]    =  MC_2nd_addr_burst_int;
       assign  first_bus[134:105]   =  MC_column_num_2nd_int;

       assign  first_bus[233:135]   =  {99{1'b0}};
	   

///----------------------COP-FIFO输出端口信息分配
  //-----------------------------------------------
  //assign  wr_data[ 1: 0] = {1'b0, req_valid_r};
  //assign  wr_data[ 9: 2] = req_pos_1st_r;
  //assign  wr_data[12:10] = req_pos_2nd_r;
  //assign  wr_data[14:13] = req_src_type_r;
  //assign  wr_data[44:15] = access_start_address_r;
      wire       [ 1:0]     COP_request_int;
      wire       [ 7:0]     COP_pos_1st_int;
      wire       [ 2:0]     COP_pos_2nd_int;
      wire       [ 1:0]     COP_src_type_int;
      wire       [29:0]     COP_start_addr_int;
      wire       [29:0]     COP_cmd_length_int;
      wire       [29:0]     COP_2nd_addr_burst_int;
      wire       [29:0]     COP_column_num_2nd_int;
	  
      assign  COP_request_int         = COP_fifo_dout[ 1: 0];
      assign  COP_pos_1st_int         = COP_fifo_dout[ 9: 2];
      assign  COP_pos_2nd_int         = COP_fifo_dout[12:10];
      assign  COP_src_type_int        = COP_fifo_dout[14:13];
      assign  COP_start_addr_int      = COP_fifo_dout[44:15];
      assign  COP_cmd_length_int      = `COP_IP_REQ_LENGTH;
      assign  COP_2nd_addr_burst_int  = COP_cmd_length_int;
      assign  COP_column_num_2nd_int  = {3'b0, COP_cmd_length_int[29:3]-1'b1}; //真实值/burst_length -1
  
      wire       [233:0]    second_bus;

       assign  second_bus[ 1: 0]     =  COP_request_int;
       assign  second_bus[ 9: 2]     =  COP_pos_1st_int;
       assign  second_bus[12:10]     =  COP_pos_2nd_int;
       assign  second_bus[14:13]     =  COP_src_type_int;
       assign  second_bus[44:15]     =  COP_start_addr_int;
       assign  second_bus[74:45]     =  COP_cmd_length_int;
       assign  second_bus[104:75]    =  COP_2nd_addr_burst_int;  
       assign  second_bus[134:105]   =  COP_column_num_2nd_int;

       assign  second_bus[233:135]   =  {99{1'b0}};
	   

///----------------------GENERAL-FIFO输出端口信息分配
  //-------------------------------------------------------
  //  .req_valid_o          (MUX_21_DOUT[1:0]), //2
  //  .req_pos_1st_o        (MUX_21_DOUT[9:2]), //8
  //  .req_pos_2nd_o        (MUX_21_DOUT[12:10]), //3
  //  .req_pos_src_type_o   (MUX_21_DOUT[14:13]), //2
  //  .req_start_addr_o     (MUX_21_DOUT[44:15]), //30
  //  .req_length_burst_o   (MUX_21_DOUT[74:45]), //30
  //  .req_2nd_addr_burst_o (MUX_21_DOUT[104:75]), //30
  //  .req_col_num_2nd_o    (MUX_21_DOUT[134:105]), //30
  //  .req_broadcast_o      (MUX_21_DOUT[135:135]), //1
  //  .req_pos0_1st_o       (MUX_21_DOUT[143:136]), //8
  //  .req_pos1_1st_o       (MUX_21_DOUT[151:144]), //8
  //  .req_pos2_1st_o       (MUX_21_DOUT[159:152]), //8
  //  .req_pos3_1st_o       (MUX_21_DOUT[167:160]), //8
  //  .req_pos4_1st_o       (MUX_21_DOUT[175:168]), //8
  //  .req_pos5_1st_o       (MUX_21_DOUT[183:176]), //8
  //  .req_pos6_1st_o       (MUX_21_DOUT[191:184]), //8
  //  .req_pos7_1st_o       (MUX_21_DOUT[199:192]), //8
  //  .req_pos0_src_type_o  (MUX_21_DOUT[201:200]), //2
  //  .req_pos1_src_type_o  (MUX_21_DOUT[203:202]), //2
  //  .req_pos2_src_type_o  (MUX_21_DOUT[205:204]), //2
  //  .req_pos3_src_type_o  (MUX_21_DOUT[207:206]), //2
  //  .req_pos4_src_type_o  (MUX_21_DOUT[209:208]), //2
  //  .req_pos5_src_type_o  (MUX_21_DOUT[211:210]), //2
  //  .req_pos6_src_type_o  (MUX_21_DOUT[213:212]), //2
  //  .req_pos7_src_type_o  (MUX_21_DOUT[215:214]), //2
  //  .req_release_o        (MUX_21_DOUT[216:216]), //1
  //  .VR_id_o              (MUX_21_DOUT[225:217]), //9
  //  .channel_id_o         (MUX_21_DOUT[230:226])  //5
  //-------------------------------------------------------
      wire       [ 1:0]     channel_request_int;
      wire       [ 7:0]     channel_pos_1st_int;
      wire       [ 2:0]     channel_pos_2nd_int;
      wire       [ 1:0]     channel_src_type_int;
      wire       [29:0]     channel_start_addr_int;
      wire       [29:0]     channel_data_length_int;
      wire       [29:0]     channel_2nd_addr_burst_int;
      wire       [29:0]     channel_column_num_2nd_int;
      
      wire                  channel_broadcast_int;
      wire       [ 7:0]     channel_pos0_1st_int;
      wire       [ 7:0]     channel_pos1_1st_int;
      wire       [ 7:0]     channel_pos2_1st_int;
      wire       [ 7:0]     channel_pos3_1st_int;
      wire       [ 7:0]     channel_pos4_1st_int;
      wire       [ 7:0]     channel_pos5_1st_int;
      wire       [ 7:0]     channel_pos6_1st_int;
      wire       [ 7:0]     channel_pos7_1st_int;
      wire       [ 1:0]     channel_pos0_src_type_int;
      wire       [ 1:0]     channel_pos1_src_type_int;
      wire       [ 1:0]     channel_pos2_src_type_int;
      wire       [ 1:0]     channel_pos3_src_type_int;
      wire       [ 1:0]     channel_pos4_src_type_int;
      wire       [ 1:0]     channel_pos5_src_type_int;
      wire       [ 1:0]     channel_pos6_src_type_int;
      wire       [ 1:0]     channel_pos7_src_type_int;

      wire                  channel_release_int;
      wire       [ 8:0]     channel_VR_id_int;
	  wire       [ 2:0]     channel_VR_FR_int;
      wire       [ 4:0]     channel_channel_ID_int;
      
      assign  channel_request_int         = channel_fifo_dout[ 1: 0];
      assign  channel_pos_1st_int         = channel_fifo_dout[ 9: 2];
      assign  channel_pos_2nd_int         = channel_fifo_dout[12:10];
      assign  channel_src_type_int        = channel_fifo_dout[14:13];
      assign  channel_start_addr_int      = channel_fifo_dout[44:15];
      assign  channel_data_length_int     = channel_fifo_dout[74:45];
      assign  channel_2nd_addr_burst_int  = channel_fifo_dout[104:75];
      assign  channel_column_num_2nd_int  = channel_fifo_dout[134:105];
      
      assign  channel_broadcast_int       = channel_fifo_dout[135:135];
      assign  channel_pos0_1st_int        = channel_fifo_dout[143:136];
      assign  channel_pos1_1st_int        = channel_fifo_dout[151:144];
      assign  channel_pos2_1st_int        = channel_fifo_dout[159:152];
      assign  channel_pos3_1st_int        = channel_fifo_dout[167:160];
      assign  channel_pos4_1st_int        = channel_fifo_dout[175:168];
      assign  channel_pos5_1st_int        = channel_fifo_dout[183:176];
      assign  channel_pos6_1st_int        = channel_fifo_dout[191:184];
      assign  channel_pos7_1st_int        = channel_fifo_dout[199:192];
      assign  channel_pos0_src_type_int   = channel_fifo_dout[201:200];
      assign  channel_pos1_src_type_int   = channel_fifo_dout[203:202];
      assign  channel_pos2_src_type_int   = channel_fifo_dout[205:204];
      assign  channel_pos3_src_type_int   = channel_fifo_dout[207:206];
      assign  channel_pos4_src_type_int   = channel_fifo_dout[209:208];
      assign  channel_pos5_src_type_int   = channel_fifo_dout[211:210];
      assign  channel_pos6_src_type_int   = channel_fifo_dout[213:212];
      assign  channel_pos7_src_type_int   = channel_fifo_dout[215:214];
      
      assign  channel_release_int         = channel_fifo_dout[216:216];
      assign  channel_VR_id_int           = channel_fifo_dout[225:217];
	  assign  channel_VR_FR_int           = channel_fifo_dout[228:226];
      assign  channel_channel_ID_int      = channel_fifo_dout[233:229];
      
      wire       [233:0]    third_bus;
      
       assign  third_bus[ 1: 0]     =  channel_request_int;
       assign  third_bus[ 9: 2]     =  channel_pos_1st_int;
       assign  third_bus[12:10]     =  channel_pos_2nd_int;
       assign  third_bus[14:13]     =  channel_src_type_int;
       assign  third_bus[44:15]     =  channel_start_addr_int;
       assign  third_bus[74:45]     =  channel_data_length_int;
       assign  third_bus[104:75]    =  channel_2nd_addr_burst_int;
       assign  third_bus[134:105]   =  channel_column_num_2nd_int;

       assign  third_bus[135:135]   =  channel_broadcast_int;
       assign  third_bus[143:136]   =  channel_pos0_1st_int;
       assign  third_bus[151:144]   =  channel_pos1_1st_int;
       assign  third_bus[159:152]   =  channel_pos2_1st_int;
       assign  third_bus[167:160]   =  channel_pos3_1st_int;
       assign  third_bus[175:168]   =  channel_pos4_1st_int;
       assign  third_bus[183:176]   =  channel_pos5_1st_int;
       assign  third_bus[191:184]   =  channel_pos6_1st_int;
       assign  third_bus[199:192]   =  channel_pos7_1st_int;
       assign  third_bus[201:200]   =  channel_pos0_src_type_int;
       assign  third_bus[203:202]   =  channel_pos1_src_type_int;
       assign  third_bus[205:204]   =  channel_pos2_src_type_int;
       assign  third_bus[207:206]   =  channel_pos3_src_type_int;
       assign  third_bus[209:208]   =  channel_pos4_src_type_int;
       assign  third_bus[211:210]   =  channel_pos5_src_type_int;
       assign  third_bus[213:212]   =  channel_pos6_src_type_int;
       assign  third_bus[215:214]   =  channel_pos7_src_type_int;

       assign  third_bus[216:216]   =  channel_release_int;
       assign  third_bus[225:217]   =  channel_VR_id_int;
	   assign  third_bus[228:226]   =  channel_VR_FR_int;
       assign  third_bus[233:229]   =  channel_channel_ID_int;

//----------[0]:MC---[1]:COP---[2]:general-----------//
      wire       [ 2:0]     fifo_rd_en;
      wire       [ 2:0]     fifo_valid;
      wire       [ 2:0]     fifo_empty;
	  wire					rd_en;

      assign  fifo_rd_en[0] = !fifo_empty[0] & rd_en;
      assign  fifo_rd_en[1] =  fifo_empty[0] & !fifo_empty[1] & rd_en;
      assign  fifo_rd_en[2] =  fifo_empty[0] &  fifo_empty[1] & !fifo_empty[2] & rd_en;
      
      assign  fifo_valid[0] = MC_fifo_valid;
      assign  fifo_valid[1] = COP_fifo_valid;
      assign  fifo_valid[2] = channel_fifo_valid;
      
      assign  fifo_empty[0] = MC_fifo_empty;
      assign  fifo_empty[1] = COP_fifo_empty | (~first_release_flag_r);   //// by yyp, 2017-01-03, special for COP
      assign  fifo_empty[2] = channel_fifo_empty;


      wire       [233:0]    select_bus;
      
      assign  select_bus  = fifo_valid[0] ? first_bus  :
                            fifo_valid[1] ? second_bus :
                            fifo_valid[2] ? third_bus  : {234{1'b0}};
    //-------------------------------------
      wire       [ 1:0]     select_request_int;
      wire       [ 7:0]     select_pos_1st_int;
      wire       [ 2:0]     select_pos_2nd_int;
      wire       [ 1:0]     select_src_type_int;
      wire       [29:0]     select_start_addr_int;
      wire       [29:0]     select_data_length_int;
      wire       [29:0]     select_2nd_addr_burst_int;
      wire       [29:0]     select_column_num_2nd_int;

      wire                  select_broadcast_int;
      wire       [ 7:0]     select_pos0_1st_int;
      wire       [ 7:0]     select_pos1_1st_int;
      wire       [ 7:0]     select_pos2_1st_int;
      wire       [ 7:0]     select_pos3_1st_int;
      wire       [ 7:0]     select_pos4_1st_int;
      wire       [ 7:0]     select_pos5_1st_int;
      wire       [ 7:0]     select_pos6_1st_int;
      wire       [ 7:0]     select_pos7_1st_int;
      wire       [ 1:0]     select_pos0_src_type_int;
      wire       [ 1:0]     select_pos1_src_type_int;
      wire       [ 1:0]     select_pos2_src_type_int;
      wire       [ 1:0]     select_pos3_src_type_int;
      wire       [ 1:0]     select_pos4_src_type_int;
      wire       [ 1:0]     select_pos5_src_type_int;
      wire       [ 1:0]     select_pos6_src_type_int;
      wire       [ 1:0]     select_pos7_src_type_int;

      wire                  select_release_int;
      wire       [ 8:0]     select_VR_id_int;
	  wire       [ 2:0]     select_VR_FR_int;
      wire       [ 4:0]     select_ID_int;
    //--------------------------------------

      assign  select_request_int         = select_bus[1:0];
      assign  select_pos_1st_int         = select_bus[9:2];
      assign  select_pos_2nd_int         = select_bus[12:10];
      assign  select_src_type_int        = select_bus[14:13];
      assign  select_start_addr_int      = select_bus[44:15];
      assign  select_data_length_int     = select_bus[74:45];
      assign  select_2nd_addr_burst_int  = select_bus[104:75];
      assign  select_column_num_2nd_int  = select_bus[134:105];
      
      assign  select_broadcast_int       = select_bus[135:135];
      assign  select_pos0_1st_int        = select_bus[143:136];
      assign  select_pos1_1st_int        = select_bus[151:144];
      assign  select_pos2_1st_int        = select_bus[159:152];
      assign  select_pos3_1st_int        = select_bus[167:160];
      assign  select_pos4_1st_int        = select_bus[175:168];
      assign  select_pos5_1st_int        = select_bus[183:176];
      assign  select_pos6_1st_int        = select_bus[191:184];
      assign  select_pos7_1st_int        = select_bus[199:192];
      assign  select_pos0_src_type_int   = select_bus[201:200];
      assign  select_pos1_src_type_int   = select_bus[203:202];
      assign  select_pos2_src_type_int   = select_bus[205:204];
      assign  select_pos3_src_type_int   = select_bus[207:206];
      assign  select_pos4_src_type_int   = select_bus[209:208];
      assign  select_pos5_src_type_int   = select_bus[211:210];
      assign  select_pos6_src_type_int   = select_bus[213:212];
      assign  select_pos7_src_type_int   = select_bus[215:214];
      
      assign  select_release_int         = select_bus[216:216];
      assign  select_VR_id_int           = select_bus[225:217];
	  assign  select_VR_FR_int           = select_bus[228:226];
      assign  select_ID_int              = select_bus[233:229];
      
///----------------------GENERAL-FIFO输出端口信息分配
  //-------------------------------------------------------
  //  .req_valid_o          (MUX_21_DOUT[1:0]), //2
  //  .req_pos_1st_o        (MUX_21_DOUT[9:2]), //8
  //  .req_pos_2nd_o        (MUX_21_DOUT[12:10]), //3
  //  .req_start_addr_o     (MUX_21_DOUT[42:13]), //30
  //  .req_length_burst_o   (MUX_21_DOUT[72:43]), //30
  //  .req_2nd_addr_burst_o (MUX_21_DOUT[102:73]), //30
  //  .req_col_num_2nd_o    (MUX_21_DOUT[132:103]), //30
  
  //  .req_broadcast_o      (MUX_21_DOUT[133:133]), //1
  //  .req_pos0_1st_o       (MUX_21_DOUT[141:134]), //8
  //  .req_pos1_1st_o       (MUX_21_DOUT[149:142]), //8
  //  .req_pos2_1st_o       (MUX_21_DOUT[157:150]), //8
  //  .req_pos3_1st_o       (MUX_21_DOUT[165:158]), //8
  //  .req_pos4_1st_o       (MUX_21_DOUT[173:166]), //8
  //  .req_pos5_1st_o       (MUX_21_DOUT[181:174]), //8
  //  .req_pos6_1st_o       (MUX_21_DOUT[189:182]), //8
  //  .req_pos7_1st_o       (MUX_21_DOUT[197:190]), //8
  //  .req_pos0_src_type_o  (MUX_21_DOUT[199:198]), //2
  //  .req_pos1_src_type_o  (MUX_21_DOUT[201:200]), //2
  //  .req_pos2_src_type_o  (MUX_21_DOUT[203:202]), //2
  //  .req_pos3_src_type_o  (MUX_21_DOUT[205:204]), //2
  //  .req_pos4_src_type_o  (MUX_21_DOUT[207:206]), //2
  //  .req_pos5_src_type_o  (MUX_21_DOUT[209:208]), //2
  //  .req_pos6_src_type_o  (MUX_21_DOUT[211:210]), //2
  //  .req_pos7_src_type_o  (MUX_21_DOUT[213:212]), //2
  
  //  .req_release_o        (MUX_21_DOUT[214:214]), //1
  //  .VR_id_o              (MUX_21_DOUT[223:215]), //9
  //  .channel_id_o         (MUX_21_DOUT[228:224])  //5
  //-------------------------------------------------------
  
//----***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---//
//----***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---//
//----***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---//
//----***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---//
//----***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---***---//  

  
  //-----------------------------------------------------
  // Code script
  //-----------------------------------------------------
  
    always@(posedge sys_clk) begin
    	if(!sys_rst_n) begin
    	  ch1_idle_r <= 1'b0;
    	  ch2_idle_r <= 1'b0;
    	  ch3_idle_r <= 1'b0;
    	  ch4_idle_r <= 1'b0;
    	  ch5_idle_r <= 1'b0;
    	  ch6_idle_r <= 1'b0;
    	end
    	else begin
    	  ch1_idle_r <= ch1_idle_i;
    	  ch2_idle_r <= ch2_idle_i;
    	  ch3_idle_r <= ch3_idle_i;
    	  ch4_idle_r <= ch4_idle_i;
    	  ch5_idle_r <= ch5_idle_i;
    	  ch6_idle_r <= ch6_idle_i;
    	end
    end
	
	// this flag (High valid) will pull down the request's valid flag (request[0])
	assign  ch1_req_done = !ch1_idle_i & ch1_idle_r;
	assign  ch2_req_done = !ch2_idle_i & ch2_idle_r;
	assign  ch3_req_done = !ch3_idle_i & ch3_idle_r;
	assign  ch4_req_done = !ch4_idle_i & ch4_idle_r;
	assign  ch5_req_done = !ch5_idle_i & ch5_idle_r;
	assign  ch6_req_done = !ch6_idle_i & ch6_idle_r;
    
    always@(posedge sys_clk) begin
    	if(!sys_rst_n) begin
    	  ch1_open_enable <= 1'b0;
    	  ch2_open_enable <= 1'b0;
    	  ch3_open_enable <= 1'b0;
    	  ch4_open_enable <= 1'b0;
    	  ch5_open_enable <= 1'b0;
    	  ch6_open_enable <= 1'b0;
    	end
    	else begin
    	  ch1_open_enable <= phy_init_done_i & ch1_idle_r;
    	  ch2_open_enable <= phy_init_done_i & ch1_grant_r & ch2_idle_r;
    	  ch3_open_enable <= phy_init_done_i & ch1_grant_r & ch2_grant_r & ch3_idle_r;
    	  ch4_open_enable <= phy_init_done_i & ch1_grant_r & ch2_grant_r & ch3_grant_r & ch4_idle_r;
    	  ch5_open_enable <= phy_init_done_i & ch1_grant_r & ch2_grant_r & ch3_grant_r & ch4_grant_r & ch5_idle_r;
    	  ch6_open_enable <= phy_init_done_i & ch1_grant_r & ch2_grant_r & ch3_grant_r & ch4_grant_r & ch5_grant_r & ch6_idle_r;
    	end
    end
    
    
  //generate ch1_grant_r ~~ ch6_grant_r
  //if chx_grant_r is HIGH, it indicates that the chx is busy.
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    		ch1_grant_r <= 1'b0;
    	else if(ch1_eof_i)
    		ch1_grant_r <= 1'b0;
    	else if(ch1_open_enable & !(&fifo_empty) & !ch1_grant_r)   /// yyp 2016-10-25
    	  ch1_grant_r <= 1'b1;                                     /// 只要有一个fifo不为空，就可以分配数据通道！
    	else
    	  ch1_grant_r <= ch1_grant_r;
    end
    
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    		ch2_grant_r <= 1'b0;
    	else if(ch2_eof_i)
    		ch2_grant_r <= 1'b0;
    	else if(ch2_open_enable & !(&fifo_empty) & !ch2_grant_r)
    	  ch2_grant_r <= 1'b1;
    	else
    	  ch2_grant_r <= ch2_grant_r;
    end
    
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    		ch3_grant_r <= 1'b0;
    	else if(ch3_eof_i)
    		ch3_grant_r <= 1'b0;
    	else if(ch3_open_enable & !(&fifo_empty) & !ch3_grant_r)
    	  ch3_grant_r <= 1'b1;
    	else
    	  ch3_grant_r <= ch3_grant_r;
    end
    
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    		ch4_grant_r <= 1'b0;
    	else if(ch4_eof_i)
    		ch4_grant_r <= 1'b0;
    	else if(ch4_open_enable & !(&fifo_empty) & !ch4_grant_r)
    	  ch4_grant_r <= 1'b1;
    	else
    	  ch4_grant_r <= ch4_grant_r;
    end
    
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    		ch5_grant_r <= 1'b0;
    	else if(ch5_eof_i)
    		ch5_grant_r <= 1'b0;
    	else if(ch5_open_enable & !(&fifo_empty) & !ch5_grant_r)
    	  ch5_grant_r <= 1'b1;
    	else
    	  ch5_grant_r <= ch5_grant_r;
    end
    
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    		ch6_grant_r <= 1'b0;
    	else if(ch6_eof_i)
    		ch6_grant_r <= 1'b0;
    	else if(ch6_open_enable & !(&fifo_empty) & !ch6_grant_r)
    	  ch6_grant_r <= 1'b1;
    	else
    	  ch6_grant_r <= ch6_grant_r;
    end
    
	
	//*******************************************
	// detect the raise edge of chx_grant_r
	//*******************************************
    always@(posedge sys_clk) begin
      if(!sys_rst_n) begin
        ch1_grant_r1 <= 1'b0;
        ch2_grant_r1 <= 1'b0;
        ch3_grant_r1 <= 1'b0;
        ch4_grant_r1 <= 1'b0;
        ch5_grant_r1 <= 1'b0;
        ch6_grant_r1 <= 1'b0;
      end
      else begin
        ch1_grant_r1 <= ch1_grant_r;
        ch2_grant_r1 <= ch2_grant_r;
        ch3_grant_r1 <= ch3_grant_r;
        ch4_grant_r1 <= ch4_grant_r;
        ch5_grant_r1 <= ch5_grant_r;
        ch6_grant_r1 <= ch6_grant_r;
      end
    end
    
assign  ch1_grant_ok = !ch1_grant_r1 & ch1_grant_r;
assign  ch2_grant_ok = !ch2_grant_r1 & ch2_grant_r;
assign  ch3_grant_ok = !ch3_grant_r1 & ch3_grant_r;
assign  ch4_grant_ok = !ch4_grant_r1 & ch4_grant_r;
assign  ch5_grant_ok = !ch5_grant_r1 & ch5_grant_r;
assign  ch6_grant_ok = !ch6_grant_r1 & ch6_grant_r;
    	
    
  //generate strobe-signal to read data from fifo.
assign  rd_en  = ch1_grant_ok | ch2_grant_ok | ch3_grant_ok | ch4_grant_ok | ch5_grant_ok | ch6_grant_ok;
    
    
    always@(posedge sys_clk) begin
      if(!sys_rst_n) begin
        ch1_grant_ok_r <= 1'b0;
        ch2_grant_ok_r <= 1'b0;
        ch3_grant_ok_r <= 1'b0;
        ch4_grant_ok_r <= 1'b0;
        ch5_grant_ok_r <= 1'b0;
        ch6_grant_ok_r <= 1'b0;
      end
      else begin
        ch1_grant_ok_r <= ch1_grant_ok;
        ch2_grant_ok_r <= ch2_grant_ok;
        ch3_grant_ok_r <= ch3_grant_ok;
        ch4_grant_ok_r <= ch4_grant_ok;
        ch5_grant_ok_r <= ch5_grant_ok;
        ch6_grant_ok_r <= ch6_grant_ok;
      end
    end
  
  
  
   always@(posedge sys_clk)
   begin
      if(!sys_rst_n)
	      ch1_request_r <= 2'b00;
      else if(ch1_req_done)
	      ch1_request_r <= 2'b00;
      else if(ch1_grant_ok_r & (|fifo_valid))
          ch1_request_r <= select_request_int;
	end
   always@(posedge sys_clk)
   begin
      if(!sys_rst_n)
	      ch2_request_r <= 2'b00;
      else if(ch2_req_done)
	      ch2_request_r <= 2'b00;
      else if(ch2_grant_ok_r & (|fifo_valid))
          ch2_request_r <= select_request_int;
	end
   always@(posedge sys_clk)
   begin
      if(!sys_rst_n)
	      ch3_request_r <= 2'b00;
      else if(ch3_req_done)
	      ch3_request_r <= 2'b00;
      else if(ch3_grant_ok_r & (|fifo_valid))
          ch3_request_r <= select_request_int;
	end
   always@(posedge sys_clk)
   begin
      if(!sys_rst_n)
	      ch4_request_r <= 2'b00;
      else if(ch4_req_done)
	      ch4_request_r <= 2'b00;
      else if(ch4_grant_ok_r & (|fifo_valid))
          ch4_request_r <= select_request_int;
	end
   always@(posedge sys_clk)
   begin
      if(!sys_rst_n)
	      ch5_request_r <= 2'b00;
      else if(ch5_req_done)
	      ch5_request_r <= 2'b00;
      else if(ch5_grant_ok_r & (|fifo_valid))
          ch5_request_r <= select_request_int;
	end
   always@(posedge sys_clk)
   begin
      if(!sys_rst_n)
	      ch6_request_r <= 2'b00;
      else if(ch6_req_done)
	      ch6_request_r <= 2'b00;
      else if(ch6_grant_ok_r & (|fifo_valid))
          ch6_request_r <= select_request_int;
	end
	  
  //数据传递至ch1
   always@(posedge sys_clk)
   begin
      if(!sys_rst_n)
      begin
      //-----------------------------------------	
          ch1_initial;
      //-----------------------------------------	
      end
      else if(ch1_eof_i)
      begin
      //-----------------------------------------	
          ch1_initial;
      //-----------------------------------------	
      end
      else if(ch1_grant_ok_r & (|fifo_valid))
      begin
      //-----------------------------------------	
          //ch1_request_r         <= select_request_int;
          ch1_pos_1st_r         <= select_pos_1st_int;
          ch1_pos_2nd_r         <= select_pos_2nd_int;
          ch1_src_type_r        <= select_src_type_int;
          ch1_start_addr_r      <= select_start_addr_int;
          ch1_data_length_r     <= select_data_length_int;
          ch1_2nd_addr_burst_r  <= select_2nd_addr_burst_int;
          ch1_column_num_2nd_r  <= select_column_num_2nd_int;
          
          ch1_broadcast_r     <= select_broadcast_int;    
          ch1_pos0_1st_r      <= select_pos0_1st_int;     
          ch1_pos1_1st_r      <= select_pos1_1st_int;     
          ch1_pos2_1st_r      <= select_pos2_1st_int;     
          ch1_pos3_1st_r      <= select_pos3_1st_int;     
          ch1_pos4_1st_r      <= select_pos4_1st_int;     
          ch1_pos5_1st_r      <= select_pos5_1st_int;     
          ch1_pos6_1st_r      <= select_pos6_1st_int;     
          ch1_pos7_1st_r      <= select_pos7_1st_int;     
          ch1_pos0_src_type_r <= select_pos0_src_type_int;
          ch1_pos1_src_type_r <= select_pos1_src_type_int;
          ch1_pos2_src_type_r <= select_pos2_src_type_int;
          ch1_pos3_src_type_r <= select_pos3_src_type_int;
          ch1_pos4_src_type_r <= select_pos4_src_type_int;
          ch1_pos5_src_type_r <= select_pos5_src_type_int;
          ch1_pos6_src_type_r <= select_pos6_src_type_int;
          ch1_pos7_src_type_r <= select_pos7_src_type_int;
                                                          
          ch1_release_r       <= select_release_int;      
          ch1_VR_id_r         <= select_VR_id_int;   
          ch1_VR_FR_r         <= select_VR_FR_int;		  
          ch1_channel_ID_r    <= select_ID_int;           
      //-----------------------------------------	
      end
   end
   
   always@(posedge sys_clk)
   begin
      if(!sys_rst_n)
      begin
      //-----------------------------------------	
          ch2_initial;
      //-----------------------------------------	
      end
      else if(ch2_eof_i)
      begin
      //-----------------------------------------	
          ch2_initial;
      //-----------------------------------------	
      end
      else if(ch2_grant_ok_r & (|fifo_valid))
      begin
      //-----------------------------------------	
          //ch2_request_r         <= select_request_int;
          ch2_pos_1st_r         <= select_pos_1st_int;
          ch2_pos_2nd_r         <= select_pos_2nd_int;
          ch2_src_type_r        <= select_src_type_int;
          ch2_start_addr_r      <= select_start_addr_int;
          ch2_data_length_r     <= select_data_length_int;
          ch2_2nd_addr_burst_r  <= select_2nd_addr_burst_int;
          ch2_column_num_2nd_r  <= select_column_num_2nd_int;
          
          ch2_broadcast_r     <= select_broadcast_int;    
          ch2_pos0_1st_r      <= select_pos0_1st_int;     
          ch2_pos1_1st_r      <= select_pos1_1st_int;     
          ch2_pos2_1st_r      <= select_pos2_1st_int;     
          ch2_pos3_1st_r      <= select_pos3_1st_int;     
          ch2_pos4_1st_r      <= select_pos4_1st_int;     
          ch2_pos5_1st_r      <= select_pos5_1st_int;     
          ch2_pos6_1st_r      <= select_pos6_1st_int;     
          ch2_pos7_1st_r      <= select_pos7_1st_int;     
          ch2_pos0_src_type_r <= select_pos0_src_type_int;
          ch2_pos1_src_type_r <= select_pos1_src_type_int;
          ch2_pos2_src_type_r <= select_pos2_src_type_int;
          ch2_pos3_src_type_r <= select_pos3_src_type_int;
          ch2_pos4_src_type_r <= select_pos4_src_type_int;
          ch2_pos5_src_type_r <= select_pos5_src_type_int;
          ch2_pos6_src_type_r <= select_pos6_src_type_int;
          ch2_pos7_src_type_r <= select_pos7_src_type_int;

          ch2_release_r       <= select_release_int;      
          ch2_VR_id_r         <= select_VR_id_int;        
          ch2_VR_FR_r         <= select_VR_FR_int;		  
          ch2_channel_ID_r    <= select_ID_int;           
      //-----------------------------------------	
      end
   end
   
   always@(posedge sys_clk)
   begin
      if(!sys_rst_n)
      begin
      //-----------------------------------------	
          ch3_initial;
      //-----------------------------------------	
      end
      else if(ch3_eof_i)
      begin
      //-----------------------------------------	
          ch3_initial;
      //-----------------------------------------	
      end
      else if(ch3_grant_ok_r & (|fifo_valid))
      begin
      //-----------------------------------------	
          //ch3_request_r         <= select_request_int;
          ch3_pos_1st_r         <= select_pos_1st_int;
          ch3_pos_2nd_r         <= select_pos_2nd_int;
          ch3_src_type_r        <= select_src_type_int;
          ch3_start_addr_r      <= select_start_addr_int;
          ch3_data_length_r     <= select_data_length_int;
          ch3_2nd_addr_burst_r  <= select_2nd_addr_burst_int;
          ch3_column_num_2nd_r  <= select_column_num_2nd_int;
          
          ch3_broadcast_r     <= select_broadcast_int;    
          ch3_pos0_1st_r      <= select_pos0_1st_int;     
          ch3_pos1_1st_r      <= select_pos1_1st_int;     
          ch3_pos2_1st_r      <= select_pos2_1st_int;     
          ch3_pos3_1st_r      <= select_pos3_1st_int;     
          ch3_pos4_1st_r      <= select_pos4_1st_int;     
          ch3_pos5_1st_r      <= select_pos5_1st_int;     
          ch3_pos6_1st_r      <= select_pos6_1st_int;     
          ch3_pos7_1st_r      <= select_pos7_1st_int;     
          ch3_pos0_src_type_r <= select_pos0_src_type_int;
          ch3_pos1_src_type_r <= select_pos1_src_type_int;
          ch3_pos2_src_type_r <= select_pos2_src_type_int;
          ch3_pos3_src_type_r <= select_pos3_src_type_int;
          ch3_pos4_src_type_r <= select_pos4_src_type_int;
          ch3_pos5_src_type_r <= select_pos5_src_type_int;
          ch3_pos6_src_type_r <= select_pos6_src_type_int;
          ch3_pos7_src_type_r <= select_pos7_src_type_int;

          ch3_release_r       <= select_release_int;      
          ch3_VR_id_r         <= select_VR_id_int;        
          ch3_VR_FR_r         <= select_VR_FR_int;		  
          ch3_channel_ID_r    <= select_ID_int;           
      //-----------------------------------------	
      end
   end
   
   always@(posedge sys_clk)
   begin
      if(!sys_rst_n)
      begin
      //-----------------------------------------	
          ch4_initial;
      //-----------------------------------------	
      end
      else if(ch4_eof_i)
      begin
      //-----------------------------------------	
          ch4_initial;
      //-----------------------------------------	
      end
      else if(ch4_grant_ok_r & (|fifo_valid))
      begin
      //-----------------------------------------	
          //ch4_request_r         <= select_request_int;
          ch4_pos_1st_r         <= select_pos_1st_int;
          ch4_pos_2nd_r         <= select_pos_2nd_int;
          ch4_src_type_r        <= select_src_type_int;
          ch4_start_addr_r      <= select_start_addr_int;
          ch4_data_length_r     <= select_data_length_int;
          ch4_2nd_addr_burst_r  <= select_2nd_addr_burst_int;
          ch4_column_num_2nd_r  <= select_column_num_2nd_int;
          
          ch4_broadcast_r     <= select_broadcast_int;    
          ch4_pos0_1st_r      <= select_pos0_1st_int;     
          ch4_pos1_1st_r      <= select_pos1_1st_int;     
          ch4_pos2_1st_r      <= select_pos2_1st_int;     
          ch4_pos3_1st_r      <= select_pos3_1st_int;     
          ch4_pos4_1st_r      <= select_pos4_1st_int;     
          ch4_pos5_1st_r      <= select_pos5_1st_int;     
          ch4_pos6_1st_r      <= select_pos6_1st_int;     
          ch4_pos7_1st_r      <= select_pos7_1st_int;     
          ch4_pos0_src_type_r <= select_pos0_src_type_int;
          ch4_pos1_src_type_r <= select_pos1_src_type_int;
          ch4_pos2_src_type_r <= select_pos2_src_type_int;
          ch4_pos3_src_type_r <= select_pos3_src_type_int;
          ch4_pos4_src_type_r <= select_pos4_src_type_int;
          ch4_pos5_src_type_r <= select_pos5_src_type_int;
          ch4_pos6_src_type_r <= select_pos6_src_type_int;
          ch4_pos7_src_type_r <= select_pos7_src_type_int;

          ch4_release_r       <= select_release_int;      
          ch4_VR_id_r         <= select_VR_id_int;       
          ch4_VR_FR_r         <= select_VR_FR_int;		   
          ch4_channel_ID_r    <= select_ID_int;           
      //-----------------------------------------	
      end
   end
   
   always@(posedge sys_clk)
   begin
      if(!sys_rst_n)
      begin
      //-----------------------------------------	
          ch5_initial;
      //-----------------------------------------	
      end
      else if(ch5_eof_i)
      begin
      //-----------------------------------------	
          ch5_initial;
      //-----------------------------------------	
      end
      else if(ch5_grant_ok_r & (|fifo_valid))
      begin
      //-----------------------------------------	
          //ch5_request_r         <= select_request_int;
          ch5_pos_1st_r         <= select_pos_1st_int;
          ch5_pos_2nd_r         <= select_pos_2nd_int;
          ch5_src_type_r        <= select_src_type_int;
          ch5_start_addr_r      <= select_start_addr_int;
          ch5_data_length_r     <= select_data_length_int;
          ch5_2nd_addr_burst_r  <= select_2nd_addr_burst_int;
          ch5_column_num_2nd_r  <= select_column_num_2nd_int;
          
          ch5_broadcast_r     <= select_broadcast_int;    
          ch5_pos0_1st_r      <= select_pos0_1st_int;     
          ch5_pos1_1st_r      <= select_pos1_1st_int;     
          ch5_pos2_1st_r      <= select_pos2_1st_int;     
          ch5_pos3_1st_r      <= select_pos3_1st_int;     
          ch5_pos4_1st_r      <= select_pos4_1st_int;     
          ch5_pos5_1st_r      <= select_pos5_1st_int;     
          ch5_pos6_1st_r      <= select_pos6_1st_int;     
          ch5_pos7_1st_r      <= select_pos7_1st_int;     
          ch5_pos0_src_type_r <= select_pos0_src_type_int;
          ch5_pos1_src_type_r <= select_pos1_src_type_int;
          ch5_pos2_src_type_r <= select_pos2_src_type_int;
          ch5_pos3_src_type_r <= select_pos3_src_type_int;
          ch5_pos4_src_type_r <= select_pos4_src_type_int;
          ch5_pos5_src_type_r <= select_pos5_src_type_int;
          ch5_pos6_src_type_r <= select_pos6_src_type_int;
          ch5_pos7_src_type_r <= select_pos7_src_type_int;

          ch5_release_r       <= select_release_int;      
          ch5_VR_id_r         <= select_VR_id_int;        
          ch5_VR_FR_r         <= select_VR_FR_int;		  
          ch5_channel_ID_r    <= select_ID_int;           
      //-----------------------------------------	
      end
   end
   
   always@(posedge sys_clk)
   begin
      if(!sys_rst_n)
      begin
      //-----------------------------------------	
          ch6_initial;
      //-----------------------------------------	
      end
      else if(ch6_eof_i)
      begin
      //-----------------------------------------	
          ch6_initial;
      //-----------------------------------------	
      end
      else if(ch6_grant_ok_r & (|fifo_valid))
      begin
      //-----------------------------------------	
          //ch6_request_r         <= select_request_int;
          ch6_pos_1st_r         <= select_pos_1st_int;
          ch6_pos_2nd_r         <= select_pos_2nd_int;
          ch6_src_type_r        <= select_src_type_int;
          ch6_start_addr_r      <= select_start_addr_int;
          ch6_data_length_r     <= select_data_length_int;
          ch6_2nd_addr_burst_r  <= select_2nd_addr_burst_int;
          ch6_column_num_2nd_r  <= select_column_num_2nd_int;
          
          ch6_broadcast_r     <= select_broadcast_int;    
          ch6_pos0_1st_r      <= select_pos0_1st_int;     
          ch6_pos1_1st_r      <= select_pos1_1st_int;     
          ch6_pos2_1st_r      <= select_pos2_1st_int;     
          ch6_pos3_1st_r      <= select_pos3_1st_int;     
          ch6_pos4_1st_r      <= select_pos4_1st_int;     
          ch6_pos5_1st_r      <= select_pos5_1st_int;     
          ch6_pos6_1st_r      <= select_pos6_1st_int;     
          ch6_pos7_1st_r      <= select_pos7_1st_int;     
          ch6_pos0_src_type_r <= select_pos0_src_type_int;
          ch6_pos1_src_type_r <= select_pos1_src_type_int;
          ch6_pos2_src_type_r <= select_pos2_src_type_int;
          ch6_pos3_src_type_r <= select_pos3_src_type_int;
          ch6_pos4_src_type_r <= select_pos4_src_type_int;
          ch6_pos5_src_type_r <= select_pos5_src_type_int;
          ch6_pos6_src_type_r <= select_pos6_src_type_int;
          ch6_pos7_src_type_r <= select_pos7_src_type_int;

          ch6_release_r       <= select_release_int;      
          ch6_VR_id_r         <= select_VR_id_int;        
          ch6_VR_FR_r         <= select_VR_FR_int;		  
          ch6_channel_ID_r    <= select_ID_int;           
      //-----------------------------------------	
      end
   end


    //------------------------------------------------
    // TASK declaration ---------in order to reset
    //------------------------------------------------
task  ch1_initial;
  begin
      //ch1_request_r         <= 2'b0;
      ch1_pos_1st_r         <= 8'b0;
      ch1_pos_2nd_r         <= 3'b0;
      ch1_src_type_r        <= 2'b0;
      ch1_start_addr_r      <= 30'b0;
      ch1_data_length_r     <= 30'b0;
      ch1_2nd_addr_burst_r  <= 30'b0;
      ch1_column_num_2nd_r  <= 30'b0;
      
      ch1_broadcast_r     <= 1'b0;
      ch1_pos0_1st_r      <= 8'b0;
      ch1_pos1_1st_r      <= 8'b0;
      ch1_pos2_1st_r      <= 8'b0;
      ch1_pos3_1st_r      <= 8'b0;
      ch1_pos4_1st_r      <= 8'b0;
      ch1_pos5_1st_r      <= 8'b0;
      ch1_pos6_1st_r      <= 8'b0;
      ch1_pos7_1st_r      <= 8'b0;
      ch1_pos0_src_type_r <= 2'b0;
      ch1_pos1_src_type_r <= 2'b0;
      ch1_pos2_src_type_r <= 2'b0;
      ch1_pos3_src_type_r <= 2'b0;
      ch1_pos4_src_type_r <= 2'b0;
      ch1_pos5_src_type_r <= 2'b0;
      ch1_pos6_src_type_r <= 2'b0;
      ch1_pos7_src_type_r <= 2'b0;

      ch1_release_r       <= 1'b0;
      ch1_VR_id_r         <= 9'b0;
	  ch1_VR_FR_r         <= 3'b0;
      ch1_channel_ID_r    <= 5'b0;
  end
endtask

task  ch2_initial;
  begin
      //ch2_request_r         <= 2'b0;
      ch2_pos_1st_r         <= 8'b0;
      ch2_pos_2nd_r         <= 3'b0;
      ch2_src_type_r        <= 2'b0;
      ch2_start_addr_r      <= 30'b0;
      ch2_data_length_r     <= 30'b0;
      ch2_2nd_addr_burst_r  <= 30'b0;
      ch2_column_num_2nd_r  <= 30'b0;

      ch2_broadcast_r     <= 1'b0;
      ch2_pos0_1st_r      <= 8'b0;
      ch2_pos1_1st_r      <= 8'b0;
      ch2_pos2_1st_r      <= 8'b0;
      ch2_pos3_1st_r      <= 8'b0;
      ch2_pos4_1st_r      <= 8'b0;
      ch2_pos5_1st_r      <= 8'b0;
      ch2_pos6_1st_r      <= 8'b0;
      ch2_pos7_1st_r      <= 8'b0;
      ch2_pos0_src_type_r <= 2'b0;
      ch2_pos1_src_type_r <= 2'b0;
      ch2_pos2_src_type_r <= 2'b0;
      ch2_pos3_src_type_r <= 2'b0;
      ch2_pos4_src_type_r <= 2'b0;
      ch2_pos5_src_type_r <= 2'b0;
      ch2_pos6_src_type_r <= 2'b0;
      ch2_pos7_src_type_r <= 2'b0;

      ch2_release_r       <= 1'b0;
      ch2_VR_id_r         <= 9'b0;
	  ch2_VR_FR_r         <= 3'b0;
      ch2_channel_ID_r    <= 5'b0;
  end
endtask

task  ch3_initial;
  begin
      //ch3_request_r         <= 2'b0;
      ch3_pos_1st_r         <= 8'b0;
      ch3_pos_2nd_r         <= 3'b0;
      ch3_src_type_r        <= 2'b0;
      ch3_start_addr_r      <= 30'b0;
      ch3_data_length_r     <= 30'b0;
      ch3_2nd_addr_burst_r  <= 30'b0;
      ch3_column_num_2nd_r  <= 30'b0;

      ch3_broadcast_r     <= 1'b0;
      ch3_pos0_1st_r      <= 8'b0;
      ch3_pos1_1st_r      <= 8'b0;
      ch3_pos2_1st_r      <= 8'b0;
      ch3_pos3_1st_r      <= 8'b0;
      ch3_pos4_1st_r      <= 8'b0;
      ch3_pos5_1st_r      <= 8'b0;
      ch3_pos6_1st_r      <= 8'b0;
      ch3_pos7_1st_r      <= 8'b0;
      ch3_pos0_src_type_r <= 2'b0;
      ch3_pos1_src_type_r <= 2'b0;
      ch3_pos2_src_type_r <= 2'b0;
      ch3_pos3_src_type_r <= 2'b0;
      ch3_pos4_src_type_r <= 2'b0;
      ch3_pos5_src_type_r <= 2'b0;
      ch3_pos6_src_type_r <= 2'b0;
      ch3_pos7_src_type_r <= 2'b0;

      ch3_release_r       <= 1'b0;
      ch3_VR_id_r         <= 9'b0;
	  ch3_VR_FR_r         <= 3'b0;
      ch3_channel_ID_r    <= 5'b0;
  end
endtask

task  ch4_initial;
  begin
      //ch4_request_r         <= 2'b0;
      ch4_pos_1st_r         <= 8'b0;
      ch4_pos_2nd_r         <= 3'b0;
      ch4_src_type_r        <= 2'b0;
      ch4_start_addr_r      <= 30'b0;
      ch4_data_length_r     <= 30'b0;
      ch4_2nd_addr_burst_r  <= 30'b0;
      ch4_column_num_2nd_r  <= 30'b0;

      ch4_broadcast_r     <= 1'b0;
      ch4_pos0_1st_r      <= 8'b0;
      ch4_pos1_1st_r      <= 8'b0;
      ch4_pos2_1st_r      <= 8'b0;
      ch4_pos3_1st_r      <= 8'b0;
      ch4_pos4_1st_r      <= 8'b0;
      ch4_pos5_1st_r      <= 8'b0;
      ch4_pos6_1st_r      <= 8'b0;
      ch4_pos7_1st_r      <= 8'b0;
      ch4_pos0_src_type_r <= 2'b0;
      ch4_pos1_src_type_r <= 2'b0;
      ch4_pos2_src_type_r <= 2'b0;
      ch4_pos3_src_type_r <= 2'b0;
      ch4_pos4_src_type_r <= 2'b0;
      ch4_pos5_src_type_r <= 2'b0;
      ch4_pos6_src_type_r <= 2'b0;
      ch4_pos7_src_type_r <= 2'b0;

      ch4_release_r       <= 1'b0;
      ch4_VR_id_r         <= 9'b0;
	  ch4_VR_FR_r         <= 3'b0;
      ch4_channel_ID_r    <= 5'b0;
  end
endtask

task  ch5_initial;
  begin
      //ch5_request_r         <= 2'b0;
      ch5_pos_1st_r         <= 8'b0;
      ch5_pos_2nd_r         <= 3'b0;
      ch5_src_type_r        <= 2'b0;
      ch5_start_addr_r      <= 30'b0;
      ch5_data_length_r     <= 30'b0;
      ch5_2nd_addr_burst_r  <= 30'b0;
      ch5_column_num_2nd_r  <= 30'b0;

      ch5_broadcast_r     <= 1'b0;
      ch5_pos0_1st_r      <= 8'b0;
      ch5_pos1_1st_r      <= 8'b0;
      ch5_pos2_1st_r      <= 8'b0;
      ch5_pos3_1st_r      <= 8'b0;
      ch5_pos4_1st_r      <= 8'b0;
      ch5_pos5_1st_r      <= 8'b0;
      ch5_pos6_1st_r      <= 8'b0;
      ch5_pos7_1st_r      <= 8'b0;
      ch5_pos0_src_type_r <= 2'b0;
      ch5_pos1_src_type_r <= 2'b0;
      ch5_pos2_src_type_r <= 2'b0;
      ch5_pos3_src_type_r <= 2'b0;
      ch5_pos4_src_type_r <= 2'b0;
      ch5_pos5_src_type_r <= 2'b0;
      ch5_pos6_src_type_r <= 2'b0;
      ch5_pos7_src_type_r <= 2'b0;

      ch5_release_r       <= 1'b0;
      ch5_VR_id_r         <= 9'b0;
	  ch5_VR_FR_r         <= 3'b0;
      ch5_channel_ID_r    <= 5'b0;
  end
endtask

task  ch6_initial;
  begin
      //ch6_request_r         <= 2'b0;
      ch6_pos_1st_r         <= 8'b0;
      ch6_pos_2nd_r         <= 3'b0;
      ch6_src_type_r        <= 2'b0;
      ch6_start_addr_r      <= 30'b0;
      ch6_data_length_r     <= 30'b0;
      ch6_2nd_addr_burst_r  <= 30'b0;
      ch6_column_num_2nd_r  <= 30'b0;

      ch6_broadcast_r     <= 1'b0;
      ch6_pos0_1st_r      <= 8'b0;
      ch6_pos1_1st_r      <= 8'b0;
      ch6_pos2_1st_r      <= 8'b0;
      ch6_pos3_1st_r      <= 8'b0;
      ch6_pos4_1st_r      <= 8'b0;
      ch6_pos5_1st_r      <= 8'b0;
      ch6_pos6_1st_r      <= 8'b0;
      ch6_pos7_1st_r      <= 8'b0;
      ch6_pos0_src_type_r <= 2'b0;
      ch6_pos1_src_type_r <= 2'b0;
      ch6_pos2_src_type_r <= 2'b0;
      ch6_pos3_src_type_r <= 2'b0;
      ch6_pos4_src_type_r <= 2'b0;
      ch6_pos5_src_type_r <= 2'b0;
      ch6_pos6_src_type_r <= 2'b0;
      ch6_pos7_src_type_r <= 2'b0;

      ch6_release_r       <= 1'b0;
      ch6_VR_id_r         <= 9'b0;
	  ch6_VR_FR_r         <= 3'b0;
      ch6_channel_ID_r    <= 5'b0;
  end
endtask


    //------------------------------------------------
    // OUTPUT-signal connection
    //------------------------------------------------
      
assign   MC_fifo_rd_en          = fifo_rd_en[0];
assign   COP_fifo_rd_en         = fifo_rd_en[1];
assign   channel_fifo_rd_en     = fifo_rd_en[2];

assign   ch1_request_o          = ch1_request_r;
assign   ch1_pos_1st_o          = ch1_pos_1st_r;
assign   ch1_pos_2nd_o          = ch1_pos_2nd_r;
assign   ch1_src_type_o         = ch1_src_type_r;
assign   ch1_start_addr_o       = ch1_start_addr_r;
assign   ch1_data_length_o      = ch1_data_length_r;
assign   ch1_2nd_addr_burst_o   = ch1_2nd_addr_burst_r;
assign   ch1_column_num_2nd_o   = ch1_column_num_2nd_r;

assign   ch1_broadcast_o        = ch1_broadcast_r;
assign   ch1_pos0_1st_o         = ch1_pos0_1st_r;
assign   ch1_pos1_1st_o         = ch1_pos1_1st_r;
assign   ch1_pos2_1st_o         = ch1_pos2_1st_r;
assign   ch1_pos3_1st_o         = ch1_pos3_1st_r;
assign   ch1_pos4_1st_o         = ch1_pos4_1st_r;
assign   ch1_pos5_1st_o         = ch1_pos5_1st_r;
assign   ch1_pos6_1st_o         = ch1_pos6_1st_r;
assign   ch1_pos7_1st_o         = ch1_pos7_1st_r;
assign   ch1_pos0_src_type_o    = ch1_pos0_src_type_r;
assign   ch1_pos1_src_type_o    = ch1_pos1_src_type_r;
assign   ch1_pos2_src_type_o    = ch1_pos2_src_type_r;
assign   ch1_pos3_src_type_o    = ch1_pos3_src_type_r;
assign   ch1_pos4_src_type_o    = ch1_pos4_src_type_r;
assign   ch1_pos5_src_type_o    = ch1_pos5_src_type_r;
assign   ch1_pos6_src_type_o    = ch1_pos6_src_type_r;
assign   ch1_pos7_src_type_o    = ch1_pos7_src_type_r;

assign   ch1_release_o          = ch1_release_r;
assign   ch1_VR_id_o            = ch1_VR_id_r;
assign   ch1_VR_FR_o            = ch1_VR_FR_r;
assign   ch1_channel_ID_o       = ch1_channel_ID_r;

assign   ch2_request_o          = ch2_request_r;
assign   ch2_pos_1st_o          = ch2_pos_1st_r;
assign   ch2_pos_2nd_o          = ch2_pos_2nd_r;
assign   ch2_src_type_o         = ch2_src_type_r;
assign   ch2_start_addr_o       = ch2_start_addr_r;
assign   ch2_data_length_o      = ch2_data_length_r;
assign   ch2_2nd_addr_burst_o   = ch2_2nd_addr_burst_r;
assign   ch2_column_num_2nd_o   = ch2_column_num_2nd_r;

assign   ch2_broadcast_o        = ch2_broadcast_r;
assign   ch2_pos0_1st_o         = ch2_pos0_1st_r;
assign   ch2_pos1_1st_o         = ch2_pos1_1st_r;
assign   ch2_pos2_1st_o         = ch2_pos2_1st_r;
assign   ch2_pos3_1st_o         = ch2_pos3_1st_r;
assign   ch2_pos4_1st_o         = ch2_pos4_1st_r;
assign   ch2_pos5_1st_o         = ch2_pos5_1st_r;
assign   ch2_pos6_1st_o         = ch2_pos6_1st_r;
assign   ch2_pos7_1st_o         = ch2_pos7_1st_r;
assign   ch2_pos0_src_type_o    = ch2_pos0_src_type_r;
assign   ch2_pos1_src_type_o    = ch2_pos1_src_type_r;
assign   ch2_pos2_src_type_o    = ch2_pos2_src_type_r;
assign   ch2_pos3_src_type_o    = ch2_pos3_src_type_r;
assign   ch2_pos4_src_type_o    = ch2_pos4_src_type_r;
assign   ch2_pos5_src_type_o    = ch2_pos5_src_type_r;
assign   ch2_pos6_src_type_o    = ch2_pos6_src_type_r;
assign   ch2_pos7_src_type_o    = ch2_pos7_src_type_r;

assign   ch2_release_o          = ch2_release_r;
assign   ch2_VR_id_o            = ch2_VR_id_r;
assign   ch2_VR_FR_o            = ch2_VR_FR_r;
assign   ch2_channel_ID_o       = ch2_channel_ID_r;

assign   ch3_request_o          = ch3_request_r;
assign   ch3_pos_1st_o          = ch3_pos_1st_r;
assign   ch3_pos_2nd_o          = ch3_pos_2nd_r;
assign   ch3_src_type_o         = ch3_src_type_r;
assign   ch3_start_addr_o       = ch3_start_addr_r;
assign   ch3_data_length_o      = ch3_data_length_r;
assign   ch3_2nd_addr_burst_o   = ch3_2nd_addr_burst_r;
assign   ch3_column_num_2nd_o   = ch3_column_num_2nd_r;

assign   ch3_broadcast_o        = ch3_broadcast_r;
assign   ch3_pos0_1st_o         = ch3_pos0_1st_r;
assign   ch3_pos1_1st_o         = ch3_pos1_1st_r;
assign   ch3_pos2_1st_o         = ch3_pos2_1st_r;
assign   ch3_pos3_1st_o         = ch3_pos3_1st_r;
assign   ch3_pos4_1st_o         = ch3_pos4_1st_r;
assign   ch3_pos5_1st_o         = ch3_pos5_1st_r;
assign   ch3_pos6_1st_o         = ch3_pos6_1st_r;
assign   ch3_pos7_1st_o         = ch3_pos7_1st_r;
assign   ch3_pos0_src_type_o    = ch3_pos0_src_type_r;
assign   ch3_pos1_src_type_o    = ch3_pos1_src_type_r;
assign   ch3_pos2_src_type_o    = ch3_pos2_src_type_r;
assign   ch3_pos3_src_type_o    = ch3_pos3_src_type_r;
assign   ch3_pos4_src_type_o    = ch3_pos4_src_type_r;
assign   ch3_pos5_src_type_o    = ch3_pos5_src_type_r;
assign   ch3_pos6_src_type_o    = ch3_pos6_src_type_r;
assign   ch3_pos7_src_type_o    = ch3_pos7_src_type_r;

assign   ch3_release_o          = ch3_release_r;
assign   ch3_VR_id_o            = ch3_VR_id_r;
assign   ch3_VR_FR_o            = ch3_VR_FR_r;
assign   ch3_channel_ID_o       = ch3_channel_ID_r;

assign   ch4_request_o          = ch4_request_r;
assign   ch4_pos_1st_o          = ch4_pos_1st_r;
assign   ch4_pos_2nd_o          = ch4_pos_2nd_r;
assign   ch4_src_type_o         = ch4_src_type_r;
assign   ch4_start_addr_o       = ch4_start_addr_r;
assign   ch4_data_length_o      = ch4_data_length_r;
assign   ch4_2nd_addr_burst_o   = ch4_2nd_addr_burst_r;
assign   ch4_column_num_2nd_o   = ch4_column_num_2nd_r;

assign   ch4_broadcast_o        = ch4_broadcast_r;
assign   ch4_pos0_1st_o         = ch4_pos0_1st_r;
assign   ch4_pos1_1st_o         = ch4_pos1_1st_r;
assign   ch4_pos2_1st_o         = ch4_pos2_1st_r;
assign   ch4_pos3_1st_o         = ch4_pos3_1st_r;
assign   ch4_pos4_1st_o         = ch4_pos4_1st_r;
assign   ch4_pos5_1st_o         = ch4_pos5_1st_r;
assign   ch4_pos6_1st_o         = ch4_pos6_1st_r;
assign   ch4_pos7_1st_o         = ch4_pos7_1st_r;
assign   ch4_pos0_src_type_o    = ch4_pos0_src_type_r;
assign   ch4_pos1_src_type_o    = ch4_pos1_src_type_r;
assign   ch4_pos2_src_type_o    = ch4_pos2_src_type_r;
assign   ch4_pos3_src_type_o    = ch4_pos3_src_type_r;
assign   ch4_pos4_src_type_o    = ch4_pos4_src_type_r;
assign   ch4_pos5_src_type_o    = ch4_pos5_src_type_r;
assign   ch4_pos6_src_type_o    = ch4_pos6_src_type_r;
assign   ch4_pos7_src_type_o    = ch4_pos7_src_type_r;

assign   ch4_release_o          = ch4_release_r;
assign   ch4_VR_id_o            = ch4_VR_id_r;
assign   ch4_VR_FR_o            = ch4_VR_FR_r;
assign   ch4_channel_ID_o       = ch4_channel_ID_r;

assign   ch5_request_o          = ch5_request_r;
assign   ch5_pos_1st_o          = ch5_pos_1st_r;
assign   ch5_pos_2nd_o          = ch5_pos_2nd_r;
assign   ch5_src_type_o         = ch5_src_type_r;
assign   ch5_start_addr_o       = ch5_start_addr_r;
assign   ch5_data_length_o      = ch5_data_length_r;
assign   ch5_2nd_addr_burst_o   = ch5_2nd_addr_burst_r;
assign   ch5_column_num_2nd_o   = ch5_column_num_2nd_r;

assign   ch5_broadcast_o        = ch5_broadcast_r;
assign   ch5_pos0_1st_o         = ch5_pos0_1st_r;
assign   ch5_pos1_1st_o         = ch5_pos1_1st_r;
assign   ch5_pos2_1st_o         = ch5_pos2_1st_r;
assign   ch5_pos3_1st_o         = ch5_pos3_1st_r;
assign   ch5_pos4_1st_o         = ch5_pos4_1st_r;
assign   ch5_pos5_1st_o         = ch5_pos5_1st_r;
assign   ch5_pos6_1st_o         = ch5_pos6_1st_r;
assign   ch5_pos7_1st_o         = ch5_pos7_1st_r;
assign   ch5_pos0_src_type_o    = ch5_pos0_src_type_r;
assign   ch5_pos1_src_type_o    = ch5_pos1_src_type_r;
assign   ch5_pos2_src_type_o    = ch5_pos2_src_type_r;
assign   ch5_pos3_src_type_o    = ch5_pos3_src_type_r;
assign   ch5_pos4_src_type_o    = ch5_pos4_src_type_r;
assign   ch5_pos5_src_type_o    = ch5_pos5_src_type_r;
assign   ch5_pos6_src_type_o    = ch5_pos6_src_type_r;
assign   ch5_pos7_src_type_o    = ch5_pos7_src_type_r;

assign   ch5_release_o          = ch5_release_r;
assign   ch5_VR_id_o            = ch5_VR_id_r;
assign   ch5_VR_FR_o            = ch5_VR_FR_r;
assign   ch5_channel_ID_o       = ch5_channel_ID_r;

assign   ch6_request_o          = ch6_request_r;
assign   ch6_pos_1st_o          = ch6_pos_1st_r;
assign   ch6_pos_2nd_o          = ch6_pos_2nd_r;
assign   ch6_src_type_o         = ch6_src_type_r;
assign   ch6_start_addr_o       = ch6_start_addr_r;
assign   ch6_data_length_o      = ch6_data_length_r;
assign   ch6_2nd_addr_burst_o   = ch6_2nd_addr_burst_r;
assign   ch6_column_num_2nd_o   = ch6_column_num_2nd_r;

assign   ch6_broadcast_o        = ch6_broadcast_r;
assign   ch6_pos0_1st_o         = ch6_pos0_1st_r;
assign   ch6_pos1_1st_o         = ch6_pos1_1st_r;
assign   ch6_pos2_1st_o         = ch6_pos2_1st_r;
assign   ch6_pos3_1st_o         = ch6_pos3_1st_r;
assign   ch6_pos4_1st_o         = ch6_pos4_1st_r;
assign   ch6_pos5_1st_o         = ch6_pos5_1st_r;
assign   ch6_pos6_1st_o         = ch6_pos6_1st_r;
assign   ch6_pos7_1st_o         = ch6_pos7_1st_r;
assign   ch6_pos0_src_type_o    = ch6_pos0_src_type_r;
assign   ch6_pos1_src_type_o    = ch6_pos1_src_type_r;
assign   ch6_pos2_src_type_o    = ch6_pos2_src_type_r;
assign   ch6_pos3_src_type_o    = ch6_pos3_src_type_r;
assign   ch6_pos4_src_type_o    = ch6_pos4_src_type_r;
assign   ch6_pos5_src_type_o    = ch6_pos5_src_type_r;
assign   ch6_pos6_src_type_o    = ch6_pos6_src_type_r;
assign   ch6_pos7_src_type_o    = ch6_pos7_src_type_r;

assign   ch6_release_o          = ch6_release_r;
assign   ch6_VR_id_o            = ch6_VR_id_r;
assign   ch6_VR_FR_o            = ch6_VR_FR_r;
assign   ch6_channel_ID_o       = ch6_channel_ID_r;
    
endmodule
