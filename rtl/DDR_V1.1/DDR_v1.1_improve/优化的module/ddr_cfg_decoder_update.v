`timescale 1ns / 1ps
//`include "ddr_define.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    2016/8/4 12:17:58 
// Design Name: 
// Module Name:    ddr_cfg_decoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 该模块不再使用cfgid，改用SRL来完成配置信息的对齐！
//
//////////////////////////////////////////////////////////////////////////////////
module ddr_cfg_decoder(
  clk,
  rst_n,
  
  //cfg_network
  cfgid_i,
  cfgfwd_i,
  cfgdata_i,
  cfgreq_i,
  cfgdone_i,
  
  //request info
  request_data_valid_o,     //取数据请求的有效标志
  request_pos_1st_o,
  request_pos_2nd_o,
  request_addr_1st_row_o,		//适用于COP三方请求
  request_addr_1st_col_o,		//同上..
  request_addr_last_trans_o,//同上..
  
  request_src_type_o,	      //对于MC取指令    2'b01---256个数据   2'b10---512个数据
                            //对于普通取数据  是区分src_a/src_b的标示
                            //对于cop取指令   是区分src_a/src_b的标示
  
  request_cmd_valid_o,			//取指令请求的有效标志
  request_cmd_access_addr_o,
  //request_mc_access_addr_o,	//适用于MC取配置信息
  //request_cop_access_addr_o,//适用于COP取指令
  

	//cfg info
	cfg_valid_o,
	
	cfg_third_req_o,
	cfg_stream_o,
	cfg_broadcast_o,
	cfg_row_column_o,			//0-列  1-行
	cfg_read_write_o,			//0-读  1-写
	cfg_D2D_flag_o,	
	cfg_ch_cluster_num_o,
	cfg_VR_id_o,					//主控制器虚拟寄存器编号
	cfg_VR_FR_o,
	cfg_ddr_channel_id_o,	//地址通道编号
	
	
	//下面的cfg info以总线的形式下发到32个ddr_channel
  cfg_data_pos0_1st_o,
  cfg_data_pos1_1st_o,
  cfg_data_pos2_1st_o,
  cfg_data_pos3_1st_o,
  cfg_data_pos4_1st_o,
  cfg_data_pos5_1st_o,
  cfg_data_pos6_1st_o,
  cfg_data_pos7_1st_o,
  cfg_data_pos0_2nd_o,
  cfg_data_pos1_2nd_o,
  cfg_data_pos2_2nd_o,
  cfg_data_pos3_2nd_o,
  cfg_data_pos4_2nd_o,
  cfg_data_pos5_2nd_o,
  cfg_data_pos6_2nd_o,
  cfg_data_pos7_2nd_o,
	
  cfg_addr_pos0_1st_o,
  cfg_addr_pos1_1st_o,
  cfg_addr_pos2_1st_o,
  cfg_addr_pos3_1st_o,
  cfg_addr_pos4_1st_o,
  cfg_addr_pos5_1st_o,
  cfg_addr_pos6_1st_o,
  cfg_addr_pos7_1st_o,
  cfg_addr_pos0_2nd_o,
  cfg_addr_pos1_2nd_o,
  cfg_addr_pos2_2nd_o,
  cfg_addr_pos3_2nd_o,
  cfg_addr_pos4_2nd_o,
  cfg_addr_pos5_2nd_o,
  cfg_addr_pos6_2nd_o,
  cfg_addr_pos7_2nd_o,
	
  // cfg_start_pos_row_0_o,
  // cfg_start_pos_col_0_o,
  cfg_start_pos_row_1_o,
  cfg_start_pos_col_1_o,
  cfg_start_pos_row_2_o,
  cfg_start_pos_col_2_o,
  cfg_start_pos_row_3_o,
  cfg_start_pos_col_3_o,
  cfg_start_pos_row_4_o,
  cfg_start_pos_col_4_o,
  cfg_start_pos_row_5_o,
  cfg_start_pos_col_5_o,
  cfg_start_pos_row_6_o,
  cfg_start_pos_col_6_o,
  cfg_start_pos_row_7_o,
  cfg_start_pos_col_7_o,
	
  cfg_start_addr_o,
  cfg_row_num_1st_o,
  cfg_column_num_1st_o,
  cfg_row_num_2nd_o,
  cfg_column_num_2nd_o,
  cfg_circu_times_o,
  
  /* 一级矩阵跳变区分行优先或列优先,二级矩阵中只存在列优先,不存在行优先 */
	cfg_col_addr_burst_o,	//一级矩阵列加一地址跳变数目
	cfg_row_addr_burst_o,	//一级矩阵行加一地址跳变数目
	cfg_2nd_addr_burst_o,	//二级矩阵行加一地址跳变数目
	cfg_access_length_burst_o	//二级矩阵大小--------规定为二级矩阵块中的小块总个数
	);
	
	//--------------------------------------------------
	// INPUT && OUTPUT ------- declaration
	//--------------------------------------------------
  input			clk;
  input			rst_n;
  
  //cfg_network
  input			[ 7:0]		cfgid_i;
  input		 		     		cfgfwd_i;
  input			[31:0]		cfgdata_i;
  input		      			cfgreq_i;
  input		      			cfgdone_i;

	//request info
	output              request_data_valid_o;
	output    [ 7:0]    request_pos_1st_o;
	output    [ 2:0]    request_pos_2nd_o;
	output    [ 1:0]    request_src_type_o;
	output    [15:0]    request_addr_1st_row_o;
	output    [13:0]    request_addr_1st_col_o;
	output              request_addr_last_trans_o;

	output              request_cmd_valid_o;
	output		[19:0]		request_cmd_access_addr_o;
	
	
	//cfg info
	output							cfg_valid_o;

	output							cfg_third_req_o;
	output							cfg_stream_o;
	output							cfg_broadcast_o;
	output							cfg_row_column_o;			//0-列  1-行
	output							cfg_read_write_o;			//0-读  1-写
	output							cfg_D2D_flag_o;
	output		[ 2:0]		cfg_ch_cluster_num_o;
	output		[ 8:0]		cfg_VR_id_o;
	output      [ 2:0]      cfg_VR_FR_o;    //// yyp 2016-10-25
	output		[ 4:0]		cfg_ddr_channel_id_o;
	
	
  output		[ 7:0]		cfg_data_pos0_1st_o;
  output		[ 7:0]		cfg_data_pos1_1st_o;
  output		[ 7:0]		cfg_data_pos2_1st_o;
  output		[ 7:0]		cfg_data_pos3_1st_o;
  output		[ 7:0]		cfg_data_pos4_1st_o;
  output		[ 7:0]		cfg_data_pos5_1st_o;
  output		[ 7:0]		cfg_data_pos6_1st_o;
  output		[ 7:0]		cfg_data_pos7_1st_o;
  output		[ 2:0]		cfg_data_pos0_2nd_o;
  output		[ 2:0]		cfg_data_pos1_2nd_o;
  output		[ 2:0]		cfg_data_pos2_2nd_o;
  output		[ 2:0]		cfg_data_pos3_2nd_o;
  output		[ 2:0]		cfg_data_pos4_2nd_o;
  output		[ 2:0]		cfg_data_pos5_2nd_o;
  output		[ 2:0]		cfg_data_pos6_2nd_o;
  output		[ 2:0]		cfg_data_pos7_2nd_o;
	
  output		[ 7:0]		cfg_addr_pos0_1st_o;
  output		[ 7:0]		cfg_addr_pos1_1st_o;
  output		[ 7:0]		cfg_addr_pos2_1st_o;
  output		[ 7:0]		cfg_addr_pos3_1st_o;
  output		[ 7:0]		cfg_addr_pos4_1st_o;
  output		[ 7:0]		cfg_addr_pos5_1st_o;
  output		[ 7:0]		cfg_addr_pos6_1st_o;
  output		[ 7:0]		cfg_addr_pos7_1st_o;
  output		[ 2:0]		cfg_addr_pos0_2nd_o;
  output		[ 2:0]		cfg_addr_pos1_2nd_o;
  output		[ 2:0]		cfg_addr_pos2_2nd_o;
  output		[ 2:0]		cfg_addr_pos3_2nd_o;
  output		[ 2:0]		cfg_addr_pos4_2nd_o;
  output		[ 2:0]		cfg_addr_pos5_2nd_o;
  output		[ 2:0]		cfg_addr_pos6_2nd_o;
  output		[ 2:0]		cfg_addr_pos7_2nd_o;
	
  // output	  [15:0]    cfg_start_pos_row_0_o;
  // output	  [13:0]    cfg_start_pos_col_0_o;
  output	  [15:0]    cfg_start_pos_row_1_o;
  output	  [13:0]    cfg_start_pos_col_1_o;
  output	  [15:0]    cfg_start_pos_row_2_o;
  output	  [13:0]    cfg_start_pos_col_2_o;
  output	  [15:0]    cfg_start_pos_row_3_o;
  output	  [13:0]    cfg_start_pos_col_3_o;
  output	  [15:0]    cfg_start_pos_row_4_o;
  output	  [13:0]    cfg_start_pos_col_4_o;
  output	  [15:0]    cfg_start_pos_row_5_o;
  output	  [13:0]    cfg_start_pos_col_5_o;
  output	  [15:0]    cfg_start_pos_row_6_o;
  output	  [13:0]    cfg_start_pos_col_6_o;
  output	  [15:0]    cfg_start_pos_row_7_o;
  output	  [13:0]    cfg_start_pos_col_7_o;

	output		[29:0]		cfg_start_addr_o;
	output		[15:0]		cfg_row_num_1st_o;
	output		[13:0]		cfg_column_num_1st_o;
	output		[15:0]		cfg_row_num_2nd_o;
	output		[13:0]		cfg_column_num_2nd_o;
	output		[29:0]		cfg_circu_times_o;
	output		[29:0]		cfg_col_addr_burst_o;
	output		[29:0]		cfg_row_addr_burst_o;
	output		[29:0]		cfg_2nd_addr_burst_o;
	output		[29:0]		cfg_access_length_burst_o;
	
	
	//--------------------------------------------------
	// REG && WIRE ------- declaration
	//--------------------------------------------------
	
  //request info
  reg                     request_valid_r;
  reg                     request_cmd_valid_r = 'b0;
  reg		    [ 7:0]    request_pos_1st_r         = 'b0;
  reg		    [ 2:0]    request_pos_2nd_r         = 'b0;
  reg		    [ 1:0]    request_src_type_r        = 'b0;
  reg		    [15:0]    request_addr_1st_row_r    = 'b0;
  reg		    [13:0]    request_addr_1st_col_r    = 'b0;
  reg		              request_addr_last_trans_r = 'b0;
  reg			[19:0]    request_cmd_access_addr_r = 'b0;
	
  
	//cfg info
  reg									cfg_valid_r = 'b0;
  
  reg                 pos_ok_start_pre_r = 'b0; //来自cfgid=5
  
  reg							cfg_third_req_r		= 'b0;
  reg							cfg_stream_r		= 'b0;
  reg							cfg_broadcast_r		= 'b0;
  reg							cfg_row_column_r	= 'b0;
  reg							cfg_read_write_r	= 'b0;
  reg							cfg_D2D_flag_r		= 'b0;
  reg				[ 2:0]		cfg_ch_cluster_num_r= 'b0;
  reg				[ 8:0]		cfg_VR_id_r			= 'b0;
  reg               [ 2:0]      cfg_VR_FR_r			= 'b0;
  reg				[ 4:0]		cfg_ddr_channel_id_r= 'b0;
	
	
  reg				[ 7:0]		cfg_data_pos0_1st_r	= 'b0;
  reg				[ 7:0]		cfg_data_pos1_1st_r	= 'b0;
  reg				[ 7:0]		cfg_data_pos2_1st_r	= 'b0;
  reg				[ 7:0]		cfg_data_pos3_1st_r	= 'b0;
  reg				[ 7:0]		cfg_data_pos4_1st_r	= 'b0;
  reg				[ 7:0]		cfg_data_pos5_1st_r	= 'b0;
  reg				[ 7:0]		cfg_data_pos6_1st_r	= 'b0;
  reg				[ 7:0]		cfg_data_pos7_1st_r	= 'b0;
  reg				[ 2:0]		cfg_data_pos0_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_data_pos1_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_data_pos2_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_data_pos3_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_data_pos4_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_data_pos5_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_data_pos6_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_data_pos7_2nd_r	= 'b0;
	
  reg				[ 7:0]		cfg_addr_pos0_1st_r	= 'b0;
  reg				[ 7:0]		cfg_addr_pos1_1st_r	= 'b0;
  reg				[ 7:0]		cfg_addr_pos2_1st_r	= 'b0;
  reg				[ 7:0]		cfg_addr_pos3_1st_r	= 'b0;
  reg				[ 7:0]		cfg_addr_pos4_1st_r	= 'b0;
  reg				[ 7:0]		cfg_addr_pos5_1st_r	= 'b0;
  reg				[ 7:0]		cfg_addr_pos6_1st_r	= 'b0;
  reg				[ 7:0]		cfg_addr_pos7_1st_r	= 'b0;
  reg				[ 2:0]		cfg_addr_pos0_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_addr_pos1_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_addr_pos2_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_addr_pos3_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_addr_pos4_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_addr_pos5_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_addr_pos6_2nd_r	= 'b0;
  reg				[ 2:0]		cfg_addr_pos7_2nd_r	= 'b0;
	
	
  reg				[29:0]		cfg_start_addr_r	= 'b0;
  reg				[15:0]		cfg_row_num_1st_r	= 'b0;
  reg				[13:0]		cfg_column_num_1st_r= 'b0;
  reg				[15:0]		cfg_row_num_2nd_r	= 'b0;
  reg				[13:0]		cfg_column_num_2nd_r= 'b0;
  reg				[29:0]		cfg_circu_times_r	= 'b0;
  reg				[29:0]		cfg_col_addr_burst_r= 'b0;
  reg				[29:0]		cfg_row_addr_burst_r= 'b0;
  reg				[29:0]		cfg_2nd_addr_burst_r= 'b0;
  reg				[29:0]		cfg_access_length_burst_r	= 'b0;
	
	//extra
	reg									cfgreq_r;
	

  
	//--------------------------------------------------
	// Package information
	//--------------------------------------------------
	reg                   info_fwd;
	reg       [31:0]      info_data;
	reg                   info_req;
	reg                   info_start;
	reg                   info_done;
	
	always@(posedge clk) begin
	   if(rst)
	      info_start <= 1'b0;
	   else if(cfgfwd_i && (cfgid_i == 8'd0))
	      info_start <= 1'b1;
	   else
	      info_start <= 1'b0;
	end
	
	always@(posedge clk) begin
	   info_fwd  <= cfgfwd_i;
	   info_data <= cfgdata_i;
	   info_req  <= cfgreq_i;
	   info_done <= cfgdone_i;
	end
	
	//--------------------------------------------------
	// Shift pipline
	//--------------------------------------------------
	reg     [15:0]   shift_pipline;
	
	//--------------------------------------------------
	// CODE ------- description
	//--------------------------------------------------
	
  //request info ----------------------------
  always@(posedge clk) begin
  	if(!rst_n)
      cfgreq_r <= 1'b0;
    else
      cfgreq_r <= cfgreq_i;
  end
  
  always @(posedge clk) begin
    if(~rst_n)
      request_valid_r <= 1'b0;
    else if(cfgreq_r && cfgdone_i)
      request_valid_r <= 1'b1;
    else
      request_valid_r <= 1'b0;
  end

	//req_0
  always @(posedge clk) begin
    if(cfgreq_i && cfgfwd_i && (cfgid_i == 8'd0)) begin
      request_pos_1st_r  <= cfgdata_i[15: 8];
      request_pos_2nd_r  <= cfgdata_i[18:16];
      request_src_type_r <= cfgdata_i[21:20];
    end
  end

	//req_1(1)
	always @(posedge clk) begin
	  if(cfgreq_i && cfgfwd_i && (cfgid_i == 8'd1) && !cfgdata_i[31]) begin
	    request_addr_1st_row_r    <= cfgdata_i[15:0];
	    request_addr_1st_col_r    <= cfgdata_i[29:16];
	    request_addr_last_trans_r <= cfgdata_i[30];
	  end
	end
	
	//req_1(2)
	always @(posedge clk) begin
	  if(cfgreq_i && cfgfwd_i && (cfgid_i == 8'd1) && cfgdata_i[31])
	    request_cmd_access_addr_r   <= cfgdata_i[19:0];
	end
	
	/* 参与判断当前请求是数据请求还是指令请求 */
	always @(posedge clk) begin
	  if(cfgreq_i && cfgfwd_i && (cfgid_i == 8'd1) && cfgdata_i[31])
	    request_cmd_valid_r   <= 1'b1;
	  else if(request_valid_r)
	    request_cmd_valid_r   <= 1'b0;
	end
	
	
	
  //cfg info ----------------------------
  
  //cfg_0
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd0)) begin
  		cfg_ddr_channel_id_r <= cfgdata_i[ 4: 0];
		cfg_VR_FR_r          <= cfgdata_i[ 7: 5];
  		cfg_VR_id_r          <= cfgdata_i[16: 8];
  		cfg_ch_cluster_num_r <= cfgdata_i[22:20];
  		cfg_D2D_flag_r       <= cfgdata_i[26];
  		cfg_read_write_r     <= cfgdata_i[27];
  		cfg_row_column_r     <= cfgdata_i[28];
  		cfg_broadcast_r      <= cfgdata_i[29];
  		cfg_stream_r         <= cfgdata_i[30];
      cfg_third_req_r      <= cfgdata_i[31];
    end
  end
	
  //cfg_1
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd1)) begin
  		cfg_data_pos0_1st_r  <= cfgdata_i[ 7: 0];
  		cfg_data_pos1_1st_r  <= cfgdata_i[15: 8];
  		cfg_data_pos2_1st_r  <= cfgdata_i[23:16];
  		cfg_data_pos3_1st_r  <= cfgdata_i[31:24];
    end
  end
	
  //cfg_2
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd2)) begin
  		cfg_data_pos4_1st_r  <= cfgdata_i[ 7: 0];
  		cfg_data_pos5_1st_r  <= cfgdata_i[15: 8];
  		cfg_data_pos6_1st_r  <= cfgdata_i[23:16];
  		cfg_data_pos7_1st_r  <= cfgdata_i[31:24];
    end
  end
	
  //cfg_3
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd3)) begin
  		cfg_addr_pos0_1st_r  <= cfgdata_i[ 7: 0];
  		cfg_addr_pos1_1st_r  <= cfgdata_i[15: 8];
  		cfg_addr_pos2_1st_r  <= cfgdata_i[23:16];
  		cfg_addr_pos3_1st_r  <= cfgdata_i[31:24];
    end
  end
	
  //cfg_4
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd4)) begin
  		cfg_addr_pos4_1st_r  <= cfgdata_i[ 7: 0];
  		cfg_addr_pos5_1st_r  <= cfgdata_i[15: 8];
  		cfg_addr_pos6_1st_r  <= cfgdata_i[23:16];
  		cfg_addr_pos7_1st_r  <= cfgdata_i[31:24];
    end
  end
	
  //cfg_5
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd5))
  		cfg_start_addr_r  <= cfgdata_i[29:0];
  end
	         //-----------------------------------------------------------// cfgid=5
             always@(posedge clk) begin                                   // cfgid=5
             	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd5))            // cfgid=5
             		pos_ok_start_pre_r <= 1'b1;                           // cfgid=5
             	else                                                      // cfgid=5
             		pos_ok_start_pre_r <= 1'b0;                           // cfgid=5
             end                                                          // cfgid=5
	         //-----------------------------------------------------------// cfgid=5
	
  //cfg_6
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd6)) begin
  		cfg_row_num_1st_r    <= cfgdata_i[15: 0];
  		cfg_column_num_1st_r <= cfgdata_i[29:16];
    end
  end
  
  //cfg_7
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd7)) begin
  		cfg_row_num_2nd_r    <= cfgdata_i[15: 0];
  		cfg_column_num_2nd_r <= cfgdata_i[29:16];
    end
  end
	
  //cfg_8
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd8)) begin
  		cfg_data_pos0_2nd_r  <= cfgdata_i[ 2: 0];
  		cfg_data_pos1_2nd_r  <= cfgdata_i[ 5: 3];
  		cfg_data_pos2_2nd_r  <= cfgdata_i[ 8: 6];
  		cfg_data_pos3_2nd_r  <= cfgdata_i[11: 9];
  		cfg_data_pos4_2nd_r  <= cfgdata_i[14:12];
  		cfg_data_pos5_2nd_r  <= cfgdata_i[17:15];
  		cfg_data_pos6_2nd_r  <= cfgdata_i[20:18];
  		cfg_data_pos7_2nd_r  <= cfgdata_i[23:21];
    end
  end
	
  //cfg_9
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd9)) begin
  		cfg_addr_pos0_2nd_r  <= cfgdata_i[ 2: 0];
  		cfg_addr_pos1_2nd_r  <= cfgdata_i[ 5: 3];
  		cfg_addr_pos2_2nd_r  <= cfgdata_i[ 8: 6];
  		cfg_addr_pos3_2nd_r  <= cfgdata_i[11: 9];
  		cfg_addr_pos4_2nd_r  <= cfgdata_i[14:12];
  		cfg_addr_pos5_2nd_r  <= cfgdata_i[17:15];
  		cfg_addr_pos6_2nd_r  <= cfgdata_i[20:18];
  		cfg_addr_pos7_2nd_r  <= cfgdata_i[23:21];
    end
  end
	
  //cfg_10
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd10))
  		cfg_circu_times_r  <= cfgdata_i[29:0];
  end
	
  //cfg_11
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd11))
  		cfg_col_addr_burst_r  <= cfgdata_i[29:0];
  end
	
  //cfg_12
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd12))
  		cfg_row_addr_burst_r  <= cfgdata_i[29:0];
  end
	
  //cfg_13
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd13))
  		cfg_2nd_addr_burst_r  <= cfgdata_i[29:0];
  end
	
  //cfg_14
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd14))
  		cfg_access_length_burst_r  <= cfgdata_i[29:0];
  end
	
  //cfg_15
  always@(posedge clk) begin
  	if(!cfgreq_i && cfgfwd_i && (cfgid_i == 8'd15))
  		cfg_valid_r  <= 1'b1;
  	else
  		cfg_valid_r  <= 1'b0;
  end
	
	
	
	//########################################
	// OUTPUT ---------- connection
	//########################################
	
  //request info
	assign	request_data_valid_o        = request_valid_r & !request_cmd_valid_r;
	assign	request_cmd_valid_o         = request_valid_r &  request_cmd_valid_r;
	assign	request_pos_1st_o           = request_pos_1st_r;
	assign	request_pos_2nd_o           = request_pos_2nd_r;
	assign	request_src_type_o          = request_src_type_r;
	assign	request_addr_1st_row_o      = request_addr_1st_row_r;
	assign	request_addr_1st_col_o      = request_addr_1st_col_r;
	assign	request_addr_last_trans_o   = request_addr_last_trans_r;
	assign	request_cmd_access_addr_o   = request_cmd_access_addr_r;
  

	//cfg info-------------------------------------------
	assign	cfg_valid_o           = cfg_valid_r;
	
	assign	cfg_third_req_o       = cfg_third_req_r;
	assign	cfg_stream_o          = cfg_stream_r;
	assign	cfg_broadcast_o       = cfg_broadcast_r;
	assign	cfg_row_column_o      = cfg_row_column_r;
	assign	cfg_read_write_o      = cfg_read_write_r;
	assign	cfg_D2D_flag_o        = cfg_D2D_flag_r;
	assign	cfg_ch_cluster_num_o  = cfg_ch_cluster_num_r;
	assign	cfg_VR_id_o           = cfg_VR_id_r;
	assign  cfg_VR_FR_o           = cfg_VR_FR_r;
	assign	cfg_ddr_channel_id_o  = cfg_ddr_channel_id_r;
	
	
	//下面的cfg info以总线的形式下发到32个ddr_channel
	assign	cfg_data_pos0_1st_o  = cfg_data_pos0_1st_r;
	assign	cfg_data_pos1_1st_o  = cfg_data_pos1_1st_r;
	assign	cfg_data_pos2_1st_o  = cfg_data_pos2_1st_r;
	assign	cfg_data_pos3_1st_o  = cfg_data_pos3_1st_r;
	assign	cfg_data_pos4_1st_o  = cfg_data_pos4_1st_r;
	assign	cfg_data_pos5_1st_o  = cfg_data_pos5_1st_r;
	assign	cfg_data_pos6_1st_o  = cfg_data_pos6_1st_r;
	assign	cfg_data_pos7_1st_o  = cfg_data_pos7_1st_r;
	assign	cfg_data_pos0_2nd_o  = cfg_data_pos0_2nd_r;
	assign	cfg_data_pos1_2nd_o  = cfg_data_pos1_2nd_r;
	assign	cfg_data_pos2_2nd_o  = cfg_data_pos2_2nd_r;
	assign	cfg_data_pos3_2nd_o  = cfg_data_pos3_2nd_r;
	assign	cfg_data_pos4_2nd_o  = cfg_data_pos4_2nd_r;
	assign	cfg_data_pos5_2nd_o  = cfg_data_pos5_2nd_r;
	assign	cfg_data_pos6_2nd_o  = cfg_data_pos6_2nd_r;
	assign	cfg_data_pos7_2nd_o  = cfg_data_pos7_2nd_r;
	
	assign	cfg_addr_pos0_1st_o  = cfg_addr_pos0_1st_r;
	assign	cfg_addr_pos1_1st_o  = cfg_addr_pos1_1st_r;
	assign	cfg_addr_pos2_1st_o  = cfg_addr_pos2_1st_r;
	assign	cfg_addr_pos3_1st_o  = cfg_addr_pos3_1st_r;
	assign	cfg_addr_pos4_1st_o  = cfg_addr_pos4_1st_r;
	assign	cfg_addr_pos5_1st_o  = cfg_addr_pos5_1st_r;
	assign	cfg_addr_pos6_1st_o  = cfg_addr_pos6_1st_r;
	assign	cfg_addr_pos7_1st_o  = cfg_addr_pos7_1st_r;
	assign	cfg_addr_pos0_2nd_o  = cfg_addr_pos0_2nd_r;
	assign	cfg_addr_pos1_2nd_o  = cfg_addr_pos1_2nd_r;
	assign	cfg_addr_pos2_2nd_o  = cfg_addr_pos2_2nd_r;
	assign	cfg_addr_pos3_2nd_o  = cfg_addr_pos3_2nd_r;
	assign	cfg_addr_pos4_2nd_o  = cfg_addr_pos4_2nd_r;
	assign	cfg_addr_pos5_2nd_o  = cfg_addr_pos5_2nd_r;
	assign	cfg_addr_pos6_2nd_o  = cfg_addr_pos6_2nd_r;
	assign	cfg_addr_pos7_2nd_o  = cfg_addr_pos7_2nd_r;
	
	
	assign	cfg_start_addr_o     = cfg_start_addr_r;
	assign	cfg_row_num_1st_o    = cfg_row_num_1st_r;
	assign	cfg_column_num_1st_o = cfg_column_num_1st_r;
	assign	cfg_row_num_2nd_o    = cfg_row_num_2nd_r;
	assign	cfg_column_num_2nd_o = cfg_column_num_2nd_r;
	assign	cfg_circu_times_o    = cfg_circu_times_r;

	assign	cfg_col_addr_burst_o      = cfg_col_addr_burst_r;
	assign	cfg_row_addr_burst_o      = cfg_row_addr_burst_r;
	assign	cfg_2nd_addr_burst_o      = cfg_2nd_addr_burst_r;
	assign	cfg_access_length_burst_o = cfg_access_length_burst_r;
	
	
	
cfg_pos_ok_v2   cfg_pos_ok_v2(
    .clk(clk), 
    .cfg_broadcast_i      (cfg_broadcast_r), 
    .pos_ok_start_pre_i   (pos_ok_start_pre_r),    //来自cfgid=5
    .cfg_row_column_i     (cfg_row_column_r),      //行列优先级   来自cfgid=0
    .cfg_ch_cluster_num_i (cfg_ch_cluster_num_r),  //配置簇个数   来自cfgid=0
    .cfg_row_num_1st_i    (cfg_row_num_1st_r),     //一级矩阵行数    来自cfgid=6
    .cfg_column_num_1st_i (cfg_column_num_1st_r),  //一级矩阵列数    来自cfgid=6
    
    // .cfg_start_pos_row_0_o(cfg_start_pos_row_0_o), 
    // .cfg_start_pos_col_0_o(cfg_start_pos_col_0_o), 
    .cfg_start_pos_row_1_o(cfg_start_pos_row_1_o), 
    .cfg_start_pos_col_1_o(cfg_start_pos_col_1_o), 
    .cfg_start_pos_row_2_o(cfg_start_pos_row_2_o), 
    .cfg_start_pos_col_2_o(cfg_start_pos_col_2_o), 
    .cfg_start_pos_row_3_o(cfg_start_pos_row_3_o), 
    .cfg_start_pos_col_3_o(cfg_start_pos_col_3_o), 
    .cfg_start_pos_row_4_o(cfg_start_pos_row_4_o), 
    .cfg_start_pos_col_4_o(cfg_start_pos_col_4_o), 
    .cfg_start_pos_row_5_o(cfg_start_pos_row_5_o), 
    .cfg_start_pos_col_5_o(cfg_start_pos_col_5_o), 
    .cfg_start_pos_row_6_o(cfg_start_pos_row_6_o), 
    .cfg_start_pos_col_6_o(cfg_start_pos_col_6_o), 
    .cfg_start_pos_row_7_o(cfg_start_pos_row_7_o), 
    .cfg_start_pos_col_7_o(cfg_start_pos_col_7_o)
    );
	
	

endmodule
