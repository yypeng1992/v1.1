`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:00:22 09/16/2016 
// Design Name: 
// Module Name:    general_ach 
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
module general_ach(
    clk,
    rst_n,
    
    
  //request info
  request_valid_i,
  request_pos_1st_i,
  request_pos_2nd_i,
  request_src_type_i,     //区分src_a/src_b
  request_addr_1st_row_i,
  request_addr_1st_col_i,
  request_addr_last_trans_i,
  

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

    
   rd_en,
   dout,
   valid,
   empty    
    );


	//--------------------------------------------------
	// INPUT && OUTPUT ------- declaration
	//--------------------------------------------------
  input			clk;	//系统时钟
  input			rst_n;
  
  //request info
  input                 request_valid_i;
  input     [ 7:0]      request_pos_1st_i;
  input     [ 2:0]      request_pos_2nd_i;
  input     [ 1:0]      request_src_type_i;
  input     [15:0]      request_addr_1st_row_i;		//适用于COP三方数据请求
  input     [13:0]      request_addr_1st_col_i;
  input                 request_addr_last_trans_i;
    
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
	
	
  input                 rd_en;
  output    [233:0]     dout;
  output                valid;
  output                empty;
	
	//--------------------------------------------------
	// INSTANCE ----------------------------------------
	//--------------------------------------------------
	wire   [3:0]   MUX_01_SEL;
	wire   [3:0]   MUX_02_SEL;
	wire   [3:0]   MUX_03_SEL;
	wire   [3:0]   MUX_04_SEL;
	wire   [3:0]   MUX_05_SEL;
	wire   [3:0]   MUX_06_SEL;
	wire   [3:0]   MUX_07_SEL;     wire   [3:0]   MUX_11_SEL;                                     
	wire   [3:0]   MUX_08_SEL;     wire   [3:0]   MUX_12_SEL;    wire   [1:0]   MUX_21_SEL;
	
	wire   [323:1]   MUX_01_D1;      
	wire   [323:1]   MUX_01_D2;      
	wire   [323:1]   MUX_01_D3;      
	wire   [323:1]   MUX_01_D4;      wire   [323:1]   MUX_11_D1; 
	wire   [323:1]   MUX_02_D1;      
	wire   [323:1]   MUX_02_D2;      
	wire   [323:1]   MUX_02_D3;      
	wire   [323:1]   MUX_02_D4;      wire   [323:1]   MUX_11_D2; 
	wire   [323:1]   MUX_03_D1;      
	wire   [323:1]   MUX_03_D2;                                             wire   [323:1]   MUX_21_D1;
	wire   [323:1]   MUX_03_D3;      
	wire   [323:1]   MUX_03_D4;      wire   [323:1]   MUX_11_D3; 
	wire   [323:1]   MUX_04_D1;      
	wire   [323:1]   MUX_04_D2;      
	wire   [323:1]   MUX_04_D3;      
	wire   [323:1]   MUX_04_D4;      wire   [323:1]   MUX_11_D4;
	wire   [323:1]   MUX_05_D1;      
	wire   [323:1]   MUX_05_D2;      
	wire   [323:1]   MUX_05_D3;      
	wire   [323:1]   MUX_05_D4;      wire   [323:1]   MUX_12_D1;
	wire   [323:1]   MUX_06_D1;      
	wire   [323:1]   MUX_06_D2;      
	wire   [323:1]   MUX_06_D3;      
	wire   [323:1]   MUX_06_D4;      wire   [323:1]   MUX_12_D2;
	wire   [323:1]   MUX_07_D1;      
	wire   [323:1]   MUX_07_D2;                                              wire   [323:1]   MUX_21_D2;
	wire   [323:1]   MUX_07_D3;      
	wire   [323:1]   MUX_07_D4;      wire   [323:1]   MUX_12_D3;
	wire   [323:1]   MUX_08_D1;      
	wire   [323:1]   MUX_08_D2;      
	wire   [323:1]   MUX_08_D3;             
	wire   [323:1]   MUX_08_D4;    	wire   [323:1]   MUX_12_D4;       
	
	wire             MUX_01_VALID;
	wire             MUX_02_VALID;
	wire             MUX_03_VALID;
	wire             MUX_04_VALID;
	wire             MUX_05_VALID;
	wire             MUX_06_VALID;
	wire             MUX_07_VALID;  wire             MUX_11_VALID;
	wire             MUX_08_VALID;  wire             MUX_12_VALID;  wire             MUX_21_VALID;
	
    wire   [323:1]   MUX_01_DOUT;
    wire   [323:1]   MUX_02_DOUT;
    wire   [323:1]   MUX_03_DOUT;
    wire   [323:1]   MUX_04_DOUT;
    wire   [323:1]   MUX_05_DOUT;
    wire   [323:1]   MUX_06_DOUT;
    wire   [323:1]   MUX_07_DOUT;   wire   [323:1]   MUX_11_DOUT;
    wire   [323:1]   MUX_08_DOUT;   wire   [323:1]   MUX_12_DOUT;   wire   [323:1]   MUX_21_DOUT;
    
    wire  [1:0]  req_valid_00;    wire  [1:0]  req_valid_10;    wire  [1:0]  req_valid_20;    wire  [1:0]  req_valid_30;
    wire  [1:0]  req_valid_01;    wire  [1:0]  req_valid_11;    wire  [1:0]  req_valid_21;    wire  [1:0]  req_valid_31;
    wire  [1:0]  req_valid_02;    wire  [1:0]  req_valid_12;    wire  [1:0]  req_valid_22;
    wire  [1:0]  req_valid_03;    wire  [1:0]  req_valid_13;    wire  [1:0]  req_valid_23;
    wire  [1:0]  req_valid_04;    wire  [1:0]  req_valid_14;    wire  [1:0]  req_valid_24;
    wire  [1:0]  req_valid_05;    wire  [1:0]  req_valid_15;    wire  [1:0]  req_valid_25;
    wire  [1:0]  req_valid_06;    wire  [1:0]  req_valid_16;    wire  [1:0]  req_valid_26;
    wire  [1:0]  req_valid_07;    wire  [1:0]  req_valid_17;    wire  [1:0]  req_valid_27;
    wire  [1:0]  req_valid_08;    wire  [1:0]  req_valid_18;    wire  [1:0]  req_valid_28;
    wire  [1:0]  req_valid_09;    wire  [1:0]  req_valid_19;    wire  [1:0]  req_valid_29;

assign  MUX_01_D1[1] = req_valid_00[1];
assign  MUX_01_D2[1] = req_valid_01[1];
assign  MUX_01_D3[1] = req_valid_02[1];
assign  MUX_01_D4[1] = req_valid_03[1];
assign  MUX_02_D1[1] = req_valid_04[1];
assign  MUX_02_D2[1] = req_valid_05[1];
assign  MUX_02_D3[1] = req_valid_06[1];
assign  MUX_02_D4[1] = req_valid_07[1];
assign  MUX_03_D1[1] = req_valid_08[1];
assign  MUX_03_D2[1] = req_valid_09[1];
assign  MUX_03_D3[1] = req_valid_10[1];
assign  MUX_03_D4[1] = req_valid_11[1];
assign  MUX_04_D1[1] = req_valid_12[1];
assign  MUX_04_D2[1] = req_valid_13[1];
assign  MUX_04_D3[1] = req_valid_14[1];
assign  MUX_04_D4[1] = req_valid_15[1];
assign  MUX_05_D1[1] = req_valid_16[1];
assign  MUX_05_D2[1] = req_valid_17[1];
assign  MUX_05_D3[1] = req_valid_18[1];
assign  MUX_05_D4[1] = req_valid_19[1];
assign  MUX_06_D1[1] = req_valid_20[1];
assign  MUX_06_D2[1] = req_valid_21[1];
assign  MUX_06_D3[1] = req_valid_22[1];
assign  MUX_08_D4[1] = req_valid_23[1];
assign  MUX_07_D1[1] = req_valid_24[1];
assign  MUX_07_D2[1] = req_valid_25[1];
assign  MUX_07_D3[1] = req_valid_26[1];
assign  MUX_07_D4[1] = req_valid_27[1];
assign  MUX_08_D1[1] = req_valid_28[1];
assign  MUX_08_D2[1] = req_valid_29[1];
assign  MUX_08_D3[1] = req_valid_30[1];
assign  MUX_08_D4[1] = req_valid_31[1];

//--------------------------------------------
// assign  MUX_01_SEL = {MUX_01_D4[0],MUX_01_D3[0],MUX_01_D2[0],MUX_01_D1[0]};
// assign  MUX_02_SEL = {MUX_02_D4[0],MUX_02_D3[0],MUX_02_D2[0],MUX_02_D1[0]};
// assign  MUX_03_SEL = {MUX_03_D4[0],MUX_03_D3[0],MUX_03_D2[0],MUX_03_D1[0]};
// assign  MUX_04_SEL = {MUX_04_D4[0],MUX_04_D3[0],MUX_04_D2[0],MUX_04_D1[0]};
// assign  MUX_05_SEL = {MUX_05_D4[0],MUX_05_D3[0],MUX_05_D2[0],MUX_05_D1[0]};
// assign  MUX_06_SEL = {MUX_06_D4[0],MUX_06_D3[0],MUX_06_D2[0],MUX_06_D1[0]};
// assign  MUX_07_SEL = {MUX_07_D4[0],MUX_07_D3[0],MUX_07_D2[0],MUX_07_D1[0]};
// assign  MUX_08_SEL = {MUX_08_D4[0],MUX_08_D3[0],MUX_08_D2[0],MUX_08_D1[0]};

assign  MUX_01_SEL = {req_valid_03[0],req_valid_02[0],req_valid_01[0],req_valid_00[0]};
assign  MUX_02_SEL = {req_valid_07[0],req_valid_06[0],req_valid_05[0],req_valid_04[0]};
assign  MUX_03_SEL = {req_valid_11[0],req_valid_10[0],req_valid_09[0],req_valid_08[0]};
assign  MUX_04_SEL = {req_valid_15[0],req_valid_14[0],req_valid_13[0],req_valid_12[0]};
assign  MUX_05_SEL = {req_valid_19[0],req_valid_18[0],req_valid_17[0],req_valid_16[0]};
assign  MUX_06_SEL = {req_valid_23[0],req_valid_22[0],req_valid_21[0],req_valid_20[0]};
assign  MUX_07_SEL = {req_valid_27[0],req_valid_26[0],req_valid_25[0],req_valid_24[0]};
assign  MUX_08_SEL = {req_valid_31[0],req_valid_30[0],req_valid_29[0],req_valid_28[0]};

assign  MUX_11_SEL = {MUX_04_VALID,MUX_03_VALID,MUX_02_VALID,MUX_01_VALID};
assign  MUX_12_SEL = {MUX_08_VALID,MUX_07_VALID,MUX_06_VALID,MUX_05_VALID};

assign  MUX_21_SEL = {MUX_12_VALID,MUX_11_VALID};

assign  MUX_11_D1  = MUX_01_DOUT;
assign  MUX_11_D2  = MUX_02_DOUT;
assign  MUX_11_D3  = MUX_03_DOUT;
assign  MUX_11_D4  = MUX_04_DOUT;
assign  MUX_12_D1  = MUX_05_DOUT;
assign  MUX_12_D2  = MUX_06_DOUT;
assign  MUX_12_D3  = MUX_07_DOUT;    assign  MUX_21_D1  = MUX_11_DOUT;
assign  MUX_12_D4  = MUX_08_DOUT;    assign  MUX_21_D2  = MUX_12_DOUT;


///----------------------LEVEL-1
MUX_4_IN  MUX_01 (
    .clk(clk), 
 //   .rst_n(rst_n), 
    .sel_en (MUX_01_SEL), 
    .data0_i(MUX_01_D1), 
    .data1_i(MUX_01_D2), 
    .data2_i(MUX_01_D3), 
    .data3_i(MUX_01_D4), 
    .dout   (MUX_01_DOUT), 
    .valid  (MUX_01_VALID)
    );

MUX_4_IN  MUX_02 (
    .clk(clk), 
 //   .rst_n(rst_n), 
    .sel_en (MUX_02_SEL), 
    .data0_i(MUX_02_D1), 
    .data1_i(MUX_02_D2), 
    .data2_i(MUX_02_D3), 
    .data3_i(MUX_02_D4), 
    .dout   (MUX_02_DOUT), 
    .valid  (MUX_02_VALID)
    );

MUX_4_IN  MUX_03 (
    .clk(clk), 
 //   .rst_n(rst_n), 
    .sel_en (MUX_03_SEL), 
    .data0_i(MUX_03_D1), 
    .data1_i(MUX_03_D2), 
    .data2_i(MUX_03_D3), 
    .data3_i(MUX_03_D4), 
    .dout   (MUX_03_DOUT), 
    .valid  (MUX_03_VALID)
    );

MUX_4_IN  MUX_04 (
    .clk(clk), 
  //  .rst_n(rst_n), 
    .sel_en (MUX_04_SEL), 
    .data0_i(MUX_04_D1), 
    .data1_i(MUX_04_D2), 
    .data2_i(MUX_04_D3), 
    .data3_i(MUX_04_D4), 
    .dout   (MUX_04_DOUT), 
    .valid  (MUX_04_VALID)
    );

MUX_4_IN  MUX_05 (
    .clk(clk), 
  //  .rst_n(rst_n), 
    .sel_en (MUX_05_SEL), 
    .data0_i(MUX_05_D1), 
    .data1_i(MUX_05_D2), 
    .data2_i(MUX_05_D3), 
    .data3_i(MUX_05_D4), 
    .dout   (MUX_05_DOUT), 
    .valid  (MUX_05_VALID)
    );

MUX_4_IN  MUX_06 (
    .clk(clk), 
  //  .rst_n(rst_n), 
    .sel_en (MUX_06_SEL), 
    .data0_i(MUX_06_D1), 
    .data1_i(MUX_06_D2), 
    .data2_i(MUX_06_D3), 
    .data3_i(MUX_06_D4), 
    .dout   (MUX_06_DOUT), 
    .valid  (MUX_06_VALID)
    );

MUX_4_IN  MUX_07 (
    .clk(clk), 
 //   .rst_n(rst_n), 
    .sel_en (MUX_07_SEL), 
    .data0_i(MUX_07_D1), 
    .data1_i(MUX_07_D2), 
    .data2_i(MUX_07_D3), 
    .data3_i(MUX_07_D4), 
    .dout   (MUX_07_DOUT), 
    .valid  (MUX_07_VALID)
    );

MUX_4_IN  MUX_08 (
    .clk(clk), 
  //  .rst_n(rst_n), 
    .sel_en (MUX_08_SEL), 
    .data0_i(MUX_08_D1), 
    .data1_i(MUX_08_D2), 
    .data2_i(MUX_08_D3), 
    .data3_i(MUX_08_D4), 
    .dout   (MUX_08_DOUT), 
    .valid  (MUX_08_VALID)
    );
    
///----------------------LEVEL-2
MUX_4_IN  MUX_11 (
    .clk(clk), 
  //  .rst_n(rst_n), 
    .sel_en (MUX_11_SEL), 
    .data0_i(MUX_11_D1), 
    .data1_i(MUX_11_D2), 
    .data2_i(MUX_11_D3), 
    .data3_i(MUX_11_D4), 
    .dout   (MUX_11_DOUT), 
    .valid  (MUX_11_VALID)
    );

MUX_4_IN  MUX_12 (
    .clk(clk), 
  //  .rst_n(rst_n), 
    .sel_en (MUX_12_SEL), 
    .data0_i(MUX_12_D1), 
    .data1_i(MUX_12_D2), 
    .data2_i(MUX_12_D3), 
    .data3_i(MUX_12_D4), 
    .dout   (MUX_12_DOUT), 
    .valid  (MUX_12_VALID)
    );
	
	
///----------------------LEVEL-3
MUX_2_IN  MUX_21 (
    .clk(clk), 
  //  .rst_n(rst_n), 
    .sel_en (MUX_21_SEL), 
    .data0_i(MUX_21_D1), 
    .data1_i(MUX_21_D2), 
    .dout   (MUX_21_DOUT), 
    .valid  (MUX_21_VALID)
    );

///----------------------选择器输出管道口信号说明如下：
  //-------------------------------------------------------
  //  .req_valid_o          (MUX_21_DOUT[1:0]), //2        
  //  .req_pos_1st_o        (MUX_21_DOUT[9:2]), //8        
  //  .req_pos_2nd_o        (MUX_21_DOUT[12:10]), //3      
  //  .req_pos_src_type_o   (MUX_01_DOUT[14:13]), //2      
  //  .cfg_start_addr_o     (MUX_21_DOUT[44:15]), //30     /// ||     \\\\\
  //  .cfg_row_addr_burst_o (MUX_21_DOUT[74:45]), //30     /// ||      \\\\\
  //  .cfg_col_addr_burst_o (MUX_21_DOUT[104:75]), //30    /// ||=======>>>>> 用于获得访存矩阵块的起始地址
  //  .select_pos_row_o     (MUX_21_DOUT[120:105]), //16   /// ||      /////
  //  .select_pos_col_o     (MUX_21_DOUT[134:121]), //14   /// ||     /////
  //  .req_length_burst_o   (MUX_21_DOUT[164:135]), //30   
  //  .req_2nd_addr_burst_o (MUX_21_DOUT[194:165]), //30                 //////////////////////////////////////////////////
  //  .req_col_num_2nd_o    (MUX_21_DOUT[224:195]), //30                 //##############################################//
  //  .req_broadcast_o      (MUX_21_DOUT[225:225]), //1                  //#                                            #//
  //  .req_pos0_1st_o       (MUX_21_DOUT[233:226]), //8                  //#               计 算 公 式                  #//
  //  .req_pos1_1st_o       (MUX_21_DOUT[241:234]), //8                  //# ------------------------------------------ #//
  //  .req_pos2_1st_o       (MUX_21_DOUT[249:242]), //8                  //#                                            #//
  //  .req_pos3_1st_o       (MUX_21_DOUT[257:250]), //8                  //#             地址通道起始地址               #//
  //  .req_pos4_1st_o       (MUX_21_DOUT[265:258]), //8                  //#                     +                      #//
  //  .req_pos5_1st_o       (MUX_21_DOUT[273:266]), //8                  //#  一级矩阵行加一跳变距离 * 矩阵块的行坐标   #//
  //  .req_pos6_1st_o       (MUX_21_DOUT[281:274]), //8                  //#                     +                      #//
  //  .req_pos7_1st_o       (MUX_21_DOUT[289:282]), //8                  //#  一级矩阵列加一跳变距离 * 矩阵块的列坐标   #//
  //  .req_pos0_src_type_o  (MUX_21_DOUT[291:290]), //2                  //#                                            #//
  //  .req_pos1_src_type_o  (MUX_21_DOUT[293:292]), //2                  //# ------------------------------------------ #//
  //  .req_pos2_src_type_o  (MUX_21_DOUT[295:294]), //2                  //#                   注  意                   #//
  //  .req_pos3_src_type_o  (MUX_21_DOUT[297:296]), //2                  //#     矩阵块的行/列坐标都是真实值减一        #//
  //  .req_pos4_src_type_o  (MUX_21_DOUT[299:298]), //2                  //# 地址和跳变距离是真实值，未除以burst_length #//
  //  .req_pos5_src_type_o  (MUX_21_DOUT[301:300]), //2                  //#      使用两个乘法器，耗费时间4个时钟周期   #//
  //  .req_pos6_src_type_o  (MUX_21_DOUT[303:302]), //2                  //##############################################//
  //  .req_pos7_src_type_o  (MUX_21_DOUT[305:304]), //2                  //////////////////////////////////////////////////
  //  .req_release_o        (MUX_21_DOUT[306:306]), //1    
  //  .VR_id_o              (MUX_21_DOUT[315:307]), //9    
  //  .VR_FR_o              (MUX_21_DOUT[318:316]), //3
  //  .channel_id_o         (MUX_21_DOUT[323:319])  //5    
  //-------------------------------------------------------
 /*   wire     [29:0]     cfg_start_addr;
   wire     [29:0]     cfg_row_addr_burst;
   wire     [29:0]     cfg_col_addr_burst;
   wire     [15:0]     select_pos_row;
   wire     [13:0]     select_pos_col;

assign  cfg_start_addr     = MUX_21_DOUT[44:15];
assign  cfg_row_addr_burst = MUX_21_DOUT[74:45];
assign  cfg_col_addr_burst = MUX_21_DOUT[104:75];
assign  select_pos_row     = MUX_21_DOUT[120:105];
assign  select_pos_col     = MUX_21_DOUT[134:121]; */

// Pipelining DSP48 input
reg  [29:0]     cfg_start_addr     = 30'b0;
reg  [29:0]     cfg_row_addr_burst = 30'b0;
reg  [29:0]     cfg_col_addr_burst = 30'b0;
reg  [15:0]     select_pos_row     = 16'b0;
reg  [13:0]     select_pos_col     = 14'b0;
always@(posedge clk)
begin
	cfg_start_addr     <= MUX_21_DOUT[44:15];
	cfg_row_addr_burst <= MUX_21_DOUT[74:45];
	cfg_col_addr_burst <= MUX_21_DOUT[104:75];
	select_pos_row     <= MUX_21_DOUT[120:105];
	select_pos_col     <= MUX_21_DOUT[134:121];
end

wire     [29:0]     P_ROW;
wire     [29:0]     P_COL;
///-----------------------MULTIPLIER (30-bits * 16-bits)
MULTIPLE_ROW   MULTIPLE_ROW (
  .CLK(clk), // input clk
  .A(cfg_row_addr_burst), // input [29 : 0] a
  .B(select_pos_row), // input [15 : 0] b
  .P(P_ROW) // output [29 : 0] p
);

MULTIPLE_COL   MULTIPLE_COL (
  .CLK(clk), // input clk
  .A(cfg_col_addr_burst), // input [29 : 0] a
  .B(select_pos_col), // input [13 : 0] b
  .P(P_COL) // output [29 : 0] p
);

reg        request_header  = 1'b0;
reg  [5:0] request_shifter = 5'b0;
always@(posedge clk) begin
  /* if(!rst_n)
     request_shifter <= 6'b0;
  else */
	request_header	<= MUX_21_VALID;
	request_shifter <= {request_shifter[4:0],request_header};
end

reg  [188:0]    info_part_up   = {189{1'b0}};
reg  [14:1]     info_part_down = 15'b0;
always@(posedge clk) begin
  /* if(!rst_n)
  begin
	info_part_up  <= {189{1'b0}};
	info_part_down <= {14{1'b0}};
  end
  else  */if(request_shifter[2])
  begin
	info_part_up  <= MUX_21_DOUT[323:135];
	info_part_down <= MUX_21_DOUT[14:1];
  end
end

reg  [29:0]  request_start_address = {30{1'b0}};
always@(posedge clk) begin
  /* if(!rst_n)
     request_start_address <= 30'b0;
  else  */if(request_shifter[3])
     request_start_address <= cfg_start_addr + P_ROW + P_COL;
end

reg  [233:1]  request_info = {233{1'b0}};
always@(posedge clk) begin
  /* if(!rst_n)
     request_info <= 233'b0;
  else  */if(request_shifter[4])
     request_info <= {info_part_up[188:0], request_start_address[29:0], info_part_down[14:1]};
end

///-------------------------------------写入FIFO
reg              wr_en = 1'b0;
reg     [233:0]  din   = {234{1'b0}};
   
GENERAL_DATA_FIFO GENERAL_DATA_FIFO (
  .clk(clk),     // input clk
  .rst(~rst_n),  // input rst
  .din(din),     // input [233 : 0] din
  .wr_en(wr_en), // input wr_en
  .full(/* full */),   // output full
 //----------------------------
  .rd_en(rd_en), // input rd_en
  .dout(dout),   // output [233 : 0] dout
  .empty(empty), // output empty
  .valid(valid)  // output valid
);

/* assign   wr_en  = request_shifter[5];
assign   din    = {request_info, 1'b1}; */
always @(posedge clk)
begin
	wr_en <= request_shifter[5];
	din   <= {request_info, 1'b1};
end

///---------------------------------------------------------------
///---------------------------------------------------------------32个通用地址通道
///---------------------------------------------------------------
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd0)) addr_ch_00 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_00), //2
    //.req_valid_o          (MUX_01_D1[1:0]), //2
    .req_pos_1st_o        (MUX_01_D1[9:2]), //8
    .req_pos_2nd_o        (MUX_01_D1[12:10]), //3
    .req_pos_src_type_o   (MUX_01_D1[14:13]), //2
    .cfg_start_addr_o     (MUX_01_D1[44:15]), //30
    .cfg_row_addr_burst_o (MUX_01_D1[74:45]), //30
    .cfg_col_addr_burst_o (MUX_01_D1[104:75]), //30
    .select_pos_row_o     (MUX_01_D1[120:105]), //16
    .select_pos_col_o     (MUX_01_D1[134:121]), //14
    .req_length_burst_o   (MUX_01_D1[164:135]), //30
    .req_2nd_addr_burst_o (MUX_01_D1[194:165]), //30
    .req_col_num_2nd_o    (MUX_01_D1[224:195]), //30
    .req_broadcast_o      (MUX_01_D1[225:225]), //1
    .req_pos0_1st_o       (MUX_01_D1[233:226]), //8
    .req_pos1_1st_o       (MUX_01_D1[241:234]), //8
    .req_pos2_1st_o       (MUX_01_D1[249:242]), //8
    .req_pos3_1st_o       (MUX_01_D1[257:250]), //8
    .req_pos4_1st_o       (MUX_01_D1[265:258]), //8
    .req_pos5_1st_o       (MUX_01_D1[273:266]), //8
    .req_pos6_1st_o       (MUX_01_D1[281:274]), //8
    .req_pos7_1st_o       (MUX_01_D1[289:282]), //8
    .req_pos0_src_type_o  (MUX_01_D1[291:290]), //2
    .req_pos1_src_type_o  (MUX_01_D1[293:292]), //2
    .req_pos2_src_type_o  (MUX_01_D1[295:294]), //2
    .req_pos3_src_type_o  (MUX_01_D1[297:296]), //2
    .req_pos4_src_type_o  (MUX_01_D1[299:298]), //2
    .req_pos5_src_type_o  (MUX_01_D1[301:300]), //2
    .req_pos6_src_type_o  (MUX_01_D1[303:302]), //2
    .req_pos7_src_type_o  (MUX_01_D1[305:304]), //2
    .req_release_o        (MUX_01_D1[306:306]), //1
    .VR_id_o              (MUX_01_D1[315:307]), //9
	.VR_FR_o              (MUX_01_D1[318:316]), //3
    .channel_id_o         (MUX_01_D1[323:319])  //5
    );

    
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd1)) addr_ch_01 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_01), //2
    //.req_valid_o          (MUX_01_D2[1:0]), //2
    .req_pos_1st_o        (MUX_01_D2[9:2]), //8
    .req_pos_2nd_o        (MUX_01_D2[12:10]), //3
    .req_pos_src_type_o   (MUX_01_D2[14:13]), //2
    .cfg_start_addr_o     (MUX_01_D2[44:15]), //30
    .cfg_row_addr_burst_o (MUX_01_D2[74:45]), //30
    .cfg_col_addr_burst_o (MUX_01_D2[104:75]), //30
    .select_pos_row_o     (MUX_01_D2[120:105]), //16
    .select_pos_col_o     (MUX_01_D2[134:121]), //14
    .req_length_burst_o   (MUX_01_D2[164:135]), //30
    .req_2nd_addr_burst_o (MUX_01_D2[194:165]), //30
    .req_col_num_2nd_o    (MUX_01_D2[224:195]), //30
    .req_broadcast_o      (MUX_01_D2[225:225]), //1
    .req_pos0_1st_o       (MUX_01_D2[233:226]), //8
    .req_pos1_1st_o       (MUX_01_D2[241:234]), //8
    .req_pos2_1st_o       (MUX_01_D2[249:242]), //8
    .req_pos3_1st_o       (MUX_01_D2[257:250]), //8
    .req_pos4_1st_o       (MUX_01_D2[265:258]), //8
    .req_pos5_1st_o       (MUX_01_D2[273:266]), //8
    .req_pos6_1st_o       (MUX_01_D2[281:274]), //8
    .req_pos7_1st_o       (MUX_01_D2[289:282]), //8
    .req_pos0_src_type_o  (MUX_01_D2[291:290]), //2
    .req_pos1_src_type_o  (MUX_01_D2[293:292]), //2
    .req_pos2_src_type_o  (MUX_01_D2[295:294]), //2
    .req_pos3_src_type_o  (MUX_01_D2[297:296]), //2
    .req_pos4_src_type_o  (MUX_01_D2[299:298]), //2
    .req_pos5_src_type_o  (MUX_01_D2[301:300]), //2
    .req_pos6_src_type_o  (MUX_01_D2[303:302]), //2
    .req_pos7_src_type_o  (MUX_01_D2[305:304]), //2
    .req_release_o        (MUX_01_D2[306:306]), //1
    .VR_id_o              (MUX_01_D2[315:307]), //9
	.VR_FR_o              (MUX_01_D2[318:316]), //3
    .channel_id_o         (MUX_01_D2[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd2)) addr_ch_02 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_02), //2
    //.req_valid_o          (MUX_01_D3[1:0]), //2
    .req_pos_1st_o        (MUX_01_D3[9:2]), //8
    .req_pos_2nd_o        (MUX_01_D3[12:10]), //3
    .req_pos_src_type_o   (MUX_01_D3[14:13]), //2
    .cfg_start_addr_o     (MUX_01_D3[44:15]), //30
    .cfg_row_addr_burst_o (MUX_01_D3[74:45]), //30
    .cfg_col_addr_burst_o (MUX_01_D3[104:75]), //30
    .select_pos_row_o     (MUX_01_D3[120:105]), //16
    .select_pos_col_o     (MUX_01_D3[134:121]), //14
    .req_length_burst_o   (MUX_01_D3[164:135]), //30
    .req_2nd_addr_burst_o (MUX_01_D3[194:165]), //30
    .req_col_num_2nd_o    (MUX_01_D3[224:195]), //30
    .req_broadcast_o      (MUX_01_D3[225:225]), //1
    .req_pos0_1st_o       (MUX_01_D3[233:226]), //8
    .req_pos1_1st_o       (MUX_01_D3[241:234]), //8
    .req_pos2_1st_o       (MUX_01_D3[249:242]), //8
    .req_pos3_1st_o       (MUX_01_D3[257:250]), //8
    .req_pos4_1st_o       (MUX_01_D3[265:258]), //8
    .req_pos5_1st_o       (MUX_01_D3[273:266]), //8
    .req_pos6_1st_o       (MUX_01_D3[281:274]), //8
    .req_pos7_1st_o       (MUX_01_D3[289:282]), //8
    .req_pos0_src_type_o  (MUX_01_D3[291:290]), //2
    .req_pos1_src_type_o  (MUX_01_D3[293:292]), //2
    .req_pos2_src_type_o  (MUX_01_D3[295:294]), //2
    .req_pos3_src_type_o  (MUX_01_D3[297:296]), //2
    .req_pos4_src_type_o  (MUX_01_D3[299:298]), //2
    .req_pos5_src_type_o  (MUX_01_D3[301:300]), //2
    .req_pos6_src_type_o  (MUX_01_D3[303:302]), //2
    .req_pos7_src_type_o  (MUX_01_D3[305:304]), //2
    .req_release_o        (MUX_01_D3[306:306]), //1
    .VR_id_o              (MUX_01_D3[315:307]), //9
	.VR_FR_o              (MUX_01_D3[318:316]), //3
    .channel_id_o         (MUX_01_D3[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd3)) addr_ch_03 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_03), //2
    //.req_valid_o          (MUX_01_D4[1:0]), //2
    .req_pos_1st_o        (MUX_01_D4[9:2]), //8
    .req_pos_2nd_o        (MUX_01_D4[12:10]), //3
    .req_pos_src_type_o   (MUX_01_D4[14:13]), //2
    .cfg_start_addr_o     (MUX_01_D4[44:15]), //30
    .cfg_row_addr_burst_o (MUX_01_D4[74:45]), //30
    .cfg_col_addr_burst_o (MUX_01_D4[104:75]), //30
    .select_pos_row_o     (MUX_01_D4[120:105]), //16
    .select_pos_col_o     (MUX_01_D4[134:121]), //14
    .req_length_burst_o   (MUX_01_D4[164:135]), //30
    .req_2nd_addr_burst_o (MUX_01_D4[194:165]), //30
    .req_col_num_2nd_o    (MUX_01_D4[224:195]), //30
    .req_broadcast_o      (MUX_01_D4[225:225]), //1
    .req_pos0_1st_o       (MUX_01_D4[233:226]), //8
    .req_pos1_1st_o       (MUX_01_D4[241:234]), //8
    .req_pos2_1st_o       (MUX_01_D4[249:242]), //8
    .req_pos3_1st_o       (MUX_01_D4[257:250]), //8
    .req_pos4_1st_o       (MUX_01_D4[265:258]), //8
    .req_pos5_1st_o       (MUX_01_D4[273:266]), //8
    .req_pos6_1st_o       (MUX_01_D4[281:274]), //8
    .req_pos7_1st_o       (MUX_01_D4[289:282]), //8
    .req_pos0_src_type_o  (MUX_01_D4[291:290]), //2
    .req_pos1_src_type_o  (MUX_01_D4[293:292]), //2
    .req_pos2_src_type_o  (MUX_01_D4[295:294]), //2
    .req_pos3_src_type_o  (MUX_01_D4[297:296]), //2
    .req_pos4_src_type_o  (MUX_01_D4[299:298]), //2
    .req_pos5_src_type_o  (MUX_01_D4[301:300]), //2
    .req_pos6_src_type_o  (MUX_01_D4[303:302]), //2
    .req_pos7_src_type_o  (MUX_01_D4[305:304]), //2
    .req_release_o        (MUX_01_D4[306:306]), //1
    .VR_id_o              (MUX_01_D4[315:307]), //9
	.VR_FR_o              (MUX_01_D4[318:316]), //3
    .channel_id_o         (MUX_01_D4[323:319])  //5
    );

    //-----------------------------------------------------------------//
	
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd4)) addr_ch_04 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i),
	.cfg_VR_FR_i(cfg_VR_FR_i), 
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_04), //2
    //.req_valid_o          (MUX_02_D1[1:0]), //2
    .req_pos_1st_o        (MUX_02_D1[9:2]), //8
    .req_pos_2nd_o        (MUX_02_D1[12:10]), //3
    .req_pos_src_type_o   (MUX_02_D1[14:13]), //2
    .cfg_start_addr_o     (MUX_02_D1[44:15]), //30
    .cfg_row_addr_burst_o (MUX_02_D1[74:45]), //30
    .cfg_col_addr_burst_o (MUX_02_D1[104:75]), //30
    .select_pos_row_o     (MUX_02_D1[120:105]), //16
    .select_pos_col_o     (MUX_02_D1[134:121]), //14
    .req_length_burst_o   (MUX_02_D1[164:135]), //30
    .req_2nd_addr_burst_o (MUX_02_D1[194:165]), //30
    .req_col_num_2nd_o    (MUX_02_D1[224:195]), //30
    .req_broadcast_o      (MUX_02_D1[225:225]), //1
    .req_pos0_1st_o       (MUX_02_D1[233:226]), //8
    .req_pos1_1st_o       (MUX_02_D1[241:234]), //8
    .req_pos2_1st_o       (MUX_02_D1[249:242]), //8
    .req_pos3_1st_o       (MUX_02_D1[257:250]), //8
    .req_pos4_1st_o       (MUX_02_D1[265:258]), //8
    .req_pos5_1st_o       (MUX_02_D1[273:266]), //8
    .req_pos6_1st_o       (MUX_02_D1[281:274]), //8
    .req_pos7_1st_o       (MUX_02_D1[289:282]), //8
    .req_pos0_src_type_o  (MUX_02_D1[291:290]), //2
    .req_pos1_src_type_o  (MUX_02_D1[293:292]), //2
    .req_pos2_src_type_o  (MUX_02_D1[295:294]), //2
    .req_pos3_src_type_o  (MUX_02_D1[297:296]), //2
    .req_pos4_src_type_o  (MUX_02_D1[299:298]), //2
    .req_pos5_src_type_o  (MUX_02_D1[301:300]), //2
    .req_pos6_src_type_o  (MUX_02_D1[303:302]), //2
    .req_pos7_src_type_o  (MUX_02_D1[305:304]), //2
    .req_release_o        (MUX_02_D1[306:306]), //1
    .VR_id_o              (MUX_02_D1[315:307]), //9
	.VR_FR_o              (MUX_02_D1[318:316]), //3
    .channel_id_o         (MUX_02_D1[323:319])  //5
    );

    
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd5)) addr_ch_05 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_05), //2
    // .req_valid_o          (MUX_02_D2[1:0]), //2
    .req_pos_1st_o        (MUX_02_D2[9:2]), //8
    .req_pos_2nd_o        (MUX_02_D2[12:10]), //3
    .req_pos_src_type_o   (MUX_02_D2[14:13]), //2
    .cfg_start_addr_o     (MUX_02_D2[44:15]), //30
    .cfg_row_addr_burst_o (MUX_02_D2[74:45]), //30
    .cfg_col_addr_burst_o (MUX_02_D2[104:75]), //30
    .select_pos_row_o     (MUX_02_D2[120:105]), //16
    .select_pos_col_o     (MUX_02_D2[134:121]), //14
    .req_length_burst_o   (MUX_02_D2[164:135]), //30
    .req_2nd_addr_burst_o (MUX_02_D2[194:165]), //30
    .req_col_num_2nd_o    (MUX_02_D2[224:195]), //30
    .req_broadcast_o      (MUX_02_D2[225:225]), //1
    .req_pos0_1st_o       (MUX_02_D2[233:226]), //8
    .req_pos1_1st_o       (MUX_02_D2[241:234]), //8
    .req_pos2_1st_o       (MUX_02_D2[249:242]), //8
    .req_pos3_1st_o       (MUX_02_D2[257:250]), //8
    .req_pos4_1st_o       (MUX_02_D2[265:258]), //8
    .req_pos5_1st_o       (MUX_02_D2[273:266]), //8
    .req_pos6_1st_o       (MUX_02_D2[281:274]), //8
    .req_pos7_1st_o       (MUX_02_D2[289:282]), //8
    .req_pos0_src_type_o  (MUX_02_D2[291:290]), //2
    .req_pos1_src_type_o  (MUX_02_D2[293:292]), //2
    .req_pos2_src_type_o  (MUX_02_D2[295:294]), //2
    .req_pos3_src_type_o  (MUX_02_D2[297:296]), //2
    .req_pos4_src_type_o  (MUX_02_D2[299:298]), //2
    .req_pos5_src_type_o  (MUX_02_D2[301:300]), //2
    .req_pos6_src_type_o  (MUX_02_D2[303:302]), //2
    .req_pos7_src_type_o  (MUX_02_D2[305:304]), //2
    .req_release_o        (MUX_02_D2[306:306]), //1
    .VR_id_o              (MUX_02_D2[315:307]), //9
	.VR_FR_o              (MUX_02_D2[318:316]), //3
    .channel_id_o         (MUX_02_D2[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd6)) addr_ch_06 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_06), //2
    // .req_valid_o          (MUX_02_D3[1:0]), //2
    .req_pos_1st_o        (MUX_02_D3[9:2]), //8
    .req_pos_2nd_o        (MUX_02_D3[12:10]), //3
    .req_pos_src_type_o   (MUX_02_D3[14:13]), //2
    .cfg_start_addr_o     (MUX_02_D3[44:15]), //30
    .cfg_row_addr_burst_o (MUX_02_D3[74:45]), //30
    .cfg_col_addr_burst_o (MUX_02_D3[104:75]), //30
    .select_pos_row_o     (MUX_02_D3[120:105]), //16
    .select_pos_col_o     (MUX_02_D3[134:121]), //14
    .req_length_burst_o   (MUX_02_D3[164:135]), //30
    .req_2nd_addr_burst_o (MUX_02_D3[194:165]), //30
    .req_col_num_2nd_o    (MUX_02_D3[224:195]), //30
    .req_broadcast_o      (MUX_02_D3[225:225]), //1
    .req_pos0_1st_o       (MUX_02_D3[233:226]), //8
    .req_pos1_1st_o       (MUX_02_D3[241:234]), //8
    .req_pos2_1st_o       (MUX_02_D3[249:242]), //8
    .req_pos3_1st_o       (MUX_02_D3[257:250]), //8
    .req_pos4_1st_o       (MUX_02_D3[265:258]), //8
    .req_pos5_1st_o       (MUX_02_D3[273:266]), //8
    .req_pos6_1st_o       (MUX_02_D3[281:274]), //8
    .req_pos7_1st_o       (MUX_02_D3[289:282]), //8
    .req_pos0_src_type_o  (MUX_02_D3[291:290]), //2
    .req_pos1_src_type_o  (MUX_02_D3[293:292]), //2
    .req_pos2_src_type_o  (MUX_02_D3[295:294]), //2
    .req_pos3_src_type_o  (MUX_02_D3[297:296]), //2
    .req_pos4_src_type_o  (MUX_02_D3[299:298]), //2
    .req_pos5_src_type_o  (MUX_02_D3[301:300]), //2
    .req_pos6_src_type_o  (MUX_02_D3[303:302]), //2
    .req_pos7_src_type_o  (MUX_02_D3[305:304]), //2
    .req_release_o        (MUX_02_D3[306:306]), //1
    .VR_id_o              (MUX_02_D3[315:307]), //9
	.VR_FR_o              (MUX_02_D3[318:316]), //3
    .channel_id_o         (MUX_02_D3[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd7)) addr_ch_07 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_07), //2
    // .req_valid_o          (MUX_02_D4[1:0]), //2
    .req_pos_1st_o        (MUX_02_D4[9:2]), //8
    .req_pos_2nd_o        (MUX_02_D4[12:10]), //3
    .req_pos_src_type_o   (MUX_02_D4[14:13]), //2
    .cfg_start_addr_o     (MUX_02_D4[44:15]), //30
    .cfg_row_addr_burst_o (MUX_02_D4[74:45]), //30
    .cfg_col_addr_burst_o (MUX_02_D4[104:75]), //30
    .select_pos_row_o     (MUX_02_D4[120:105]), //16
    .select_pos_col_o     (MUX_02_D4[134:121]), //14
    .req_length_burst_o   (MUX_02_D4[164:135]), //30
    .req_2nd_addr_burst_o (MUX_02_D4[194:165]), //30
    .req_col_num_2nd_o    (MUX_02_D4[224:195]), //30
    .req_broadcast_o      (MUX_02_D4[225:225]), //1
    .req_pos0_1st_o       (MUX_02_D4[233:226]), //8
    .req_pos1_1st_o       (MUX_02_D4[241:234]), //8
    .req_pos2_1st_o       (MUX_02_D4[249:242]), //8
    .req_pos3_1st_o       (MUX_02_D4[257:250]), //8
    .req_pos4_1st_o       (MUX_02_D4[265:258]), //8
    .req_pos5_1st_o       (MUX_02_D4[273:266]), //8
    .req_pos6_1st_o       (MUX_02_D4[281:274]), //8
    .req_pos7_1st_o       (MUX_02_D4[289:282]), //8
    .req_pos0_src_type_o  (MUX_02_D4[291:290]), //2
    .req_pos1_src_type_o  (MUX_02_D4[293:292]), //2
    .req_pos2_src_type_o  (MUX_02_D4[295:294]), //2
    .req_pos3_src_type_o  (MUX_02_D4[297:296]), //2
    .req_pos4_src_type_o  (MUX_02_D4[299:298]), //2
    .req_pos5_src_type_o  (MUX_02_D4[301:300]), //2
    .req_pos6_src_type_o  (MUX_02_D4[303:302]), //2
    .req_pos7_src_type_o  (MUX_02_D4[305:304]), //2
    .req_release_o        (MUX_02_D4[306:306]), //1
    .VR_id_o              (MUX_02_D4[315:307]), //9
	.VR_FR_o              (MUX_02_D4[318:316]), //3
    .channel_id_o         (MUX_02_D4[323:319])  //5
    );

    //-----------------------------------------------------------------//
	
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd8)) addr_ch_08 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_08), //2
    // .req_valid_o          (MUX_03_D1[1:0]), //2
    .req_pos_1st_o        (MUX_03_D1[9:2]), //8
    .req_pos_2nd_o        (MUX_03_D1[12:10]), //3
    .req_pos_src_type_o   (MUX_03_D1[14:13]), //2
    .cfg_start_addr_o     (MUX_03_D1[44:15]), //30
    .cfg_row_addr_burst_o (MUX_03_D1[74:45]), //30
    .cfg_col_addr_burst_o (MUX_03_D1[104:75]), //30
    .select_pos_row_o     (MUX_03_D1[120:105]), //16
    .select_pos_col_o     (MUX_03_D1[134:121]), //14
    .req_length_burst_o   (MUX_03_D1[164:135]), //30
    .req_2nd_addr_burst_o (MUX_03_D1[194:165]), //30
    .req_col_num_2nd_o    (MUX_03_D1[224:195]), //30
    .req_broadcast_o      (MUX_03_D1[225:225]), //1
    .req_pos0_1st_o       (MUX_03_D1[233:226]), //8
    .req_pos1_1st_o       (MUX_03_D1[241:234]), //8
    .req_pos2_1st_o       (MUX_03_D1[249:242]), //8
    .req_pos3_1st_o       (MUX_03_D1[257:250]), //8
    .req_pos4_1st_o       (MUX_03_D1[265:258]), //8
    .req_pos5_1st_o       (MUX_03_D1[273:266]), //8
    .req_pos6_1st_o       (MUX_03_D1[281:274]), //8
    .req_pos7_1st_o       (MUX_03_D1[289:282]), //8
    .req_pos0_src_type_o  (MUX_03_D1[291:290]), //2
    .req_pos1_src_type_o  (MUX_03_D1[293:292]), //2
    .req_pos2_src_type_o  (MUX_03_D1[295:294]), //2
    .req_pos3_src_type_o  (MUX_03_D1[297:296]), //2
    .req_pos4_src_type_o  (MUX_03_D1[299:298]), //2
    .req_pos5_src_type_o  (MUX_03_D1[301:300]), //2
    .req_pos6_src_type_o  (MUX_03_D1[303:302]), //2
    .req_pos7_src_type_o  (MUX_03_D1[305:304]), //2
    .req_release_o        (MUX_03_D1[306:306]), //1
    .VR_id_o              (MUX_03_D1[315:307]), //9
	.VR_FR_o              (MUX_03_D1[318:316]), //3
    .channel_id_o         (MUX_03_D1[323:319])  //5
    );

    
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd9)) addr_ch_09 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_09), //2
    // .req_valid_o          (MUX_03_D2[1:0]), //2
    .req_pos_1st_o        (MUX_03_D2[9:2]), //8
    .req_pos_2nd_o        (MUX_03_D2[12:10]), //3
    .req_pos_src_type_o   (MUX_03_D2[14:13]), //2
    .cfg_start_addr_o     (MUX_03_D2[44:15]), //30
    .cfg_row_addr_burst_o (MUX_03_D2[74:45]), //30
    .cfg_col_addr_burst_o (MUX_03_D2[104:75]), //30
    .select_pos_row_o     (MUX_03_D2[120:105]), //16
    .select_pos_col_o     (MUX_03_D2[134:121]), //14
    .req_length_burst_o   (MUX_03_D2[164:135]), //30
    .req_2nd_addr_burst_o (MUX_03_D2[194:165]), //30
    .req_col_num_2nd_o    (MUX_03_D2[224:195]), //30
    .req_broadcast_o      (MUX_03_D2[225:225]), //1
    .req_pos0_1st_o       (MUX_03_D2[233:226]), //8
    .req_pos1_1st_o       (MUX_03_D2[241:234]), //8
    .req_pos2_1st_o       (MUX_03_D2[249:242]), //8
    .req_pos3_1st_o       (MUX_03_D2[257:250]), //8
    .req_pos4_1st_o       (MUX_03_D2[265:258]), //8
    .req_pos5_1st_o       (MUX_03_D2[273:266]), //8
    .req_pos6_1st_o       (MUX_03_D2[281:274]), //8
    .req_pos7_1st_o       (MUX_03_D2[289:282]), //8
    .req_pos0_src_type_o  (MUX_03_D2[291:290]), //2
    .req_pos1_src_type_o  (MUX_03_D2[293:292]), //2
    .req_pos2_src_type_o  (MUX_03_D2[295:294]), //2
    .req_pos3_src_type_o  (MUX_03_D2[297:296]), //2
    .req_pos4_src_type_o  (MUX_03_D2[299:298]), //2
    .req_pos5_src_type_o  (MUX_03_D2[301:300]), //2
    .req_pos6_src_type_o  (MUX_03_D2[303:302]), //2
    .req_pos7_src_type_o  (MUX_03_D2[305:304]), //2
    .req_release_o        (MUX_03_D2[306:306]), //1
    .VR_id_o              (MUX_03_D2[315:307]), //9
	.VR_FR_o              (MUX_03_D2[318:316]), //3
    .channel_id_o         (MUX_03_D2[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd10)) addr_ch_10 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_10), //2
    //.req_valid_o          (MUX_03_D3[1:0]), //2
    .req_pos_1st_o        (MUX_03_D3[9:2]), //8
    .req_pos_2nd_o        (MUX_03_D3[12:10]), //3
    .req_pos_src_type_o   (MUX_03_D3[14:13]), //2
    .cfg_start_addr_o     (MUX_03_D3[44:15]), //30
    .cfg_row_addr_burst_o (MUX_03_D3[74:45]), //30
    .cfg_col_addr_burst_o (MUX_03_D3[104:75]), //30
    .select_pos_row_o     (MUX_03_D3[120:105]), //16
    .select_pos_col_o     (MUX_03_D3[134:121]), //14
    .req_length_burst_o   (MUX_03_D3[164:135]), //30
    .req_2nd_addr_burst_o (MUX_03_D3[194:165]), //30
    .req_col_num_2nd_o    (MUX_03_D3[224:195]), //30
    .req_broadcast_o      (MUX_03_D3[225:225]), //1
    .req_pos0_1st_o       (MUX_03_D3[233:226]), //8
    .req_pos1_1st_o       (MUX_03_D3[241:234]), //8
    .req_pos2_1st_o       (MUX_03_D3[249:242]), //8
    .req_pos3_1st_o       (MUX_03_D3[257:250]), //8
    .req_pos4_1st_o       (MUX_03_D3[265:258]), //8
    .req_pos5_1st_o       (MUX_03_D3[273:266]), //8
    .req_pos6_1st_o       (MUX_03_D3[281:274]), //8
    .req_pos7_1st_o       (MUX_03_D3[289:282]), //8
    .req_pos0_src_type_o  (MUX_03_D3[291:290]), //2
    .req_pos1_src_type_o  (MUX_03_D3[293:292]), //2
    .req_pos2_src_type_o  (MUX_03_D3[295:294]), //2
    .req_pos3_src_type_o  (MUX_03_D3[297:296]), //2
    .req_pos4_src_type_o  (MUX_03_D3[299:298]), //2
    .req_pos5_src_type_o  (MUX_03_D3[301:300]), //2
    .req_pos6_src_type_o  (MUX_03_D3[303:302]), //2
    .req_pos7_src_type_o  (MUX_03_D3[305:304]), //2
    .req_release_o        (MUX_03_D3[306:306]), //1
    .VR_id_o              (MUX_03_D3[315:307]), //9
	.VR_FR_o              (MUX_03_D3[318:316]), //3
    .channel_id_o         (MUX_03_D3[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd11)) addr_ch_11 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_11), //2
    //.req_valid_o          (MUX_03_D4[1:0]), //2
    .req_pos_1st_o        (MUX_03_D4[9:2]), //8
    .req_pos_2nd_o        (MUX_03_D4[12:10]), //3
    .req_pos_src_type_o   (MUX_03_D4[14:13]), //2
    .cfg_start_addr_o     (MUX_03_D4[44:15]), //30
    .cfg_row_addr_burst_o (MUX_03_D4[74:45]), //30
    .cfg_col_addr_burst_o (MUX_03_D4[104:75]), //30
    .select_pos_row_o     (MUX_03_D4[120:105]), //16
    .select_pos_col_o     (MUX_03_D4[134:121]), //14
    .req_length_burst_o   (MUX_03_D4[164:135]), //30
    .req_2nd_addr_burst_o (MUX_03_D4[194:165]), //30
    .req_col_num_2nd_o    (MUX_03_D4[224:195]), //30
    .req_broadcast_o      (MUX_03_D4[225:225]), //1
    .req_pos0_1st_o       (MUX_03_D4[233:226]), //8
    .req_pos1_1st_o       (MUX_03_D4[241:234]), //8
    .req_pos2_1st_o       (MUX_03_D4[249:242]), //8
    .req_pos3_1st_o       (MUX_03_D4[257:250]), //8
    .req_pos4_1st_o       (MUX_03_D4[265:258]), //8
    .req_pos5_1st_o       (MUX_03_D4[273:266]), //8
    .req_pos6_1st_o       (MUX_03_D4[281:274]), //8
    .req_pos7_1st_o       (MUX_03_D4[289:282]), //8
    .req_pos0_src_type_o  (MUX_03_D4[291:290]), //2
    .req_pos1_src_type_o  (MUX_03_D4[293:292]), //2
    .req_pos2_src_type_o  (MUX_03_D4[295:294]), //2
    .req_pos3_src_type_o  (MUX_03_D4[297:296]), //2
    .req_pos4_src_type_o  (MUX_03_D4[299:298]), //2
    .req_pos5_src_type_o  (MUX_03_D4[301:300]), //2
    .req_pos6_src_type_o  (MUX_03_D4[303:302]), //2
    .req_pos7_src_type_o  (MUX_03_D4[305:304]), //2
    .req_release_o        (MUX_03_D4[306:306]), //1
    .VR_id_o              (MUX_03_D4[315:307]), //9
	.VR_FR_o              (MUX_03_D4[318:316]), //3
    .channel_id_o         (MUX_03_D4[323:319])  //5
    );

    //-----------------------------------------------------------------//
	
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd12)) addr_ch_12 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_12), //2
    //.req_valid_o          (MUX_04_D1[1:0]), //2
    .req_pos_1st_o        (MUX_04_D1[9:2]), //8
    .req_pos_2nd_o        (MUX_04_D1[12:10]), //3
    .req_pos_src_type_o   (MUX_04_D1[14:13]), //2
    .cfg_start_addr_o     (MUX_04_D1[44:15]), //30
    .cfg_row_addr_burst_o (MUX_04_D1[74:45]), //30
    .cfg_col_addr_burst_o (MUX_04_D1[104:75]), //30
    .select_pos_row_o     (MUX_04_D1[120:105]), //16
    .select_pos_col_o     (MUX_04_D1[134:121]), //14
    .req_length_burst_o   (MUX_04_D1[164:135]), //30
    .req_2nd_addr_burst_o (MUX_04_D1[194:165]), //30
    .req_col_num_2nd_o    (MUX_04_D1[224:195]), //30
    .req_broadcast_o      (MUX_04_D1[225:225]), //1
    .req_pos0_1st_o       (MUX_04_D1[233:226]), //8
    .req_pos1_1st_o       (MUX_04_D1[241:234]), //8
    .req_pos2_1st_o       (MUX_04_D1[249:242]), //8
    .req_pos3_1st_o       (MUX_04_D1[257:250]), //8
    .req_pos4_1st_o       (MUX_04_D1[265:258]), //8
    .req_pos5_1st_o       (MUX_04_D1[273:266]), //8
    .req_pos6_1st_o       (MUX_04_D1[281:274]), //8
    .req_pos7_1st_o       (MUX_04_D1[289:282]), //8
    .req_pos0_src_type_o  (MUX_04_D1[291:290]), //2
    .req_pos1_src_type_o  (MUX_04_D1[293:292]), //2
    .req_pos2_src_type_o  (MUX_04_D1[295:294]), //2
    .req_pos3_src_type_o  (MUX_04_D1[297:296]), //2
    .req_pos4_src_type_o  (MUX_04_D1[299:298]), //2
    .req_pos5_src_type_o  (MUX_04_D1[301:300]), //2
    .req_pos6_src_type_o  (MUX_04_D1[303:302]), //2
    .req_pos7_src_type_o  (MUX_04_D1[305:304]), //2
    .req_release_o        (MUX_04_D1[306:306]), //1
    .VR_id_o              (MUX_04_D1[315:307]), //9
	.VR_FR_o              (MUX_04_D1[318:316]), //3
    .channel_id_o         (MUX_04_D1[323:319])  //5
    );

    
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd13)) addr_ch_13 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_13), //2
    //.req_valid_o          (MUX_04_D2[1:0]), //2
    .req_pos_1st_o        (MUX_04_D2[9:2]), //8
    .req_pos_2nd_o        (MUX_04_D2[12:10]), //3
    .req_pos_src_type_o   (MUX_04_D2[14:13]), //2
    .cfg_start_addr_o     (MUX_04_D2[44:15]), //30
    .cfg_row_addr_burst_o (MUX_04_D2[74:45]), //30
    .cfg_col_addr_burst_o (MUX_04_D2[104:75]), //30
    .select_pos_row_o     (MUX_04_D2[120:105]), //16
    .select_pos_col_o     (MUX_04_D2[134:121]), //14
    .req_length_burst_o   (MUX_04_D2[164:135]), //30
    .req_2nd_addr_burst_o (MUX_04_D2[194:165]), //30
    .req_col_num_2nd_o    (MUX_04_D2[224:195]), //30
    .req_broadcast_o      (MUX_04_D2[225:225]), //1
    .req_pos0_1st_o       (MUX_04_D2[233:226]), //8
    .req_pos1_1st_o       (MUX_04_D2[241:234]), //8
    .req_pos2_1st_o       (MUX_04_D2[249:242]), //8
    .req_pos3_1st_o       (MUX_04_D2[257:250]), //8
    .req_pos4_1st_o       (MUX_04_D2[265:258]), //8
    .req_pos5_1st_o       (MUX_04_D2[273:266]), //8
    .req_pos6_1st_o       (MUX_04_D2[281:274]), //8
    .req_pos7_1st_o       (MUX_04_D2[289:282]), //8
    .req_pos0_src_type_o  (MUX_04_D2[291:290]), //2
    .req_pos1_src_type_o  (MUX_04_D2[293:292]), //2
    .req_pos2_src_type_o  (MUX_04_D2[295:294]), //2
    .req_pos3_src_type_o  (MUX_04_D2[297:296]), //2
    .req_pos4_src_type_o  (MUX_04_D2[299:298]), //2
    .req_pos5_src_type_o  (MUX_04_D2[301:300]), //2
    .req_pos6_src_type_o  (MUX_04_D2[303:302]), //2
    .req_pos7_src_type_o  (MUX_04_D2[305:304]), //2
    .req_release_o        (MUX_04_D2[306:306]), //1
    .VR_id_o              (MUX_04_D2[315:307]), //9
	.VR_FR_o              (MUX_04_D2[318:316]), //3
    .channel_id_o         (MUX_04_D2[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd14)) addr_ch_14 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_14), //2
    // .req_valid_o          (MUX_04_D3[1:0]), //2
    .req_pos_1st_o        (MUX_04_D3[9:2]), //8
    .req_pos_2nd_o        (MUX_04_D3[12:10]), //3
    .req_pos_src_type_o   (MUX_04_D3[14:13]), //2
    .cfg_start_addr_o     (MUX_04_D3[44:15]), //30
    .cfg_row_addr_burst_o (MUX_04_D3[74:45]), //30
    .cfg_col_addr_burst_o (MUX_04_D3[104:75]), //30
    .select_pos_row_o     (MUX_04_D3[120:105]), //16
    .select_pos_col_o     (MUX_04_D3[134:121]), //14
    .req_length_burst_o   (MUX_04_D3[164:135]), //30
    .req_2nd_addr_burst_o (MUX_04_D3[194:165]), //30
    .req_col_num_2nd_o    (MUX_04_D3[224:195]), //30
    .req_broadcast_o      (MUX_04_D3[225:225]), //1
    .req_pos0_1st_o       (MUX_04_D3[233:226]), //8
    .req_pos1_1st_o       (MUX_04_D3[241:234]), //8
    .req_pos2_1st_o       (MUX_04_D3[249:242]), //8
    .req_pos3_1st_o       (MUX_04_D3[257:250]), //8
    .req_pos4_1st_o       (MUX_04_D3[265:258]), //8
    .req_pos5_1st_o       (MUX_04_D3[273:266]), //8
    .req_pos6_1st_o       (MUX_04_D3[281:274]), //8
    .req_pos7_1st_o       (MUX_04_D3[289:282]), //8
    .req_pos0_src_type_o  (MUX_04_D3[291:290]), //2
    .req_pos1_src_type_o  (MUX_04_D3[293:292]), //2
    .req_pos2_src_type_o  (MUX_04_D3[295:294]), //2
    .req_pos3_src_type_o  (MUX_04_D3[297:296]), //2
    .req_pos4_src_type_o  (MUX_04_D3[299:298]), //2
    .req_pos5_src_type_o  (MUX_04_D3[301:300]), //2
    .req_pos6_src_type_o  (MUX_04_D3[303:302]), //2
    .req_pos7_src_type_o  (MUX_04_D3[305:304]), //2
    .req_release_o        (MUX_04_D3[306:306]), //1
    .VR_id_o              (MUX_04_D3[315:307]), //9
	.VR_FR_o              (MUX_04_D3[318:316]), //3
    .channel_id_o         (MUX_04_D3[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd15)) addr_ch_15 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_15), //2
    // .req_valid_o          (MUX_04_D4[1:0]), //2
    .req_pos_1st_o        (MUX_04_D4[9:2]), //8
    .req_pos_2nd_o        (MUX_04_D4[12:10]), //3
    .req_pos_src_type_o   (MUX_04_D4[14:13]), //2
    .cfg_start_addr_o     (MUX_04_D4[44:15]), //30
    .cfg_row_addr_burst_o (MUX_04_D4[74:45]), //30
    .cfg_col_addr_burst_o (MUX_04_D4[104:75]), //30
    .select_pos_row_o     (MUX_04_D4[120:105]), //16
    .select_pos_col_o     (MUX_04_D4[134:121]), //14
    .req_length_burst_o   (MUX_04_D4[164:135]), //30
    .req_2nd_addr_burst_o (MUX_04_D4[194:165]), //30
    .req_col_num_2nd_o    (MUX_04_D4[224:195]), //30
    .req_broadcast_o      (MUX_04_D4[225:225]), //1
    .req_pos0_1st_o       (MUX_04_D4[233:226]), //8
    .req_pos1_1st_o       (MUX_04_D4[241:234]), //8
    .req_pos2_1st_o       (MUX_04_D4[249:242]), //8
    .req_pos3_1st_o       (MUX_04_D4[257:250]), //8
    .req_pos4_1st_o       (MUX_04_D4[265:258]), //8
    .req_pos5_1st_o       (MUX_04_D4[273:266]), //8
    .req_pos6_1st_o       (MUX_04_D4[281:274]), //8
    .req_pos7_1st_o       (MUX_04_D4[289:282]), //8
    .req_pos0_src_type_o  (MUX_04_D4[291:290]), //2
    .req_pos1_src_type_o  (MUX_04_D4[293:292]), //2
    .req_pos2_src_type_o  (MUX_04_D4[295:294]), //2
    .req_pos3_src_type_o  (MUX_04_D4[297:296]), //2
    .req_pos4_src_type_o  (MUX_04_D4[299:298]), //2
    .req_pos5_src_type_o  (MUX_04_D4[301:300]), //2
    .req_pos6_src_type_o  (MUX_04_D4[303:302]), //2
    .req_pos7_src_type_o  (MUX_04_D4[305:304]), //2
    .req_release_o        (MUX_04_D4[306:306]), //1
    .VR_id_o              (MUX_04_D4[315:307]), //9
	.VR_FR_o              (MUX_04_D4[318:316]), //3
    .channel_id_o         (MUX_04_D4[323:319])  //5
    );

    //-----------------------------------------------------------------//
	
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd16)) addr_ch_16 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_16), //2
    // .req_valid_o          (MUX_05_D1[1:0]), //2
    .req_pos_1st_o        (MUX_05_D1[9:2]), //8
    .req_pos_2nd_o        (MUX_05_D1[12:10]), //3
    .req_pos_src_type_o   (MUX_05_D1[14:13]), //2
    .cfg_start_addr_o     (MUX_05_D1[44:15]), //30
    .cfg_row_addr_burst_o (MUX_05_D1[74:45]), //30
    .cfg_col_addr_burst_o (MUX_05_D1[104:75]), //30
    .select_pos_row_o     (MUX_05_D1[120:105]), //16
    .select_pos_col_o     (MUX_05_D1[134:121]), //14
    .req_length_burst_o   (MUX_05_D1[164:135]), //30
    .req_2nd_addr_burst_o (MUX_05_D1[194:165]), //30
    .req_col_num_2nd_o    (MUX_05_D1[224:195]), //30
    .req_broadcast_o      (MUX_05_D1[225:225]), //1
    .req_pos0_1st_o       (MUX_05_D1[233:226]), //8
    .req_pos1_1st_o       (MUX_05_D1[241:234]), //8
    .req_pos2_1st_o       (MUX_05_D1[249:242]), //8
    .req_pos3_1st_o       (MUX_05_D1[257:250]), //8
    .req_pos4_1st_o       (MUX_05_D1[265:258]), //8
    .req_pos5_1st_o       (MUX_05_D1[273:266]), //8
    .req_pos6_1st_o       (MUX_05_D1[281:274]), //8
    .req_pos7_1st_o       (MUX_05_D1[289:282]), //8
    .req_pos0_src_type_o  (MUX_05_D1[291:290]), //2
    .req_pos1_src_type_o  (MUX_05_D1[293:292]), //2
    .req_pos2_src_type_o  (MUX_05_D1[295:294]), //2
    .req_pos3_src_type_o  (MUX_05_D1[297:296]), //2
    .req_pos4_src_type_o  (MUX_05_D1[299:298]), //2
    .req_pos5_src_type_o  (MUX_05_D1[301:300]), //2
    .req_pos6_src_type_o  (MUX_05_D1[303:302]), //2
    .req_pos7_src_type_o  (MUX_05_D1[305:304]), //2
    .req_release_o        (MUX_05_D1[306:306]), //1
    .VR_id_o              (MUX_05_D1[315:307]), //9
	.VR_FR_o              (MUX_05_D1[318:316]), //3
    .channel_id_o         (MUX_05_D1[323:319])  //5
    );

    
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd17)) addr_ch_17 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_17), //2
   // .req_valid_o          (MUX_05_D2[1:0]), //2
    .req_pos_1st_o        (MUX_05_D2[9:2]), //8
    .req_pos_2nd_o        (MUX_05_D2[12:10]), //3
    .req_pos_src_type_o   (MUX_05_D2[14:13]), //2
    .cfg_start_addr_o     (MUX_05_D2[44:15]), //30
    .cfg_row_addr_burst_o (MUX_05_D2[74:45]), //30
    .cfg_col_addr_burst_o (MUX_05_D2[104:75]), //30
    .select_pos_row_o     (MUX_05_D2[120:105]), //16
    .select_pos_col_o     (MUX_05_D2[134:121]), //14
    .req_length_burst_o   (MUX_05_D2[164:135]), //30
    .req_2nd_addr_burst_o (MUX_05_D2[194:165]), //30
    .req_col_num_2nd_o    (MUX_05_D2[224:195]), //30
    .req_broadcast_o      (MUX_05_D2[225:225]), //1
    .req_pos0_1st_o       (MUX_05_D2[233:226]), //8
    .req_pos1_1st_o       (MUX_05_D2[241:234]), //8
    .req_pos2_1st_o       (MUX_05_D2[249:242]), //8
    .req_pos3_1st_o       (MUX_05_D2[257:250]), //8
    .req_pos4_1st_o       (MUX_05_D2[265:258]), //8
    .req_pos5_1st_o       (MUX_05_D2[273:266]), //8
    .req_pos6_1st_o       (MUX_05_D2[281:274]), //8
    .req_pos7_1st_o       (MUX_05_D2[289:282]), //8
    .req_pos0_src_type_o  (MUX_05_D2[291:290]), //2
    .req_pos1_src_type_o  (MUX_05_D2[293:292]), //2
    .req_pos2_src_type_o  (MUX_05_D2[295:294]), //2
    .req_pos3_src_type_o  (MUX_05_D2[297:296]), //2
    .req_pos4_src_type_o  (MUX_05_D2[299:298]), //2
    .req_pos5_src_type_o  (MUX_05_D2[301:300]), //2
    .req_pos6_src_type_o  (MUX_05_D2[303:302]), //2
    .req_pos7_src_type_o  (MUX_05_D2[305:304]), //2
    .req_release_o        (MUX_05_D2[306:306]), //1
    .VR_id_o              (MUX_05_D2[315:307]), //9
	.VR_FR_o              (MUX_05_D2[318:316]), //3
    .channel_id_o         (MUX_05_D2[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd18)) addr_ch_18 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_18), //2
    // .req_valid_o          (MUX_05_D3[1:0]), //2
    .req_pos_1st_o        (MUX_05_D3[9:2]), //8
    .req_pos_2nd_o        (MUX_05_D3[12:10]), //3
    .req_pos_src_type_o   (MUX_05_D3[14:13]), //2
    .cfg_start_addr_o     (MUX_05_D3[44:15]), //30
    .cfg_row_addr_burst_o (MUX_05_D3[74:45]), //30
    .cfg_col_addr_burst_o (MUX_05_D3[104:75]), //30
    .select_pos_row_o     (MUX_05_D3[120:105]), //16
    .select_pos_col_o     (MUX_05_D3[134:121]), //14
    .req_length_burst_o   (MUX_05_D3[164:135]), //30
    .req_2nd_addr_burst_o (MUX_05_D3[194:165]), //30
    .req_col_num_2nd_o    (MUX_05_D3[224:195]), //30
    .req_broadcast_o      (MUX_05_D3[225:225]), //1
    .req_pos0_1st_o       (MUX_05_D3[233:226]), //8
    .req_pos1_1st_o       (MUX_05_D3[241:234]), //8
    .req_pos2_1st_o       (MUX_05_D3[249:242]), //8
    .req_pos3_1st_o       (MUX_05_D3[257:250]), //8
    .req_pos4_1st_o       (MUX_05_D3[265:258]), //8
    .req_pos5_1st_o       (MUX_05_D3[273:266]), //8
    .req_pos6_1st_o       (MUX_05_D3[281:274]), //8
    .req_pos7_1st_o       (MUX_05_D3[289:282]), //8
    .req_pos0_src_type_o  (MUX_05_D3[291:290]), //2
    .req_pos1_src_type_o  (MUX_05_D3[293:292]), //2
    .req_pos2_src_type_o  (MUX_05_D3[295:294]), //2
    .req_pos3_src_type_o  (MUX_05_D3[297:296]), //2
    .req_pos4_src_type_o  (MUX_05_D3[299:298]), //2
    .req_pos5_src_type_o  (MUX_05_D3[301:300]), //2
    .req_pos6_src_type_o  (MUX_05_D3[303:302]), //2
    .req_pos7_src_type_o  (MUX_05_D3[305:304]), //2
    .req_release_o        (MUX_05_D3[306:306]), //1
    .VR_id_o              (MUX_05_D3[315:307]), //9
	.VR_FR_o              (MUX_05_D3[318:316]), //3
    .channel_id_o         (MUX_05_D3[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd19)) addr_ch_19 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_19), //2
    // .req_valid_o          (MUX_05_D4[1:0]), //2
    .req_pos_1st_o        (MUX_05_D4[9:2]), //8
    .req_pos_2nd_o        (MUX_05_D4[12:10]), //3
    .req_pos_src_type_o   (MUX_05_D4[14:13]), //2
    .cfg_start_addr_o     (MUX_05_D4[44:15]), //30
    .cfg_row_addr_burst_o (MUX_05_D4[74:45]), //30
    .cfg_col_addr_burst_o (MUX_05_D4[104:75]), //30
    .select_pos_row_o     (MUX_05_D4[120:105]), //16
    .select_pos_col_o     (MUX_05_D4[134:121]), //14
    .req_length_burst_o   (MUX_05_D4[164:135]), //30
    .req_2nd_addr_burst_o (MUX_05_D4[194:165]), //30
    .req_col_num_2nd_o    (MUX_05_D4[224:195]), //30
    .req_broadcast_o      (MUX_05_D4[225:225]), //1
    .req_pos0_1st_o       (MUX_05_D4[233:226]), //8
    .req_pos1_1st_o       (MUX_05_D4[241:234]), //8
    .req_pos2_1st_o       (MUX_05_D4[249:242]), //8
    .req_pos3_1st_o       (MUX_05_D4[257:250]), //8
    .req_pos4_1st_o       (MUX_05_D4[265:258]), //8
    .req_pos5_1st_o       (MUX_05_D4[273:266]), //8
    .req_pos6_1st_o       (MUX_05_D4[281:274]), //8
    .req_pos7_1st_o       (MUX_05_D4[289:282]), //8
    .req_pos0_src_type_o  (MUX_05_D4[291:290]), //2
    .req_pos1_src_type_o  (MUX_05_D4[293:292]), //2
    .req_pos2_src_type_o  (MUX_05_D4[295:294]), //2
    .req_pos3_src_type_o  (MUX_05_D4[297:296]), //2
    .req_pos4_src_type_o  (MUX_05_D4[299:298]), //2
    .req_pos5_src_type_o  (MUX_05_D4[301:300]), //2
    .req_pos6_src_type_o  (MUX_05_D4[303:302]), //2
    .req_pos7_src_type_o  (MUX_05_D4[305:304]), //2
    .req_release_o        (MUX_05_D4[306:306]), //1
    .VR_id_o              (MUX_05_D4[315:307]), //9
	.VR_FR_o              (MUX_05_D4[318:316]), //3
    .channel_id_o         (MUX_05_D4[323:319])  //5
    );

    //-----------------------------------------------------------------//
	
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd20)) addr_ch_20 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_20), //2
    // .req_valid_o          (MUX_06_D1[1:0]), //2
    .req_pos_1st_o        (MUX_06_D1[9:2]), //8
    .req_pos_2nd_o        (MUX_06_D1[12:10]), //3
    .req_pos_src_type_o   (MUX_06_D1[14:13]), //2
    .cfg_start_addr_o     (MUX_06_D1[44:15]), //30
    .cfg_row_addr_burst_o (MUX_06_D1[74:45]), //30
    .cfg_col_addr_burst_o (MUX_06_D1[104:75]), //30
    .select_pos_row_o     (MUX_06_D1[120:105]), //16
    .select_pos_col_o     (MUX_06_D1[134:121]), //14
    .req_length_burst_o   (MUX_06_D1[164:135]), //30
    .req_2nd_addr_burst_o (MUX_06_D1[194:165]), //30
    .req_col_num_2nd_o    (MUX_06_D1[224:195]), //30
    .req_broadcast_o      (MUX_06_D1[225:225]), //1
    .req_pos0_1st_o       (MUX_06_D1[233:226]), //8
    .req_pos1_1st_o       (MUX_06_D1[241:234]), //8
    .req_pos2_1st_o       (MUX_06_D1[249:242]), //8
    .req_pos3_1st_o       (MUX_06_D1[257:250]), //8
    .req_pos4_1st_o       (MUX_06_D1[265:258]), //8
    .req_pos5_1st_o       (MUX_06_D1[273:266]), //8
    .req_pos6_1st_o       (MUX_06_D1[281:274]), //8
    .req_pos7_1st_o       (MUX_06_D1[289:282]), //8
    .req_pos0_src_type_o  (MUX_06_D1[291:290]), //2
    .req_pos1_src_type_o  (MUX_06_D1[293:292]), //2
    .req_pos2_src_type_o  (MUX_06_D1[295:294]), //2
    .req_pos3_src_type_o  (MUX_06_D1[297:296]), //2
    .req_pos4_src_type_o  (MUX_06_D1[299:298]), //2
    .req_pos5_src_type_o  (MUX_06_D1[301:300]), //2
    .req_pos6_src_type_o  (MUX_06_D1[303:302]), //2
    .req_pos7_src_type_o  (MUX_06_D1[305:304]), //2
    .req_release_o        (MUX_06_D1[306:306]), //1
    .VR_id_o              (MUX_06_D1[315:307]), //9
	.VR_FR_o              (MUX_06_D1[318:316]), //3
    .channel_id_o         (MUX_06_D1[323:319])  //5
    );

    
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd21)) addr_ch_21 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_21), //2
    // .req_valid_o          (MUX_06_D2[1:0]), //2
    .req_pos_1st_o        (MUX_06_D2[9:2]), //8
    .req_pos_2nd_o        (MUX_06_D2[12:10]), //3
    .req_pos_src_type_o   (MUX_06_D2[14:13]), //2
    .cfg_start_addr_o     (MUX_06_D2[44:15]), //30
    .cfg_row_addr_burst_o (MUX_06_D2[74:45]), //30
    .cfg_col_addr_burst_o (MUX_06_D2[104:75]), //30
    .select_pos_row_o     (MUX_06_D2[120:105]), //16
    .select_pos_col_o     (MUX_06_D2[134:121]), //14
    .req_length_burst_o   (MUX_06_D2[164:135]), //30
    .req_2nd_addr_burst_o (MUX_06_D2[194:165]), //30
    .req_col_num_2nd_o    (MUX_06_D2[224:195]), //30
    .req_broadcast_o      (MUX_06_D2[225:225]), //1
    .req_pos0_1st_o       (MUX_06_D2[233:226]), //8
    .req_pos1_1st_o       (MUX_06_D2[241:234]), //8
    .req_pos2_1st_o       (MUX_06_D2[249:242]), //8
    .req_pos3_1st_o       (MUX_06_D2[257:250]), //8
    .req_pos4_1st_o       (MUX_06_D2[265:258]), //8
    .req_pos5_1st_o       (MUX_06_D2[273:266]), //8
    .req_pos6_1st_o       (MUX_06_D2[281:274]), //8
    .req_pos7_1st_o       (MUX_06_D2[289:282]), //8
    .req_pos0_src_type_o  (MUX_06_D2[291:290]), //2
    .req_pos1_src_type_o  (MUX_06_D2[293:292]), //2
    .req_pos2_src_type_o  (MUX_06_D2[295:294]), //2
    .req_pos3_src_type_o  (MUX_06_D2[297:296]), //2
    .req_pos4_src_type_o  (MUX_06_D2[299:298]), //2
    .req_pos5_src_type_o  (MUX_06_D2[301:300]), //2
    .req_pos6_src_type_o  (MUX_06_D2[303:302]), //2
    .req_pos7_src_type_o  (MUX_06_D2[305:304]), //2
    .req_release_o        (MUX_06_D2[306:306]), //1
    .VR_id_o              (MUX_06_D2[315:307]), //9
	.VR_FR_o              (MUX_06_D2[318:316]), //3
    .channel_id_o         (MUX_06_D2[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd22)) addr_ch_22 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_22), //2
    // .req_valid_o          (MUX_06_D3[1:0]), //2
    .req_pos_1st_o        (MUX_06_D3[9:2]), //8
    .req_pos_2nd_o        (MUX_06_D3[12:10]), //3
    .req_pos_src_type_o   (MUX_06_D3[14:13]), //2
    .cfg_start_addr_o     (MUX_06_D3[44:15]), //30
    .cfg_row_addr_burst_o (MUX_06_D3[74:45]), //30
    .cfg_col_addr_burst_o (MUX_06_D3[104:75]), //30
    .select_pos_row_o     (MUX_06_D3[120:105]), //16
    .select_pos_col_o     (MUX_06_D3[134:121]), //14
    .req_length_burst_o   (MUX_06_D3[164:135]), //30
    .req_2nd_addr_burst_o (MUX_06_D3[194:165]), //30
    .req_col_num_2nd_o    (MUX_06_D3[224:195]), //30
    .req_broadcast_o      (MUX_06_D3[225:225]), //1
    .req_pos0_1st_o       (MUX_06_D3[233:226]), //8
    .req_pos1_1st_o       (MUX_06_D3[241:234]), //8
    .req_pos2_1st_o       (MUX_06_D3[249:242]), //8
    .req_pos3_1st_o       (MUX_06_D3[257:250]), //8
    .req_pos4_1st_o       (MUX_06_D3[265:258]), //8
    .req_pos5_1st_o       (MUX_06_D3[273:266]), //8
    .req_pos6_1st_o       (MUX_06_D3[281:274]), //8
    .req_pos7_1st_o       (MUX_06_D3[289:282]), //8
    .req_pos0_src_type_o  (MUX_06_D3[291:290]), //2
    .req_pos1_src_type_o  (MUX_06_D3[293:292]), //2
    .req_pos2_src_type_o  (MUX_06_D3[295:294]), //2
    .req_pos3_src_type_o  (MUX_06_D3[297:296]), //2
    .req_pos4_src_type_o  (MUX_06_D3[299:298]), //2
    .req_pos5_src_type_o  (MUX_06_D3[301:300]), //2
    .req_pos6_src_type_o  (MUX_06_D3[303:302]), //2
    .req_pos7_src_type_o  (MUX_06_D3[305:304]), //2
    .req_release_o        (MUX_06_D3[306:306]), //1
    .VR_id_o              (MUX_06_D3[315:307]), //9
	.VR_FR_o              (MUX_06_D3[318:316]), //3
    .channel_id_o         (MUX_06_D3[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd23)) addr_ch_23 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_23), //2
    // .req_valid_o          (MUX_06_D4[1:0]), //2
    .req_pos_1st_o        (MUX_06_D4[9:2]), //8
    .req_pos_2nd_o        (MUX_06_D4[12:10]), //3
    .req_pos_src_type_o   (MUX_06_D4[14:13]), //2
    .cfg_start_addr_o     (MUX_06_D4[44:15]), //30
    .cfg_row_addr_burst_o (MUX_06_D4[74:45]), //30
    .cfg_col_addr_burst_o (MUX_06_D4[104:75]), //30
    .select_pos_row_o     (MUX_06_D4[120:105]), //16
    .select_pos_col_o     (MUX_06_D4[134:121]), //14
    .req_length_burst_o   (MUX_06_D4[164:135]), //30
    .req_2nd_addr_burst_o (MUX_06_D4[194:165]), //30
    .req_col_num_2nd_o    (MUX_06_D4[224:195]), //30
    .req_broadcast_o      (MUX_06_D4[225:225]), //1
    .req_pos0_1st_o       (MUX_06_D4[233:226]), //8
    .req_pos1_1st_o       (MUX_06_D4[241:234]), //8
    .req_pos2_1st_o       (MUX_06_D4[249:242]), //8
    .req_pos3_1st_o       (MUX_06_D4[257:250]), //8
    .req_pos4_1st_o       (MUX_06_D4[265:258]), //8
    .req_pos5_1st_o       (MUX_06_D4[273:266]), //8
    .req_pos6_1st_o       (MUX_06_D4[281:274]), //8
    .req_pos7_1st_o       (MUX_06_D4[289:282]), //8
    .req_pos0_src_type_o  (MUX_06_D4[291:290]), //2
    .req_pos1_src_type_o  (MUX_06_D4[293:292]), //2
    .req_pos2_src_type_o  (MUX_06_D4[295:294]), //2
    .req_pos3_src_type_o  (MUX_06_D4[297:296]), //2
    .req_pos4_src_type_o  (MUX_06_D4[299:298]), //2
    .req_pos5_src_type_o  (MUX_06_D4[301:300]), //2
    .req_pos6_src_type_o  (MUX_06_D4[303:302]), //2
    .req_pos7_src_type_o  (MUX_06_D4[305:304]), //2
    .req_release_o        (MUX_06_D4[306:306]), //1
    .VR_id_o              (MUX_06_D4[315:307]), //9
	.VR_FR_o              (MUX_06_D4[318:316]), //3
    .channel_id_o         (MUX_06_D4[323:319])  //5
    );

    //-----------------------------------------------------------------//
	
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd24)) addr_ch_24 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_24), //2
    // .req_valid_o          (MUX_07_D1[1:0]), //2
    .req_pos_1st_o        (MUX_07_D1[9:2]), //8
    .req_pos_2nd_o        (MUX_07_D1[12:10]), //3
    .req_pos_src_type_o   (MUX_07_D1[14:13]), //2
    .cfg_start_addr_o     (MUX_07_D1[44:15]), //30
    .cfg_row_addr_burst_o (MUX_07_D1[74:45]), //30
    .cfg_col_addr_burst_o (MUX_07_D1[104:75]), //30
    .select_pos_row_o     (MUX_07_D1[120:105]), //16
    .select_pos_col_o     (MUX_07_D1[134:121]), //14
    .req_length_burst_o   (MUX_07_D1[164:135]), //30
    .req_2nd_addr_burst_o (MUX_07_D1[194:165]), //30
    .req_col_num_2nd_o    (MUX_07_D1[224:195]), //30
    .req_broadcast_o      (MUX_07_D1[225:225]), //1
    .req_pos0_1st_o       (MUX_07_D1[233:226]), //8
    .req_pos1_1st_o       (MUX_07_D1[241:234]), //8
    .req_pos2_1st_o       (MUX_07_D1[249:242]), //8
    .req_pos3_1st_o       (MUX_07_D1[257:250]), //8
    .req_pos4_1st_o       (MUX_07_D1[265:258]), //8
    .req_pos5_1st_o       (MUX_07_D1[273:266]), //8
    .req_pos6_1st_o       (MUX_07_D1[281:274]), //8
    .req_pos7_1st_o       (MUX_07_D1[289:282]), //8
    .req_pos0_src_type_o  (MUX_07_D1[291:290]), //2
    .req_pos1_src_type_o  (MUX_07_D1[293:292]), //2
    .req_pos2_src_type_o  (MUX_07_D1[295:294]), //2
    .req_pos3_src_type_o  (MUX_07_D1[297:296]), //2
    .req_pos4_src_type_o  (MUX_07_D1[299:298]), //2
    .req_pos5_src_type_o  (MUX_07_D1[301:300]), //2
    .req_pos6_src_type_o  (MUX_07_D1[303:302]), //2
    .req_pos7_src_type_o  (MUX_07_D1[305:304]), //2
    .req_release_o        (MUX_07_D1[306:306]), //1
    .VR_id_o              (MUX_07_D1[315:307]), //9
	.VR_FR_o              (MUX_07_D1[318:316]), //3
    .channel_id_o         (MUX_07_D1[323:319])  //5
    );

    
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd25)) addr_ch_25 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_25), //2
    // .req_valid_o          (MUX_07_D2[1:0]), //2
    .req_pos_1st_o        (MUX_07_D2[9:2]), //8
    .req_pos_2nd_o        (MUX_07_D2[12:10]), //3
    .req_pos_src_type_o   (MUX_07_D2[14:13]), //2
    .cfg_start_addr_o     (MUX_07_D2[44:15]), //30
    .cfg_row_addr_burst_o (MUX_07_D2[74:45]), //30
    .cfg_col_addr_burst_o (MUX_07_D2[104:75]), //30
    .select_pos_row_o     (MUX_07_D2[120:105]), //16
    .select_pos_col_o     (MUX_07_D2[134:121]), //14
    .req_length_burst_o   (MUX_07_D2[164:135]), //30
    .req_2nd_addr_burst_o (MUX_07_D2[194:165]), //30
    .req_col_num_2nd_o    (MUX_07_D2[224:195]), //30
    .req_broadcast_o      (MUX_07_D2[225:225]), //1
    .req_pos0_1st_o       (MUX_07_D2[233:226]), //8
    .req_pos1_1st_o       (MUX_07_D2[241:234]), //8
    .req_pos2_1st_o       (MUX_07_D2[249:242]), //8
    .req_pos3_1st_o       (MUX_07_D2[257:250]), //8
    .req_pos4_1st_o       (MUX_07_D2[265:258]), //8
    .req_pos5_1st_o       (MUX_07_D2[273:266]), //8
    .req_pos6_1st_o       (MUX_07_D2[281:274]), //8
    .req_pos7_1st_o       (MUX_07_D2[289:282]), //8
    .req_pos0_src_type_o  (MUX_07_D2[291:290]), //2
    .req_pos1_src_type_o  (MUX_07_D2[293:292]), //2
    .req_pos2_src_type_o  (MUX_07_D2[295:294]), //2
    .req_pos3_src_type_o  (MUX_07_D2[297:296]), //2
    .req_pos4_src_type_o  (MUX_07_D2[299:298]), //2
    .req_pos5_src_type_o  (MUX_07_D2[301:300]), //2
    .req_pos6_src_type_o  (MUX_07_D2[303:302]), //2
    .req_pos7_src_type_o  (MUX_07_D2[305:304]), //2
    .req_release_o        (MUX_07_D2[306:306]), //1
    .VR_id_o              (MUX_07_D2[315:307]), //9
	.VR_FR_o              (MUX_07_D2[318:316]), //3
    .channel_id_o         (MUX_07_D2[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd26)) addr_ch_26 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_26), //2
    // .req_valid_o          (MUX_07_D3[1:0]), //2
    .req_pos_1st_o        (MUX_07_D3[9:2]), //8
    .req_pos_2nd_o        (MUX_07_D3[12:10]), //3
    .req_pos_src_type_o   (MUX_07_D3[14:13]), //2
    .cfg_start_addr_o     (MUX_07_D3[44:15]), //30
    .cfg_row_addr_burst_o (MUX_07_D3[74:45]), //30
    .cfg_col_addr_burst_o (MUX_07_D3[104:75]), //30
    .select_pos_row_o     (MUX_07_D3[120:105]), //16
    .select_pos_col_o     (MUX_07_D3[134:121]), //14
    .req_length_burst_o   (MUX_07_D3[164:135]), //30
    .req_2nd_addr_burst_o (MUX_07_D3[194:165]), //30
    .req_col_num_2nd_o    (MUX_07_D3[224:195]), //30
    .req_broadcast_o      (MUX_07_D3[225:225]), //1
    .req_pos0_1st_o       (MUX_07_D3[233:226]), //8
    .req_pos1_1st_o       (MUX_07_D3[241:234]), //8
    .req_pos2_1st_o       (MUX_07_D3[249:242]), //8
    .req_pos3_1st_o       (MUX_07_D3[257:250]), //8
    .req_pos4_1st_o       (MUX_07_D3[265:258]), //8
    .req_pos5_1st_o       (MUX_07_D3[273:266]), //8
    .req_pos6_1st_o       (MUX_07_D3[281:274]), //8
    .req_pos7_1st_o       (MUX_07_D3[289:282]), //8
    .req_pos0_src_type_o  (MUX_07_D3[291:290]), //2
    .req_pos1_src_type_o  (MUX_07_D3[293:292]), //2
    .req_pos2_src_type_o  (MUX_07_D3[295:294]), //2
    .req_pos3_src_type_o  (MUX_07_D3[297:296]), //2
    .req_pos4_src_type_o  (MUX_07_D3[299:298]), //2
    .req_pos5_src_type_o  (MUX_07_D3[301:300]), //2
    .req_pos6_src_type_o  (MUX_07_D3[303:302]), //2
    .req_pos7_src_type_o  (MUX_07_D3[305:304]), //2
    .req_release_o        (MUX_07_D3[306:306]), //1
    .VR_id_o              (MUX_07_D3[315:307]), //9
	.VR_FR_o              (MUX_07_D3[318:316]), //3
    .channel_id_o         (MUX_07_D3[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd27)) addr_ch_27 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_27), //2
    // .req_valid_o          (MUX_07_D4[1:0]), //2
    .req_pos_1st_o        (MUX_07_D4[9:2]), //8
    .req_pos_2nd_o        (MUX_07_D4[12:10]), //3
    .req_pos_src_type_o   (MUX_07_D4[14:13]), //2
    .cfg_start_addr_o     (MUX_07_D4[44:15]), //30
    .cfg_row_addr_burst_o (MUX_07_D4[74:45]), //30
    .cfg_col_addr_burst_o (MUX_07_D4[104:75]), //30
    .select_pos_row_o     (MUX_07_D4[120:105]), //16
    .select_pos_col_o     (MUX_07_D4[134:121]), //14
    .req_length_burst_o   (MUX_07_D4[164:135]), //30
    .req_2nd_addr_burst_o (MUX_07_D4[194:165]), //30
    .req_col_num_2nd_o    (MUX_07_D4[224:195]), //30
    .req_broadcast_o      (MUX_07_D4[225:225]), //1
    .req_pos0_1st_o       (MUX_07_D4[233:226]), //8
    .req_pos1_1st_o       (MUX_07_D4[241:234]), //8
    .req_pos2_1st_o       (MUX_07_D4[249:242]), //8
    .req_pos3_1st_o       (MUX_07_D4[257:250]), //8
    .req_pos4_1st_o       (MUX_07_D4[265:258]), //8
    .req_pos5_1st_o       (MUX_07_D4[273:266]), //8
    .req_pos6_1st_o       (MUX_07_D4[281:274]), //8
    .req_pos7_1st_o       (MUX_07_D4[289:282]), //8
    .req_pos0_src_type_o  (MUX_07_D4[291:290]), //2
    .req_pos1_src_type_o  (MUX_07_D4[293:292]), //2
    .req_pos2_src_type_o  (MUX_07_D4[295:294]), //2
    .req_pos3_src_type_o  (MUX_07_D4[297:296]), //2
    .req_pos4_src_type_o  (MUX_07_D4[299:298]), //2
    .req_pos5_src_type_o  (MUX_07_D4[301:300]), //2
    .req_pos6_src_type_o  (MUX_07_D4[303:302]), //2
    .req_pos7_src_type_o  (MUX_07_D4[305:304]), //2
    .req_release_o        (MUX_07_D4[306:306]), //1
    .VR_id_o              (MUX_07_D4[315:307]), //9
	.VR_FR_o              (MUX_07_D4[318:316]), //3
    .channel_id_o         (MUX_07_D4[323:319])  //5
    );

    //-----------------------------------------------------------------//
	
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd28)) addr_ch_28 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_28), //2
    // .req_valid_o          (MUX_08_D1[1:0]), //2
    .req_pos_1st_o        (MUX_08_D1[9:2]), //8
    .req_pos_2nd_o        (MUX_08_D1[12:10]), //3
    .req_pos_src_type_o   (MUX_08_D1[14:13]), //2
    .cfg_start_addr_o     (MUX_08_D1[44:15]), //30
    .cfg_row_addr_burst_o (MUX_08_D1[74:45]), //30
    .cfg_col_addr_burst_o (MUX_08_D1[104:75]), //30
    .select_pos_row_o     (MUX_08_D1[120:105]), //16
    .select_pos_col_o     (MUX_08_D1[134:121]), //14
    .req_length_burst_o   (MUX_08_D1[164:135]), //30
    .req_2nd_addr_burst_o (MUX_08_D1[194:165]), //30
    .req_col_num_2nd_o    (MUX_08_D1[224:195]), //30
    .req_broadcast_o      (MUX_08_D1[225:225]), //1
    .req_pos0_1st_o       (MUX_08_D1[233:226]), //8
    .req_pos1_1st_o       (MUX_08_D1[241:234]), //8
    .req_pos2_1st_o       (MUX_08_D1[249:242]), //8
    .req_pos3_1st_o       (MUX_08_D1[257:250]), //8
    .req_pos4_1st_o       (MUX_08_D1[265:258]), //8
    .req_pos5_1st_o       (MUX_08_D1[273:266]), //8
    .req_pos6_1st_o       (MUX_08_D1[281:274]), //8
    .req_pos7_1st_o       (MUX_08_D1[289:282]), //8
    .req_pos0_src_type_o  (MUX_08_D1[291:290]), //2
    .req_pos1_src_type_o  (MUX_08_D1[293:292]), //2
    .req_pos2_src_type_o  (MUX_08_D1[295:294]), //2
    .req_pos3_src_type_o  (MUX_08_D1[297:296]), //2
    .req_pos4_src_type_o  (MUX_08_D1[299:298]), //2
    .req_pos5_src_type_o  (MUX_08_D1[301:300]), //2
    .req_pos6_src_type_o  (MUX_08_D1[303:302]), //2
    .req_pos7_src_type_o  (MUX_08_D1[305:304]), //2
    .req_release_o        (MUX_08_D1[306:306]), //1
    .VR_id_o              (MUX_08_D1[315:307]), //9
	.VR_FR_o              (MUX_08_D1[318:316]), //3
    .channel_id_o         (MUX_08_D1[323:319])  //5
    );

    
addr_ch_xx  #(.DATA_CHANNEL_ID(5'd29)) addr_ch_29 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_29), //2
    // .req_valid_o          (MUX_08_D2[1:0]), //2
    .req_pos_1st_o        (MUX_08_D2[9:2]), //8
    .req_pos_2nd_o        (MUX_08_D2[12:10]), //3
    .req_pos_src_type_o   (MUX_08_D2[14:13]), //2
    .cfg_start_addr_o     (MUX_08_D2[44:15]), //30
    .cfg_row_addr_burst_o (MUX_08_D2[74:45]), //30
    .cfg_col_addr_burst_o (MUX_08_D2[104:75]), //30
    .select_pos_row_o     (MUX_08_D2[120:105]), //16
    .select_pos_col_o     (MUX_08_D2[134:121]), //14
    .req_length_burst_o   (MUX_08_D2[164:135]), //30
    .req_2nd_addr_burst_o (MUX_08_D2[194:165]), //30
    .req_col_num_2nd_o    (MUX_08_D2[224:195]), //30
    .req_broadcast_o      (MUX_08_D2[225:225]), //1
    .req_pos0_1st_o       (MUX_08_D2[233:226]), //8
    .req_pos1_1st_o       (MUX_08_D2[241:234]), //8
    .req_pos2_1st_o       (MUX_08_D2[249:242]), //8
    .req_pos3_1st_o       (MUX_08_D2[257:250]), //8
    .req_pos4_1st_o       (MUX_08_D2[265:258]), //8
    .req_pos5_1st_o       (MUX_08_D2[273:266]), //8
    .req_pos6_1st_o       (MUX_08_D2[281:274]), //8
    .req_pos7_1st_o       (MUX_08_D2[289:282]), //8
    .req_pos0_src_type_o  (MUX_08_D2[291:290]), //2
    .req_pos1_src_type_o  (MUX_08_D2[293:292]), //2
    .req_pos2_src_type_o  (MUX_08_D2[295:294]), //2
    .req_pos3_src_type_o  (MUX_08_D2[297:296]), //2
    .req_pos4_src_type_o  (MUX_08_D2[299:298]), //2
    .req_pos5_src_type_o  (MUX_08_D2[301:300]), //2
    .req_pos6_src_type_o  (MUX_08_D2[303:302]), //2
    .req_pos7_src_type_o  (MUX_08_D2[305:304]), //2
    .req_release_o        (MUX_08_D2[306:306]), //1
    .VR_id_o              (MUX_08_D2[315:307]), //9
	.VR_FR_o              (MUX_08_D2[318:316]), //3
    .channel_id_o         (MUX_08_D2[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd30)) addr_ch_30 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_30), //2
    // .req_valid_o          (MUX_08_D3[1:0]), //2
    .req_pos_1st_o        (MUX_08_D3[9:2]), //8
    .req_pos_2nd_o        (MUX_08_D3[12:10]), //3
    .req_pos_src_type_o   (MUX_08_D3[14:13]), //2
    .cfg_start_addr_o     (MUX_08_D3[44:15]), //30
    .cfg_row_addr_burst_o (MUX_08_D3[74:45]), //30
    .cfg_col_addr_burst_o (MUX_08_D3[104:75]), //30
    .select_pos_row_o     (MUX_08_D3[120:105]), //16
    .select_pos_col_o     (MUX_08_D3[134:121]), //14
    .req_length_burst_o   (MUX_08_D3[164:135]), //30
    .req_2nd_addr_burst_o (MUX_08_D3[194:165]), //30
    .req_col_num_2nd_o    (MUX_08_D3[224:195]), //30
    .req_broadcast_o      (MUX_08_D3[225:225]), //1
    .req_pos0_1st_o       (MUX_08_D3[233:226]), //8
    .req_pos1_1st_o       (MUX_08_D3[241:234]), //8
    .req_pos2_1st_o       (MUX_08_D3[249:242]), //8
    .req_pos3_1st_o       (MUX_08_D3[257:250]), //8
    .req_pos4_1st_o       (MUX_08_D3[265:258]), //8
    .req_pos5_1st_o       (MUX_08_D3[273:266]), //8
    .req_pos6_1st_o       (MUX_08_D3[281:274]), //8
    .req_pos7_1st_o       (MUX_08_D3[289:282]), //8
    .req_pos0_src_type_o  (MUX_08_D3[291:290]), //2
    .req_pos1_src_type_o  (MUX_08_D3[293:292]), //2
    .req_pos2_src_type_o  (MUX_08_D3[295:294]), //2
    .req_pos3_src_type_o  (MUX_08_D3[297:296]), //2
    .req_pos4_src_type_o  (MUX_08_D3[299:298]), //2
    .req_pos5_src_type_o  (MUX_08_D3[301:300]), //2
    .req_pos6_src_type_o  (MUX_08_D3[303:302]), //2
    .req_pos7_src_type_o  (MUX_08_D3[305:304]), //2
    .req_release_o        (MUX_08_D3[306:306]), //1
    .VR_id_o              (MUX_08_D3[315:307]), //9
	.VR_FR_o              (MUX_08_D3[318:316]), //3
    .channel_id_o         (MUX_08_D3[323:319])  //5
    );

addr_ch_xx  #(.DATA_CHANNEL_ID(5'd31)) addr_ch_31 (
    .clk(clk), 
    .rst_n(rst_n), 
    .request_valid_i(request_valid_i), 
    .request_pos_1st_i(request_pos_1st_i), 
    .request_pos_2nd_i(request_pos_2nd_i), 
    .request_src_type_i(request_src_type_i), 
    .request_addr_1st_row_i(request_addr_1st_row_i), 
    .request_addr_1st_col_i(request_addr_1st_col_i), 
    .request_addr_last_trans_i(request_addr_last_trans_i), 
    .cfg_valid_i(cfg_valid_i), 
    .cfg_third_req_i(cfg_third_req_i), 
    .cfg_broadcast_i(cfg_broadcast_i), 
    .cfg_row_column_i(cfg_row_column_i), 
    .cfg_read_write_i(cfg_read_write_i), 
    .cfg_cluster_num_i(cfg_cluster_num_i), 
    .cfg_VR_id_i(cfg_VR_id_i), 
	.cfg_VR_FR_i(cfg_VR_FR_i),
    .cfg_channel_id_i(cfg_channel_id_i), 
    .cfg_stream_i(cfg_stream_i), 
    .cfg_D2D_flag_i(cfg_D2D_flag_i), 
    .cfg_data_pos0_1st_i(cfg_data_pos0_1st_i), 
    .cfg_data_pos1_1st_i(cfg_data_pos1_1st_i), 
    .cfg_data_pos2_1st_i(cfg_data_pos2_1st_i), 
    .cfg_data_pos3_1st_i(cfg_data_pos3_1st_i), 
    .cfg_data_pos4_1st_i(cfg_data_pos4_1st_i), 
    .cfg_data_pos5_1st_i(cfg_data_pos5_1st_i), 
    .cfg_data_pos6_1st_i(cfg_data_pos6_1st_i), 
    .cfg_data_pos7_1st_i(cfg_data_pos7_1st_i), 
    .cfg_data_pos0_2nd_i(cfg_data_pos0_2nd_i), 
    .cfg_data_pos1_2nd_i(cfg_data_pos1_2nd_i), 
    .cfg_data_pos2_2nd_i(cfg_data_pos2_2nd_i), 
    .cfg_data_pos3_2nd_i(cfg_data_pos3_2nd_i), 
    .cfg_data_pos4_2nd_i(cfg_data_pos4_2nd_i), 
    .cfg_data_pos5_2nd_i(cfg_data_pos5_2nd_i), 
    .cfg_data_pos6_2nd_i(cfg_data_pos6_2nd_i), 
    .cfg_data_pos7_2nd_i(cfg_data_pos7_2nd_i), 
    .cfg_addr_pos0_1st_i(cfg_addr_pos0_1st_i), 
    .cfg_addr_pos1_1st_i(cfg_addr_pos1_1st_i), 
    .cfg_addr_pos2_1st_i(cfg_addr_pos2_1st_i), 
    .cfg_addr_pos3_1st_i(cfg_addr_pos3_1st_i), 
    .cfg_addr_pos4_1st_i(cfg_addr_pos4_1st_i), 
    .cfg_addr_pos5_1st_i(cfg_addr_pos5_1st_i), 
    .cfg_addr_pos6_1st_i(cfg_addr_pos6_1st_i), 
    .cfg_addr_pos7_1st_i(cfg_addr_pos7_1st_i), 
    .cfg_addr_pos0_2nd_i(cfg_addr_pos0_2nd_i), 
    .cfg_addr_pos1_2nd_i(cfg_addr_pos1_2nd_i), 
    .cfg_addr_pos2_2nd_i(cfg_addr_pos2_2nd_i), 
    .cfg_addr_pos3_2nd_i(cfg_addr_pos3_2nd_i), 
    .cfg_addr_pos4_2nd_i(cfg_addr_pos4_2nd_i), 
    .cfg_addr_pos5_2nd_i(cfg_addr_pos5_2nd_i), 
    .cfg_addr_pos6_2nd_i(cfg_addr_pos6_2nd_i), 
    .cfg_addr_pos7_2nd_i(cfg_addr_pos7_2nd_i), 
    .cfg_start_pos_row_0_i(cfg_start_pos_row_0_i), 
    .cfg_start_pos_col_0_i(cfg_start_pos_col_0_i), 
    .cfg_start_pos_row_1_i(cfg_start_pos_row_1_i), 
    .cfg_start_pos_col_1_i(cfg_start_pos_col_1_i), 
    .cfg_start_pos_row_2_i(cfg_start_pos_row_2_i), 
    .cfg_start_pos_col_2_i(cfg_start_pos_col_2_i), 
    .cfg_start_pos_row_3_i(cfg_start_pos_row_3_i), 
    .cfg_start_pos_col_3_i(cfg_start_pos_col_3_i), 
    .cfg_start_pos_row_4_i(cfg_start_pos_row_4_i), 
    .cfg_start_pos_col_4_i(cfg_start_pos_col_4_i), 
    .cfg_start_pos_row_5_i(cfg_start_pos_row_5_i), 
    .cfg_start_pos_col_5_i(cfg_start_pos_col_5_i), 
    .cfg_start_pos_row_6_i(cfg_start_pos_row_6_i), 
    .cfg_start_pos_col_6_i(cfg_start_pos_col_6_i), 
    .cfg_start_pos_row_7_i(cfg_start_pos_row_7_i), 
    .cfg_start_pos_col_7_i(cfg_start_pos_col_7_i), 
    .cfg_start_addr_i(cfg_start_addr_i), 
    .cfg_row_num_1st_i(cfg_row_num_1st_i), 
    .cfg_col_num_1st_i(cfg_col_num_1st_i), 
    .cfg_row_num_2nd_i(cfg_row_num_2nd_i), 
    .cfg_col_num_2nd_i(cfg_col_num_2nd_i), 
    .cfg_circu_times_i(cfg_circu_times_i), 
    .cfg_col_addr_burst_i(cfg_col_addr_burst_i), 
    .cfg_row_addr_burst_i(cfg_row_addr_burst_i), 
    .cfg_2nd_addr_burst_i(cfg_2nd_addr_burst_i), 
    .cfg_length_burst_i(cfg_length_burst_i), 
  //-------------------------------------------------------
    .req_valid_o          (req_valid_31), //2
    // .req_valid_o          (MUX_08_D4[1:0]), //2
    .req_pos_1st_o        (MUX_08_D4[9:2]), //8
    .req_pos_2nd_o        (MUX_08_D4[12:10]), //3
    .req_pos_src_type_o   (MUX_08_D4[14:13]), //2
    .cfg_start_addr_o     (MUX_08_D4[44:15]), //30
    .cfg_row_addr_burst_o (MUX_08_D4[74:45]), //30
    .cfg_col_addr_burst_o (MUX_08_D4[104:75]), //30
    .select_pos_row_o     (MUX_08_D4[120:105]), //16
    .select_pos_col_o     (MUX_08_D4[134:121]), //14
    .req_length_burst_o   (MUX_08_D4[164:135]), //30
    .req_2nd_addr_burst_o (MUX_08_D4[194:165]), //30
    .req_col_num_2nd_o    (MUX_08_D4[224:195]), //30
    .req_broadcast_o      (MUX_08_D4[225:225]), //1
    .req_pos0_1st_o       (MUX_08_D4[233:226]), //8
    .req_pos1_1st_o       (MUX_08_D4[241:234]), //8
    .req_pos2_1st_o       (MUX_08_D4[249:242]), //8
    .req_pos3_1st_o       (MUX_08_D4[257:250]), //8
    .req_pos4_1st_o       (MUX_08_D4[265:258]), //8
    .req_pos5_1st_o       (MUX_08_D4[273:266]), //8
    .req_pos6_1st_o       (MUX_08_D4[281:274]), //8
    .req_pos7_1st_o       (MUX_08_D4[289:282]), //8
    .req_pos0_src_type_o  (MUX_08_D4[291:290]), //2
    .req_pos1_src_type_o  (MUX_08_D4[293:292]), //2
    .req_pos2_src_type_o  (MUX_08_D4[295:294]), //2
    .req_pos3_src_type_o  (MUX_08_D4[297:296]), //2
    .req_pos4_src_type_o  (MUX_08_D4[299:298]), //2
    .req_pos5_src_type_o  (MUX_08_D4[301:300]), //2
    .req_pos6_src_type_o  (MUX_08_D4[303:302]), //2
    .req_pos7_src_type_o  (MUX_08_D4[305:304]), //2
    .req_release_o        (MUX_08_D4[306:306]), //1
    .VR_id_o              (MUX_08_D4[315:307]), //9
	.VR_FR_o              (MUX_08_D4[318:316]), //3
    .channel_id_o         (MUX_08_D4[323:319])  //5
    );

    //-----------------------------------------------------------------//
	





endmodule
