`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:55:52 09/26/2016 
// Design Name: 
// Module Name:    ddr_ctrl_top 
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
module ddr_ctrl_top(
   sys_clk,  sys_rst_n,
   ddr_clk,  ddr_rst_n,
   phy_init_done_i,
   
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
  
  //PCC_network
  //----------------------------4个输入通道 <--| PCC网络
  pcc_ip_data1_i,    pcc_ip_data2_i,    pcc_ip_data3_i,    pcc_ip_data4_i,         pcc_ip_data5_i,    pcc_ip_data6_i,    pcc_ip_data7_i,    pcc_ip_data8_i,    
  pcc_ip_stb1_i,     pcc_ip_stb2_i,     pcc_ip_stb3_i,     pcc_ip_stb4_i,           pcc_ip_stb5_i,     pcc_ip_stb6_i,     pcc_ip_stb7_i,     pcc_ip_stb8_i,     
  pcc_ip_fwd1_i,     pcc_ip_fwd2_i,     pcc_ip_fwd3_i,     pcc_ip_fwd4_i,           pcc_ip_fwd5_i,     pcc_ip_fwd6_i,     pcc_ip_fwd7_i,     pcc_ip_fwd8_i,     
  pcc_ip_fail1_o,    pcc_ip_fail2_o,    pcc_ip_fail3_o,    pcc_ip_fail4_o,         pcc_ip_fail5_o,    pcc_ip_fail6_o,    pcc_ip_fail7_o,    pcc_ip_fail8_o,    
  pcc_ip_pack1_o,    pcc_ip_pack2_o,    pcc_ip_pack3_o,    pcc_ip_pack4_o,         pcc_ip_pack5_o,    pcc_ip_pack6_o,    pcc_ip_pack7_o,    pcc_ip_pack8_o,    
  pcc_ip_suspend1_o, pcc_ip_suspend2_o, pcc_ip_suspend3_o, pcc_ip_suspend4_o,   pcc_ip_suspend5_o, pcc_ip_suspend6_o, pcc_ip_suspend7_o, pcc_ip_suspend8_o, 
  pcc_ip_cancel1_o,  pcc_ip_cancel2_o,  pcc_ip_cancel3_o,  pcc_ip_cancel4_o,     pcc_ip_cancel5_o,  pcc_ip_cancel6_o,  pcc_ip_cancel7_o,  pcc_ip_cancel8_o,  
  //----------------------------4个输出通道 |--> PCC网络                                                                                                  
  pcc_op_data1_o,    pcc_op_data2_o,    pcc_op_data3_o,    pcc_op_data4_o,         pcc_op_data5_o,    pcc_op_data6_o,    pcc_op_data7_o,    pcc_op_data8_o,    
  pcc_op_stb1_o,     pcc_op_stb2_o,     pcc_op_stb3_o,     pcc_op_stb4_o,           pcc_op_stb5_o,     pcc_op_stb6_o,     pcc_op_stb7_o,     pcc_op_stb8_o,     
  pcc_op_fwd1_o,     pcc_op_fwd2_o,     pcc_op_fwd3_o,     pcc_op_fwd4_o,           pcc_op_fwd5_o,     pcc_op_fwd6_o,     pcc_op_fwd7_o,     pcc_op_fwd8_o,     
  pcc_op_fail1_i,    pcc_op_fail2_i,    pcc_op_fail3_i,    pcc_op_fail4_i,         pcc_op_fail5_i,    pcc_op_fail6_i,    pcc_op_fail7_i,    pcc_op_fail8_i,    
  pcc_op_pack1_i,    pcc_op_pack2_i,    pcc_op_pack3_i,    pcc_op_pack4_i,         pcc_op_pack5_i,    pcc_op_pack6_i,    pcc_op_pack7_i,    pcc_op_pack8_i,    
  pcc_op_suspend1_i, pcc_op_suspend2_i, pcc_op_suspend3_i, pcc_op_suspend4_i,   pcc_op_suspend5_i, pcc_op_suspend6_i, pcc_op_suspend7_i, pcc_op_suspend8_i, 
  pcc_op_cancel1_i,  pcc_op_cancel2_i,  pcc_op_cancel3_i,  pcc_op_cancel4_i,     pcc_op_cancel5_i,  pcc_op_cancel6_i,  pcc_op_cancel7_i,  pcc_op_cancel8_i,  

  //Broadcast_network
  broadcast_data_o,
  broadcast_fwd_o,
  
  //DDR-UI
  app_rdy,
  app_wdf_rdy,
  app_rd_data_valid,
  app_rd_data,
  app_en,
  app_cmd,
  app_addr,
  app_wdf_wren,
  app_wdf_data,
  app_wdf_mask,
  app_wdf_end  
   
    );

  input    sys_clk,  sys_rst_n;
  input    ddr_clk,  ddr_rst_n;
  input    phy_init_done_i;
   
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
  input [65:0] pcc_ip_data1_i,    pcc_ip_data2_i,    pcc_ip_data3_i,    pcc_ip_data4_i,    pcc_ip_data5_i,    pcc_ip_data6_i,    pcc_ip_data7_i,    pcc_ip_data8_i;    
  input        pcc_ip_stb1_i,     pcc_ip_stb2_i,     pcc_ip_stb3_i,     pcc_ip_stb4_i,     pcc_ip_stb5_i,     pcc_ip_stb6_i,     pcc_ip_stb7_i,     pcc_ip_stb8_i;     
  input        pcc_ip_fwd1_i,     pcc_ip_fwd2_i,     pcc_ip_fwd3_i,     pcc_ip_fwd4_i,     pcc_ip_fwd5_i,     pcc_ip_fwd6_i,     pcc_ip_fwd7_i,     pcc_ip_fwd8_i;     
  output       pcc_ip_fail1_o,    pcc_ip_fail2_o,    pcc_ip_fail3_o,    pcc_ip_fail4_o,    pcc_ip_fail5_o,    pcc_ip_fail6_o,    pcc_ip_fail7_o,    pcc_ip_fail8_o;    
  output       pcc_ip_pack1_o,    pcc_ip_pack2_o,    pcc_ip_pack3_o,    pcc_ip_pack4_o,    pcc_ip_pack5_o,    pcc_ip_pack6_o,    pcc_ip_pack7_o,    pcc_ip_pack8_o;    
  output       pcc_ip_suspend1_o, pcc_ip_suspend2_o, pcc_ip_suspend3_o, pcc_ip_suspend4_o, pcc_ip_suspend5_o, pcc_ip_suspend6_o, pcc_ip_suspend7_o, pcc_ip_suspend8_o; 
  output       pcc_ip_cancel1_o,  pcc_ip_cancel2_o,  pcc_ip_cancel3_o,  pcc_ip_cancel4_o,  pcc_ip_cancel5_o,  pcc_ip_cancel6_o,  pcc_ip_cancel7_o,  pcc_ip_cancel8_o;  
  //----------------------------8个输出通道 |--> PCC网络                                                                                                               
  output[65:0] pcc_op_data1_o,    pcc_op_data2_o,    pcc_op_data3_o,    pcc_op_data4_o,    pcc_op_data5_o,    pcc_op_data6_o,    pcc_op_data7_o,    pcc_op_data8_o;    
  output       pcc_op_stb1_o,     pcc_op_stb2_o,     pcc_op_stb3_o,     pcc_op_stb4_o,     pcc_op_stb5_o,     pcc_op_stb6_o,     pcc_op_stb7_o,     pcc_op_stb8_o;     
  output       pcc_op_fwd1_o,     pcc_op_fwd2_o,     pcc_op_fwd3_o,     pcc_op_fwd4_o,     pcc_op_fwd5_o,     pcc_op_fwd6_o,     pcc_op_fwd7_o,     pcc_op_fwd8_o;     
  input        pcc_op_fail1_i,    pcc_op_fail2_i,    pcc_op_fail3_i,    pcc_op_fail4_i,    pcc_op_fail5_i,    pcc_op_fail6_i,    pcc_op_fail7_i,    pcc_op_fail8_i;    
  input        pcc_op_pack1_i,    pcc_op_pack2_i,    pcc_op_pack3_i,    pcc_op_pack4_i,    pcc_op_pack5_i,    pcc_op_pack6_i,    pcc_op_pack7_i,    pcc_op_pack8_i;    
  input        pcc_op_suspend1_i, pcc_op_suspend2_i, pcc_op_suspend3_i, pcc_op_suspend4_i, pcc_op_suspend5_i, pcc_op_suspend6_i, pcc_op_suspend7_i, pcc_op_suspend8_i; 
  input        pcc_op_cancel1_i,  pcc_op_cancel2_i,  pcc_op_cancel3_i,  pcc_op_cancel4_i,  pcc_op_cancel5_i,  pcc_op_cancel6_i,  pcc_op_cancel7_i,  pcc_op_cancel8_i;  

  //Broadcast_network
	output    [65:0]   broadcast_data_o;
	output             broadcast_fwd_o;
	
  //DDR-UI
  input               app_rdy;
  input               app_wdf_rdy;
  input               app_rd_data_valid;
  input    [255:0]    app_rd_data;
  output              app_en;
  output   [2:0]      app_cmd;
  output   [28:0]     app_addr;
  output              app_wdf_wren;
  output   [255:0]    app_wdf_data;
  output   [31:0]     app_wdf_mask;
  output              app_wdf_end;
	
  
  
/////----------------------------------------------------------------------------------beautiful line
/////----------------------------------------------------------------------------------beautiful line
/////----------------------------------------------------------------------------------beautiful line
/////----------------------------------------------------------------------------------beautiful line
/////----------------------------------------------------------------------------------beautiful line
  

//---------------------模块之间的连线------------------
//link-1 : cfg模块与ach_top之间
  //request info
  wire                 request_data_valid;
  wire     [ 7:0]      request_pos_1st;
  wire     [ 2:0]      request_pos_2nd;
  wire     [ 1:0]      request_src_type;
  wire     [15:0]      request_addr_1st_row;		//适用于COP三方数据请求
  wire     [13:0]      request_addr_1st_col;
  wire                 request_addr_last_trans;

  wire                 request_cmd_valid;
  wire     [19:0]      request_access_addr;
  
	//cfg info
    wire                 cfg_valid;
	wire                 cfg_third_req;
	wire                 cfg_stream;
	wire                 cfg_broadcast;
	wire                 cfg_row_column;		//0-列  1-行
	wire                 cfg_read_write;		//0-读  1-写
	wire                 cfg_D2D_flag;	
	wire     [ 2:0]      cfg_cluster_num;
	wire     [ 8:0]      cfg_VR_id;					//主控制器虚拟寄存器编号
	wire     [ 2:0]      cfg_VR_FR;
	wire     [ 4:0]      cfg_channel_id;	//地址通道编号
    
	//下面的cfg info以总线的形式下发到32个ddr_channel
  wire     [ 7:0]      cfg_data_pos0_1st;	/*** 与DDR发生数据交互的IP的一级坐标 ***/
  wire     [ 7:0]      cfg_data_pos1_1st;
  wire     [ 7:0]      cfg_data_pos2_1st;
  wire     [ 7:0]      cfg_data_pos3_1st;
  wire     [ 7:0]      cfg_data_pos4_1st;
  wire     [ 7:0]      cfg_data_pos5_1st;
  wire     [ 7:0]      cfg_data_pos6_1st;
  wire     [ 7:0]      cfg_data_pos7_1st;
  wire     [ 2:0]      cfg_data_pos0_2nd;
  wire     [ 2:0]      cfg_data_pos1_2nd;
  wire     [ 2:0]      cfg_data_pos2_2nd;
  wire     [ 2:0]      cfg_data_pos3_2nd;
  wire     [ 2:0]      cfg_data_pos4_2nd;
  wire     [ 2:0]      cfg_data_pos5_2nd;
  wire     [ 2:0]      cfg_data_pos6_2nd;
  wire     [ 2:0]      cfg_data_pos7_2nd;
  
  wire     [ 7:0]      cfg_addr_pos0_1st;	/*** 发起三方请求的IP的一级坐标 ***/  //一般来说该IP是COP
  wire     [ 7:0]      cfg_addr_pos1_1st;  //当非三方请求时，该坐标不使用，默认为零。
  wire     [ 7:0]      cfg_addr_pos2_1st;
  wire     [ 7:0]      cfg_addr_pos3_1st;
  wire     [ 7:0]      cfg_addr_pos4_1st;
  wire     [ 7:0]      cfg_addr_pos5_1st;
  wire     [ 7:0]      cfg_addr_pos6_1st;
  wire     [ 7:0]      cfg_addr_pos7_1st;
  wire     [ 2:0]      cfg_addr_pos0_2nd;
  wire     [ 2:0]      cfg_addr_pos1_2nd;
  wire     [ 2:0]      cfg_addr_pos2_2nd;
  wire     [ 2:0]      cfg_addr_pos3_2nd;
  wire     [ 2:0]      cfg_addr_pos4_2nd;
  wire     [ 2:0]      cfg_addr_pos5_2nd;
  wire     [ 2:0]      cfg_addr_pos6_2nd;
  wire     [ 2:0]      cfg_addr_pos7_2nd;
  
  wire     [15:0]      cfg_start_pos_row_0;	/*** 各个配置簇初次访问DDR时访问的矩阵块在二维矩阵网格中的坐标 ***/
  wire     [13:0]      cfg_start_pos_col_0;
  wire     [15:0]      cfg_start_pos_row_1;
  wire     [13:0]      cfg_start_pos_col_1;
  wire     [15:0]      cfg_start_pos_row_2;
  wire     [13:0]      cfg_start_pos_col_2;
  wire     [15:0]      cfg_start_pos_row_3;
  wire     [13:0]      cfg_start_pos_col_3;
  wire     [15:0]      cfg_start_pos_row_4;
  wire     [13:0]      cfg_start_pos_col_4;
  wire     [15:0]      cfg_start_pos_row_5;
  wire     [13:0]      cfg_start_pos_col_5;
  wire     [15:0]      cfg_start_pos_row_6;
  wire     [13:0]      cfg_start_pos_col_6;
  wire     [15:0]      cfg_start_pos_row_7;
  wire     [13:0]      cfg_start_pos_col_7;
    
  wire     [29:0]      cfg_start_addr;
  wire     [15:0]      cfg_row_num_1st;
  wire     [13:0]      cfg_col_num_1st;
  wire     [15:0]      cfg_row_num_2nd;
  wire     [13:0]      cfg_col_num_2nd;
  wire     [29:0]      cfg_circu_times;		//循环次数
  
	wire     [29:0]      cfg_col_addr_burst;	//一级矩阵列加一地址跳变数目
	wire     [29:0]      cfg_row_addr_burst;	//一级矩阵行加一地址跳变数目
	wire     [29:0]      cfg_2nd_addr_burst;	//二级矩阵行加一地址跳变数目
	wire     [29:0]      cfg_length_burst;	  //二级矩阵大小--------规定为二级矩阵块中的小块总个数
	
//link-2 : ach_top与master之间
  wire        ach01_idle,           ach02_idle,           ach03_idle,           ach04_idle,           ach05_idle,           ach06_idle;
  wire        ach01_eof,            ach02_eof,            ach03_eof,            ach04_eof,            ach05_eof,            ach06_eof;
  wire [ 1:0] ach01_request,        ach02_request,        ach03_request,        ach04_request,        ach05_request,        ach06_request;
  wire [ 7:0] ach01_pos_1st,        ach02_pos_1st,        ach03_pos_1st,        ach04_pos_1st,        ach05_pos_1st,        ach06_pos_1st;
  wire [ 2:0] ach01_pos_2nd,        ach02_pos_2nd,        ach03_pos_2nd,        ach04_pos_2nd,        ach05_pos_2nd,        ach06_pos_2nd;
  wire [ 1:0] ach01_src_type,       ach02_src_type,       ach03_src_type,       ach04_src_type,       ach05_src_type,       ach06_src_type;
  wire [29:0] ach01_start_addr,     ach02_start_addr,     ach03_start_addr,     ach04_start_addr,     ach05_start_addr,     ach06_start_addr;
  wire [29:0] ach01_data_length,    ach02_data_length,    ach03_data_length,    ach04_data_length,    ach05_data_length,    ach06_data_length;
  wire [29:0] ach01_2nd_addr_burst, ach02_2nd_addr_burst, ach03_2nd_addr_burst, ach04_2nd_addr_burst, ach05_2nd_addr_burst, ach06_2nd_addr_burst;
  wire [29:0] ach01_column_num_2nd, ach02_column_num_2nd, ach03_column_num_2nd, ach04_column_num_2nd, ach05_column_num_2nd, ach06_column_num_2nd;
  
  wire        ach01_broadcast,      ach02_broadcast,      ach03_broadcast,      ach04_broadcast,      ach05_broadcast,      ach06_broadcast;
  wire [ 7:0] ach01_pos0_1st,       ach02_pos0_1st,       ach03_pos0_1st,       ach04_pos0_1st,       ach05_pos0_1st,       ach06_pos0_1st;
  wire [ 7:0] ach01_pos1_1st,       ach02_pos1_1st,       ach03_pos1_1st,       ach04_pos1_1st,       ach05_pos1_1st,       ach06_pos1_1st;
  wire [ 7:0] ach01_pos2_1st,       ach02_pos2_1st,       ach03_pos2_1st,       ach04_pos2_1st,       ach05_pos2_1st,       ach06_pos2_1st;
  wire [ 7:0] ach01_pos3_1st,       ach02_pos3_1st,       ach03_pos3_1st,       ach04_pos3_1st,       ach05_pos3_1st,       ach06_pos3_1st;
  wire [ 7:0] ach01_pos4_1st,       ach02_pos4_1st,       ach03_pos4_1st,       ach04_pos4_1st,       ach05_pos4_1st,       ach06_pos4_1st;
  wire [ 7:0] ach01_pos5_1st,       ach02_pos5_1st,       ach03_pos5_1st,       ach04_pos5_1st,       ach05_pos5_1st,       ach06_pos5_1st;
  wire [ 7:0] ach01_pos6_1st,       ach02_pos6_1st,       ach03_pos6_1st,       ach04_pos6_1st,       ach05_pos6_1st,       ach06_pos6_1st;
  wire [ 7:0] ach01_pos7_1st,       ach02_pos7_1st,       ach03_pos7_1st,       ach04_pos7_1st,       ach05_pos7_1st,       ach06_pos7_1st;
  wire [ 1:0] ach01_pos0_src_type,  ach02_pos0_src_type,  ach03_pos0_src_type,  ach04_pos0_src_type,  ach05_pos0_src_type,  ach06_pos0_src_type;
  wire [ 1:0] ach01_pos1_src_type,  ach02_pos1_src_type,  ach03_pos1_src_type,  ach04_pos1_src_type,  ach05_pos1_src_type,  ach06_pos1_src_type;
  wire [ 1:0] ach01_pos2_src_type,  ach02_pos2_src_type,  ach03_pos2_src_type,  ach04_pos2_src_type,  ach05_pos2_src_type,  ach06_pos2_src_type;
  wire [ 1:0] ach01_pos3_src_type,  ach02_pos3_src_type,  ach03_pos3_src_type,  ach04_pos3_src_type,  ach05_pos3_src_type,  ach06_pos3_src_type;
  wire [ 1:0] ach01_pos4_src_type,  ach02_pos4_src_type,  ach03_pos4_src_type,  ach04_pos4_src_type,  ach05_pos4_src_type,  ach06_pos4_src_type;
  wire [ 1:0] ach01_pos5_src_type,  ach02_pos5_src_type,  ach03_pos5_src_type,  ach04_pos5_src_type,  ach05_pos5_src_type,  ach06_pos5_src_type;
  wire [ 1:0] ach01_pos6_src_type,  ach02_pos6_src_type,  ach03_pos6_src_type,  ach04_pos6_src_type,  ach05_pos6_src_type,  ach06_pos6_src_type;
  wire [ 1:0] ach01_pos7_src_type,  ach02_pos7_src_type,  ach03_pos7_src_type,  ach04_pos7_src_type,  ach05_pos7_src_type,  ach06_pos7_src_type;
  
  wire        ach01_release,        ach02_release,        ach03_release,        ach04_release,        ach05_release,        ach06_release;
  wire [ 8:0] ach01_VR_id,          ach02_VR_id,          ach03_VR_id,          ach04_VR_id,          ach05_VR_id,          ach06_VR_id;
  wire [ 2:0] ach01_VR_FR,          ach02_VR_FR,          ach03_VR_FR,          ach04_VR_FR,          ach05_VR_FR,          ach06_VR_FR;
  wire [ 4:0] ach01_channel_ID,     ach02_channel_ID,     ach03_channel_ID,     ach04_channel_ID,     ach05_channel_ID,     ach06_channel_ID;
   

//link-3 : master与status_port之间
  wire              status_req;
  wire              status_req_type;
  wire [ 8:0]       status_VR_id;
  wire [ 2:0]       status_VR_FR;
  wire [ 4:0]       status_channel_ID;
  wire [ 7:0]       status_pos_1st;
  wire [ 2:0]       status_pos_2nd;
  wire [ 1:0]       status_src_type;
  wire              status_idle;
  
     
//link-4 : master与broadcast_crossbar之间
  wire        broad01_grant,        broad02_grant,        broad03_grant,        broad04_grant,        broad05_grant,        broad06_grant;
  wire        broad01_link,         broad02_link,         broad03_link,         broad04_link,         broad05_link,         broad06_link;
  wire        broad01_fwd,          broad02_fwd,          broad03_fwd,          broad04_fwd,          broad05_fwd,          broad06_fwd;
  wire [65:0] broad01_data,         broad02_data,         broad03_data,         broad04_data,         broad05_data,         broad06_data;


//link-5 : master与pcc_crossbar之间
  wire [65:0] dch01_ip_data,        dch02_ip_data,        dch03_ip_data,        dch04_ip_data,        dch05_ip_data,        dch06_ip_data;
  wire        dch01_ip_fwd,         dch02_ip_fwd,         dch03_ip_fwd,         dch04_ip_fwd,         dch05_ip_fwd,         dch06_ip_fwd;
  wire        dch01_ip_stb,         dch02_ip_stb,         dch03_ip_stb,         dch04_ip_stb,         dch05_ip_stb,         dch06_ip_stb;
  wire        dch01_ip_fail,        dch02_ip_fail,        dch03_ip_fail,        dch04_ip_fail,        dch05_ip_fail,        dch06_ip_fail;
  wire        dch01_ip_pack,        dch02_ip_pack,        dch03_ip_pack,        dch04_ip_pack,        dch05_ip_pack,        dch06_ip_pack;
  wire        dch01_ip_suspend,     dch02_ip_suspend,     dch03_ip_suspend,     dch04_ip_suspend,     dch05_ip_suspend,     dch06_ip_suspend;
  wire        dch01_ip_cancel,      dch02_ip_cancel,      dch03_ip_cancel,      dch04_ip_cancel,      dch05_ip_cancel,      dch06_ip_cancel;
          
  wire        dch01_op_fail,        dch02_op_fail,        dch03_op_fail,        dch04_op_fail,        dch05_op_fail,        dch06_op_fail;
  wire        dch01_op_pack,        dch02_op_pack,        dch03_op_pack,        dch04_op_pack,        dch05_op_pack,        dch06_op_pack;
  wire        dch01_op_suspend,     dch02_op_suspend,     dch03_op_suspend,     dch04_op_suspend,     dch05_op_suspend,     dch06_op_suspend;
  wire        dch01_op_cancel,      dch02_op_cancel,      dch03_op_cancel,      dch04_op_cancel,      dch05_op_cancel,      dch06_op_cancel;
  wire [65:0] dch01_op_data,        dch02_op_data,        dch03_op_data,        dch04_op_data,        dch05_op_data,        dch06_op_data;
  wire        dch01_op_fwd,         dch02_op_fwd,         dch03_op_fwd,         dch04_op_fwd,         dch05_op_fwd,         dch06_op_fwd;
  wire        dch01_op_stb,         dch02_op_stb,         dch03_op_stb,         dch04_op_stb,         dch05_op_stb,         dch06_op_stb;
          
  wire [ 3:0] dch01_pos_1st_rd,     dch02_pos_1st_rd,     dch03_pos_1st_rd,     dch04_pos_1st_rd,     dch05_pos_1st_rd,     dch06_pos_1st_rd;
  wire [ 7:0] dch01_pos_1st_wr,     dch02_pos_1st_wr,     dch03_pos_1st_wr,     dch04_pos_1st_wr,     dch05_pos_1st_wr,     dch06_pos_1st_wr;
    

//link-6 : master与rd_fifo_arbiter之间
  wire        RD01_DFS_wr_en,       RD02_DFS_wr_en,       RD03_DFS_wr_en,       RD04_DFS_wr_en,       RD05_DFS_wr_en,       RD06_DFS_wr_en;
  wire[511:0] RD01_DFS_din,         RD02_DFS_din,         RD03_DFS_din,         RD04_DFS_din,         RD05_DFS_din,         RD06_DFS_din;
  wire        RD01_DFS_full,        RD02_DFS_full,        RD03_DFS_full,        RD04_DFS_full,        RD05_DFS_full,        RD06_DFS_full;
  wire[ 5 :0] RD01_DFS_wr_count,    RD02_DFS_wr_count,    RD03_DFS_wr_count,    RD04_DFS_wr_count,    RD05_DFS_wr_count,    RD06_DFS_wr_count;

  wire        ch01_req_rd,          ch02_req_rd,          ch03_req_rd,          ch04_req_rd,          ch05_req_rd,          ch06_req_rd;
  wire[ 29:0] ch01_address,         ch02_address,         ch03_address,         ch04_address,         ch05_address,         ch06_address;
  wire        ch01_rd_addr_en,      ch02_rd_addr_en,      ch03_rd_addr_en,      ch04_rd_addr_en,      ch05_rd_addr_en,      ch06_rd_addr_en;
  wire        ch01_wr_addr_en,      ch02_wr_addr_en,      ch03_wr_addr_en,      ch04_wr_addr_en,      ch05_wr_addr_en,      ch06_wr_addr_en;

//link-7 : master与wr_fifo_arbiter之间
  wire        WR01_DFS_rd_en,       WR02_DFS_rd_en,       WR03_DFS_rd_en,       WR04_DFS_rd_en,       WR05_DFS_rd_en,       WR06_DFS_rd_en;
  wire[511:0] WR01_DFS_dout,        WR02_DFS_dout,        WR03_DFS_dout,        WR04_DFS_dout,        WR05_DFS_dout,        WR06_DFS_dout;
  wire        WR01_DFS_valid,       WR02_DFS_valid,       WR03_DFS_valid,       WR04_DFS_valid,       WR05_DFS_valid,       WR06_DFS_valid;
  wire        WR01_DFS_empty,       WR02_DFS_empty,       WR03_DFS_empty,       WR04_DFS_empty,       WR05_DFS_empty,       WR06_DFS_empty;
  

//link-8 : rd_fifo_arbiter与ddr_app之间
  wire           rd_addr_fifo_empty;
  wire           rd_addr_fifo_valid;
  wire [29:0]    rd_addr_fifo_data_out;
  wire           rd_addr_fifo_rd_en;
  wire [255:0]   rd_ddr_fifo_data_in;
  wire           rd_ddr_fifo_wr_en;


//link-9 : wr_fifo_arbiter与ddr_app之间
  wire           wr_addr_fifo_rd_en;
  wire [29:0]    wr_addr_fifo_data_out;
  wire           wr_addr_fifo_valid;
  wire           wr_addr_fifo_empty;
  wire           wr_ddr_fifo_rd_en;
  wire [255:0]   wr_ddr_fifo_data_out;
  wire           wr_ddr_fifo_empty;
  wire           wr_ddr_fifo_valid;
  wire [8:0]     wr_ddr_fifo_rd_count;    


//link-10 : special for COP
    wire first_release_flag;


// Instantiate the module
status_port   status_port
   (
     .clk                        (                    sys_clk),
     .rst_n                      (                  sys_rst_n),
     
     .request_o                  (           status_request_o),
     .ack_i                      (               status_ack_i),
     .data_o                     (              status_data_o),
     .valid_o                    (             status_valid_o),
     
     .status_req_i               (               status_req),
     .status_req_type_i          (          status_req_type),
     .status_VR_id_i             (             status_VR_id),
	 .status_VR_FR_i             (             status_VR_FR),
     .status_channel_ID_i        (        status_channel_ID),
     .status_pos_1st_i           (           status_pos_1st),
     .status_pos_2nd_i           (           status_pos_2nd),
     .status_src_type_i          (          status_src_type),
     .status_idle_o              (              status_idle),
     .first_release_flag        (first_release_flag)   //// by yyp, 2017-01-05
    );






// Instantiate the module[cfg_decodoer]
ddr_cfg_decoder ddr_cfg_decoder (
     .clk                           (                     sys_clk),
     .rst_n                         (                   sys_rst_n),
     .cfgid_i                       (                     cfgid_i),
     .cfgfwd_i                      (                    cfgfwd_i),
     .cfgdata_i                     (                   cfgdata_i),
     .cfgreq_i                      (                    cfgreq_i),
     .cfgdone_i                     (                   cfgdone_i),
     
     .request_data_valid_o          (        request_data_valid),
     .request_pos_1st_o             (           request_pos_1st),
     .request_pos_2nd_o             (           request_pos_2nd),
     .request_addr_1st_row_o        (      request_addr_1st_row),
     .request_addr_1st_col_o        (      request_addr_1st_col),
     .request_addr_last_trans_o     (   request_addr_last_trans),
     .request_src_type_o            (          request_src_type),
     .request_cmd_valid_o           (         request_cmd_valid),
     .request_cmd_access_addr_o     (       request_access_addr),
     .cfg_valid_o                   (                 cfg_valid),
     .cfg_third_req_o               (             cfg_third_req),
     .cfg_stream_o                  (                cfg_stream),
     .cfg_broadcast_o               (             cfg_broadcast),
     .cfg_row_column_o              (            cfg_row_column),
     .cfg_read_write_o              (            cfg_read_write),
     .cfg_D2D_flag_o                (              cfg_D2D_flag),
     .cfg_ch_cluster_num_o          (           cfg_cluster_num),
     .cfg_VR_id_o                   (                 cfg_VR_id),
	 .cfg_VR_FR_o                   (                 cfg_VR_FR),
     .cfg_ddr_channel_id_o          (            cfg_channel_id),
     .cfg_data_pos0_1st_o           (         cfg_data_pos0_1st),
     .cfg_data_pos1_1st_o           (         cfg_data_pos1_1st),
     .cfg_data_pos2_1st_o           (         cfg_data_pos2_1st),
     .cfg_data_pos3_1st_o           (         cfg_data_pos3_1st),
     .cfg_data_pos4_1st_o           (         cfg_data_pos4_1st),
     .cfg_data_pos5_1st_o           (         cfg_data_pos5_1st),
     .cfg_data_pos6_1st_o           (         cfg_data_pos6_1st),
     .cfg_data_pos7_1st_o           (         cfg_data_pos7_1st),
     .cfg_data_pos0_2nd_o           (         cfg_data_pos0_2nd),
     .cfg_data_pos1_2nd_o           (         cfg_data_pos1_2nd),
     .cfg_data_pos2_2nd_o           (         cfg_data_pos2_2nd),
     .cfg_data_pos3_2nd_o           (         cfg_data_pos3_2nd),
     .cfg_data_pos4_2nd_o           (         cfg_data_pos4_2nd),
     .cfg_data_pos5_2nd_o           (         cfg_data_pos5_2nd),
     .cfg_data_pos6_2nd_o           (         cfg_data_pos6_2nd),
     .cfg_data_pos7_2nd_o           (         cfg_data_pos7_2nd),
     .cfg_addr_pos0_1st_o           (         cfg_addr_pos0_1st),
     .cfg_addr_pos1_1st_o           (         cfg_addr_pos1_1st),
     .cfg_addr_pos2_1st_o           (         cfg_addr_pos2_1st),
     .cfg_addr_pos3_1st_o           (         cfg_addr_pos3_1st),
     .cfg_addr_pos4_1st_o           (         cfg_addr_pos4_1st),
     .cfg_addr_pos5_1st_o           (         cfg_addr_pos5_1st),
     .cfg_addr_pos6_1st_o           (         cfg_addr_pos6_1st),
     .cfg_addr_pos7_1st_o           (         cfg_addr_pos7_1st),
     .cfg_addr_pos0_2nd_o           (         cfg_addr_pos0_2nd),
     .cfg_addr_pos1_2nd_o           (         cfg_addr_pos1_2nd),
     .cfg_addr_pos2_2nd_o           (         cfg_addr_pos2_2nd),
     .cfg_addr_pos3_2nd_o           (         cfg_addr_pos3_2nd),
     .cfg_addr_pos4_2nd_o           (         cfg_addr_pos4_2nd),
     .cfg_addr_pos5_2nd_o           (         cfg_addr_pos5_2nd),
     .cfg_addr_pos6_2nd_o           (         cfg_addr_pos6_2nd),
     .cfg_addr_pos7_2nd_o           (         cfg_addr_pos7_2nd),
     .cfg_start_pos_row_0_o         (       cfg_start_pos_row_0),
     .cfg_start_pos_col_0_o         (       cfg_start_pos_col_0),
     .cfg_start_pos_row_1_o         (       cfg_start_pos_row_1),
     .cfg_start_pos_col_1_o         (       cfg_start_pos_col_1),
     .cfg_start_pos_row_2_o         (       cfg_start_pos_row_2),
     .cfg_start_pos_col_2_o         (       cfg_start_pos_col_2),
     .cfg_start_pos_row_3_o         (       cfg_start_pos_row_3),
     .cfg_start_pos_col_3_o         (       cfg_start_pos_col_3),
     .cfg_start_pos_row_4_o         (       cfg_start_pos_row_4),
     .cfg_start_pos_col_4_o         (       cfg_start_pos_col_4),
     .cfg_start_pos_row_5_o         (       cfg_start_pos_row_5),
     .cfg_start_pos_col_5_o         (       cfg_start_pos_col_5),
     .cfg_start_pos_row_6_o         (       cfg_start_pos_row_6),
     .cfg_start_pos_col_6_o         (       cfg_start_pos_col_6),
     .cfg_start_pos_row_7_o         (       cfg_start_pos_row_7),
     .cfg_start_pos_col_7_o         (       cfg_start_pos_col_7),
     .cfg_start_addr_o              (            cfg_start_addr),
     .cfg_row_num_1st_o             (           cfg_row_num_1st),
     .cfg_column_num_1st_o          (           cfg_col_num_1st),
     .cfg_row_num_2nd_o             (           cfg_row_num_2nd),
     .cfg_column_num_2nd_o          (           cfg_col_num_2nd),
     .cfg_circu_times_o             (           cfg_circu_times),
     .cfg_col_addr_burst_o          (        cfg_col_addr_burst),
     .cfg_row_addr_burst_o          (        cfg_row_addr_burst),
     .cfg_2nd_addr_burst_o          (        cfg_2nd_addr_burst),
     .cfg_access_length_burst_o     (          cfg_length_burst)
    );


// Instantiate the module[ach_top]
ach_top ach_top (
     .sys_clk                    (                    sys_clk),
     .sys_rst_n                  (                  sys_rst_n),
     .phy_init_done_i            (            phy_init_done_i),
     .first_release_flag        (first_release_flag),   //// by yyp, 2017-01-05, special for COP
     
     .request_data_valid_i       (       request_data_valid),
     .request_pos_1st_i          (          request_pos_1st),
     .request_pos_2nd_i          (          request_pos_2nd),
     .request_src_type_i         (         request_src_type),
     .request_addr_1st_row_i     (     request_addr_1st_row),
     .request_addr_1st_col_i     (     request_addr_1st_col),
     .request_addr_last_trans_i  (  request_addr_last_trans),
     .request_cmd_valid_i        (        request_cmd_valid),
     .request_access_addr_i      (      request_access_addr),
     .cfg_valid_i                (                cfg_valid),
     .cfg_third_req_i            (            cfg_third_req),
     .cfg_broadcast_i            (            cfg_broadcast),
     .cfg_row_column_i           (           cfg_row_column),
     .cfg_read_write_i           (           cfg_read_write),
     .cfg_cluster_num_i          (          cfg_cluster_num),
     .cfg_VR_id_i                (                cfg_VR_id),
	 .cfg_VR_FR_i                (                cfg_VR_FR),
     .cfg_channel_id_i           (           cfg_channel_id),
     .cfg_stream_i               (               cfg_stream),
     .cfg_D2D_flag_i             (             cfg_D2D_flag),
     .cfg_data_pos0_1st_i        (        cfg_data_pos0_1st),
     .cfg_data_pos1_1st_i        (        cfg_data_pos1_1st),
     .cfg_data_pos2_1st_i        (        cfg_data_pos2_1st),
     .cfg_data_pos3_1st_i        (        cfg_data_pos3_1st),
     .cfg_data_pos4_1st_i        (        cfg_data_pos4_1st),
     .cfg_data_pos5_1st_i        (        cfg_data_pos5_1st),
     .cfg_data_pos6_1st_i        (        cfg_data_pos6_1st),
     .cfg_data_pos7_1st_i        (        cfg_data_pos7_1st),
     .cfg_data_pos0_2nd_i        (        cfg_data_pos0_2nd),
     .cfg_data_pos1_2nd_i        (        cfg_data_pos1_2nd),
     .cfg_data_pos2_2nd_i        (        cfg_data_pos2_2nd),
     .cfg_data_pos3_2nd_i        (        cfg_data_pos3_2nd),
     .cfg_data_pos4_2nd_i        (        cfg_data_pos4_2nd),
     .cfg_data_pos5_2nd_i        (        cfg_data_pos5_2nd),
     .cfg_data_pos6_2nd_i        (        cfg_data_pos6_2nd),
     .cfg_data_pos7_2nd_i        (        cfg_data_pos7_2nd),
     .cfg_addr_pos0_1st_i        (        cfg_addr_pos0_1st),
     .cfg_addr_pos1_1st_i        (        cfg_addr_pos1_1st),
     .cfg_addr_pos2_1st_i        (        cfg_addr_pos2_1st),
     .cfg_addr_pos3_1st_i        (        cfg_addr_pos3_1st),
     .cfg_addr_pos4_1st_i        (        cfg_addr_pos4_1st),
     .cfg_addr_pos5_1st_i        (        cfg_addr_pos5_1st),
     .cfg_addr_pos6_1st_i        (        cfg_addr_pos6_1st),
     .cfg_addr_pos7_1st_i        (        cfg_addr_pos7_1st),
     .cfg_addr_pos0_2nd_i        (        cfg_addr_pos0_2nd),
     .cfg_addr_pos1_2nd_i        (        cfg_addr_pos1_2nd),
     .cfg_addr_pos2_2nd_i        (        cfg_addr_pos2_2nd),
     .cfg_addr_pos3_2nd_i        (        cfg_addr_pos3_2nd),
     .cfg_addr_pos4_2nd_i        (        cfg_addr_pos4_2nd),
     .cfg_addr_pos5_2nd_i        (        cfg_addr_pos5_2nd),
     .cfg_addr_pos6_2nd_i        (        cfg_addr_pos6_2nd),
     .cfg_addr_pos7_2nd_i        (        cfg_addr_pos7_2nd),
     .cfg_start_pos_row_0_i      (      cfg_start_pos_row_0),
     .cfg_start_pos_col_0_i      (      cfg_start_pos_col_0),
     .cfg_start_pos_row_1_i      (      cfg_start_pos_row_1),
     .cfg_start_pos_col_1_i      (      cfg_start_pos_col_1),
     .cfg_start_pos_row_2_i      (      cfg_start_pos_row_2),
     .cfg_start_pos_col_2_i      (      cfg_start_pos_col_2),
     .cfg_start_pos_row_3_i      (      cfg_start_pos_row_3),
     .cfg_start_pos_col_3_i      (      cfg_start_pos_col_3),
     .cfg_start_pos_row_4_i      (      cfg_start_pos_row_4),
     .cfg_start_pos_col_4_i      (      cfg_start_pos_col_4),
     .cfg_start_pos_row_5_i      (      cfg_start_pos_row_5),
     .cfg_start_pos_col_5_i      (      cfg_start_pos_col_5),
     .cfg_start_pos_row_6_i      (      cfg_start_pos_row_6),
     .cfg_start_pos_col_6_i      (      cfg_start_pos_col_6),
     .cfg_start_pos_row_7_i      (      cfg_start_pos_row_7),
     .cfg_start_pos_col_7_i      (      cfg_start_pos_col_7),
     .cfg_start_addr_i           (           cfg_start_addr),
     .cfg_row_num_1st_i          (          cfg_row_num_1st),
     .cfg_col_num_1st_i          (          cfg_col_num_1st),
     .cfg_row_num_2nd_i          (          cfg_row_num_2nd),
     .cfg_col_num_2nd_i          (          cfg_col_num_2nd),
     .cfg_circu_times_i          (          cfg_circu_times),
     .cfg_col_addr_burst_i       (       cfg_col_addr_burst),
     .cfg_row_addr_burst_i       (       cfg_row_addr_burst),
     .cfg_2nd_addr_burst_i       (       cfg_2nd_addr_burst),
     .cfg_length_burst_i         (         cfg_length_burst),
     
     .ch1_idle_i                 (                 ach01_idle),
     .ch2_idle_i                 (                 ach02_idle),
     .ch3_idle_i                 (                 ach03_idle),
     .ch4_idle_i                 (                 ach04_idle),
     .ch5_idle_i                 (                 ach05_idle),
     .ch6_idle_i                 (                 ach06_idle),
     .ch1_eof_i                  (                  ach01_eof),
     .ch2_eof_i                  (                  ach02_eof),
     .ch3_eof_i                  (                  ach03_eof),
     .ch4_eof_i                  (                  ach04_eof),
     .ch5_eof_i                  (                  ach05_eof),
     .ch6_eof_i                  (                  ach06_eof),
     .ch1_request_o              (              ach01_request),
     .ch2_request_o              (              ach02_request),
     .ch3_request_o              (              ach03_request),
     .ch4_request_o              (              ach04_request),
     .ch5_request_o              (              ach05_request),
     .ch6_request_o              (              ach06_request),
     .ch1_pos_1st_o              (              ach01_pos_1st),
     .ch2_pos_1st_o              (              ach02_pos_1st),
     .ch3_pos_1st_o              (              ach03_pos_1st),
     .ch4_pos_1st_o              (              ach04_pos_1st),
     .ch5_pos_1st_o              (              ach05_pos_1st),
     .ch6_pos_1st_o              (              ach06_pos_1st),
     .ch1_pos_2nd_o              (              ach01_pos_2nd),
     .ch2_pos_2nd_o              (              ach02_pos_2nd),
     .ch3_pos_2nd_o              (              ach03_pos_2nd),
     .ch4_pos_2nd_o              (              ach04_pos_2nd),
     .ch5_pos_2nd_o              (              ach05_pos_2nd),
     .ch6_pos_2nd_o              (              ach06_pos_2nd),
     .ch1_src_type_o             (             ach01_src_type),
     .ch2_src_type_o             (             ach02_src_type),
     .ch3_src_type_o             (             ach03_src_type),
     .ch4_src_type_o             (             ach04_src_type),
     .ch5_src_type_o             (             ach05_src_type),
     .ch6_src_type_o             (             ach06_src_type),
     .ch1_start_addr_o           (           ach01_start_addr),
     .ch2_start_addr_o           (           ach02_start_addr),
     .ch3_start_addr_o           (           ach03_start_addr),
     .ch4_start_addr_o           (           ach04_start_addr),
     .ch5_start_addr_o           (           ach05_start_addr),
     .ch6_start_addr_o           (           ach06_start_addr),
     .ch1_data_length_o          (          ach01_data_length),
     .ch2_data_length_o          (          ach02_data_length),
     .ch3_data_length_o          (          ach03_data_length),
     .ch4_data_length_o          (          ach04_data_length),
     .ch5_data_length_o          (          ach05_data_length),
     .ch6_data_length_o          (          ach06_data_length),
     .ch1_2nd_addr_burst_o       (       ach01_2nd_addr_burst),
     .ch2_2nd_addr_burst_o       (       ach02_2nd_addr_burst),
     .ch3_2nd_addr_burst_o       (       ach03_2nd_addr_burst),
     .ch4_2nd_addr_burst_o       (       ach04_2nd_addr_burst),
     .ch5_2nd_addr_burst_o       (       ach05_2nd_addr_burst),
     .ch6_2nd_addr_burst_o       (       ach06_2nd_addr_burst),
     .ch1_column_num_2nd_o       (       ach01_column_num_2nd),
     .ch2_column_num_2nd_o       (       ach02_column_num_2nd),
     .ch3_column_num_2nd_o       (       ach03_column_num_2nd),
     .ch4_column_num_2nd_o       (       ach04_column_num_2nd),
     .ch5_column_num_2nd_o       (       ach05_column_num_2nd),
     .ch6_column_num_2nd_o       (       ach06_column_num_2nd),
     .ch1_broadcast_o            (            ach01_broadcast),
     .ch2_broadcast_o            (            ach02_broadcast),
     .ch3_broadcast_o            (            ach03_broadcast),
     .ch4_broadcast_o            (            ach04_broadcast),
     .ch5_broadcast_o            (            ach05_broadcast),
     .ch6_broadcast_o            (            ach06_broadcast),
     .ch1_pos0_1st_o             (             ach01_pos0_1st),
     .ch2_pos0_1st_o             (             ach02_pos0_1st),
     .ch3_pos0_1st_o             (             ach03_pos0_1st),
     .ch4_pos0_1st_o             (             ach04_pos0_1st),
     .ch5_pos0_1st_o             (             ach05_pos0_1st),
     .ch6_pos0_1st_o             (             ach06_pos0_1st),
     .ch1_pos1_1st_o             (             ach01_pos1_1st),
     .ch2_pos1_1st_o             (             ach02_pos1_1st),
     .ch3_pos1_1st_o             (             ach03_pos1_1st),
     .ch4_pos1_1st_o             (             ach04_pos1_1st),
     .ch5_pos1_1st_o             (             ach05_pos1_1st),
     .ch6_pos1_1st_o             (             ach06_pos1_1st),
     .ch1_pos2_1st_o             (             ach01_pos2_1st),
     .ch2_pos2_1st_o             (             ach02_pos2_1st),
     .ch3_pos2_1st_o             (             ach03_pos2_1st),
     .ch4_pos2_1st_o             (             ach04_pos2_1st),
     .ch5_pos2_1st_o             (             ach05_pos2_1st),
     .ch6_pos2_1st_o             (             ach06_pos2_1st),
     .ch1_pos3_1st_o             (             ach01_pos3_1st),
     .ch2_pos3_1st_o             (             ach02_pos3_1st),
     .ch3_pos3_1st_o             (             ach03_pos3_1st),
     .ch4_pos3_1st_o             (             ach04_pos3_1st),
     .ch5_pos3_1st_o             (             ach05_pos3_1st),
     .ch6_pos3_1st_o             (             ach06_pos3_1st),
     .ch1_pos4_1st_o             (             ach01_pos4_1st),
     .ch2_pos4_1st_o             (             ach02_pos4_1st),
     .ch3_pos4_1st_o             (             ach03_pos4_1st),
     .ch4_pos4_1st_o             (             ach04_pos4_1st),
     .ch5_pos4_1st_o             (             ach05_pos4_1st),
     .ch6_pos4_1st_o             (             ach06_pos4_1st),
     .ch1_pos5_1st_o             (             ach01_pos5_1st),
     .ch2_pos5_1st_o             (             ach02_pos5_1st),
     .ch3_pos5_1st_o             (             ach03_pos5_1st),
     .ch4_pos5_1st_o             (             ach04_pos5_1st),
     .ch5_pos5_1st_o             (             ach05_pos5_1st),
     .ch6_pos5_1st_o             (             ach06_pos5_1st),
     .ch1_pos6_1st_o             (             ach01_pos6_1st),
     .ch2_pos6_1st_o             (             ach02_pos6_1st),
     .ch3_pos6_1st_o             (             ach03_pos6_1st),
     .ch4_pos6_1st_o             (             ach04_pos6_1st),
     .ch5_pos6_1st_o             (             ach05_pos6_1st),
     .ch6_pos6_1st_o             (             ach06_pos6_1st),
     .ch1_pos7_1st_o             (             ach01_pos7_1st),
     .ch2_pos7_1st_o             (             ach02_pos7_1st),
     .ch3_pos7_1st_o             (             ach03_pos7_1st),
     .ch4_pos7_1st_o             (             ach04_pos7_1st),
     .ch5_pos7_1st_o             (             ach05_pos7_1st),
     .ch6_pos7_1st_o             (             ach06_pos7_1st),
     .ch1_pos0_src_type_o        (        ach01_pos0_src_type),
     .ch2_pos0_src_type_o        (        ach02_pos0_src_type),
     .ch3_pos0_src_type_o        (        ach03_pos0_src_type),
     .ch4_pos0_src_type_o        (        ach04_pos0_src_type),
     .ch5_pos0_src_type_o        (        ach05_pos0_src_type),
     .ch6_pos0_src_type_o        (        ach06_pos0_src_type),
     .ch1_pos1_src_type_o        (        ach01_pos1_src_type),
     .ch2_pos1_src_type_o        (        ach02_pos1_src_type),
     .ch3_pos1_src_type_o        (        ach03_pos1_src_type),
     .ch4_pos1_src_type_o        (        ach04_pos1_src_type),
     .ch5_pos1_src_type_o        (        ach05_pos1_src_type),
     .ch6_pos1_src_type_o        (        ach06_pos1_src_type),
     .ch1_pos2_src_type_o        (        ach01_pos2_src_type),
     .ch2_pos2_src_type_o        (        ach02_pos2_src_type),
     .ch3_pos2_src_type_o        (        ach03_pos2_src_type),
     .ch4_pos2_src_type_o        (        ach04_pos2_src_type),
     .ch5_pos2_src_type_o        (        ach05_pos2_src_type),
     .ch6_pos2_src_type_o        (        ach06_pos2_src_type),
     .ch1_pos3_src_type_o        (        ach01_pos3_src_type),
     .ch2_pos3_src_type_o        (        ach02_pos3_src_type),
     .ch3_pos3_src_type_o        (        ach03_pos3_src_type),
     .ch4_pos3_src_type_o        (        ach04_pos3_src_type),
     .ch5_pos3_src_type_o        (        ach05_pos3_src_type),
     .ch6_pos3_src_type_o        (        ach06_pos3_src_type),
     .ch1_pos4_src_type_o        (        ach01_pos4_src_type),
     .ch2_pos4_src_type_o        (        ach02_pos4_src_type),
     .ch3_pos4_src_type_o        (        ach03_pos4_src_type),
     .ch4_pos4_src_type_o        (        ach04_pos4_src_type),
     .ch5_pos4_src_type_o        (        ach05_pos4_src_type),
     .ch6_pos4_src_type_o        (        ach06_pos4_src_type),
     .ch1_pos5_src_type_o        (        ach01_pos5_src_type),
     .ch2_pos5_src_type_o        (        ach02_pos5_src_type),
     .ch3_pos5_src_type_o        (        ach03_pos5_src_type),
     .ch4_pos5_src_type_o        (        ach04_pos5_src_type),
     .ch5_pos5_src_type_o        (        ach05_pos5_src_type),
     .ch6_pos5_src_type_o        (        ach06_pos5_src_type),
     .ch1_pos6_src_type_o        (        ach01_pos6_src_type),
     .ch2_pos6_src_type_o        (        ach02_pos6_src_type),
     .ch3_pos6_src_type_o        (        ach03_pos6_src_type),
     .ch4_pos6_src_type_o        (        ach04_pos6_src_type),
     .ch5_pos6_src_type_o        (        ach05_pos6_src_type),
     .ch6_pos6_src_type_o        (        ach06_pos6_src_type),
     .ch1_pos7_src_type_o        (        ach01_pos7_src_type),
     .ch2_pos7_src_type_o        (        ach02_pos7_src_type),
     .ch3_pos7_src_type_o        (        ach03_pos7_src_type),
     .ch4_pos7_src_type_o        (        ach04_pos7_src_type),
     .ch5_pos7_src_type_o        (        ach05_pos7_src_type),
     .ch6_pos7_src_type_o        (        ach06_pos7_src_type),
     .ch1_release_o              (              ach01_release),
     .ch2_release_o              (              ach02_release),
     .ch3_release_o              (              ach03_release),
     .ch4_release_o              (              ach04_release),
     .ch5_release_o              (              ach05_release),
     .ch6_release_o              (              ach06_release),
     .ch1_VR_id_o                (                ach01_VR_id),
     .ch2_VR_id_o                (                ach02_VR_id),
     .ch3_VR_id_o                (                ach03_VR_id),
     .ch4_VR_id_o                (                ach04_VR_id),
     .ch5_VR_id_o                (                ach05_VR_id),
     .ch6_VR_id_o                (                ach06_VR_id),
	 .ch1_VR_FR_o                (                ach01_VR_FR),
	 .ch2_VR_FR_o                (                ach02_VR_FR),
	 .ch3_VR_FR_o                (                ach03_VR_FR),
	 .ch4_VR_FR_o                (                ach04_VR_FR),
	 .ch5_VR_FR_o                (                ach05_VR_FR),
	 .ch6_VR_FR_o                (                ach06_VR_FR),
     .ch1_channel_ID_o           (           ach01_channel_ID),
     .ch2_channel_ID_o           (           ach02_channel_ID),
     .ch3_channel_ID_o           (           ach03_channel_ID),
     .ch4_channel_ID_o           (           ach04_channel_ID),
     .ch5_channel_ID_o           (           ach05_channel_ID),
     .ch6_channel_ID_o           (           ach06_channel_ID)
    );


// Instantiate the module[ddr_master]
ddr_master ddr_master (
     .sys_clk                    (                    sys_clk),
     .sys_rst_n                  (                  sys_rst_n),
     .phy_init_done_i            (            phy_init_done_i),
     
     .status_idle_i              (              status_idle),
     .status_ack_o               (               status_req),
     .status_ack_type_o          (          status_req_type),
     .status_VR_id_o             (             status_VR_id),
	 .status_VR_FR_o             (             status_VR_FR),
     .status_channel_ID_o        (        status_channel_ID),
     .status_pos_1st_o           (           status_pos_1st),
     .status_pos_2nd_o           (           status_pos_2nd),
     .status_src_type_o          (          status_src_type),
     
     .ach01_idle_o               (               ach01_idle),
     .ach02_idle_o               (               ach02_idle),
     .ach03_idle_o               (               ach03_idle),
     .ach04_idle_o               (               ach04_idle),
     .ach05_idle_o               (               ach05_idle),
     .ach06_idle_o               (               ach06_idle),
     .ach01_eof_o                (                ach01_eof),
     .ach02_eof_o                (                ach02_eof),
     .ach03_eof_o                (                ach03_eof),
     .ach04_eof_o                (                ach04_eof),
     .ach05_eof_o                (                ach05_eof),
     .ach06_eof_o                (                ach06_eof),
     .ach01_request_i            (            ach01_request),
     .ach02_request_i            (            ach02_request),
     .ach03_request_i            (            ach03_request),
     .ach04_request_i            (            ach04_request),
     .ach05_request_i            (            ach05_request),
     .ach06_request_i            (            ach06_request),
     .ach01_pos_1st_i            (            ach01_pos_1st),
     .ach02_pos_1st_i            (            ach02_pos_1st),
     .ach03_pos_1st_i            (            ach03_pos_1st),
     .ach04_pos_1st_i            (            ach04_pos_1st),
     .ach05_pos_1st_i            (            ach05_pos_1st),
     .ach06_pos_1st_i            (            ach06_pos_1st),
     .ach01_pos_2nd_i            (            ach01_pos_2nd),
     .ach02_pos_2nd_i            (            ach02_pos_2nd),
     .ach03_pos_2nd_i            (            ach03_pos_2nd),
     .ach04_pos_2nd_i            (            ach04_pos_2nd),
     .ach05_pos_2nd_i            (            ach05_pos_2nd),
     .ach06_pos_2nd_i            (            ach06_pos_2nd),
     .ach01_src_type_i           (           ach01_src_type),
     .ach02_src_type_i           (           ach02_src_type),
     .ach03_src_type_i           (           ach03_src_type),
     .ach04_src_type_i           (           ach04_src_type),
     .ach05_src_type_i           (           ach05_src_type),
     .ach06_src_type_i           (           ach06_src_type),
     .ach01_start_addr_i         (         ach01_start_addr),
     .ach02_start_addr_i         (         ach02_start_addr),
     .ach03_start_addr_i         (         ach03_start_addr),
     .ach04_start_addr_i         (         ach04_start_addr),
     .ach05_start_addr_i         (         ach05_start_addr),
     .ach06_start_addr_i         (         ach06_start_addr),
     .ach01_data_length_i        (        ach01_data_length),
     .ach02_data_length_i        (        ach02_data_length),
     .ach03_data_length_i        (        ach03_data_length),
     .ach04_data_length_i        (        ach04_data_length),
     .ach05_data_length_i        (        ach05_data_length),
     .ach06_data_length_i        (        ach06_data_length),
     .ach01_2nd_addr_burst_i     (     ach01_2nd_addr_burst),
     .ach02_2nd_addr_burst_i     (     ach02_2nd_addr_burst),
     .ach03_2nd_addr_burst_i     (     ach03_2nd_addr_burst),
     .ach04_2nd_addr_burst_i     (     ach04_2nd_addr_burst),
     .ach05_2nd_addr_burst_i     (     ach05_2nd_addr_burst),
     .ach06_2nd_addr_burst_i     (     ach06_2nd_addr_burst),
     .ach01_column_num_2nd_i     (     ach01_column_num_2nd),
     .ach02_column_num_2nd_i     (     ach02_column_num_2nd),
     .ach03_column_num_2nd_i     (     ach03_column_num_2nd),
     .ach04_column_num_2nd_i     (     ach04_column_num_2nd),
     .ach05_column_num_2nd_i     (     ach05_column_num_2nd),
     .ach06_column_num_2nd_i     (     ach06_column_num_2nd),
     .ach01_broadcast_i          (          ach01_broadcast),
     .ach02_broadcast_i          (          ach02_broadcast),
     .ach03_broadcast_i          (          ach03_broadcast),
     .ach04_broadcast_i          (          ach04_broadcast),
     .ach05_broadcast_i          (          ach05_broadcast),
     .ach06_broadcast_i          (          ach06_broadcast),
     .ach01_pos0_1st_i           (           ach01_pos0_1st),
     .ach02_pos0_1st_i           (           ach02_pos0_1st),
     .ach03_pos0_1st_i           (           ach03_pos0_1st),
     .ach04_pos0_1st_i           (           ach04_pos0_1st),
     .ach05_pos0_1st_i           (           ach05_pos0_1st),
     .ach06_pos0_1st_i           (           ach06_pos0_1st),
     .ach01_pos1_1st_i           (           ach01_pos1_1st),
     .ach02_pos1_1st_i           (           ach02_pos1_1st),
     .ach03_pos1_1st_i           (           ach03_pos1_1st),
     .ach04_pos1_1st_i           (           ach04_pos1_1st),
     .ach05_pos1_1st_i           (           ach05_pos1_1st),
     .ach06_pos1_1st_i           (           ach06_pos1_1st),
     .ach01_pos2_1st_i           (           ach01_pos2_1st),
     .ach02_pos2_1st_i           (           ach02_pos2_1st),
     .ach03_pos2_1st_i           (           ach03_pos2_1st),
     .ach04_pos2_1st_i           (           ach04_pos2_1st),
     .ach05_pos2_1st_i           (           ach05_pos2_1st),
     .ach06_pos2_1st_i           (           ach06_pos2_1st),
     .ach01_pos3_1st_i           (           ach01_pos3_1st),
     .ach02_pos3_1st_i           (           ach02_pos3_1st),
     .ach03_pos3_1st_i           (           ach03_pos3_1st),
     .ach04_pos3_1st_i           (           ach04_pos3_1st),
     .ach05_pos3_1st_i           (           ach05_pos3_1st),
     .ach06_pos3_1st_i           (           ach06_pos3_1st),
     .ach01_pos4_1st_i           (           ach01_pos4_1st),
     .ach02_pos4_1st_i           (           ach02_pos4_1st),
     .ach03_pos4_1st_i           (           ach03_pos4_1st),
     .ach04_pos4_1st_i           (           ach04_pos4_1st),
     .ach05_pos4_1st_i           (           ach05_pos4_1st),
     .ach06_pos4_1st_i           (           ach06_pos4_1st),
     .ach01_pos5_1st_i           (           ach01_pos5_1st),
     .ach02_pos5_1st_i           (           ach02_pos5_1st),
     .ach03_pos5_1st_i           (           ach03_pos5_1st),
     .ach04_pos5_1st_i           (           ach04_pos5_1st),
     .ach05_pos5_1st_i           (           ach05_pos5_1st),
     .ach06_pos5_1st_i           (           ach06_pos5_1st),
     .ach01_pos6_1st_i           (           ach01_pos6_1st),
     .ach02_pos6_1st_i           (           ach02_pos6_1st),
     .ach03_pos6_1st_i           (           ach03_pos6_1st),
     .ach04_pos6_1st_i           (           ach04_pos6_1st),
     .ach05_pos6_1st_i           (           ach05_pos6_1st),
     .ach06_pos6_1st_i           (           ach06_pos6_1st),
     .ach01_pos7_1st_i           (           ach01_pos7_1st),
     .ach02_pos7_1st_i           (           ach02_pos7_1st),
     .ach03_pos7_1st_i           (           ach03_pos7_1st),
     .ach04_pos7_1st_i           (           ach04_pos7_1st),
     .ach05_pos7_1st_i           (           ach05_pos7_1st),
     .ach06_pos7_1st_i           (           ach06_pos7_1st),
     .ach01_pos0_src_type_i      (      ach01_pos0_src_type),
     .ach02_pos0_src_type_i      (      ach02_pos0_src_type),
     .ach03_pos0_src_type_i      (      ach03_pos0_src_type),
     .ach04_pos0_src_type_i      (      ach04_pos0_src_type),
     .ach05_pos0_src_type_i      (      ach05_pos0_src_type),
     .ach06_pos0_src_type_i      (      ach06_pos0_src_type),
     .ach01_pos1_src_type_i      (      ach01_pos1_src_type),
     .ach02_pos1_src_type_i      (      ach02_pos1_src_type),
     .ach03_pos1_src_type_i      (      ach03_pos1_src_type),
     .ach04_pos1_src_type_i      (      ach04_pos1_src_type),
     .ach05_pos1_src_type_i      (      ach05_pos1_src_type),
     .ach06_pos1_src_type_i      (      ach06_pos1_src_type),
     .ach01_pos2_src_type_i      (      ach01_pos2_src_type),
     .ach02_pos2_src_type_i      (      ach02_pos2_src_type),
     .ach03_pos2_src_type_i      (      ach03_pos2_src_type),
     .ach04_pos2_src_type_i      (      ach04_pos2_src_type),
     .ach05_pos2_src_type_i      (      ach05_pos2_src_type),
     .ach06_pos2_src_type_i      (      ach06_pos2_src_type),
     .ach01_pos3_src_type_i      (      ach01_pos3_src_type),
     .ach02_pos3_src_type_i      (      ach02_pos3_src_type),
     .ach03_pos3_src_type_i      (      ach03_pos3_src_type),
     .ach04_pos3_src_type_i      (      ach04_pos3_src_type),
     .ach05_pos3_src_type_i      (      ach05_pos3_src_type),
     .ach06_pos3_src_type_i      (      ach06_pos3_src_type),
     .ach01_pos4_src_type_i      (      ach01_pos4_src_type),
     .ach02_pos4_src_type_i      (      ach02_pos4_src_type),
     .ach03_pos4_src_type_i      (      ach03_pos4_src_type),
     .ach04_pos4_src_type_i      (      ach04_pos4_src_type),
     .ach05_pos4_src_type_i      (      ach05_pos4_src_type),
     .ach06_pos4_src_type_i      (      ach06_pos4_src_type),
     .ach01_pos5_src_type_i      (      ach01_pos5_src_type),
     .ach02_pos5_src_type_i      (      ach02_pos5_src_type),
     .ach03_pos5_src_type_i      (      ach03_pos5_src_type),
     .ach04_pos5_src_type_i      (      ach04_pos5_src_type),
     .ach05_pos5_src_type_i      (      ach05_pos5_src_type),
     .ach06_pos5_src_type_i      (      ach06_pos5_src_type),
     .ach01_pos6_src_type_i      (      ach01_pos6_src_type),
     .ach02_pos6_src_type_i      (      ach02_pos6_src_type),
     .ach03_pos6_src_type_i      (      ach03_pos6_src_type),
     .ach04_pos6_src_type_i      (      ach04_pos6_src_type),
     .ach05_pos6_src_type_i      (      ach05_pos6_src_type),
     .ach06_pos6_src_type_i      (      ach06_pos6_src_type),
     .ach01_pos7_src_type_i      (      ach01_pos7_src_type),
     .ach02_pos7_src_type_i      (      ach02_pos7_src_type),
     .ach03_pos7_src_type_i      (      ach03_pos7_src_type),
     .ach04_pos7_src_type_i      (      ach04_pos7_src_type),
     .ach05_pos7_src_type_i      (      ach05_pos7_src_type),
     .ach06_pos7_src_type_i      (      ach06_pos7_src_type),
     .ach01_release_i            (            ach01_release),
     .ach02_release_i            (            ach02_release),
     .ach03_release_i            (            ach03_release),
     .ach04_release_i            (            ach04_release),
     .ach05_release_i            (            ach05_release),
     .ach06_release_i            (            ach06_release),
     .ach01_VR_id_i              (              ach01_VR_id),
     .ach02_VR_id_i              (              ach02_VR_id),
     .ach03_VR_id_i              (              ach03_VR_id),
     .ach04_VR_id_i              (              ach04_VR_id),
     .ach05_VR_id_i              (              ach05_VR_id),
     .ach06_VR_id_i              (              ach06_VR_id),
     .ach01_VR_FR_i              (              ach01_VR_FR),
     .ach02_VR_FR_i              (              ach02_VR_FR),
     .ach03_VR_FR_i              (              ach03_VR_FR),
     .ach04_VR_FR_i              (              ach04_VR_FR),
     .ach05_VR_FR_i              (              ach05_VR_FR),
     .ach06_VR_FR_i              (              ach06_VR_FR),
     .ach01_channel_ID_i         (         ach01_channel_ID),
     .ach02_channel_ID_i         (         ach02_channel_ID),
     .ach03_channel_ID_i         (         ach03_channel_ID),
     .ach04_channel_ID_i         (         ach04_channel_ID),
     .ach05_channel_ID_i         (         ach05_channel_ID),
     .ach06_channel_ID_i         (         ach06_channel_ID),
     
     
     .dch01_ip_data_i            (            dch01_ip_data),
     .dch02_ip_data_i            (            dch02_ip_data),
     .dch03_ip_data_i            (            dch03_ip_data),
     .dch04_ip_data_i            (            dch04_ip_data),
     .dch05_ip_data_i            (            dch05_ip_data),
     .dch06_ip_data_i            (            dch06_ip_data),
     .dch01_ip_fwd_i             (             dch01_ip_fwd),
     .dch02_ip_fwd_i             (             dch02_ip_fwd),
     .dch03_ip_fwd_i             (             dch03_ip_fwd),
     .dch04_ip_fwd_i             (             dch04_ip_fwd),
     .dch05_ip_fwd_i             (             dch05_ip_fwd),
     .dch06_ip_fwd_i             (             dch06_ip_fwd),
     .dch01_ip_stb_i             (             dch01_ip_stb),
     .dch02_ip_stb_i             (             dch02_ip_stb),
     .dch03_ip_stb_i             (             dch03_ip_stb),
     .dch04_ip_stb_i             (             dch04_ip_stb),
     .dch05_ip_stb_i             (             dch05_ip_stb),
     .dch06_ip_stb_i             (             dch06_ip_stb),
     .dch01_ip_fail_o            (            dch01_ip_fail),
     .dch02_ip_fail_o            (            dch02_ip_fail),
     .dch03_ip_fail_o            (            dch03_ip_fail),
     .dch04_ip_fail_o            (            dch04_ip_fail),
     .dch05_ip_fail_o            (            dch05_ip_fail),
     .dch06_ip_fail_o            (            dch06_ip_fail),
     .dch01_ip_pack_o            (            dch01_ip_pack),
     .dch02_ip_pack_o            (            dch02_ip_pack),
     .dch03_ip_pack_o            (            dch03_ip_pack),
     .dch04_ip_pack_o            (            dch04_ip_pack),
     .dch05_ip_pack_o            (            dch05_ip_pack),
     .dch06_ip_pack_o            (            dch06_ip_pack),
     .dch01_ip_suspend_o         (         dch01_ip_suspend),
     .dch02_ip_suspend_o         (         dch02_ip_suspend),
     .dch03_ip_suspend_o         (         dch03_ip_suspend),
     .dch04_ip_suspend_o         (         dch04_ip_suspend),
     .dch05_ip_suspend_o         (         dch05_ip_suspend),
     .dch06_ip_suspend_o         (         dch06_ip_suspend),
     .dch01_ip_cancel_o          (          dch01_ip_cancel),
     .dch02_ip_cancel_o          (          dch02_ip_cancel),
     .dch03_ip_cancel_o          (          dch03_ip_cancel),
     .dch04_ip_cancel_o          (          dch04_ip_cancel),
     .dch05_ip_cancel_o          (          dch05_ip_cancel),
     .dch06_ip_cancel_o          (          dch06_ip_cancel),     
     .dch01_op_fail_i            (            dch01_op_fail),
     .dch02_op_fail_i            (            dch02_op_fail),
     .dch03_op_fail_i            (            dch03_op_fail),
     .dch04_op_fail_i            (            dch04_op_fail),
     .dch05_op_fail_i            (            dch05_op_fail),
     .dch06_op_fail_i            (            dch06_op_fail),
     .dch01_op_pack_i            (            dch01_op_pack),
     .dch02_op_pack_i            (            dch02_op_pack),
     .dch03_op_pack_i            (            dch03_op_pack),
     .dch04_op_pack_i            (            dch04_op_pack),
     .dch05_op_pack_i            (            dch05_op_pack),
     .dch06_op_pack_i            (            dch06_op_pack),
     .dch01_op_suspend_i         (         dch01_op_suspend),
     .dch02_op_suspend_i         (         dch02_op_suspend),
     .dch03_op_suspend_i         (         dch03_op_suspend),
     .dch04_op_suspend_i         (         dch04_op_suspend),
     .dch05_op_suspend_i         (         dch05_op_suspend),
     .dch06_op_suspend_i         (         dch06_op_suspend),
     .dch01_op_cancel_i          (          dch01_op_cancel),
     .dch02_op_cancel_i          (          dch02_op_cancel),
     .dch03_op_cancel_i          (          dch03_op_cancel),
     .dch04_op_cancel_i          (          dch04_op_cancel),
     .dch05_op_cancel_i          (          dch05_op_cancel),
     .dch06_op_cancel_i          (          dch06_op_cancel),
     .dch01_op_data_o            (            dch01_op_data),
     .dch02_op_data_o            (            dch02_op_data),
     .dch03_op_data_o            (            dch03_op_data),
     .dch04_op_data_o            (            dch04_op_data),
     .dch05_op_data_o            (            dch05_op_data),
     .dch06_op_data_o            (            dch06_op_data),
     .dch01_op_fwd_o             (             dch01_op_fwd),
     .dch02_op_fwd_o             (             dch02_op_fwd),
     .dch03_op_fwd_o             (             dch03_op_fwd),
     .dch04_op_fwd_o             (             dch04_op_fwd),
     .dch05_op_fwd_o             (             dch05_op_fwd),
     .dch06_op_fwd_o             (             dch06_op_fwd),
     .dch01_op_stb_o             (             dch01_op_stb),
     .dch02_op_stb_o             (             dch02_op_stb),
     .dch03_op_stb_o             (             dch03_op_stb),
     .dch04_op_stb_o             (             dch04_op_stb),
     .dch05_op_stb_o             (             dch05_op_stb),
     .dch06_op_stb_o             (             dch06_op_stb),     
     .dch01_pos_1st_rd           (           dch01_pos_1st_rd),
     .dch02_pos_1st_rd           (           dch02_pos_1st_rd),
     .dch03_pos_1st_rd           (           dch03_pos_1st_rd),
     .dch04_pos_1st_rd           (           dch04_pos_1st_rd),
     .dch05_pos_1st_rd           (           dch05_pos_1st_rd),
     .dch06_pos_1st_rd           (           dch06_pos_1st_rd),
     .dch01_pos_1st_wr           (           dch01_pos_1st_wr),
     .dch02_pos_1st_wr           (           dch02_pos_1st_wr),
     .dch03_pos_1st_wr           (           dch03_pos_1st_wr),
     .dch04_pos_1st_wr           (           dch04_pos_1st_wr),
     .dch05_pos_1st_wr           (           dch05_pos_1st_wr),
     .dch06_pos_1st_wr           (           dch06_pos_1st_wr),
     
     
     .broad01_grant_i            (            broad01_grant),
     .broad02_grant_i            (            broad02_grant),
     .broad03_grant_i            (            broad03_grant),
     .broad04_grant_i            (            broad04_grant),
     .broad05_grant_i            (            broad05_grant),
     .broad06_grant_i            (            broad06_grant),
     .broad01_link_o             (             broad01_link),
     .broad02_link_o             (             broad02_link),
     .broad03_link_o             (             broad03_link),
     .broad04_link_o             (             broad04_link),
     .broad05_link_o             (             broad05_link),
     .broad06_link_o             (             broad06_link),
     .broad01_fwd_o              (              broad01_fwd),
     .broad02_fwd_o              (              broad02_fwd),
     .broad03_fwd_o              (              broad03_fwd),
     .broad04_fwd_o              (              broad04_fwd),
     .broad05_fwd_o              (              broad05_fwd),
     .broad06_fwd_o              (              broad06_fwd),
     .broad01_data_o             (             broad01_data),
     .broad02_data_o             (             broad02_data),
     .broad03_data_o             (             broad03_data),
     .broad04_data_o             (             broad04_data),
     .broad05_data_o             (             broad05_data),
     .broad06_data_o             (             broad06_data),
     
     
     .ch01_req_rd_o              (              ch01_req_rd),
     .ch02_req_rd_o              (              ch02_req_rd),
     .ch03_req_rd_o              (              ch03_req_rd),
     .ch04_req_rd_o              (              ch04_req_rd),
     .ch05_req_rd_o              (              ch05_req_rd),
     .ch06_req_rd_o              (              ch06_req_rd),
     .ch01_rd_addr_en_i          (          ch01_rd_addr_en),
     .ch02_rd_addr_en_i          (          ch02_rd_addr_en),
     .ch03_rd_addr_en_i          (          ch03_rd_addr_en),
     .ch04_rd_addr_en_i          (          ch04_rd_addr_en),
     .ch05_rd_addr_en_i          (          ch05_rd_addr_en),
     .ch06_rd_addr_en_i          (          ch06_rd_addr_en),
     
     .ch01_wr_addr_en_i          (          ch01_wr_addr_en),
     .ch02_wr_addr_en_i          (          ch02_wr_addr_en),
     .ch03_wr_addr_en_i          (          ch03_wr_addr_en),
     .ch04_wr_addr_en_i          (          ch04_wr_addr_en),
     .ch05_wr_addr_en_i          (          ch05_wr_addr_en),
     .ch06_wr_addr_en_i          (          ch06_wr_addr_en),
     
     .ch01_address_o             (             ch01_address),
     .ch02_address_o             (             ch02_address),
     .ch03_address_o             (             ch03_address),
     .ch04_address_o             (             ch04_address),
     .ch05_address_o             (             ch05_address),
     .ch06_address_o             (             ch06_address),
     
     .RD01_DFS_wr_en             (             RD01_DFS_wr_en),
     .RD02_DFS_wr_en             (             RD02_DFS_wr_en),
     .RD03_DFS_wr_en             (             RD03_DFS_wr_en),
     .RD04_DFS_wr_en             (             RD04_DFS_wr_en),
     .RD05_DFS_wr_en             (             RD05_DFS_wr_en),
     .RD06_DFS_wr_en             (             RD06_DFS_wr_en),
     .RD01_DFS_din               (               RD01_DFS_din),
     .RD02_DFS_din               (               RD02_DFS_din),
     .RD03_DFS_din               (               RD03_DFS_din),
     .RD04_DFS_din               (               RD04_DFS_din),
     .RD05_DFS_din               (               RD05_DFS_din),
     .RD06_DFS_din               (               RD06_DFS_din),
     .RD01_DFS_full              (              RD01_DFS_full),
     .RD02_DFS_full              (              RD02_DFS_full),
     .RD03_DFS_full              (              RD03_DFS_full),
     .RD04_DFS_full              (              RD04_DFS_full),
     .RD05_DFS_full              (              RD05_DFS_full),
     .RD06_DFS_full              (              RD06_DFS_full),
     .RD01_DFS_wr_count          (          RD01_DFS_wr_count),
     .RD02_DFS_wr_count          (          RD02_DFS_wr_count),
     .RD03_DFS_wr_count          (          RD03_DFS_wr_count),
     .RD04_DFS_wr_count          (          RD04_DFS_wr_count),
     .RD05_DFS_wr_count          (          RD05_DFS_wr_count),
     .RD06_DFS_wr_count          (          RD06_DFS_wr_count),
     
     .WR01_DFS_rd_en             (             WR01_DFS_rd_en),
     .WR02_DFS_rd_en             (             WR02_DFS_rd_en),
     .WR03_DFS_rd_en             (             WR03_DFS_rd_en),
     .WR04_DFS_rd_en             (             WR04_DFS_rd_en),
     .WR05_DFS_rd_en             (             WR05_DFS_rd_en),
     .WR06_DFS_rd_en             (             WR06_DFS_rd_en),
     .WR01_DFS_dout              (              WR01_DFS_dout),
     .WR02_DFS_dout              (              WR02_DFS_dout),
     .WR03_DFS_dout              (              WR03_DFS_dout),
     .WR04_DFS_dout              (              WR04_DFS_dout),
     .WR05_DFS_dout              (              WR05_DFS_dout),
     .WR06_DFS_dout              (              WR06_DFS_dout),
     .WR01_DFS_valid             (             WR01_DFS_valid),
     .WR02_DFS_valid             (             WR02_DFS_valid),
     .WR03_DFS_valid             (             WR03_DFS_valid),
     .WR04_DFS_valid             (             WR04_DFS_valid),
     .WR05_DFS_valid             (             WR05_DFS_valid),
     .WR06_DFS_valid             (             WR06_DFS_valid),
     .WR01_DFS_empty             (             WR01_DFS_empty),
     .WR02_DFS_empty             (             WR02_DFS_empty),
     .WR03_DFS_empty             (             WR03_DFS_empty),
     .WR04_DFS_empty             (             WR04_DFS_empty),
     .WR05_DFS_empty             (             WR05_DFS_empty),
     .WR06_DFS_empty             (             WR06_DFS_empty)
    );



// Instantiate the module[rd_fifo_arbiter]
rd_fifo_arbiter   rd_fifo_arbiter
   (
     .phy_init_done_i            (            phy_init_done_i),
     .sys_clk                    (                    sys_clk),
     .sys_rst                    (                  sys_rst_n),
     .ddr_clk                    (                    ddr_clk),
     
     .ch1_rd_fifo_data_in        (        RD01_DFS_din),
     .ch2_rd_fifo_data_in        (        RD02_DFS_din),
     .ch3_rd_fifo_data_in        (        RD03_DFS_din),
     .ch4_rd_fifo_data_in        (        RD04_DFS_din),
     .ch5_rd_fifo_data_in        (        RD05_DFS_din),
     .ch6_rd_fifo_data_in        (        RD06_DFS_din),
     .ch1_rd_fifo_wr_en          (      RD01_DFS_wr_en),
     .ch2_rd_fifo_wr_en          (      RD02_DFS_wr_en),
     .ch3_rd_fifo_wr_en          (      RD03_DFS_wr_en),
     .ch4_rd_fifo_wr_en          (      RD04_DFS_wr_en),
     .ch5_rd_fifo_wr_en          (      RD05_DFS_wr_en),
     .ch6_rd_fifo_wr_en          (      RD06_DFS_wr_en),
     .ch1_rd_fifo_wr_count       (   RD01_DFS_wr_count),
     .ch2_rd_fifo_wr_count       (   RD02_DFS_wr_count),
     .ch3_rd_fifo_wr_count       (   RD03_DFS_wr_count),
     .ch4_rd_fifo_wr_count       (   RD04_DFS_wr_count),
     .ch5_rd_fifo_wr_count       (   RD05_DFS_wr_count),
     .ch6_rd_fifo_wr_count       (   RD06_DFS_wr_count),
     
     .ch1_req_i                  (         ch01_req_rd),
     .ch2_req_i                  (         ch02_req_rd),
     .ch3_req_i                  (         ch03_req_rd),
     .ch4_req_i                  (         ch04_req_rd),
     .ch5_req_i                  (         ch05_req_rd),
     .ch6_req_i                  (         ch06_req_rd),
     .ch1_address_i              (        ch01_address),
     .ch2_address_i              (        ch02_address),
     .ch3_address_i              (        ch03_address),
     .ch4_address_i              (        ch04_address),
     .ch5_address_i              (        ch05_address),
     .ch6_address_i              (        ch06_address),
     .ch1_addr_en_o              (     ch01_rd_addr_en),
     .ch2_addr_en_o              (     ch02_rd_addr_en),
     .ch3_addr_en_o              (     ch03_rd_addr_en),
     .ch4_addr_en_o              (     ch04_rd_addr_en),
     .ch5_addr_en_o              (     ch05_rd_addr_en),
     .ch6_addr_en_o              (     ch06_rd_addr_en),
     
     .rd_addr_fifo_rd_en         (         rd_addr_fifo_rd_en),
     .rd_addr_fifo_data_out      (      rd_addr_fifo_data_out),
     .rd_addr_fifo_valid         (         rd_addr_fifo_valid),
     .rd_addr_fifo_empty         (         rd_addr_fifo_empty),
     
     .rd_ddr_fifo_wr_en          (          rd_ddr_fifo_wr_en),
     .rd_ddr_fifo_data_in        (        rd_ddr_fifo_data_in)
    );




// Instantiate the module[wr_fifo_arbiter]
wr_fifo_arbiter_f1   wr_fifo_arbiter
   (
     .phy_init_done_i            (            phy_init_done_i),
     .sys_clk                    (                    sys_clk),
     .sys_rst                    (                  sys_rst_n),
     .ddr_clk                    (                    ddr_clk),
     
     .ch1_wr_fifo_data_out       (       WR01_DFS_dout),
     .ch2_wr_fifo_data_out       (       WR02_DFS_dout),
     .ch3_wr_fifo_data_out       (       WR03_DFS_dout),
     .ch4_wr_fifo_data_out       (       WR04_DFS_dout),
     .ch5_wr_fifo_data_out       (       WR05_DFS_dout),
     .ch6_wr_fifo_data_out       (       WR06_DFS_dout),
     .ch1_wr_fifo_rd_en          (      WR01_DFS_rd_en),
     .ch2_wr_fifo_rd_en          (      WR02_DFS_rd_en),
     .ch3_wr_fifo_rd_en          (      WR03_DFS_rd_en),
     .ch4_wr_fifo_rd_en          (      WR04_DFS_rd_en),
     .ch5_wr_fifo_rd_en          (      WR05_DFS_rd_en),
     .ch6_wr_fifo_rd_en          (      WR06_DFS_rd_en),
     .ch1_wr_fifo_valid          (      WR01_DFS_valid),
     .ch2_wr_fifo_valid          (      WR02_DFS_valid),
     .ch3_wr_fifo_valid          (      WR03_DFS_valid),
     .ch4_wr_fifo_valid          (      WR04_DFS_valid),
     .ch5_wr_fifo_valid          (      WR05_DFS_valid),
     .ch6_wr_fifo_valid          (      WR06_DFS_valid),
     .ch1_wr_fifo_empty          (      WR01_DFS_empty),
     .ch2_wr_fifo_empty          (      WR02_DFS_empty),
     .ch3_wr_fifo_empty          (      WR03_DFS_empty),
     .ch4_wr_fifo_empty          (      WR04_DFS_empty),
     .ch5_wr_fifo_empty          (      WR05_DFS_empty),
     .ch6_wr_fifo_empty          (      WR06_DFS_empty),
     .ch1_address_i              (        ch01_address),
     .ch2_address_i              (        ch02_address),
     .ch3_address_i              (        ch03_address),
     .ch4_address_i              (        ch04_address),
     .ch5_address_i              (        ch05_address),
     .ch6_address_i              (        ch06_address),
     .ch1_addr_en_o              (     ch01_wr_addr_en),
     .ch2_addr_en_o              (     ch02_wr_addr_en),
     .ch3_addr_en_o              (     ch03_wr_addr_en),
     .ch4_addr_en_o              (     ch04_wr_addr_en),
     .ch5_addr_en_o              (     ch05_wr_addr_en),
     .ch6_addr_en_o              (     ch06_wr_addr_en),
     
     .wr_addr_fifo_rd_en         (         wr_addr_fifo_rd_en),
     .wr_addr_fifo_data_out      (      wr_addr_fifo_data_out),
     .wr_addr_fifo_valid         (         wr_addr_fifo_valid),
     .wr_addr_fifo_empty         (         wr_addr_fifo_empty),
     
     .wr_ddr_fifo_rd_en          (          wr_ddr_fifo_rd_en),
     .wr_ddr_fifo_data_out       (       wr_ddr_fifo_data_out),
     .wr_ddr_fifo_valid          (          wr_ddr_fifo_valid),
     .wr_ddr_fifo_empty          (          wr_ddr_fifo_empty),
     .wr_ddr_fifo_rd_count       (       wr_ddr_fifo_rd_count)
    );



// Instantiate the module[broadcast_crossbar]
broadcast_crossbar   broadcast_crossbar
    (
     .sys_clk                    (                    sys_clk),
     .sys_rst_n                  (                  sys_rst_n),
     .ch1_link_i                 (            broad01_link),
     .ch2_link_i                 (            broad02_link),
     .ch3_link_i                 (            broad03_link),
     .ch4_link_i                 (            broad04_link),
     .ch5_link_i                 (            broad05_link),
     .ch6_link_i                 (            broad06_link),
     .ch1_grant_o                (           broad01_grant),
     .ch2_grant_o                (           broad02_grant),
     .ch3_grant_o                (           broad03_grant),
     .ch4_grant_o                (           broad04_grant),
     .ch5_grant_o                (           broad05_grant),
     .ch6_grant_o                (           broad06_grant),
     .ch1_data_i                 (            broad01_data),
     .ch2_data_i                 (            broad02_data),
     .ch3_data_i                 (            broad03_data),
     .ch4_data_i                 (            broad04_data),
     .ch5_data_i                 (            broad05_data),
     .ch6_data_i                 (            broad06_data),
     .ch1_fwd_i                  (             broad01_fwd),
     .ch2_fwd_i                  (             broad02_fwd),
     .ch3_fwd_i                  (             broad03_fwd),
     .ch4_fwd_i                  (             broad04_fwd),
     .ch5_fwd_i                  (             broad05_fwd),
     .ch6_fwd_i                  (             broad06_fwd),
     .broadcast_data_o           (           broadcast_data_o),
     .broadcast_fwd_o            (            broadcast_fwd_o)
    );




// Instantiate the module[pcc_crossbar]
ddr_pcc_crossbar_8X8   ddr_pcc_crossbar_8X8
    (
     .clk                        (                    sys_clk),
     .rst_n                      (                  sys_rst_n),
     
     .ch1_ddr_pos_1st_wr         (         dch01_pos_1st_wr),
     .ch2_ddr_pos_1st_wr         (         dch02_pos_1st_wr),
     .ch3_ddr_pos_1st_wr         (         dch03_pos_1st_wr),
     .ch4_ddr_pos_1st_wr         (         dch04_pos_1st_wr),
     .ch5_ddr_pos_1st_wr         (         dch05_pos_1st_wr),
     .ch6_ddr_pos_1st_wr         (         dch06_pos_1st_wr),
     .ch1_ddr_pos_1st_rd         (         dch01_pos_1st_rd),
     .ch2_ddr_pos_1st_rd         (         dch02_pos_1st_rd),
     .ch3_ddr_pos_1st_rd         (         dch03_pos_1st_rd),
     .ch4_ddr_pos_1st_rd         (         dch04_pos_1st_rd),
     .ch5_ddr_pos_1st_rd         (         dch05_pos_1st_rd),
     .ch6_ddr_pos_1st_rd         (         dch06_pos_1st_rd),
     
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
     .ch1_ip_data_o              (       dch01_ip_data),
     .ch2_ip_data_o              (       dch02_ip_data),
     .ch3_ip_data_o              (       dch03_ip_data),
     .ch4_ip_data_o              (       dch04_ip_data),
     .ch5_ip_data_o              (       dch05_ip_data),
     .ch6_ip_data_o              (       dch06_ip_data),
     .ch1_ip_stb_o               (        dch01_ip_stb),
     .ch2_ip_stb_o               (        dch02_ip_stb),
     .ch3_ip_stb_o               (        dch03_ip_stb),
     .ch4_ip_stb_o               (        dch04_ip_stb),
     .ch5_ip_stb_o               (        dch05_ip_stb),
     .ch6_ip_stb_o               (        dch06_ip_stb),
     .ch1_ip_fwd_o               (        dch01_ip_fwd),
     .ch2_ip_fwd_o               (        dch02_ip_fwd),
     .ch3_ip_fwd_o               (        dch03_ip_fwd),
     .ch4_ip_fwd_o               (        dch04_ip_fwd),
     .ch5_ip_fwd_o               (        dch05_ip_fwd),
     .ch6_ip_fwd_o               (        dch06_ip_fwd),
     .ch1_ip_fail_i              (       dch01_ip_fail),
     .ch2_ip_fail_i              (       dch02_ip_fail),
     .ch3_ip_fail_i              (       dch03_ip_fail),
     .ch4_ip_fail_i              (       dch04_ip_fail),
     .ch5_ip_fail_i              (       dch05_ip_fail),
     .ch6_ip_fail_i              (       dch06_ip_fail),
     .ch1_ip_pack_i              (       dch01_ip_pack),
     .ch2_ip_pack_i              (       dch02_ip_pack),
     .ch3_ip_pack_i              (       dch03_ip_pack),
     .ch4_ip_pack_i              (       dch04_ip_pack),
     .ch5_ip_pack_i              (       dch05_ip_pack),
     .ch6_ip_pack_i              (       dch06_ip_pack),
     .ch1_ip_suspend_i           (    dch01_ip_suspend),
     .ch2_ip_suspend_i           (    dch02_ip_suspend),
     .ch3_ip_suspend_i           (    dch03_ip_suspend),
     .ch4_ip_suspend_i           (    dch04_ip_suspend),
     .ch5_ip_suspend_i           (    dch05_ip_suspend),
     .ch6_ip_suspend_i           (    dch06_ip_suspend),
     .ch1_ip_cancel_i            (     dch01_ip_cancel),
     .ch2_ip_cancel_i            (     dch02_ip_cancel),
     .ch3_ip_cancel_i            (     dch03_ip_cancel),
     .ch4_ip_cancel_i            (     dch04_ip_cancel),
     .ch5_ip_cancel_i            (     dch05_ip_cancel),
     .ch6_ip_cancel_i            (     dch06_ip_cancel),
     
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
     
     .ch1_op_data_i              (       dch01_op_data),
     .ch2_op_data_i              (       dch02_op_data),
     .ch3_op_data_i              (       dch03_op_data),
     .ch4_op_data_i              (       dch04_op_data),
     .ch5_op_data_i              (       dch05_op_data),
     .ch6_op_data_i              (       dch06_op_data),
     .ch1_op_stb_i               (        dch01_op_stb),
     .ch2_op_stb_i               (        dch02_op_stb),
     .ch3_op_stb_i               (        dch03_op_stb),
     .ch4_op_stb_i               (        dch04_op_stb),
     .ch5_op_stb_i               (        dch05_op_stb),
     .ch6_op_stb_i               (        dch06_op_stb),
     .ch1_op_fwd_i               (        dch01_op_fwd),
     .ch2_op_fwd_i               (        dch02_op_fwd),
     .ch3_op_fwd_i               (        dch03_op_fwd),
     .ch4_op_fwd_i               (        dch04_op_fwd),
     .ch5_op_fwd_i               (        dch05_op_fwd),
     .ch6_op_fwd_i               (        dch06_op_fwd),
     .ch1_op_fail_o              (       dch01_op_fail),
     .ch2_op_fail_o              (       dch02_op_fail),
     .ch3_op_fail_o              (       dch03_op_fail),
     .ch4_op_fail_o              (       dch04_op_fail),
     .ch5_op_fail_o              (       dch05_op_fail),
     .ch6_op_fail_o              (       dch06_op_fail),
     .ch1_op_pack_o              (       dch01_op_pack),
     .ch2_op_pack_o              (       dch02_op_pack),
     .ch3_op_pack_o              (       dch03_op_pack),
     .ch4_op_pack_o              (       dch04_op_pack),
     .ch5_op_pack_o              (       dch05_op_pack),
     .ch6_op_pack_o              (       dch06_op_pack),
     .ch1_op_suspend_o           (    dch01_op_suspend),
     .ch2_op_suspend_o           (    dch02_op_suspend),
     .ch3_op_suspend_o           (    dch03_op_suspend),
     .ch4_op_suspend_o           (    dch04_op_suspend),
     .ch5_op_suspend_o           (    dch05_op_suspend),
     .ch6_op_suspend_o           (    dch06_op_suspend),
     .ch1_op_cancel_o            (     dch01_op_cancel),
     .ch2_op_cancel_o            (     dch02_op_cancel),
     .ch3_op_cancel_o            (     dch03_op_cancel),
     .ch4_op_cancel_o            (     dch04_op_cancel),
     .ch5_op_cancel_o            (     dch05_op_cancel),
     .ch6_op_cancel_o            (     dch06_op_cancel)
    );



// Instantiate the module[ddr_app]
ddr_app_1w1r    ddr_app
   (
     
     .raddr_fifo_rd_en           (      rd_addr_fifo_rd_en),
     .raddr_fifo_dout            (   rd_addr_fifo_data_out),
     .raddr_fifo_valid           (      rd_addr_fifo_valid),
     .raddr_fifo_empty           (      rd_addr_fifo_empty),
     .rdata_fifo_din             (     rd_ddr_fifo_data_in),
     .rdata_fifo_wr_en           (       rd_ddr_fifo_wr_en),
     
     .waddr_fifo_rd_en           (      wr_addr_fifo_rd_en),
     .waddr_fifo_dout            (   wr_addr_fifo_data_out),
     .waddr_fifo_empty           (      wr_addr_fifo_empty),
     .waddr_fifo_valid           (      wr_addr_fifo_valid),
     .wdata_fifo_rd_en           (       wr_ddr_fifo_rd_en),
     .wdata_fifo_dout            (    wr_ddr_fifo_data_out),
     .wdata_fifo_valid           (       wr_ddr_fifo_valid),
     .wdata_fifo_empty           (       wr_ddr_fifo_empty),
     .wdata_fifo_rdepth          (    wr_ddr_fifo_rd_count),
     
     .clk                        (                    ddr_clk),
     .rst_n                      (                  ddr_rst_n),
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



endmodule
