`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:50:24 09/26/2016 
// Design Name: 
// Module Name:    ach_top 
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
module ach_top(
    sys_clk,  sys_rst_n, phy_init_done_i, first_release_flag,
    
  //request info
  request_data_valid_i,
  request_pos_1st_i,
  request_pos_2nd_i,
  request_src_type_i,
  request_addr_1st_row_i,
  request_addr_1st_col_i,
  request_addr_last_trans_i,
  
  request_cmd_valid_i,
  request_access_addr_i,
  
  
	//cfg info
	cfg_valid_i,
	cfg_third_req_i,
	cfg_broadcast_i,
	cfg_row_column_i,			//0-列  1-行
	cfg_read_write_i,			//0-读  1-写
	cfg_cluster_num_i,
	cfg_VR_id_i,					//主控制器虚拟寄存器编号
	cfg_VR_FR_i,
	cfg_channel_id_i,	    //地址通道编号
	
//------------------no-use
	cfg_stream_i,
	cfg_D2D_flag_i,
//------------------
	
	//下面的cfg info以总线的形式下发到32个ddr_channel
  cfg_data_pos0_1st_i,	/*** 与DDR发生数据交互的IP的一级坐标 ***/
  cfg_data_pos1_1st_i,
  cfg_data_pos2_1st_i,
  cfg_data_pos3_1st_i,
  cfg_data_pos4_1st_i,
  cfg_data_pos5_1st_i,
  cfg_data_pos6_1st_i,
  cfg_data_pos7_1st_i,
  cfg_data_pos0_2nd_i,
  cfg_data_pos1_2nd_i,
  cfg_data_pos2_2nd_i,
  cfg_data_pos3_2nd_i,
  cfg_data_pos4_2nd_i,
  cfg_data_pos5_2nd_i,
  cfg_data_pos6_2nd_i,
  cfg_data_pos7_2nd_i,
	
  cfg_addr_pos0_1st_i,	/*** 发起三方请求的IP的一级坐标 ***/ //一般来说该IP是COP；
  cfg_addr_pos1_1st_i,                                       //当非三方请求时，该坐标不使用，默认为零。
  cfg_addr_pos2_1st_i,
  cfg_addr_pos3_1st_i,
  cfg_addr_pos4_1st_i,
  cfg_addr_pos5_1st_i,
  cfg_addr_pos6_1st_i,
  cfg_addr_pos7_1st_i,
  cfg_addr_pos0_2nd_i,
  cfg_addr_pos1_2nd_i,
  cfg_addr_pos2_2nd_i,
  cfg_addr_pos3_2nd_i,
  cfg_addr_pos4_2nd_i,
  cfg_addr_pos5_2nd_i,
  cfg_addr_pos6_2nd_i,
  cfg_addr_pos7_2nd_i,
  
  cfg_start_pos_row_0_i,	/*** 各个配置簇初次访问DDR时访问的矩阵块在二维矩阵网格中的坐标 ***/
  cfg_start_pos_col_0_i,
  cfg_start_pos_row_1_i,
  cfg_start_pos_col_1_i,
  cfg_start_pos_row_2_i,
  cfg_start_pos_col_2_i,
  cfg_start_pos_row_3_i,
  cfg_start_pos_col_3_i,
  cfg_start_pos_row_4_i,
  cfg_start_pos_col_4_i,
  cfg_start_pos_row_5_i,
  cfg_start_pos_col_5_i,
  cfg_start_pos_row_6_i,
  cfg_start_pos_col_6_i,
  cfg_start_pos_row_7_i,
  cfg_start_pos_col_7_i,
	
  cfg_start_addr_i,
  cfg_row_num_1st_i,
  cfg_col_num_1st_i,
  cfg_row_num_2nd_i,
  cfg_col_num_2nd_i,
  cfg_circu_times_i,		//循环次数
  
	cfg_col_addr_burst_i,	//一级矩阵列加一地址跳变数目
	cfg_row_addr_burst_i,	//一级矩阵行加一地址跳变数目
	cfg_2nd_addr_burst_i,	//二级矩阵行加一地址跳变数目
	cfg_length_burst_i,	  //二级矩阵大小--------规定为二级矩阵块中的小块总个数



//---------6个通用数据通道---------//
  ch1_idle_i,           ch2_idle_i,           ch3_idle_i,           ch4_idle_i,           ch5_idle_i,           ch6_idle_i,           
  ch1_eof_i,            ch2_eof_i,            ch3_eof_i,            ch4_eof_i,            ch5_eof_i,            ch6_eof_i,            
  ch1_request_o,        ch2_request_o,        ch3_request_o,        ch4_request_o,        ch5_request_o,        ch6_request_o,        
  ch1_pos_1st_o,        ch2_pos_1st_o,        ch3_pos_1st_o,        ch4_pos_1st_o,        ch5_pos_1st_o,        ch6_pos_1st_o,        
  ch1_pos_2nd_o,        ch2_pos_2nd_o,        ch3_pos_2nd_o,        ch4_pos_2nd_o,        ch5_pos_2nd_o,        ch6_pos_2nd_o,        
  ch1_src_type_o,       ch2_src_type_o,       ch3_src_type_o,       ch4_src_type_o,       ch5_src_type_o,       ch6_src_type_o,       
  ch1_start_addr_o,     ch2_start_addr_o,     ch3_start_addr_o,     ch4_start_addr_o,     ch5_start_addr_o,     ch6_start_addr_o,     
  ch1_data_length_o,    ch2_data_length_o,    ch3_data_length_o,    ch4_data_length_o,    ch5_data_length_o,    ch6_data_length_o,    
  ch1_2nd_addr_burst_o, ch2_2nd_addr_burst_o, ch3_2nd_addr_burst_o, ch4_2nd_addr_burst_o, ch5_2nd_addr_burst_o, ch6_2nd_addr_burst_o, 
  ch1_column_num_2nd_o, ch2_column_num_2nd_o, ch3_column_num_2nd_o, ch4_column_num_2nd_o, ch5_column_num_2nd_o, ch6_column_num_2nd_o, 

  ch1_broadcast_o,      ch2_broadcast_o,      ch3_broadcast_o,      ch4_broadcast_o,      ch5_broadcast_o,      ch6_broadcast_o,      
  ch1_pos0_1st_o,       ch2_pos0_1st_o,       ch3_pos0_1st_o,       ch4_pos0_1st_o,       ch5_pos0_1st_o,       ch6_pos0_1st_o,       
  ch1_pos1_1st_o,       ch2_pos1_1st_o,       ch3_pos1_1st_o,       ch4_pos1_1st_o,       ch5_pos1_1st_o,       ch6_pos1_1st_o,       
  ch1_pos2_1st_o,       ch2_pos2_1st_o,       ch3_pos2_1st_o,       ch4_pos2_1st_o,       ch5_pos2_1st_o,       ch6_pos2_1st_o,       
  ch1_pos3_1st_o,       ch2_pos3_1st_o,       ch3_pos3_1st_o,       ch4_pos3_1st_o,       ch5_pos3_1st_o,       ch6_pos3_1st_o,       
  ch1_pos4_1st_o,       ch2_pos4_1st_o,       ch3_pos4_1st_o,       ch4_pos4_1st_o,       ch5_pos4_1st_o,       ch6_pos4_1st_o,       
  ch1_pos5_1st_o,       ch2_pos5_1st_o,       ch3_pos5_1st_o,       ch4_pos5_1st_o,       ch5_pos5_1st_o,       ch6_pos5_1st_o,       
  ch1_pos6_1st_o,       ch2_pos6_1st_o,       ch3_pos6_1st_o,       ch4_pos6_1st_o,       ch5_pos6_1st_o,       ch6_pos6_1st_o,       
  ch1_pos7_1st_o,       ch2_pos7_1st_o,       ch3_pos7_1st_o,       ch4_pos7_1st_o,       ch5_pos7_1st_o,       ch6_pos7_1st_o,       
  ch1_pos0_src_type_o,  ch2_pos0_src_type_o,  ch3_pos0_src_type_o,  ch4_pos0_src_type_o,  ch5_pos0_src_type_o,  ch6_pos0_src_type_o,  
  ch1_pos1_src_type_o,  ch2_pos1_src_type_o,  ch3_pos1_src_type_o,  ch4_pos1_src_type_o,  ch5_pos1_src_type_o,  ch6_pos1_src_type_o,  
  ch1_pos2_src_type_o,  ch2_pos2_src_type_o,  ch3_pos2_src_type_o,  ch4_pos2_src_type_o,  ch5_pos2_src_type_o,  ch6_pos2_src_type_o,  
  ch1_pos3_src_type_o,  ch2_pos3_src_type_o,  ch3_pos3_src_type_o,  ch4_pos3_src_type_o,  ch5_pos3_src_type_o,  ch6_pos3_src_type_o,  
  ch1_pos4_src_type_o,  ch2_pos4_src_type_o,  ch3_pos4_src_type_o,  ch4_pos4_src_type_o,  ch5_pos4_src_type_o,  ch6_pos4_src_type_o,  
  ch1_pos5_src_type_o,  ch2_pos5_src_type_o,  ch3_pos5_src_type_o,  ch4_pos5_src_type_o,  ch5_pos5_src_type_o,  ch6_pos5_src_type_o,  
  ch1_pos6_src_type_o,  ch2_pos6_src_type_o,  ch3_pos6_src_type_o,  ch4_pos6_src_type_o,  ch5_pos6_src_type_o,  ch6_pos6_src_type_o,  
  ch1_pos7_src_type_o,  ch2_pos7_src_type_o,  ch3_pos7_src_type_o,  ch4_pos7_src_type_o,  ch5_pos7_src_type_o,  ch6_pos7_src_type_o,  

  ch1_release_o,        ch2_release_o,        ch3_release_o,        ch4_release_o,        ch5_release_o,        ch6_release_o,        
  ch1_VR_id_o,          ch2_VR_id_o,          ch3_VR_id_o,          ch4_VR_id_o,          ch5_VR_id_o,          ch6_VR_id_o,        
  ch1_VR_FR_o,          ch2_VR_FR_o,          ch3_VR_FR_o,          ch4_VR_FR_o,          ch5_VR_FR_o,          ch6_VR_FR_o,          
  ch1_channel_ID_o,     ch2_channel_ID_o,     ch3_channel_ID_o,     ch4_channel_ID_o,     ch5_channel_ID_o,     ch6_channel_ID_o     

    );
  input    sys_clk,  sys_rst_n,  phy_init_done_i,  first_release_flag;
  
//来自ddr_cfg_decoder的信号
  //request info
  input                 request_data_valid_i;
  input     [ 7:0]      request_pos_1st_i;
  input     [ 2:0]      request_pos_2nd_i;
  input     [ 1:0]      request_src_type_i;
  input     [15:0]      request_addr_1st_row_i;		//适用于COP三方数据请求
  input     [13:0]      request_addr_1st_col_i;
  input                 request_addr_last_trans_i;

  input                 request_cmd_valid_i;
  input     [19:0]      request_access_addr_i;
  
	//cfg info
  input                 cfg_valid_i;
	
	input                 cfg_third_req_i;
	input                 cfg_stream_i;
	input                 cfg_broadcast_i;
	input                 cfg_row_column_i;		//0-列  1-行
	input                 cfg_read_write_i;		//0-读  1-写
	input                 cfg_D2D_flag_i;	
	input     [ 2:0]      cfg_cluster_num_i;
	input     [ 8:0]      cfg_VR_id_i;					//主控制器虚拟寄存器编号
	input     [ 2:0]      cfg_VR_FR_i;
	input     [ 4:0]      cfg_channel_id_i;	//地址通道编号
    
	//下面的cfg info以总线的形式下发到32个ddr_channel
  input     [ 7:0]      cfg_data_pos0_1st_i;	/*** 与DDR发生数据交互的IP的一级坐标 ***/
  input     [ 7:0]      cfg_data_pos1_1st_i;
  input     [ 7:0]      cfg_data_pos2_1st_i;
  input     [ 7:0]      cfg_data_pos3_1st_i;
  input     [ 7:0]      cfg_data_pos4_1st_i;
  input     [ 7:0]      cfg_data_pos5_1st_i;
  input     [ 7:0]      cfg_data_pos6_1st_i;
  input     [ 7:0]      cfg_data_pos7_1st_i;
  input     [ 2:0]      cfg_data_pos0_2nd_i;
  input     [ 2:0]      cfg_data_pos1_2nd_i;
  input     [ 2:0]      cfg_data_pos2_2nd_i;
  input     [ 2:0]      cfg_data_pos3_2nd_i;
  input     [ 2:0]      cfg_data_pos4_2nd_i;
  input     [ 2:0]      cfg_data_pos5_2nd_i;
  input     [ 2:0]      cfg_data_pos6_2nd_i;
  input     [ 2:0]      cfg_data_pos7_2nd_i;
  
  input     [ 7:0]      cfg_addr_pos0_1st_i;	/*** 发起三方请求的IP的一级坐标 ***/  //一般来说该IP是COP
  input     [ 7:0]      cfg_addr_pos1_1st_i;  //当非三方请求时，该坐标不使用，默认为零。
  input     [ 7:0]      cfg_addr_pos2_1st_i;
  input     [ 7:0]      cfg_addr_pos3_1st_i;
  input     [ 7:0]      cfg_addr_pos4_1st_i;
  input     [ 7:0]      cfg_addr_pos5_1st_i;
  input     [ 7:0]      cfg_addr_pos6_1st_i;
  input     [ 7:0]      cfg_addr_pos7_1st_i;
  input     [ 2:0]      cfg_addr_pos0_2nd_i;
  input     [ 2:0]      cfg_addr_pos1_2nd_i;
  input     [ 2:0]      cfg_addr_pos2_2nd_i;
  input     [ 2:0]      cfg_addr_pos3_2nd_i;
  input     [ 2:0]      cfg_addr_pos4_2nd_i;
  input     [ 2:0]      cfg_addr_pos5_2nd_i;
  input     [ 2:0]      cfg_addr_pos6_2nd_i;
  input     [ 2:0]      cfg_addr_pos7_2nd_i;
  
  input     [15:0]      cfg_start_pos_row_0_i;	/*** 各个配置簇初次访问DDR时访问的矩阵块在二维矩阵网格中的坐标 ***/
  input     [13:0]      cfg_start_pos_col_0_i;
  input     [15:0]      cfg_start_pos_row_1_i;
  input     [13:0]      cfg_start_pos_col_1_i;
  input     [15:0]      cfg_start_pos_row_2_i;
  input     [13:0]      cfg_start_pos_col_2_i;
  input     [15:0]      cfg_start_pos_row_3_i;
  input     [13:0]      cfg_start_pos_col_3_i;
  input     [15:0]      cfg_start_pos_row_4_i;
  input     [13:0]      cfg_start_pos_col_4_i;
  input     [15:0]      cfg_start_pos_row_5_i;
  input     [13:0]      cfg_start_pos_col_5_i;
  input     [15:0]      cfg_start_pos_row_6_i;
  input     [13:0]      cfg_start_pos_col_6_i;
  input     [15:0]      cfg_start_pos_row_7_i;
  input     [13:0]      cfg_start_pos_col_7_i;
    
  input     [29:0]      cfg_start_addr_i;
  input     [15:0]      cfg_row_num_1st_i;
  input     [13:0]      cfg_col_num_1st_i;
  input     [15:0]      cfg_row_num_2nd_i;
  input     [13:0]      cfg_col_num_2nd_i;
  input     [29:0]      cfg_circu_times_i;		//循环次数
  
	input     [29:0]      cfg_col_addr_burst_i;	//一级矩阵列加一地址跳变数目
	input     [29:0]      cfg_row_addr_burst_i;	//一级矩阵行加一地址跳变数目
	input     [29:0]      cfg_2nd_addr_burst_i;	//二级矩阵行加一地址跳变数目
	input     [29:0]      cfg_length_burst_i;	  //二级矩阵大小--------规定为二级矩阵块中的小块总个数
	

//送至ddr_master的信号

//---------6个通用数据通道---------//
input                ch1_idle_i,           ch2_idle_i,           ch3_idle_i,           ch4_idle_i,           ch5_idle_i,           ch6_idle_i          ;
input                ch1_eof_i,            ch2_eof_i,            ch3_eof_i,            ch4_eof_i,            ch5_eof_i,            ch6_eof_i           ;
output     [ 1:0]    ch1_request_o,        ch2_request_o,        ch3_request_o,        ch4_request_o,        ch5_request_o,        ch6_request_o       ;
output     [ 7:0]    ch1_pos_1st_o,        ch2_pos_1st_o,        ch3_pos_1st_o,        ch4_pos_1st_o,        ch5_pos_1st_o,        ch6_pos_1st_o       ;
output     [ 2:0]    ch1_pos_2nd_o,        ch2_pos_2nd_o,        ch3_pos_2nd_o,        ch4_pos_2nd_o,        ch5_pos_2nd_o,        ch6_pos_2nd_o       ;
output     [ 1:0]    ch1_src_type_o,       ch2_src_type_o,       ch3_src_type_o,       ch4_src_type_o,       ch5_src_type_o,       ch6_src_type_o      ;
output     [29:0]    ch1_start_addr_o,     ch2_start_addr_o,     ch3_start_addr_o,     ch4_start_addr_o,     ch5_start_addr_o,     ch6_start_addr_o    ;
output     [29:0]    ch1_data_length_o,    ch2_data_length_o,    ch3_data_length_o,    ch4_data_length_o,    ch5_data_length_o,    ch6_data_length_o   ;
output     [29:0]    ch1_2nd_addr_burst_o, ch2_2nd_addr_burst_o, ch3_2nd_addr_burst_o, ch4_2nd_addr_burst_o, ch5_2nd_addr_burst_o, ch6_2nd_addr_burst_o;
output     [29:0]    ch1_column_num_2nd_o, ch2_column_num_2nd_o, ch3_column_num_2nd_o, ch4_column_num_2nd_o, ch5_column_num_2nd_o, ch6_column_num_2nd_o;
                                                                                                                                                       
output               ch1_broadcast_o,      ch2_broadcast_o,      ch3_broadcast_o,      ch4_broadcast_o,      ch5_broadcast_o,      ch6_broadcast_o     ;
output     [ 7:0]    ch1_pos0_1st_o,       ch2_pos0_1st_o,       ch3_pos0_1st_o,       ch4_pos0_1st_o,       ch5_pos0_1st_o,       ch6_pos0_1st_o      ;
output     [ 7:0]    ch1_pos1_1st_o,       ch2_pos1_1st_o,       ch3_pos1_1st_o,       ch4_pos1_1st_o,       ch5_pos1_1st_o,       ch6_pos1_1st_o      ;
output     [ 7:0]    ch1_pos2_1st_o,       ch2_pos2_1st_o,       ch3_pos2_1st_o,       ch4_pos2_1st_o,       ch5_pos2_1st_o,       ch6_pos2_1st_o      ;
output     [ 7:0]    ch1_pos3_1st_o,       ch2_pos3_1st_o,       ch3_pos3_1st_o,       ch4_pos3_1st_o,       ch5_pos3_1st_o,       ch6_pos3_1st_o      ;
output     [ 7:0]    ch1_pos4_1st_o,       ch2_pos4_1st_o,       ch3_pos4_1st_o,       ch4_pos4_1st_o,       ch5_pos4_1st_o,       ch6_pos4_1st_o      ;
output     [ 7:0]    ch1_pos5_1st_o,       ch2_pos5_1st_o,       ch3_pos5_1st_o,       ch4_pos5_1st_o,       ch5_pos5_1st_o,       ch6_pos5_1st_o      ;
output     [ 7:0]    ch1_pos6_1st_o,       ch2_pos6_1st_o,       ch3_pos6_1st_o,       ch4_pos6_1st_o,       ch5_pos6_1st_o,       ch6_pos6_1st_o      ;
output     [ 7:0]    ch1_pos7_1st_o,       ch2_pos7_1st_o,       ch3_pos7_1st_o,       ch4_pos7_1st_o,       ch5_pos7_1st_o,       ch6_pos7_1st_o      ;
output     [ 1:0]    ch1_pos0_src_type_o,  ch2_pos0_src_type_o,  ch3_pos0_src_type_o,  ch4_pos0_src_type_o,  ch5_pos0_src_type_o,  ch6_pos0_src_type_o ;
output     [ 1:0]    ch1_pos1_src_type_o,  ch2_pos1_src_type_o,  ch3_pos1_src_type_o,  ch4_pos1_src_type_o,  ch5_pos1_src_type_o,  ch6_pos1_src_type_o ;
output     [ 1:0]    ch1_pos2_src_type_o,  ch2_pos2_src_type_o,  ch3_pos2_src_type_o,  ch4_pos2_src_type_o,  ch5_pos2_src_type_o,  ch6_pos2_src_type_o ;
output     [ 1:0]    ch1_pos3_src_type_o,  ch2_pos3_src_type_o,  ch3_pos3_src_type_o,  ch4_pos3_src_type_o,  ch5_pos3_src_type_o,  ch6_pos3_src_type_o ;
output     [ 1:0]    ch1_pos4_src_type_o,  ch2_pos4_src_type_o,  ch3_pos4_src_type_o,  ch4_pos4_src_type_o,  ch5_pos4_src_type_o,  ch6_pos4_src_type_o ;
output     [ 1:0]    ch1_pos5_src_type_o,  ch2_pos5_src_type_o,  ch3_pos5_src_type_o,  ch4_pos5_src_type_o,  ch5_pos5_src_type_o,  ch6_pos5_src_type_o ;
output     [ 1:0]    ch1_pos6_src_type_o,  ch2_pos6_src_type_o,  ch3_pos6_src_type_o,  ch4_pos6_src_type_o,  ch5_pos6_src_type_o,  ch6_pos6_src_type_o ;
output     [ 1:0]    ch1_pos7_src_type_o,  ch2_pos7_src_type_o,  ch3_pos7_src_type_o,  ch4_pos7_src_type_o,  ch5_pos7_src_type_o,  ch6_pos7_src_type_o ;
                                                                                                                                                       
output               ch1_release_o,        ch2_release_o,        ch3_release_o,        ch4_release_o,        ch5_release_o,        ch6_release_o       ;
output     [ 8:0]    ch1_VR_id_o,          ch2_VR_id_o,          ch3_VR_id_o,          ch4_VR_id_o,          ch5_VR_id_o,          ch6_VR_id_o         ; 
output     [ 2:0]    ch1_VR_FR_o,          ch2_VR_FR_o,          ch3_VR_FR_o,          ch4_VR_FR_o,          ch5_VR_FR_o,          ch6_VR_FR_o         ;
output     [ 4:0]    ch1_channel_ID_o,     ch2_channel_ID_o,     ch3_channel_ID_o,     ch4_channel_ID_o,     ch5_channel_ID_o,     ch6_channel_ID_o    ;


//模块互连信号线
wire                 MC_fifo_rd_en;
wire                 MC_fifo_valid;
wire     [74:0]      MC_fifo_dout;
wire                 MC_fifo_empty;

wire                 COP_fifo_rd_en;
wire                 COP_fifo_valid;
wire     [44:0]      COP_fifo_dout;
wire                 COP_fifo_empty;

wire                 channel_fifo_rd_en;
wire                 channel_fifo_valid;
wire     [233:0]     channel_fifo_dout;
wire                 channel_fifo_empty;


// Instantiate the module
addr_ch_MC addr_ch_MC (
     .clk                        (sys_clk                    ),
     .rst_n                      (sys_rst_n                  ),
     .request_valid_i            (request_cmd_valid_i        ),
     .request_pos_1st_i          (request_pos_1st_i          ),
     .request_pos_2nd_i          (request_pos_2nd_i          ),
     .request_src_type_i         (request_src_type_i         ),
     .request_access_addr_i      (request_access_addr_i      ),
     .rd_en                      (MC_fifo_rd_en              ),
     .dout                       (MC_fifo_dout               ),
     .valid                      (MC_fifo_valid              ),
     .empty                      (MC_fifo_empty              )
    );

addr_ch_COP addr_ch_COP (
     .clk                        (sys_clk                    ),
     .rst_n                      (sys_rst_n                  ),
     .request_valid_i            (request_cmd_valid_i        ),
     .request_pos_1st_i          (request_pos_1st_i          ),
     .request_pos_2nd_i          (request_pos_2nd_i          ),
     .request_src_type_i         (request_src_type_i         ),
     .request_access_addr_i      (request_access_addr_i      ),
     .rd_en                      (COP_fifo_rd_en             ),
     .dout                       (COP_fifo_dout              ),
     .valid                      (COP_fifo_valid             ),
     .empty                      (COP_fifo_empty             )
    );



// Instantiate the module
general_ach general_ach (
     .clk                        (sys_clk                    ),
     .rst_n                      (sys_rst_n                  ),
     .request_valid_i            (request_data_valid_i       ),
     .request_pos_1st_i          (request_pos_1st_i          ),
     .request_pos_2nd_i          (request_pos_2nd_i          ),
     .request_src_type_i         (request_src_type_i         ),
     .request_addr_1st_row_i     (request_addr_1st_row_i     ),
     .request_addr_1st_col_i     (request_addr_1st_col_i     ),
     .request_addr_last_trans_i  (request_addr_last_trans_i  ),
     .cfg_valid_i                (cfg_valid_i                ),
     .cfg_third_req_i            (cfg_third_req_i            ),
     .cfg_broadcast_i            (cfg_broadcast_i            ),
     .cfg_row_column_i           (cfg_row_column_i           ),
     .cfg_read_write_i           (cfg_read_write_i           ),
     .cfg_cluster_num_i          (cfg_cluster_num_i          ),
     .cfg_VR_id_i                (cfg_VR_id_i                ),
	 .cfg_VR_FR_i                (cfg_VR_FR_i                ),
     .cfg_channel_id_i           (cfg_channel_id_i           ),
     .cfg_stream_i               (cfg_stream_i               ),
     .cfg_D2D_flag_i             (cfg_D2D_flag_i             ),
     .cfg_data_pos0_1st_i        (cfg_data_pos0_1st_i        ),
     .cfg_data_pos1_1st_i        (cfg_data_pos1_1st_i        ),
     .cfg_data_pos2_1st_i        (cfg_data_pos2_1st_i        ),
     .cfg_data_pos3_1st_i        (cfg_data_pos3_1st_i        ),
     .cfg_data_pos4_1st_i        (cfg_data_pos4_1st_i        ),
     .cfg_data_pos5_1st_i        (cfg_data_pos5_1st_i        ),
     .cfg_data_pos6_1st_i        (cfg_data_pos6_1st_i        ),
     .cfg_data_pos7_1st_i        (cfg_data_pos7_1st_i        ),
     .cfg_data_pos0_2nd_i        (cfg_data_pos0_2nd_i        ),
     .cfg_data_pos1_2nd_i        (cfg_data_pos1_2nd_i        ),
     .cfg_data_pos2_2nd_i        (cfg_data_pos2_2nd_i        ),
     .cfg_data_pos3_2nd_i        (cfg_data_pos3_2nd_i        ),
     .cfg_data_pos4_2nd_i        (cfg_data_pos4_2nd_i        ),
     .cfg_data_pos5_2nd_i        (cfg_data_pos5_2nd_i        ),
     .cfg_data_pos6_2nd_i        (cfg_data_pos6_2nd_i        ),
     .cfg_data_pos7_2nd_i        (cfg_data_pos7_2nd_i        ),
     .cfg_addr_pos0_1st_i        (cfg_addr_pos0_1st_i        ),
     .cfg_addr_pos1_1st_i        (cfg_addr_pos1_1st_i        ),
     .cfg_addr_pos2_1st_i        (cfg_addr_pos2_1st_i        ),
     .cfg_addr_pos3_1st_i        (cfg_addr_pos3_1st_i        ),
     .cfg_addr_pos4_1st_i        (cfg_addr_pos4_1st_i        ),
     .cfg_addr_pos5_1st_i        (cfg_addr_pos5_1st_i        ),
     .cfg_addr_pos6_1st_i        (cfg_addr_pos6_1st_i        ),
     .cfg_addr_pos7_1st_i        (cfg_addr_pos7_1st_i        ),
     .cfg_addr_pos0_2nd_i        (cfg_addr_pos0_2nd_i        ),
     .cfg_addr_pos1_2nd_i        (cfg_addr_pos1_2nd_i        ),
     .cfg_addr_pos2_2nd_i        (cfg_addr_pos2_2nd_i        ),
     .cfg_addr_pos3_2nd_i        (cfg_addr_pos3_2nd_i        ),
     .cfg_addr_pos4_2nd_i        (cfg_addr_pos4_2nd_i        ),
     .cfg_addr_pos5_2nd_i        (cfg_addr_pos5_2nd_i        ),
     .cfg_addr_pos6_2nd_i        (cfg_addr_pos6_2nd_i        ),
     .cfg_addr_pos7_2nd_i        (cfg_addr_pos7_2nd_i        ),
     .cfg_start_pos_row_0_i      (cfg_start_pos_row_0_i      ),
     .cfg_start_pos_col_0_i      (cfg_start_pos_col_0_i      ),
     .cfg_start_pos_row_1_i      (cfg_start_pos_row_1_i      ),
     .cfg_start_pos_col_1_i      (cfg_start_pos_col_1_i      ),
     .cfg_start_pos_row_2_i      (cfg_start_pos_row_2_i      ),
     .cfg_start_pos_col_2_i      (cfg_start_pos_col_2_i      ),
     .cfg_start_pos_row_3_i      (cfg_start_pos_row_3_i      ),
     .cfg_start_pos_col_3_i      (cfg_start_pos_col_3_i      ),
     .cfg_start_pos_row_4_i      (cfg_start_pos_row_4_i      ),
     .cfg_start_pos_col_4_i      (cfg_start_pos_col_4_i      ),
     .cfg_start_pos_row_5_i      (cfg_start_pos_row_5_i      ),
     .cfg_start_pos_col_5_i      (cfg_start_pos_col_5_i      ),
     .cfg_start_pos_row_6_i      (cfg_start_pos_row_6_i      ),
     .cfg_start_pos_col_6_i      (cfg_start_pos_col_6_i      ),
     .cfg_start_pos_row_7_i      (cfg_start_pos_row_7_i      ),
     .cfg_start_pos_col_7_i      (cfg_start_pos_col_7_i      ),
     .cfg_start_addr_i           (cfg_start_addr_i           ),
     .cfg_row_num_1st_i          (cfg_row_num_1st_i          ),
     .cfg_col_num_1st_i          (cfg_col_num_1st_i          ),
     .cfg_row_num_2nd_i          (cfg_row_num_2nd_i          ),
     .cfg_col_num_2nd_i          (cfg_col_num_2nd_i          ),
     .cfg_circu_times_i          (cfg_circu_times_i          ),
     .cfg_col_addr_burst_i       (cfg_col_addr_burst_i       ),
     .cfg_row_addr_burst_i       (cfg_row_addr_burst_i       ),
     .cfg_2nd_addr_burst_i       (cfg_2nd_addr_burst_i       ),
     .cfg_length_burst_i         (cfg_length_burst_i         ),
     .rd_en                      (channel_fifo_rd_en         ),
     .dout                       (channel_fifo_dout          ),
     .valid                      (channel_fifo_valid         ),
     .empty                      (channel_fifo_empty         )
    );




// Instantiate the module
Task_arbiter_v2  Task_arbiter_v2 (
     .sys_clk                    (sys_clk                    ),
     .sys_rst_n                  (sys_rst_n                  ),
     .phy_init_done_i            (phy_init_done_i            ),
     .first_release_flag        (first_release_flag),   //// by yyp, 2017-01-05, special for COP
     .MC_fifo_rd_en              (MC_fifo_rd_en              ),
     .MC_fifo_valid              (MC_fifo_valid              ),
     .MC_fifo_dout               (MC_fifo_dout               ),
     .MC_fifo_empty              (MC_fifo_empty              ),
     .COP_fifo_rd_en             (COP_fifo_rd_en             ),
     .COP_fifo_valid             (COP_fifo_valid             ),
     .COP_fifo_dout              (COP_fifo_dout              ),
     .COP_fifo_empty             (COP_fifo_empty             ),
     .channel_fifo_rd_en         (channel_fifo_rd_en         ),
     .channel_fifo_valid         (channel_fifo_valid         ),
     .channel_fifo_dout          (channel_fifo_dout          ),
     .channel_fifo_empty         (channel_fifo_empty         ),
     .ch1_idle_i                 (ch1_idle_i                 ),
     .ch1_eof_i                  (ch1_eof_i                  ),
     .ch1_request_o              (ch1_request_o              ),
     .ch1_pos_1st_o              (ch1_pos_1st_o              ),
     .ch1_pos_2nd_o              (ch1_pos_2nd_o              ),
     .ch1_src_type_o             (ch1_src_type_o             ),
     .ch1_start_addr_o           (ch1_start_addr_o           ),
     .ch1_data_length_o          (ch1_data_length_o          ),
     .ch1_2nd_addr_burst_o       (ch1_2nd_addr_burst_o       ),
     .ch1_column_num_2nd_o       (ch1_column_num_2nd_o       ),
     .ch1_broadcast_o            (ch1_broadcast_o            ),
     .ch1_pos0_1st_o             (ch1_pos0_1st_o             ),
     .ch1_pos1_1st_o             (ch1_pos1_1st_o             ),
     .ch1_pos2_1st_o             (ch1_pos2_1st_o             ),
     .ch1_pos3_1st_o             (ch1_pos3_1st_o             ),
     .ch1_pos4_1st_o             (ch1_pos4_1st_o             ),
     .ch1_pos5_1st_o             (ch1_pos5_1st_o             ),
     .ch1_pos6_1st_o             (ch1_pos6_1st_o             ),
     .ch1_pos7_1st_o             (ch1_pos7_1st_o             ),
     .ch1_pos0_src_type_o        (ch1_pos0_src_type_o        ),
     .ch1_pos1_src_type_o        (ch1_pos1_src_type_o        ),
     .ch1_pos2_src_type_o        (ch1_pos2_src_type_o        ),
     .ch1_pos3_src_type_o        (ch1_pos3_src_type_o        ),
     .ch1_pos4_src_type_o        (ch1_pos4_src_type_o        ),
     .ch1_pos5_src_type_o        (ch1_pos5_src_type_o        ),
     .ch1_pos6_src_type_o        (ch1_pos6_src_type_o        ),
     .ch1_pos7_src_type_o        (ch1_pos7_src_type_o        ),
     .ch1_release_o              (ch1_release_o              ),
     .ch1_VR_id_o                (ch1_VR_id_o                ),
	 .ch1_VR_FR_o                (ch1_VR_FR_o                ),
     .ch1_channel_ID_o           (ch1_channel_ID_o           ),
     .ch2_idle_i                 (ch2_idle_i                 ),
     .ch2_eof_i                  (ch2_eof_i                  ),
     .ch2_request_o              (ch2_request_o              ),
     .ch2_pos_1st_o              (ch2_pos_1st_o              ),
     .ch2_pos_2nd_o              (ch2_pos_2nd_o              ),
     .ch2_src_type_o             (ch2_src_type_o             ),
     .ch2_start_addr_o           (ch2_start_addr_o           ),
     .ch2_data_length_o          (ch2_data_length_o          ),
     .ch2_2nd_addr_burst_o       (ch2_2nd_addr_burst_o       ),
     .ch2_column_num_2nd_o       (ch2_column_num_2nd_o       ),
     .ch2_broadcast_o            (ch2_broadcast_o            ),
     .ch2_pos0_1st_o             (ch2_pos0_1st_o             ),
     .ch2_pos1_1st_o             (ch2_pos1_1st_o             ),
     .ch2_pos2_1st_o             (ch2_pos2_1st_o             ),
     .ch2_pos3_1st_o             (ch2_pos3_1st_o             ),
     .ch2_pos4_1st_o             (ch2_pos4_1st_o             ),
     .ch2_pos5_1st_o             (ch2_pos5_1st_o             ),
     .ch2_pos6_1st_o             (ch2_pos6_1st_o             ),
     .ch2_pos7_1st_o             (ch2_pos7_1st_o             ),
     .ch2_pos0_src_type_o        (ch2_pos0_src_type_o        ),
     .ch2_pos1_src_type_o        (ch2_pos1_src_type_o        ),
     .ch2_pos2_src_type_o        (ch2_pos2_src_type_o        ),
     .ch2_pos3_src_type_o        (ch2_pos3_src_type_o        ),
     .ch2_pos4_src_type_o        (ch2_pos4_src_type_o        ),
     .ch2_pos5_src_type_o        (ch2_pos5_src_type_o        ),
     .ch2_pos6_src_type_o        (ch2_pos6_src_type_o        ),
     .ch2_pos7_src_type_o        (ch2_pos7_src_type_o        ),
     .ch2_release_o              (ch2_release_o              ),
     .ch2_VR_id_o                (ch2_VR_id_o                ),
	 .ch2_VR_FR_o                (ch2_VR_FR_o                ),
     .ch2_channel_ID_o           (ch2_channel_ID_o           ),
     .ch3_idle_i                 (ch3_idle_i                 ),
     .ch3_eof_i                  (ch3_eof_i                  ),
     .ch3_request_o              (ch3_request_o              ),
     .ch3_pos_1st_o              (ch3_pos_1st_o              ),
     .ch3_pos_2nd_o              (ch3_pos_2nd_o              ),
     .ch3_src_type_o             (ch3_src_type_o             ),
     .ch3_start_addr_o           (ch3_start_addr_o           ),
     .ch3_data_length_o          (ch3_data_length_o          ),
     .ch3_2nd_addr_burst_o       (ch3_2nd_addr_burst_o       ),
     .ch3_column_num_2nd_o       (ch3_column_num_2nd_o       ),
     .ch3_broadcast_o            (ch3_broadcast_o            ),
     .ch3_pos0_1st_o             (ch3_pos0_1st_o             ),
     .ch3_pos1_1st_o             (ch3_pos1_1st_o             ),
     .ch3_pos2_1st_o             (ch3_pos2_1st_o             ),
     .ch3_pos3_1st_o             (ch3_pos3_1st_o             ),
     .ch3_pos4_1st_o             (ch3_pos4_1st_o             ),
     .ch3_pos5_1st_o             (ch3_pos5_1st_o             ),
     .ch3_pos6_1st_o             (ch3_pos6_1st_o             ),
     .ch3_pos7_1st_o             (ch3_pos7_1st_o             ),
     .ch3_pos0_src_type_o        (ch3_pos0_src_type_o        ),
     .ch3_pos1_src_type_o        (ch3_pos1_src_type_o        ),
     .ch3_pos2_src_type_o        (ch3_pos2_src_type_o        ),
     .ch3_pos3_src_type_o        (ch3_pos3_src_type_o        ),
     .ch3_pos4_src_type_o        (ch3_pos4_src_type_o        ),
     .ch3_pos5_src_type_o        (ch3_pos5_src_type_o        ),
     .ch3_pos6_src_type_o        (ch3_pos6_src_type_o        ),
     .ch3_pos7_src_type_o        (ch3_pos7_src_type_o        ),
     .ch3_release_o              (ch3_release_o              ),
     .ch3_VR_id_o                (ch3_VR_id_o                ),
	 .ch3_VR_FR_o                (ch3_VR_FR_o                ),
     .ch3_channel_ID_o           (ch3_channel_ID_o           ),
     .ch4_idle_i                 (ch4_idle_i                 ),
     .ch4_eof_i                  (ch4_eof_i                  ),
     .ch4_request_o              (ch4_request_o              ),
     .ch4_pos_1st_o              (ch4_pos_1st_o              ),
     .ch4_pos_2nd_o              (ch4_pos_2nd_o              ),
     .ch4_src_type_o             (ch4_src_type_o             ),
     .ch4_start_addr_o           (ch4_start_addr_o           ),
     .ch4_data_length_o          (ch4_data_length_o          ),
     .ch4_2nd_addr_burst_o       (ch4_2nd_addr_burst_o       ),
     .ch4_column_num_2nd_o       (ch4_column_num_2nd_o       ),
     .ch4_broadcast_o            (ch4_broadcast_o            ),
     .ch4_pos0_1st_o             (ch4_pos0_1st_o             ),
     .ch4_pos1_1st_o             (ch4_pos1_1st_o             ),
     .ch4_pos2_1st_o             (ch4_pos2_1st_o             ),
     .ch4_pos3_1st_o             (ch4_pos3_1st_o             ),
     .ch4_pos4_1st_o             (ch4_pos4_1st_o             ),
     .ch4_pos5_1st_o             (ch4_pos5_1st_o             ),
     .ch4_pos6_1st_o             (ch4_pos6_1st_o             ),
     .ch4_pos7_1st_o             (ch4_pos7_1st_o             ),
     .ch4_pos0_src_type_o        (ch4_pos0_src_type_o        ),
     .ch4_pos1_src_type_o        (ch4_pos1_src_type_o        ),
     .ch4_pos2_src_type_o        (ch4_pos2_src_type_o        ),
     .ch4_pos3_src_type_o        (ch4_pos3_src_type_o        ),
     .ch4_pos4_src_type_o        (ch4_pos4_src_type_o        ),
     .ch4_pos5_src_type_o        (ch4_pos5_src_type_o        ),
     .ch4_pos6_src_type_o        (ch4_pos6_src_type_o        ),
     .ch4_pos7_src_type_o        (ch4_pos7_src_type_o        ),
     .ch4_release_o              (ch4_release_o              ),
     .ch4_VR_id_o                (ch4_VR_id_o                ),
	 .ch4_VR_FR_o                (ch4_VR_FR_o                ),
     .ch4_channel_ID_o           (ch4_channel_ID_o           ),
     .ch5_idle_i                 (ch5_idle_i                 ),
     .ch5_eof_i                  (ch5_eof_i                  ),
     .ch5_request_o              (ch5_request_o              ),
     .ch5_pos_1st_o              (ch5_pos_1st_o              ),
     .ch5_pos_2nd_o              (ch5_pos_2nd_o              ),
     .ch5_src_type_o             (ch5_src_type_o             ),
     .ch5_start_addr_o           (ch5_start_addr_o           ),
     .ch5_data_length_o          (ch5_data_length_o          ),
     .ch5_2nd_addr_burst_o       (ch5_2nd_addr_burst_o       ),
     .ch5_column_num_2nd_o       (ch5_column_num_2nd_o       ),
     .ch5_broadcast_o            (ch5_broadcast_o            ),
     .ch5_pos0_1st_o             (ch5_pos0_1st_o             ),
     .ch5_pos1_1st_o             (ch5_pos1_1st_o             ),
     .ch5_pos2_1st_o             (ch5_pos2_1st_o             ),
     .ch5_pos3_1st_o             (ch5_pos3_1st_o             ),
     .ch5_pos4_1st_o             (ch5_pos4_1st_o             ),
     .ch5_pos5_1st_o             (ch5_pos5_1st_o             ),
     .ch5_pos6_1st_o             (ch5_pos6_1st_o             ),
     .ch5_pos7_1st_o             (ch5_pos7_1st_o             ),
     .ch5_pos0_src_type_o        (ch5_pos0_src_type_o        ),
     .ch5_pos1_src_type_o        (ch5_pos1_src_type_o        ),
     .ch5_pos2_src_type_o        (ch5_pos2_src_type_o        ),
     .ch5_pos3_src_type_o        (ch5_pos3_src_type_o        ),
     .ch5_pos4_src_type_o        (ch5_pos4_src_type_o        ),
     .ch5_pos5_src_type_o        (ch5_pos5_src_type_o        ),
     .ch5_pos6_src_type_o        (ch5_pos6_src_type_o        ),
     .ch5_pos7_src_type_o        (ch5_pos7_src_type_o        ),
     .ch5_release_o              (ch5_release_o              ),
     .ch5_VR_id_o                (ch5_VR_id_o                ),
	 .ch5_VR_FR_o                (ch5_VR_FR_o                ),
     .ch5_channel_ID_o           (ch5_channel_ID_o           ),
     .ch6_idle_i                 (ch6_idle_i                 ),
     .ch6_eof_i                  (ch6_eof_i                  ),
     .ch6_request_o              (ch6_request_o              ),
     .ch6_pos_1st_o              (ch6_pos_1st_o              ),
     .ch6_pos_2nd_o              (ch6_pos_2nd_o              ),
     .ch6_src_type_o             (ch6_src_type_o             ),
     .ch6_start_addr_o           (ch6_start_addr_o           ),
     .ch6_data_length_o          (ch6_data_length_o          ),
     .ch6_2nd_addr_burst_o       (ch6_2nd_addr_burst_o       ),
     .ch6_column_num_2nd_o       (ch6_column_num_2nd_o       ),
     .ch6_broadcast_o            (ch6_broadcast_o            ),
     .ch6_pos0_1st_o             (ch6_pos0_1st_o             ),
     .ch6_pos1_1st_o             (ch6_pos1_1st_o             ),
     .ch6_pos2_1st_o             (ch6_pos2_1st_o             ),
     .ch6_pos3_1st_o             (ch6_pos3_1st_o             ),
     .ch6_pos4_1st_o             (ch6_pos4_1st_o             ),
     .ch6_pos5_1st_o             (ch6_pos5_1st_o             ),
     .ch6_pos6_1st_o             (ch6_pos6_1st_o             ),
     .ch6_pos7_1st_o             (ch6_pos7_1st_o             ),
     .ch6_pos0_src_type_o        (ch6_pos0_src_type_o        ),
     .ch6_pos1_src_type_o        (ch6_pos1_src_type_o        ),
     .ch6_pos2_src_type_o        (ch6_pos2_src_type_o        ),
     .ch6_pos3_src_type_o        (ch6_pos3_src_type_o        ),
     .ch6_pos4_src_type_o        (ch6_pos4_src_type_o        ),
     .ch6_pos5_src_type_o        (ch6_pos5_src_type_o        ),
     .ch6_pos6_src_type_o        (ch6_pos6_src_type_o        ),
     .ch6_pos7_src_type_o        (ch6_pos7_src_type_o        ),
     .ch6_release_o              (ch6_release_o              ),
     .ch6_VR_id_o                (ch6_VR_id_o                ),
	 .ch6_VR_FR_o                (ch6_VR_FR_o                ),
     .ch6_channel_ID_o           (ch6_channel_ID_o           )
    );




endmodule
