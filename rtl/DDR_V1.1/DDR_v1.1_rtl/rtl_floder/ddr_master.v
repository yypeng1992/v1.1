`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:04:05 09/07/2016 
// Design Name: 
// Module Name:    ddr_master 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ddr_master(
          sys_clk,
          sys_rst_n,
          
		    phy_init_done_i,
//---------status_port---------//
        status_idle_i,
        status_ack_o,
        status_ack_type_o,
        status_VR_id_o,
		status_VR_FR_o,
        status_channel_ID_o,
        status_pos_1st_o,
        status_pos_2nd_o,
        status_src_type_o,
        
        
//---------地址通道一侧---------//
  ach01_idle_o,           ach02_idle_o,           ach03_idle_o,           ach04_idle_o,           ach05_idle_o,           ach06_idle_o,          
  ach01_eof_o,            ach02_eof_o,            ach03_eof_o,            ach04_eof_o,            ach05_eof_o,            ach06_eof_o,           
  ach01_request_i,        ach02_request_i,        ach03_request_i,        ach04_request_i,        ach05_request_i,        ach06_request_i,       
  ach01_pos_1st_i,        ach02_pos_1st_i,        ach03_pos_1st_i,        ach04_pos_1st_i,        ach05_pos_1st_i,        ach06_pos_1st_i,       
  ach01_pos_2nd_i,        ach02_pos_2nd_i,        ach03_pos_2nd_i,        ach04_pos_2nd_i,        ach05_pos_2nd_i,        ach06_pos_2nd_i,       
  ach01_src_type_i,       ach02_src_type_i,       ach03_src_type_i,       ach04_src_type_i,       ach05_src_type_i,       ach06_src_type_i,       
  ach01_start_addr_i,     ach02_start_addr_i,     ach03_start_addr_i,     ach04_start_addr_i,     ach05_start_addr_i,     ach06_start_addr_i,    
  ach01_data_length_i,    ach02_data_length_i,    ach03_data_length_i,    ach04_data_length_i,    ach05_data_length_i,    ach06_data_length_i,   
  ach01_2nd_addr_burst_i, ach02_2nd_addr_burst_i, ach03_2nd_addr_burst_i, ach04_2nd_addr_burst_i, ach05_2nd_addr_burst_i, ach06_2nd_addr_burst_i,
  ach01_column_num_2nd_i, ach02_column_num_2nd_i, ach03_column_num_2nd_i, ach04_column_num_2nd_i, ach05_column_num_2nd_i, ach06_column_num_2nd_i,

  ach01_broadcast_i,      ach02_broadcast_i,      ach03_broadcast_i,      ach04_broadcast_i,      ach05_broadcast_i,      ach06_broadcast_i,     
  ach01_pos0_1st_i,       ach02_pos0_1st_i,       ach03_pos0_1st_i,       ach04_pos0_1st_i,       ach05_pos0_1st_i,       ach06_pos0_1st_i,      
  ach01_pos1_1st_i,       ach02_pos1_1st_i,       ach03_pos1_1st_i,       ach04_pos1_1st_i,       ach05_pos1_1st_i,       ach06_pos1_1st_i,      
  ach01_pos2_1st_i,       ach02_pos2_1st_i,       ach03_pos2_1st_i,       ach04_pos2_1st_i,       ach05_pos2_1st_i,       ach06_pos2_1st_i,      
  ach01_pos3_1st_i,       ach02_pos3_1st_i,       ach03_pos3_1st_i,       ach04_pos3_1st_i,       ach05_pos3_1st_i,       ach06_pos3_1st_i,      
  ach01_pos4_1st_i,       ach02_pos4_1st_i,       ach03_pos4_1st_i,       ach04_pos4_1st_i,       ach05_pos4_1st_i,       ach06_pos4_1st_i,      
  ach01_pos5_1st_i,       ach02_pos5_1st_i,       ach03_pos5_1st_i,       ach04_pos5_1st_i,       ach05_pos5_1st_i,       ach06_pos5_1st_i,      
  ach01_pos6_1st_i,       ach02_pos6_1st_i,       ach03_pos6_1st_i,       ach04_pos6_1st_i,       ach05_pos6_1st_i,       ach06_pos6_1st_i,      
  ach01_pos7_1st_i,       ach02_pos7_1st_i,       ach03_pos7_1st_i,       ach04_pos7_1st_i,       ach05_pos7_1st_i,       ach06_pos7_1st_i,      
  ach01_pos0_src_type_i,  ach02_pos0_src_type_i,  ach03_pos0_src_type_i,  ach04_pos0_src_type_i,  ach05_pos0_src_type_i,  ach06_pos0_src_type_i, 
  ach01_pos1_src_type_i,  ach02_pos1_src_type_i,  ach03_pos1_src_type_i,  ach04_pos1_src_type_i,  ach05_pos1_src_type_i,  ach06_pos1_src_type_i, 
  ach01_pos2_src_type_i,  ach02_pos2_src_type_i,  ach03_pos2_src_type_i,  ach04_pos2_src_type_i,  ach05_pos2_src_type_i,  ach06_pos2_src_type_i, 
  ach01_pos3_src_type_i,  ach02_pos3_src_type_i,  ach03_pos3_src_type_i,  ach04_pos3_src_type_i,  ach05_pos3_src_type_i,  ach06_pos3_src_type_i, 
  ach01_pos4_src_type_i,  ach02_pos4_src_type_i,  ach03_pos4_src_type_i,  ach04_pos4_src_type_i,  ach05_pos4_src_type_i,  ach06_pos4_src_type_i, 
  ach01_pos5_src_type_i,  ach02_pos5_src_type_i,  ach03_pos5_src_type_i,  ach04_pos5_src_type_i,  ach05_pos5_src_type_i,  ach06_pos5_src_type_i, 
  ach01_pos6_src_type_i,  ach02_pos6_src_type_i,  ach03_pos6_src_type_i,  ach04_pos6_src_type_i,  ach05_pos6_src_type_i,  ach06_pos6_src_type_i, 
  ach01_pos7_src_type_i,  ach02_pos7_src_type_i,  ach03_pos7_src_type_i,  ach04_pos7_src_type_i,  ach05_pos7_src_type_i,  ach06_pos7_src_type_i, 

  ach01_release_i,        ach02_release_i,        ach03_release_i,        ach04_release_i,        ach05_release_i,        ach06_release_i,       
  ach01_VR_id_i,          ach02_VR_id_i,          ach03_VR_id_i,          ach04_VR_id_i,          ach05_VR_id_i,          ach06_VR_id_i,         
  ach01_VR_FR_i,          ach02_VR_FR_i,          ach03_VR_FR_i,          ach04_VR_FR_i,          ach05_VR_FR_i,          ach06_VR_FR_i,          
  ach01_channel_ID_i,     ach02_channel_ID_i,     ach03_channel_ID_i,     ach04_channel_ID_i,     ach05_channel_ID_i,     ach06_channel_ID_i,    
    
//---------pcc_crossbar--------//
  dch01_ip_data_i,        dch02_ip_data_i,        dch03_ip_data_i,        dch04_ip_data_i,        dch05_ip_data_i,        dch06_ip_data_i,           
  dch01_ip_fwd_i,         dch02_ip_fwd_i,         dch03_ip_fwd_i,         dch04_ip_fwd_i,         dch05_ip_fwd_i,         dch06_ip_fwd_i,            
  dch01_ip_stb_i,         dch02_ip_stb_i,         dch03_ip_stb_i,         dch04_ip_stb_i,         dch05_ip_stb_i,         dch06_ip_stb_i,            
  dch01_ip_fail_o,        dch02_ip_fail_o,        dch03_ip_fail_o,        dch04_ip_fail_o,        dch05_ip_fail_o,        dch06_ip_fail_o,           
  dch01_ip_pack_o,        dch02_ip_pack_o,        dch03_ip_pack_o,        dch04_ip_pack_o,        dch05_ip_pack_o,        dch06_ip_pack_o,           
  dch01_ip_suspend_o,     dch02_ip_suspend_o,     dch03_ip_suspend_o,     dch04_ip_suspend_o,     dch05_ip_suspend_o,     dch06_ip_suspend_o,        
  dch01_ip_cancel_o,      dch02_ip_cancel_o,      dch03_ip_cancel_o,      dch04_ip_cancel_o,      dch05_ip_cancel_o,      dch06_ip_cancel_o,         

  dch01_op_fail_i,        dch02_op_fail_i,        dch03_op_fail_i,        dch04_op_fail_i,        dch05_op_fail_i,        dch06_op_fail_i,           
  dch01_op_pack_i,        dch02_op_pack_i,        dch03_op_pack_i,        dch04_op_pack_i,        dch05_op_pack_i,        dch06_op_pack_i,            
  dch01_op_suspend_i,     dch02_op_suspend_i,     dch03_op_suspend_i,     dch04_op_suspend_i,     dch05_op_suspend_i,     dch06_op_suspend_i,        
  dch01_op_cancel_i,      dch02_op_cancel_i,      dch03_op_cancel_i,      dch04_op_cancel_i,      dch05_op_cancel_i,      dch06_op_cancel_i,         
  dch01_op_data_o,        dch02_op_data_o,        dch03_op_data_o,        dch04_op_data_o,        dch05_op_data_o,        dch06_op_data_o,           
  dch01_op_fwd_o,         dch02_op_fwd_o,         dch03_op_fwd_o,         dch04_op_fwd_o,         dch05_op_fwd_o,         dch06_op_fwd_o,            
  dch01_op_stb_o,         dch02_op_stb_o,         dch03_op_stb_o,         dch04_op_stb_o,         dch05_op_stb_o,         dch06_op_stb_o,            

  dch01_pos_1st_rd,       dch02_pos_1st_rd,       dch03_pos_1st_rd,       dch04_pos_1st_rd,       dch05_pos_1st_rd,       dch06_pos_1st_rd,          
  dch01_pos_1st_wr,       dch02_pos_1st_wr,       dch03_pos_1st_wr,       dch04_pos_1st_wr,       dch05_pos_1st_wr,       dch06_pos_1st_wr,          
    
//--------broadcast_crossbar-------//
  broad01_grant_i,        broad02_grant_i,        broad03_grant_i,        broad04_grant_i,        broad05_grant_i,        broad06_grant_i,        
  broad01_link_o,         broad02_link_o,         broad03_link_o,         broad04_link_o,         broad05_link_o,         broad06_link_o,         
  broad01_fwd_o,          broad02_fwd_o,          broad03_fwd_o,          broad04_fwd_o,          broad05_fwd_o,          broad06_fwd_o,          
  broad01_data_o,         broad02_data_o,         broad03_data_o,         broad04_data_o,         broad05_data_o,         broad06_data_o,         
    
//------------ddr_app----------//
  ch01_req_rd_o,          ch02_req_rd_o,          ch03_req_rd_o,          ch04_req_rd_o,          ch05_req_rd_o,          ch06_req_rd_o,          
  ch01_rd_addr_en_i,      ch02_rd_addr_en_i,      ch03_rd_addr_en_i,      ch04_rd_addr_en_i,      ch05_rd_addr_en_i,      ch06_rd_addr_en_i,      
  ch01_wr_addr_en_i,      ch02_wr_addr_en_i,      ch03_wr_addr_en_i,      ch04_wr_addr_en_i,      ch05_wr_addr_en_i,      ch06_wr_addr_en_i,      
  ch01_address_o,         ch02_address_o,         ch03_address_o,         ch04_address_o,         ch05_address_o,         ch06_address_o,

//-------------DFS---------------//
  RD01_DFS_wr_en,         RD02_DFS_wr_en,         RD03_DFS_wr_en,         RD04_DFS_wr_en,         RD05_DFS_wr_en,         RD06_DFS_wr_en,         
  RD01_DFS_din,           RD02_DFS_din,           RD03_DFS_din,           RD04_DFS_din,           RD05_DFS_din,           RD06_DFS_din,           
  RD01_DFS_full,          RD02_DFS_full,          RD03_DFS_full,          RD04_DFS_full,          RD05_DFS_full,          RD06_DFS_full,          
  RD01_DFS_wr_count,      RD02_DFS_wr_count,      RD03_DFS_wr_count,      RD04_DFS_wr_count,      RD05_DFS_wr_count,      RD06_DFS_wr_count,      
  WR01_DFS_rd_en,         WR02_DFS_rd_en,         WR03_DFS_rd_en,         WR04_DFS_rd_en,         WR05_DFS_rd_en,         WR06_DFS_rd_en,         
  WR01_DFS_dout,          WR02_DFS_dout,          WR03_DFS_dout,          WR04_DFS_dout,          WR05_DFS_dout,          WR06_DFS_dout,          
  WR01_DFS_valid,         WR02_DFS_valid,         WR03_DFS_valid,         WR04_DFS_valid,         WR05_DFS_valid,         WR06_DFS_valid,         
  WR01_DFS_empty,         WR02_DFS_empty,         WR03_DFS_empty,         WR04_DFS_empty,         WR05_DFS_empty,         WR06_DFS_empty
    );
  
    
    //------------------------------------------------
    // I/O-PORT declaration
    //------------------------------------------------

      input           sys_clk;
      input           sys_rst_n;
      input           phy_init_done_i;
      

//---------地址通道一侧---------//
output      ach01_idle_o,           ach02_idle_o,           ach03_idle_o,           ach04_idle_o,           ach05_idle_o,           ach06_idle_o;
output      ach01_eof_o,            ach02_eof_o,            ach03_eof_o,            ach04_eof_o,            ach05_eof_o,            ach06_eof_o;
input[ 1:0] ach01_request_i,        ach02_request_i,        ach03_request_i,        ach04_request_i,        ach05_request_i,        ach06_request_i;
input[ 7:0] ach01_pos_1st_i,        ach02_pos_1st_i,        ach03_pos_1st_i,        ach04_pos_1st_i,        ach05_pos_1st_i,        ach06_pos_1st_i;
input[ 2:0] ach01_pos_2nd_i,        ach02_pos_2nd_i,        ach03_pos_2nd_i,        ach04_pos_2nd_i,        ach05_pos_2nd_i,        ach06_pos_2nd_i;
input[ 1:0] ach01_src_type_i,       ach02_src_type_i,       ach03_src_type_i,       ach04_src_type_i,       ach05_src_type_i,       ach06_src_type_i;
input[29:0] ach01_start_addr_i,     ach02_start_addr_i,     ach03_start_addr_i,     ach04_start_addr_i,     ach05_start_addr_i,     ach06_start_addr_i;
input[29:0] ach01_data_length_i,    ach02_data_length_i,    ach03_data_length_i,    ach04_data_length_i,    ach05_data_length_i,    ach06_data_length_i;
input[29:0] ach01_2nd_addr_burst_i, ach02_2nd_addr_burst_i, ach03_2nd_addr_burst_i, ach04_2nd_addr_burst_i, ach05_2nd_addr_burst_i, ach06_2nd_addr_burst_i;
input[29:0] ach01_column_num_2nd_i, ach02_column_num_2nd_i, ach03_column_num_2nd_i, ach04_column_num_2nd_i, ach05_column_num_2nd_i, ach06_column_num_2nd_i;

input       ach01_broadcast_i,      ach02_broadcast_i,      ach03_broadcast_i,      ach04_broadcast_i,      ach05_broadcast_i,      ach06_broadcast_i;
input[ 7:0] ach01_pos0_1st_i,       ach02_pos0_1st_i,       ach03_pos0_1st_i,       ach04_pos0_1st_i,       ach05_pos0_1st_i,       ach06_pos0_1st_i;
input[ 7:0] ach01_pos1_1st_i,       ach02_pos1_1st_i,       ach03_pos1_1st_i,       ach04_pos1_1st_i,       ach05_pos1_1st_i,       ach06_pos1_1st_i;
input[ 7:0] ach01_pos2_1st_i,       ach02_pos2_1st_i,       ach03_pos2_1st_i,       ach04_pos2_1st_i,       ach05_pos2_1st_i,       ach06_pos2_1st_i;
input[ 7:0] ach01_pos3_1st_i,       ach02_pos3_1st_i,       ach03_pos3_1st_i,       ach04_pos3_1st_i,       ach05_pos3_1st_i,       ach06_pos3_1st_i;
input[ 7:0] ach01_pos4_1st_i,       ach02_pos4_1st_i,       ach03_pos4_1st_i,       ach04_pos4_1st_i,       ach05_pos4_1st_i,       ach06_pos4_1st_i;
input[ 7:0] ach01_pos5_1st_i,       ach02_pos5_1st_i,       ach03_pos5_1st_i,       ach04_pos5_1st_i,       ach05_pos5_1st_i,       ach06_pos5_1st_i;
input[ 7:0] ach01_pos6_1st_i,       ach02_pos6_1st_i,       ach03_pos6_1st_i,       ach04_pos6_1st_i,       ach05_pos6_1st_i,       ach06_pos6_1st_i;
input[ 7:0] ach01_pos7_1st_i,       ach02_pos7_1st_i,       ach03_pos7_1st_i,       ach04_pos7_1st_i,       ach05_pos7_1st_i,       ach06_pos7_1st_i;
input[ 1:0] ach01_pos0_src_type_i,  ach02_pos0_src_type_i,  ach03_pos0_src_type_i,  ach04_pos0_src_type_i,  ach05_pos0_src_type_i,  ach06_pos0_src_type_i;
input[ 1:0] ach01_pos1_src_type_i,  ach02_pos1_src_type_i,  ach03_pos1_src_type_i,  ach04_pos1_src_type_i,  ach05_pos1_src_type_i,  ach06_pos1_src_type_i;
input[ 1:0] ach01_pos2_src_type_i,  ach02_pos2_src_type_i,  ach03_pos2_src_type_i,  ach04_pos2_src_type_i,  ach05_pos2_src_type_i,  ach06_pos2_src_type_i;
input[ 1:0] ach01_pos3_src_type_i,  ach02_pos3_src_type_i,  ach03_pos3_src_type_i,  ach04_pos3_src_type_i,  ach05_pos3_src_type_i,  ach06_pos3_src_type_i;
input[ 1:0] ach01_pos4_src_type_i,  ach02_pos4_src_type_i,  ach03_pos4_src_type_i,  ach04_pos4_src_type_i,  ach05_pos4_src_type_i,  ach06_pos4_src_type_i;
input[ 1:0] ach01_pos5_src_type_i,  ach02_pos5_src_type_i,  ach03_pos5_src_type_i,  ach04_pos5_src_type_i,  ach05_pos5_src_type_i,  ach06_pos5_src_type_i;
input[ 1:0] ach01_pos6_src_type_i,  ach02_pos6_src_type_i,  ach03_pos6_src_type_i,  ach04_pos6_src_type_i,  ach05_pos6_src_type_i,  ach06_pos6_src_type_i;
input[ 1:0] ach01_pos7_src_type_i,  ach02_pos7_src_type_i,  ach03_pos7_src_type_i,  ach04_pos7_src_type_i,  ach05_pos7_src_type_i,  ach06_pos7_src_type_i;

input       ach01_release_i,        ach02_release_i,        ach03_release_i,        ach04_release_i,        ach05_release_i,        ach06_release_i;
input[ 8:0] ach01_VR_id_i,          ach02_VR_id_i,          ach03_VR_id_i,          ach04_VR_id_i,          ach05_VR_id_i,          ach06_VR_id_i;
input[ 2:0] ach01_VR_FR_i,          ach02_VR_FR_i,          ach03_VR_FR_i,          ach04_VR_FR_i,          ach05_VR_FR_i,          ach06_VR_FR_i;
input[ 4:0] ach01_channel_ID_i,     ach02_channel_ID_i,     ach03_channel_ID_i,     ach04_channel_ID_i,     ach05_channel_ID_i,     ach06_channel_ID_i;
    
//---------pcc_crossbar--------//
input[65:0] dch01_ip_data_i,        dch02_ip_data_i,        dch03_ip_data_i,        dch04_ip_data_i,        dch05_ip_data_i,        dch06_ip_data_i;
input       dch01_ip_fwd_i,         dch02_ip_fwd_i,         dch03_ip_fwd_i,         dch04_ip_fwd_i,         dch05_ip_fwd_i,         dch06_ip_fwd_i;
input       dch01_ip_stb_i,         dch02_ip_stb_i,         dch03_ip_stb_i,         dch04_ip_stb_i,         dch05_ip_stb_i,         dch06_ip_stb_i;
output      dch01_ip_fail_o,        dch02_ip_fail_o,        dch03_ip_fail_o,        dch04_ip_fail_o,        dch05_ip_fail_o,        dch06_ip_fail_o;
output      dch01_ip_pack_o,        dch02_ip_pack_o,        dch03_ip_pack_o,        dch04_ip_pack_o,        dch05_ip_pack_o,        dch06_ip_pack_o;
output      dch01_ip_suspend_o,     dch02_ip_suspend_o,     dch03_ip_suspend_o,     dch04_ip_suspend_o,     dch05_ip_suspend_o,     dch06_ip_suspend_o;
output      dch01_ip_cancel_o,      dch02_ip_cancel_o,      dch03_ip_cancel_o,      dch04_ip_cancel_o,      dch05_ip_cancel_o,      dch06_ip_cancel_o;

input       dch01_op_fail_i,        dch02_op_fail_i,        dch03_op_fail_i,        dch04_op_fail_i,        dch05_op_fail_i,        dch06_op_fail_i;
input       dch01_op_pack_i,        dch02_op_pack_i,        dch03_op_pack_i,        dch04_op_pack_i,        dch05_op_pack_i,        dch06_op_pack_i;
input       dch01_op_suspend_i,     dch02_op_suspend_i,     dch03_op_suspend_i,     dch04_op_suspend_i,     dch05_op_suspend_i,     dch06_op_suspend_i;
input       dch01_op_cancel_i,      dch02_op_cancel_i,      dch03_op_cancel_i,      dch04_op_cancel_i,      dch05_op_cancel_i,      dch06_op_cancel_i;
output[65:0]dch01_op_data_o,        dch02_op_data_o,        dch03_op_data_o,        dch04_op_data_o,        dch05_op_data_o,        dch06_op_data_o;
output      dch01_op_fwd_o,         dch02_op_fwd_o,         dch03_op_fwd_o,         dch04_op_fwd_o,         dch05_op_fwd_o,         dch06_op_fwd_o;
output      dch01_op_stb_o,         dch02_op_stb_o,         dch03_op_stb_o,         dch04_op_stb_o,         dch05_op_stb_o,         dch06_op_stb_o;

output[ 3:0]dch01_pos_1st_rd,       dch02_pos_1st_rd,       dch03_pos_1st_rd,       dch04_pos_1st_rd,       dch05_pos_1st_rd,       dch06_pos_1st_rd;
output[ 7:0]dch01_pos_1st_wr,       dch02_pos_1st_wr,       dch03_pos_1st_wr,       dch04_pos_1st_wr,       dch05_pos_1st_wr,       dch06_pos_1st_wr;
    
//--------broadcast_crossbar-------//
input       broad01_grant_i,        broad02_grant_i,        broad03_grant_i,        broad04_grant_i,        broad05_grant_i,        broad06_grant_i;
output      broad01_link_o,         broad02_link_o,         broad03_link_o,         broad04_link_o,         broad05_link_o,         broad06_link_o;
output      broad01_fwd_o,          broad02_fwd_o,          broad03_fwd_o,          broad04_fwd_o,          broad05_fwd_o,          broad06_fwd_o;
output[65:0]broad01_data_o,         broad02_data_o,         broad03_data_o,         broad04_data_o,         broad05_data_o,         broad06_data_o;
    
//------------ddr_app----------//
output      ch01_req_rd_o,          ch02_req_rd_o,          ch03_req_rd_o,          ch04_req_rd_o,          ch05_req_rd_o,          ch06_req_rd_o;
input       ch01_rd_addr_en_i,      ch02_rd_addr_en_i,      ch03_rd_addr_en_i,      ch04_rd_addr_en_i,      ch05_rd_addr_en_i,      ch06_rd_addr_en_i;
input       ch01_wr_addr_en_i,      ch02_wr_addr_en_i,      ch03_wr_addr_en_i,      ch04_wr_addr_en_i,      ch05_wr_addr_en_i,      ch06_wr_addr_en_i;
output[29:0]ch01_address_o,         ch02_address_o,         ch03_address_o,         ch04_address_o,         ch05_address_o,         ch06_address_o;
    
//-------------DFS---------------//
input        RD01_DFS_wr_en,         RD02_DFS_wr_en,         RD03_DFS_wr_en,         RD04_DFS_wr_en,         RD05_DFS_wr_en,         RD06_DFS_wr_en;
input [511:0]RD01_DFS_din,           RD02_DFS_din,           RD03_DFS_din,           RD04_DFS_din,           RD05_DFS_din,           RD06_DFS_din;
output       RD01_DFS_full,          RD02_DFS_full,          RD03_DFS_full,          RD04_DFS_full,          RD05_DFS_full,          RD06_DFS_full;
output[ 5 :0]RD01_DFS_wr_count,      RD02_DFS_wr_count,      RD03_DFS_wr_count,      RD04_DFS_wr_count,      RD05_DFS_wr_count,      RD06_DFS_wr_count;
input        WR01_DFS_rd_en,         WR02_DFS_rd_en,         WR03_DFS_rd_en,         WR04_DFS_rd_en,         WR05_DFS_rd_en,         WR06_DFS_rd_en;
output[511:0]WR01_DFS_dout,          WR02_DFS_dout,          WR03_DFS_dout,          WR04_DFS_dout,          WR05_DFS_dout,          WR06_DFS_dout;
output       WR01_DFS_valid,         WR02_DFS_valid,         WR03_DFS_valid,         WR04_DFS_valid,         WR05_DFS_valid,         WR06_DFS_valid;
output       WR01_DFS_empty,         WR02_DFS_empty,         WR03_DFS_empty,         WR04_DFS_empty,         WR05_DFS_empty,         WR06_DFS_empty;
  
wire        RD01_DFS_rd_en,         RD02_DFS_rd_en,         RD03_DFS_rd_en,         RD04_DFS_rd_en,         RD05_DFS_rd_en,         RD06_DFS_rd_en;
wire[63:0]  RD01_DFS_dout,          RD02_DFS_dout,          RD03_DFS_dout,          RD04_DFS_dout,          RD05_DFS_dout,          RD06_DFS_dout;
wire        RD01_DFS_empty,         RD02_DFS_empty,         RD03_DFS_empty,         RD04_DFS_empty,         RD05_DFS_empty,         RD06_DFS_empty;
wire        RD01_DFS_valid,         RD02_DFS_valid,         RD03_DFS_valid,         RD04_DFS_valid,         RD05_DFS_valid,         RD06_DFS_valid;
wire        WR01_DFS_wr_en,         WR02_DFS_wr_en,         WR03_DFS_wr_en,         WR04_DFS_wr_en,         WR05_DFS_wr_en,         WR06_DFS_wr_en;
wire[63:0]  WR01_DFS_din,           WR02_DFS_din,           WR03_DFS_din,           WR04_DFS_din,           WR05_DFS_din,           WR06_DFS_din;
wire        WR01_DFS_full,          WR02_DFS_full,          WR03_DFS_full,          WR04_DFS_full,          WR05_DFS_full,          WR06_DFS_full;
wire[ 7:0]  WR01_DFS_wr_count,      WR02_DFS_wr_count,      WR03_DFS_wr_count,      WR04_DFS_wr_count,      WR05_DFS_wr_count,      WR06_DFS_wr_count;

//---------status_port---------//
input                  status_idle_i;
output                 status_ack_o;
output                 status_ack_type_o;
output     [ 8:0]      status_VR_id_o;
output     [ 2:0]      status_VR_FR_o;
output     [ 4:0]      status_channel_ID_o;
output     [ 7:0]      status_pos_1st_o;
output     [ 2:0]      status_pos_2nd_o;
output     [ 1:0]      status_src_type_o;

///----------------------status port signal select---------------------
wire       status01_grant,         status02_grant,         status03_grant,         status04_grant,         status05_grant,         status06_grant;
wire       status01_ack,           status02_ack,           status03_ack,           status04_ack,           status05_ack,           status06_ack;
wire       status01_ack_type,      status02_ack_type,      status03_ack_type,      status04_ack_type,      status05_ack_type,      status06_ack_type;
wire[ 8:0] status01_VR_id,         status02_VR_id,         status03_VR_id,         status04_VR_id,         status05_VR_id,         status06_VR_id;
wire[ 2:0] status01_VR_FR,         status02_VR_FR,         status03_VR_FR,         status04_VR_FR,         status05_VR_FR,         status06_VR_FR;
wire[ 4:0] status01_channel_ID,    status02_channel_ID,    status03_channel_ID,    status04_channel_ID,    status05_channel_ID,    status06_channel_ID;
wire[ 7:0] status01_pos_1st,       status02_pos_1st,       status03_pos_1st,       status04_pos_1st,       status05_pos_1st,       status06_pos_1st;
wire[ 2:0] status01_pos_2nd,       status02_pos_2nd,       status03_pos_2nd,       status04_pos_2nd,       status05_pos_2nd,       status06_pos_2nd;
wire[ 1:0] status01_src_type,      status02_src_type,      status03_src_type,      status04_src_type,      status05_src_type,      status06_src_type;


status_info_select status_info_select
(
    .sys_clk     (sys_clk),
	.sys_rst_n   (sys_rst_n),
	
//---------status_port---------//
    .status_idle_i         (status_idle_i         ),
    .status_ack_o          (status_ack_o          ),
    .status_ack_type_o     (status_ack_type_o     ),
    .status_VR_id_o        (status_VR_id_o        ),
	.status_VR_FR_o        (status_VR_FR_o        ),
    .status_channel_ID_o   (status_channel_ID_o   ),
    .status_pos_1st_o      (status_pos_1st_o      ),
    .status_pos_2nd_o      (status_pos_2nd_o      ),
    .status_src_type_o     (status_src_type_o     ),
	
//---------status request------from ddr_ch_fsm_01~~ddr_ch_fsm_06
	//output
    .status01_grant_o       (status01_grant      ),
    .status02_grant_o       (status02_grant      ),
    .status03_grant_o       (status03_grant      ),
    .status04_grant_o       (status04_grant      ),
    .status05_grant_o       (status05_grant      ),
    .status06_grant_o       (status06_grant      ),
	//input
    .status01_ack_i         (status01_ack        ),
    .status02_ack_i         (status02_ack        ),
    .status03_ack_i         (status03_ack        ),
    .status04_ack_i         (status04_ack        ),
    .status05_ack_i         (status05_ack        ),
    .status06_ack_i         (status06_ack        ),
    .status01_ack_type_i    (status01_ack_type   ),
    .status02_ack_type_i    (status02_ack_type   ),
    .status03_ack_type_i    (status03_ack_type   ),
    .status04_ack_type_i    (status04_ack_type   ),
    .status05_ack_type_i    (status05_ack_type   ),
    .status06_ack_type_i    (status06_ack_type   ),
    .status01_VR_id_i       (status01_VR_id      ),
    .status02_VR_id_i       (status02_VR_id      ),
    .status03_VR_id_i       (status03_VR_id      ),
    .status04_VR_id_i       (status04_VR_id      ),
    .status05_VR_id_i       (status05_VR_id      ),
    .status06_VR_id_i       (status06_VR_id      ),
    .status01_VR_FR_i       (status01_VR_FR      ),
    .status02_VR_FR_i       (status02_VR_FR      ),
    .status03_VR_FR_i       (status03_VR_FR      ),
    .status04_VR_FR_i       (status04_VR_FR      ),
    .status05_VR_FR_i       (status05_VR_FR      ),
    .status06_VR_FR_i       (status06_VR_FR      ),
    .status01_channel_ID_i  (status01_channel_ID ),
    .status02_channel_ID_i  (status02_channel_ID ),
    .status03_channel_ID_i  (status03_channel_ID ),
    .status04_channel_ID_i  (status04_channel_ID ),
    .status05_channel_ID_i  (status05_channel_ID ),
    .status06_channel_ID_i  (status06_channel_ID ),
    .status01_pos_1st_i     (status01_pos_1st    ),
    .status02_pos_1st_i     (status02_pos_1st    ),
    .status03_pos_1st_i     (status03_pos_1st    ),
    .status04_pos_1st_i     (status04_pos_1st    ),
    .status05_pos_1st_i     (status05_pos_1st    ),
    .status06_pos_1st_i     (status06_pos_1st    ),
    .status01_pos_2nd_i     (status01_pos_2nd    ),
    .status02_pos_2nd_i     (status02_pos_2nd    ),
    .status03_pos_2nd_i     (status03_pos_2nd    ),
    .status04_pos_2nd_i     (status04_pos_2nd    ),
    .status05_pos_2nd_i     (status05_pos_2nd    ),
    .status06_pos_2nd_i     (status06_pos_2nd    ),
    .status01_src_type_i    (status01_src_type   ),
    .status02_src_type_i    (status02_src_type   ),
    .status03_src_type_i    (status03_src_type   ),
    .status04_src_type_i    (status04_src_type   ),
    .status05_src_type_i    (status05_src_type   ),
    .status06_src_type_i    (status06_src_type   )
    );
	


//------------------ch1--------------------
RD_DATA_FIFO_S  RD_DATA_FIFO_S1 (
  .rst             (~sys_rst_n), // input rst
  
  .rd_clk          (sys_clk), // input rd_clk
  .rd_en           (RD01_DFS_rd_en), // input rd_en
  .dout            (RD01_DFS_dout), // output [63 : 0] dout
  .empty           (RD01_DFS_empty), // output empty
  .valid           (RD01_DFS_valid), // output valid
  
  .wr_clk          (sys_clk), // input wr_clk
  .wr_en           (RD01_DFS_wr_en), // input wr_en
  .din             (RD01_DFS_din), // input [511 : 0] din
  .full            (RD01_DFS_full), // output full
  .wr_data_count   (RD01_DFS_wr_count) // output [5 : 0] wr_data_count
);

WR_DATA_FIFO_S  WR_DATA_FIFO_S1 (
  .rst             (~sys_rst_n), // input rst
  
  .rd_clk          (sys_clk), // input rd_clk
  .rd_en           (WR01_DFS_rd_en), // input rd_en
  .dout            (WR01_DFS_dout), // output [511 : 0] dout
  .valid           (WR01_DFS_valid), // output valid
  .empty           (WR01_DFS_empty), // output empty
  
  .wr_clk          (sys_clk), // input wr_clk
  .wr_en           (WR01_DFS_wr_en), // input wr_en
  .din             (WR01_DFS_din), // input [63 : 0] din
  .full            (WR01_DFS_full), // output full
  .wr_data_count   (WR01_DFS_wr_count) // output [7 : 0] wr_data_count
);

ddr_ch_fsm ddr_ch_fsm_01 (
    .sys_clk              (sys_clk), 
    .sys_rst_n            (sys_rst_n), 
    .phy_init_done_i      (phy_init_done_i), 
    
    .status_grant_i       (status01_grant), 
    .status_ack_o         (status01_ack), 
    .status_ack_type_o    (status01_ack_type), 
    .status_VR_id_o       (status01_VR_id), 
	.status_VR_FR_o       (status01_VR_FR),
    .status_channel_ID_o  (status01_channel_ID), 
    .status_pos_1st_o     (status01_pos_1st), 
    .status_pos_2nd_o     (status01_pos_2nd), 
    .status_src_type_o    (status01_src_type),
    
    .ach_idle_o           (ach01_idle_o), 
    .ach_eof_o            (ach01_eof_o), 
    .ach_request_i        (ach01_request_i), 
    .ach_pos_1st_i        (ach01_pos_1st_i), 
    .ach_pos_2nd_i        (ach01_pos_2nd_i), 
    .ach_src_type_i       (ach01_src_type_i),
    .ach_start_addr_i     (ach01_start_addr_i), 
    .ach_data_length_i    (ach01_data_length_i), 
    .ach_2nd_addr_burst_i (ach01_2nd_addr_burst_i), 
    .ach_column_num_2nd_i (ach01_column_num_2nd_i), 
    .ach_broadcast_i      (ach01_broadcast_i), 
    .ach_pos0_1st_i       (ach01_pos0_1st_i), 
    .ach_pos1_1st_i       (ach01_pos1_1st_i), 
    .ach_pos2_1st_i       (ach01_pos2_1st_i), 
    .ach_pos3_1st_i       (ach01_pos3_1st_i), 
    .ach_pos4_1st_i       (ach01_pos4_1st_i), 
    .ach_pos5_1st_i       (ach01_pos5_1st_i), 
    .ach_pos6_1st_i       (ach01_pos6_1st_i), 
    .ach_pos7_1st_i       (ach01_pos7_1st_i), 
    .ach_pos0_src_type_i  (ach01_pos0_src_type_i), 
    .ach_pos1_src_type_i  (ach01_pos1_src_type_i), 
    .ach_pos2_src_type_i  (ach01_pos2_src_type_i), 
    .ach_pos3_src_type_i  (ach01_pos3_src_type_i), 
    .ach_pos4_src_type_i  (ach01_pos4_src_type_i), 
    .ach_pos5_src_type_i  (ach01_pos5_src_type_i), 
    .ach_pos6_src_type_i  (ach01_pos6_src_type_i), 
    .ach_pos7_src_type_i  (ach01_pos7_src_type_i), 
    .ach_release_i        (ach01_release_i), 
    .ach_VR_id_i          (ach01_VR_id_i), 
	.ach_VR_FR_i          (ach01_VR_FR_i),
    .ach_channel_ID_i     (ach01_channel_ID_i), 
    .dch_ip_data_i        (dch01_ip_data_i), 
    .dch_ip_fwd_i         (dch01_ip_fwd_i), 
    .dch_ip_stb_i         (dch01_ip_stb_i), 
    .dch_ip_fail_o        (dch01_ip_fail_o), 
    .dch_ip_pack_o        (dch01_ip_pack_o), 
    .dch_ip_suspend_o     (dch01_ip_suspend_o), 
    .dch_ip_cancel_o      (dch01_ip_cancel_o), 
    .dch_op_fail_i        (dch01_op_fail_i), 
    .dch_op_pack_i        (dch01_op_pack_i), 
    .dch_op_suspend_i     (dch01_op_suspend_i), 
    .dch_op_cancel_i      (dch01_op_cancel_i), 
    .dch_op_data_o        (dch01_op_data_o), 
    .dch_op_fwd_o         (dch01_op_fwd_o), 
    .dch_op_stb_o         (dch01_op_stb_o), 
    .dch_pos_1st_rd       (dch01_pos_1st_rd), 
    .dch_pos_1st_wr       (dch01_pos_1st_wr), 
    .broad_grant_i        (broad01_grant_i), 
    .broad_link_o         (broad01_link_o), 
    .broad_fwd_o          (broad01_fwd_o), 
    .broad_data_o         (broad01_data_o), 
    .ch_req_rd_o          (ch01_req_rd_o), 
    .ch_rd_addr_en_i      (ch01_rd_addr_en_i), 
    .ch_wr_addr_en_i      (ch01_wr_addr_en_i), 
    .ch_address_o         (ch01_address_o),
    .RD_DFS_rd_en         (RD01_DFS_rd_en), 
    .RD_DFS_dout          (RD01_DFS_dout), 
    .RD_DFS_valid         (RD01_DFS_valid), 
    .RD_DFS_empty         (RD01_DFS_empty), 
    .WR_DFS_wr_en         (WR01_DFS_wr_en), 
    .WR_DFS_din           (WR01_DFS_din), 
    .WR_DFS_full          (WR01_DFS_full), 
    .WR_DFS_wr_count      (WR01_DFS_wr_count)
    );


//------------------ch2--------------------
RD_DATA_FIFO_S  RD_DATA_FIFO_S02 (
  .rst             (~sys_rst_n), // input rst
  
  .rd_clk          (sys_clk), // input rd_clk
  .rd_en           (RD02_DFS_rd_en), // input rd_en
  .dout            (RD02_DFS_dout), // output [63 : 0] dout
  .empty           (RD02_DFS_empty), // output empty
  .valid           (RD02_DFS_valid), // output valid
  
  .wr_clk          (sys_clk), // input wr_clk
  .wr_en           (RD02_DFS_wr_en), // input wr_en
  .din             (RD02_DFS_din), // input [511 : 0] din
  .full            (RD02_DFS_full), // output full
  .wr_data_count   (RD02_DFS_wr_count) // output [5 : 0] wr_data_count
);

WR_DATA_FIFO_S  WR_DATA_FIFO_S02 (
  .rst             (~sys_rst_n), // input rst
  
  .rd_clk          (sys_clk), // input rd_clk
  .rd_en           (WR02_DFS_rd_en), // input rd_en
  .dout            (WR02_DFS_dout), // output [511 : 0] dout
  .valid           (WR02_DFS_valid), // output valid
  .empty           (WR02_DFS_empty), // output empty
  
  .wr_clk          (sys_clk), // input wr_clk
  .wr_en           (WR02_DFS_wr_en), // input wr_en
  .din             (WR02_DFS_din), // input [63 : 0] din
  .full            (WR02_DFS_full), // output full
  .wr_data_count   (WR02_DFS_wr_count) // output [7 : 0] wr_data_count
);

ddr_ch_fsm ddr_ch_fsm_02 (
    .sys_clk              (sys_clk), 
    .sys_rst_n            (sys_rst_n), 
    .phy_init_done_i      (phy_init_done_i), 
    
    .status_grant_i       (status02_grant), 
    .status_ack_o         (status02_ack), 
    .status_ack_type_o    (status02_ack_type), 
    .status_VR_id_o       (status02_VR_id), 
	.status_VR_FR_o       (status02_VR_FR),
    .status_channel_ID_o  (status02_channel_ID), 
    .status_pos_1st_o     (status02_pos_1st), 
    .status_pos_2nd_o     (status02_pos_2nd), 
    .status_src_type_o    (status02_src_type),
    
    .ach_idle_o           (ach02_idle_o), 
    .ach_eof_o            (ach02_eof_o), 
    .ach_request_i        (ach02_request_i), 
    .ach_pos_1st_i        (ach02_pos_1st_i), 
    .ach_pos_2nd_i        (ach02_pos_2nd_i), 
    .ach_src_type_i       (ach02_src_type_i),
    .ach_start_addr_i     (ach02_start_addr_i), 
    .ach_data_length_i    (ach02_data_length_i), 
    .ach_2nd_addr_burst_i (ach02_2nd_addr_burst_i), 
    .ach_column_num_2nd_i (ach02_column_num_2nd_i), 
    .ach_broadcast_i      (ach02_broadcast_i), 
    .ach_pos0_1st_i       (ach02_pos0_1st_i), 
    .ach_pos1_1st_i       (ach02_pos1_1st_i), 
    .ach_pos2_1st_i       (ach02_pos2_1st_i), 
    .ach_pos3_1st_i       (ach02_pos3_1st_i), 
    .ach_pos4_1st_i       (ach02_pos4_1st_i), 
    .ach_pos5_1st_i       (ach02_pos5_1st_i), 
    .ach_pos6_1st_i       (ach02_pos6_1st_i), 
    .ach_pos7_1st_i       (ach02_pos7_1st_i), 
    .ach_pos0_src_type_i  (ach02_pos0_src_type_i), 
    .ach_pos1_src_type_i  (ach02_pos1_src_type_i), 
    .ach_pos2_src_type_i  (ach02_pos2_src_type_i), 
    .ach_pos3_src_type_i  (ach02_pos3_src_type_i), 
    .ach_pos4_src_type_i  (ach02_pos4_src_type_i), 
    .ach_pos5_src_type_i  (ach02_pos5_src_type_i), 
    .ach_pos6_src_type_i  (ach02_pos6_src_type_i), 
    .ach_pos7_src_type_i  (ach02_pos7_src_type_i), 
    .ach_release_i        (ach02_release_i), 
    .ach_VR_id_i          (ach02_VR_id_i), 
	.ach_VR_FR_i          (ach02_VR_FR_i),
    .ach_channel_ID_i     (ach02_channel_ID_i), 
    .dch_ip_data_i        (dch02_ip_data_i), 
    .dch_ip_fwd_i         (dch02_ip_fwd_i), 
    .dch_ip_stb_i         (dch02_ip_stb_i), 
    .dch_ip_fail_o        (dch02_ip_fail_o), 
    .dch_ip_pack_o        (dch02_ip_pack_o), 
    .dch_ip_suspend_o     (dch02_ip_suspend_o), 
    .dch_ip_cancel_o      (dch02_ip_cancel_o), 
    .dch_op_fail_i        (dch02_op_fail_i), 
    .dch_op_pack_i        (dch02_op_pack_i), 
    .dch_op_suspend_i     (dch02_op_suspend_i), 
    .dch_op_cancel_i      (dch02_op_cancel_i), 
    .dch_op_data_o        (dch02_op_data_o), 
    .dch_op_fwd_o         (dch02_op_fwd_o), 
    .dch_op_stb_o         (dch02_op_stb_o), 
    .dch_pos_1st_rd       (dch02_pos_1st_rd), 
    .dch_pos_1st_wr       (dch02_pos_1st_wr), 
    .broad_grant_i        (broad02_grant_i), 
    .broad_link_o         (broad02_link_o), 
    .broad_fwd_o          (broad02_fwd_o), 
    .broad_data_o         (broad02_data_o), 
    .ch_req_rd_o          (ch02_req_rd_o), 
    .ch_rd_addr_en_i      (ch02_rd_addr_en_i), 
    .ch_wr_addr_en_i      (ch02_wr_addr_en_i), 
    .ch_address_o         (ch02_address_o),
    .RD_DFS_rd_en         (RD02_DFS_rd_en), 
    .RD_DFS_dout          (RD02_DFS_dout), 
    .RD_DFS_valid         (RD02_DFS_valid), 
    .RD_DFS_empty         (RD02_DFS_empty), 
    .WR_DFS_wr_en         (WR02_DFS_wr_en), 
    .WR_DFS_din           (WR02_DFS_din), 
    .WR_DFS_full          (WR02_DFS_full), 
    .WR_DFS_wr_count      (WR02_DFS_wr_count)
    );


//------------------ch3--------------------
RD_DATA_FIFO_S  RD_DATA_FIFO_S03 (
  .rst             (~sys_rst_n), // input rst
  
  .rd_clk          (sys_clk), // input rd_clk
  .rd_en           (RD03_DFS_rd_en), // input rd_en
  .dout            (RD03_DFS_dout), // output [63 : 0] dout
  .empty           (RD03_DFS_empty), // output empty
  .valid           (RD03_DFS_valid), // output valid
  
  .wr_clk          (sys_clk), // input wr_clk
  .wr_en           (RD03_DFS_wr_en), // input wr_en
  .din             (RD03_DFS_din), // input [511 : 0] din
  .full            (RD03_DFS_full), // output full
  .wr_data_count   (RD03_DFS_wr_count) // output [5 : 0] wr_data_count
);

WR_DATA_FIFO_S  WR_DATA_FIFO_S03 (
  .rst             (~sys_rst_n), // input rst
  
  .rd_clk          (sys_clk), // input rd_clk
  .rd_en           (WR03_DFS_rd_en), // input rd_en
  .dout            (WR03_DFS_dout), // output [511 : 0] dout
  .valid           (WR03_DFS_valid), // output valid
  .empty           (WR03_DFS_empty), // output empty
  
  .wr_clk          (sys_clk), // input wr_clk
  .wr_en           (WR03_DFS_wr_en), // input wr_en
  .din             (WR03_DFS_din), // input [63 : 0] din
  .full            (WR03_DFS_full), // output full
  .wr_data_count   (WR03_DFS_wr_count) // output [7 : 0] wr_data_count
);

ddr_ch_fsm ddr_ch_fsm_03 (
    .sys_clk              (sys_clk), 
    .sys_rst_n            (sys_rst_n), 
    .phy_init_done_i      (phy_init_done_i), 
    
    .status_grant_i       (status03_grant), 
    .status_ack_o         (status03_ack), 
    .status_ack_type_o    (status03_ack_type), 
    .status_VR_id_o       (status03_VR_id), 
	.status_VR_FR_o       (status03_VR_FR),
    .status_channel_ID_o  (status03_channel_ID), 
    .status_pos_1st_o     (status03_pos_1st), 
    .status_pos_2nd_o     (status03_pos_2nd), 
    .status_src_type_o    (status03_src_type),
    
    .ach_idle_o           (ach03_idle_o), 
    .ach_eof_o            (ach03_eof_o), 
    .ach_request_i        (ach03_request_i), 
    .ach_pos_1st_i        (ach03_pos_1st_i), 
    .ach_pos_2nd_i        (ach03_pos_2nd_i), 
    .ach_src_type_i       (ach03_src_type_i),
    .ach_start_addr_i     (ach03_start_addr_i), 
    .ach_data_length_i    (ach03_data_length_i), 
    .ach_2nd_addr_burst_i (ach03_2nd_addr_burst_i), 
    .ach_column_num_2nd_i (ach03_column_num_2nd_i), 
    .ach_broadcast_i      (ach03_broadcast_i), 
    .ach_pos0_1st_i       (ach03_pos0_1st_i), 
    .ach_pos1_1st_i       (ach03_pos1_1st_i), 
    .ach_pos2_1st_i       (ach03_pos2_1st_i), 
    .ach_pos3_1st_i       (ach03_pos3_1st_i), 
    .ach_pos4_1st_i       (ach03_pos4_1st_i), 
    .ach_pos5_1st_i       (ach03_pos5_1st_i), 
    .ach_pos6_1st_i       (ach03_pos6_1st_i), 
    .ach_pos7_1st_i       (ach03_pos7_1st_i), 
    .ach_pos0_src_type_i  (ach03_pos0_src_type_i), 
    .ach_pos1_src_type_i  (ach03_pos1_src_type_i), 
    .ach_pos2_src_type_i  (ach03_pos2_src_type_i), 
    .ach_pos3_src_type_i  (ach03_pos3_src_type_i), 
    .ach_pos4_src_type_i  (ach03_pos4_src_type_i), 
    .ach_pos5_src_type_i  (ach03_pos5_src_type_i), 
    .ach_pos6_src_type_i  (ach03_pos6_src_type_i), 
    .ach_pos7_src_type_i  (ach03_pos7_src_type_i), 
    .ach_release_i        (ach03_release_i), 
    .ach_VR_id_i          (ach03_VR_id_i), 
	.ach_VR_FR_i          (ach03_VR_FR_i),
    .ach_channel_ID_i     (ach03_channel_ID_i), 
    .dch_ip_data_i        (dch03_ip_data_i), 
    .dch_ip_fwd_i         (dch03_ip_fwd_i), 
    .dch_ip_stb_i         (dch03_ip_stb_i), 
    .dch_ip_fail_o        (dch03_ip_fail_o), 
    .dch_ip_pack_o        (dch03_ip_pack_o), 
    .dch_ip_suspend_o     (dch03_ip_suspend_o), 
    .dch_ip_cancel_o      (dch03_ip_cancel_o), 
    .dch_op_fail_i        (dch03_op_fail_i), 
    .dch_op_pack_i        (dch03_op_pack_i), 
    .dch_op_suspend_i     (dch03_op_suspend_i), 
    .dch_op_cancel_i      (dch03_op_cancel_i), 
    .dch_op_data_o        (dch03_op_data_o), 
    .dch_op_fwd_o         (dch03_op_fwd_o), 
    .dch_op_stb_o         (dch03_op_stb_o), 
    .dch_pos_1st_rd       (dch03_pos_1st_rd), 
    .dch_pos_1st_wr       (dch03_pos_1st_wr), 
    .broad_grant_i        (broad03_grant_i), 
    .broad_link_o         (broad03_link_o), 
    .broad_fwd_o          (broad03_fwd_o), 
    .broad_data_o         (broad03_data_o), 
    .ch_req_rd_o          (ch03_req_rd_o), 
    .ch_rd_addr_en_i      (ch03_rd_addr_en_i), 
    .ch_wr_addr_en_i      (ch03_wr_addr_en_i), 
    .ch_address_o         (ch03_address_o),
    .RD_DFS_rd_en         (RD03_DFS_rd_en), 
    .RD_DFS_dout          (RD03_DFS_dout), 
    .RD_DFS_valid         (RD03_DFS_valid), 
    .RD_DFS_empty         (RD03_DFS_empty), 
    .WR_DFS_wr_en         (WR03_DFS_wr_en), 
    .WR_DFS_din           (WR03_DFS_din), 
    .WR_DFS_full          (WR03_DFS_full), 
    .WR_DFS_wr_count      (WR03_DFS_wr_count)
    );


//------------------ch4--------------------
RD_DATA_FIFO_S  RD_DATA_FIFO_S04 (
  .rst             (~sys_rst_n), // input rst
  
  .rd_clk          (sys_clk), // input rd_clk
  .rd_en           (RD04_DFS_rd_en), // input rd_en
  .dout            (RD04_DFS_dout), // output [63 : 0] dout
  .empty           (RD04_DFS_empty), // output empty
  .valid           (RD04_DFS_valid), // output valid
  
  .wr_clk          (sys_clk), // input wr_clk
  .wr_en           (RD04_DFS_wr_en), // input wr_en
  .din             (RD04_DFS_din), // input [511 : 0] din
  .full            (RD04_DFS_full), // output full
  .wr_data_count   (RD04_DFS_wr_count) // output [5 : 0] wr_data_count
);

WR_DATA_FIFO_S  WR_DATA_FIFO_S04 (
  .rst             (~sys_rst_n), // input rst
  
  .rd_clk          (sys_clk), // input rd_clk
  .rd_en           (WR04_DFS_rd_en), // input rd_en
  .dout            (WR04_DFS_dout), // output [511 : 0] dout
  .valid           (WR04_DFS_valid), // output valid
  .empty           (WR04_DFS_empty), // output empty
  
  .wr_clk          (sys_clk), // input wr_clk
  .wr_en           (WR04_DFS_wr_en), // input wr_en
  .din             (WR04_DFS_din), // input [63 : 0] din
  .full            (WR04_DFS_full), // output full
  .wr_data_count   (WR04_DFS_wr_count) // output [7 : 0] wr_data_count
);

ddr_ch_fsm ddr_ch_fsm_04 (
    .sys_clk              (sys_clk), 
    .sys_rst_n            (sys_rst_n), 
    .phy_init_done_i      (phy_init_done_i), 
    
    .status_grant_i       (status04_grant), 
    .status_ack_o         (status04_ack), 
    .status_ack_type_o    (status04_ack_type), 
    .status_VR_id_o       (status04_VR_id), 
	.status_VR_FR_o       (status04_VR_FR),
    .status_channel_ID_o  (status04_channel_ID), 
    .status_pos_1st_o     (status04_pos_1st), 
    .status_pos_2nd_o     (status04_pos_2nd), 
    .status_src_type_o    (status04_src_type),
    
    .ach_idle_o           (ach04_idle_o), 
    .ach_eof_o            (ach04_eof_o), 
    .ach_request_i        (ach04_request_i), 
    .ach_pos_1st_i        (ach04_pos_1st_i), 
    .ach_pos_2nd_i        (ach04_pos_2nd_i), 
    .ach_src_type_i       (ach04_src_type_i),
    .ach_start_addr_i     (ach04_start_addr_i), 
    .ach_data_length_i    (ach04_data_length_i), 
    .ach_2nd_addr_burst_i (ach04_2nd_addr_burst_i), 
    .ach_column_num_2nd_i (ach04_column_num_2nd_i), 
    .ach_broadcast_i      (ach04_broadcast_i), 
    .ach_pos0_1st_i       (ach04_pos0_1st_i), 
    .ach_pos1_1st_i       (ach04_pos1_1st_i), 
    .ach_pos2_1st_i       (ach04_pos2_1st_i), 
    .ach_pos3_1st_i       (ach04_pos3_1st_i), 
    .ach_pos4_1st_i       (ach04_pos4_1st_i), 
    .ach_pos5_1st_i       (ach04_pos5_1st_i), 
    .ach_pos6_1st_i       (ach04_pos6_1st_i), 
    .ach_pos7_1st_i       (ach04_pos7_1st_i), 
    .ach_pos0_src_type_i  (ach04_pos0_src_type_i), 
    .ach_pos1_src_type_i  (ach04_pos1_src_type_i), 
    .ach_pos2_src_type_i  (ach04_pos2_src_type_i), 
    .ach_pos3_src_type_i  (ach04_pos3_src_type_i), 
    .ach_pos4_src_type_i  (ach04_pos4_src_type_i), 
    .ach_pos5_src_type_i  (ach04_pos5_src_type_i), 
    .ach_pos6_src_type_i  (ach04_pos6_src_type_i), 
    .ach_pos7_src_type_i  (ach04_pos7_src_type_i), 
    .ach_release_i        (ach04_release_i), 
    .ach_VR_id_i          (ach04_VR_id_i), 
	.ach_VR_FR_i          (ach04_VR_FR_i),
    .ach_channel_ID_i     (ach04_channel_ID_i), 
    .dch_ip_data_i        (dch04_ip_data_i), 
    .dch_ip_fwd_i         (dch04_ip_fwd_i), 
    .dch_ip_stb_i         (dch04_ip_stb_i), 
    .dch_ip_fail_o        (dch04_ip_fail_o), 
    .dch_ip_pack_o        (dch04_ip_pack_o), 
    .dch_ip_suspend_o     (dch04_ip_suspend_o), 
    .dch_ip_cancel_o      (dch04_ip_cancel_o), 
    .dch_op_fail_i        (dch04_op_fail_i), 
    .dch_op_pack_i        (dch04_op_pack_i), 
    .dch_op_suspend_i     (dch04_op_suspend_i), 
    .dch_op_cancel_i      (dch04_op_cancel_i), 
    .dch_op_data_o        (dch04_op_data_o), 
    .dch_op_fwd_o         (dch04_op_fwd_o), 
    .dch_op_stb_o         (dch04_op_stb_o), 
    .dch_pos_1st_rd       (dch04_pos_1st_rd), 
    .dch_pos_1st_wr       (dch04_pos_1st_wr), 
    .broad_grant_i        (broad04_grant_i), 
    .broad_link_o         (broad04_link_o), 
    .broad_fwd_o          (broad04_fwd_o), 
    .broad_data_o         (broad04_data_o), 
    .ch_req_rd_o          (ch04_req_rd_o), 
    .ch_rd_addr_en_i      (ch04_rd_addr_en_i), 
    .ch_wr_addr_en_i      (ch04_wr_addr_en_i), 
    .ch_address_o         (ch04_address_o),
    .RD_DFS_rd_en         (RD04_DFS_rd_en), 
    .RD_DFS_dout          (RD04_DFS_dout), 
    .RD_DFS_valid         (RD04_DFS_valid), 
    .RD_DFS_empty         (RD04_DFS_empty), 
    .WR_DFS_wr_en         (WR04_DFS_wr_en), 
    .WR_DFS_din           (WR04_DFS_din), 
    .WR_DFS_full          (WR04_DFS_full), 
    .WR_DFS_wr_count      (WR04_DFS_wr_count)
    );


//------------------ch5--------------------
RD_DATA_FIFO_S  RD_DATA_FIFO_S05 (
  .rst             (~sys_rst_n), // input rst
  
  .rd_clk          (sys_clk), // input rd_clk
  .rd_en           (RD05_DFS_rd_en), // input rd_en
  .dout            (RD05_DFS_dout), // output [63 : 0] dout
  .empty           (RD05_DFS_empty), // output empty
  .valid           (RD05_DFS_valid), // output valid
  
  .wr_clk          (sys_clk), // input wr_clk
  .wr_en           (RD05_DFS_wr_en), // input wr_en
  .din             (RD05_DFS_din), // input [511 : 0] din
  .full            (RD05_DFS_full), // output full
  .wr_data_count   (RD05_DFS_wr_count) // output [5 : 0] wr_data_count
);

WR_DATA_FIFO_S  WR_DATA_FIFO_S05 (
  .rst             (~sys_rst_n), // input rst
  
  .rd_clk          (sys_clk), // input rd_clk
  .rd_en           (WR05_DFS_rd_en), // input rd_en
  .dout            (WR05_DFS_dout), // output [511 : 0] dout
  .valid           (WR05_DFS_valid), // output valid
  .empty           (WR05_DFS_empty), // output empty
  
  .wr_clk          (sys_clk), // input wr_clk
  .wr_en           (WR05_DFS_wr_en), // input wr_en
  .din             (WR05_DFS_din), // input [63 : 0] din
  .full            (WR05_DFS_full), // output full
  .wr_data_count   (WR05_DFS_wr_count) // output [7 : 0] wr_data_count
);

ddr_ch_fsm ddr_ch_fsm_05 (
    .sys_clk              (sys_clk), 
    .sys_rst_n            (sys_rst_n), 
    .phy_init_done_i      (phy_init_done_i), 
    
    .status_grant_i       (status05_grant), 
    .status_ack_o         (status05_ack), 
    .status_ack_type_o    (status05_ack_type), 
    .status_VR_id_o       (status05_VR_id), 
	.status_VR_FR_o       (status05_VR_FR),
    .status_channel_ID_o  (status05_channel_ID), 
    .status_pos_1st_o     (status05_pos_1st), 
    .status_pos_2nd_o     (status05_pos_2nd), 
    .status_src_type_o    (status05_src_type),
    
    .ach_idle_o           (ach05_idle_o), 
    .ach_eof_o            (ach05_eof_o), 
    .ach_request_i        (ach05_request_i), 
    .ach_pos_1st_i        (ach05_pos_1st_i), 
    .ach_pos_2nd_i        (ach05_pos_2nd_i), 
    .ach_src_type_i       (ach05_src_type_i),
    .ach_start_addr_i     (ach05_start_addr_i), 
    .ach_data_length_i    (ach05_data_length_i), 
    .ach_2nd_addr_burst_i (ach05_2nd_addr_burst_i), 
    .ach_column_num_2nd_i (ach05_column_num_2nd_i), 
    .ach_broadcast_i      (ach05_broadcast_i), 
    .ach_pos0_1st_i       (ach05_pos0_1st_i), 
    .ach_pos1_1st_i       (ach05_pos1_1st_i), 
    .ach_pos2_1st_i       (ach05_pos2_1st_i), 
    .ach_pos3_1st_i       (ach05_pos3_1st_i), 
    .ach_pos4_1st_i       (ach05_pos4_1st_i), 
    .ach_pos5_1st_i       (ach05_pos5_1st_i), 
    .ach_pos6_1st_i       (ach05_pos6_1st_i), 
    .ach_pos7_1st_i       (ach05_pos7_1st_i), 
    .ach_pos0_src_type_i  (ach05_pos0_src_type_i), 
    .ach_pos1_src_type_i  (ach05_pos1_src_type_i), 
    .ach_pos2_src_type_i  (ach05_pos2_src_type_i), 
    .ach_pos3_src_type_i  (ach05_pos3_src_type_i), 
    .ach_pos4_src_type_i  (ach05_pos4_src_type_i), 
    .ach_pos5_src_type_i  (ach05_pos5_src_type_i), 
    .ach_pos6_src_type_i  (ach05_pos6_src_type_i), 
    .ach_pos7_src_type_i  (ach05_pos7_src_type_i), 
    .ach_release_i        (ach05_release_i), 
    .ach_VR_id_i          (ach05_VR_id_i), 
	.ach_VR_FR_i          (ach05_VR_FR_i),
    .ach_channel_ID_i     (ach05_channel_ID_i), 
    .dch_ip_data_i        (dch05_ip_data_i), 
    .dch_ip_fwd_i         (dch05_ip_fwd_i), 
    .dch_ip_stb_i         (dch05_ip_stb_i), 
    .dch_ip_fail_o        (dch05_ip_fail_o), 
    .dch_ip_pack_o        (dch05_ip_pack_o), 
    .dch_ip_suspend_o     (dch05_ip_suspend_o), 
    .dch_ip_cancel_o      (dch05_ip_cancel_o), 
    .dch_op_fail_i        (dch05_op_fail_i), 
    .dch_op_pack_i        (dch05_op_pack_i), 
    .dch_op_suspend_i     (dch05_op_suspend_i), 
    .dch_op_cancel_i      (dch05_op_cancel_i), 
    .dch_op_data_o        (dch05_op_data_o), 
    .dch_op_fwd_o         (dch05_op_fwd_o), 
    .dch_op_stb_o         (dch05_op_stb_o), 
    .dch_pos_1st_rd       (dch05_pos_1st_rd), 
    .dch_pos_1st_wr       (dch05_pos_1st_wr), 
    .broad_grant_i        (broad05_grant_i), 
    .broad_link_o         (broad05_link_o), 
    .broad_fwd_o          (broad05_fwd_o), 
    .broad_data_o         (broad05_data_o), 
    .ch_req_rd_o          (ch05_req_rd_o), 
    .ch_rd_addr_en_i      (ch05_rd_addr_en_i), 
    .ch_wr_addr_en_i      (ch05_wr_addr_en_i), 
    .ch_address_o         (ch05_address_o),
    .RD_DFS_rd_en         (RD05_DFS_rd_en), 
    .RD_DFS_dout          (RD05_DFS_dout), 
    .RD_DFS_valid         (RD05_DFS_valid), 
    .RD_DFS_empty         (RD05_DFS_empty), 
    .WR_DFS_wr_en         (WR05_DFS_wr_en), 
    .WR_DFS_din           (WR05_DFS_din), 
    .WR_DFS_full          (WR05_DFS_full), 
    .WR_DFS_wr_count      (WR05_DFS_wr_count)
    );


//------------------ch6--------------------
RD_DATA_FIFO_S  RD_DATA_FIFO_S06 (
  .rst             (~sys_rst_n), // input rst
  
  .rd_clk          (sys_clk), // input rd_clk
  .rd_en           (RD06_DFS_rd_en), // input rd_en
  .dout            (RD06_DFS_dout), // output [63 : 0] dout
  .empty           (RD06_DFS_empty), // output empty
  .valid           (RD06_DFS_valid), // output valid
  
  .wr_clk          (sys_clk), // input wr_clk
  .wr_en           (RD06_DFS_wr_en), // input wr_en
  .din             (RD06_DFS_din), // input [511 : 0] din
  .full            (RD06_DFS_full), // output full
  .wr_data_count   (RD06_DFS_wr_count) // output [5 : 0] wr_data_count
);

WR_DATA_FIFO_S  WR_DATA_FIFO_S06 (
  .rst             (~sys_rst_n), // input rst
  
  .rd_clk          (sys_clk), // input rd_clk
  .rd_en           (WR06_DFS_rd_en), // input rd_en
  .dout            (WR06_DFS_dout), // output [511 : 0] dout
  .valid           (WR06_DFS_valid), // output valid
  .empty           (WR06_DFS_empty), // output empty
  
  .wr_clk          (sys_clk), // input wr_clk
  .wr_en           (WR06_DFS_wr_en), // input wr_en
  .din             (WR06_DFS_din), // input [63 : 0] din
  .full            (WR06_DFS_full), // output full
  .wr_data_count   (WR06_DFS_wr_count) // output [7 : 0] wr_data_count
);

ddr_ch_fsm ddr_ch_fsm_06 (
    .sys_clk              (sys_clk), 
    .sys_rst_n            (sys_rst_n), 
    .phy_init_done_i      (phy_init_done_i), 
    
    .status_grant_i       (status06_grant), 
    .status_ack_o         (status06_ack), 
    .status_ack_type_o    (status06_ack_type), 
    .status_VR_id_o       (status06_VR_id), 
	.status_VR_FR_o       (status06_VR_FR),
    .status_channel_ID_o  (status06_channel_ID), 
    .status_pos_1st_o     (status06_pos_1st), 
    .status_pos_2nd_o     (status06_pos_2nd), 
    .status_src_type_o    (status06_src_type),
    
    .ach_idle_o           (ach06_idle_o), 
    .ach_eof_o            (ach06_eof_o), 
    .ach_request_i        (ach06_request_i), 
    .ach_pos_1st_i        (ach06_pos_1st_i), 
    .ach_pos_2nd_i        (ach06_pos_2nd_i), 
    .ach_src_type_i       (ach06_src_type_i),
    .ach_start_addr_i     (ach06_start_addr_i), 
    .ach_data_length_i    (ach06_data_length_i), 
    .ach_2nd_addr_burst_i (ach06_2nd_addr_burst_i), 
    .ach_column_num_2nd_i (ach06_column_num_2nd_i), 
    .ach_broadcast_i      (ach06_broadcast_i), 
    .ach_pos0_1st_i       (ach06_pos0_1st_i), 
    .ach_pos1_1st_i       (ach06_pos1_1st_i), 
    .ach_pos2_1st_i       (ach06_pos2_1st_i), 
    .ach_pos3_1st_i       (ach06_pos3_1st_i), 
    .ach_pos4_1st_i       (ach06_pos4_1st_i), 
    .ach_pos5_1st_i       (ach06_pos5_1st_i), 
    .ach_pos6_1st_i       (ach06_pos6_1st_i), 
    .ach_pos7_1st_i       (ach06_pos7_1st_i), 
    .ach_pos0_src_type_i  (ach06_pos0_src_type_i), 
    .ach_pos1_src_type_i  (ach06_pos1_src_type_i), 
    .ach_pos2_src_type_i  (ach06_pos2_src_type_i), 
    .ach_pos3_src_type_i  (ach06_pos3_src_type_i), 
    .ach_pos4_src_type_i  (ach06_pos4_src_type_i), 
    .ach_pos5_src_type_i  (ach06_pos5_src_type_i), 
    .ach_pos6_src_type_i  (ach06_pos6_src_type_i), 
    .ach_pos7_src_type_i  (ach06_pos7_src_type_i), 
    .ach_release_i        (ach06_release_i), 
    .ach_VR_id_i          (ach06_VR_id_i), 
	.ach_VR_FR_i          (ach06_VR_FR_i),
    .ach_channel_ID_i     (ach06_channel_ID_i), 
    .dch_ip_data_i        (dch06_ip_data_i), 
    .dch_ip_fwd_i         (dch06_ip_fwd_i), 
    .dch_ip_stb_i         (dch06_ip_stb_i), 
    .dch_ip_fail_o        (dch06_ip_fail_o), 
    .dch_ip_pack_o        (dch06_ip_pack_o), 
    .dch_ip_suspend_o     (dch06_ip_suspend_o), 
    .dch_ip_cancel_o      (dch06_ip_cancel_o), 
    .dch_op_fail_i        (dch06_op_fail_i), 
    .dch_op_pack_i        (dch06_op_pack_i), 
    .dch_op_suspend_i     (dch06_op_suspend_i), 
    .dch_op_cancel_i      (dch06_op_cancel_i), 
    .dch_op_data_o        (dch06_op_data_o), 
    .dch_op_fwd_o         (dch06_op_fwd_o), 
    .dch_op_stb_o         (dch06_op_stb_o), 
    .dch_pos_1st_rd       (dch06_pos_1st_rd), 
    .dch_pos_1st_wr       (dch06_pos_1st_wr), 
    .broad_grant_i        (broad06_grant_i), 
    .broad_link_o         (broad06_link_o), 
    .broad_fwd_o          (broad06_fwd_o), 
    .broad_data_o         (broad06_data_o), 
    .ch_req_rd_o          (ch06_req_rd_o), 
    .ch_rd_addr_en_i      (ch06_rd_addr_en_i), 
    .ch_wr_addr_en_i      (ch06_wr_addr_en_i), 
    .ch_address_o         (ch06_address_o),
    .RD_DFS_rd_en         (RD06_DFS_rd_en), 
    .RD_DFS_dout          (RD06_DFS_dout), 
    .RD_DFS_valid         (RD06_DFS_valid), 
    .RD_DFS_empty         (RD06_DFS_empty), 
    .WR_DFS_wr_en         (WR06_DFS_wr_en), 
    .WR_DFS_din           (WR06_DFS_din), 
    .WR_DFS_full          (WR06_DFS_full), 
    .WR_DFS_wr_count      (WR06_DFS_wr_count)
    );
    
endmodule
