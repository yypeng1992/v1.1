`timescale 1ns / 1ps
//`include "ddr_define.vh"
/*********************************************************************************
//////////////////////////////////////////////////////////////////////////////////
Module name : <cfg_pos_ok>  坐标定位器
Function: 读取配置信息，计算出地址通道中被配置簇的首次访问时的矩阵块坐标。
	来 源 ：<ddr_cfg_decoder>
	目 的 ：<addr_ch_xx>
	需要如下5个参数：
	                1) 坐标定位器开关（只有普通模式下有效）   --------- (CFG0)
					2) 行/列优先级标志   ------------------------------ (CFG0)
					3) 配置簇数目   ----------------------------------- (CFG0)
					4) 一级矩阵行数   --------------------------------- (CFG6)
					5) 一级矩阵列数   --------------------------------- (CFG6)
	开启计算的时机：
	                在得到全部的所需参数后，即可开始计算  ------------- (CFG6完毕时)
	计算必须按时完成：
	                计算结果必须在CFG15解析之前完成
//////////////////////////////////////////////////////////////////////////////////
*********************************************************************************/
module	cfg_pos_ok_v2(
	clk,
	//rst_n,
	
	cfg_broadcast_i,  //若广播开启，则当前模块无效,据此可以作为当前模块的总开关    来自cfgid=0
	
	pos_ok_start_pre_i, //来自cfgid=5
	
	cfg_row_column_i,     //行列优先级   来自cfgid=0
	cfg_ch_cluster_num_i, //配置簇个数   来自cfgid=0
	
  cfg_row_num_1st_i,    //一级矩阵行数    来自cfgid=6
  cfg_column_num_1st_i, //一级矩阵列数    来自cfgid=6
  
  cfg_start_pos_row_0_o,
  cfg_start_pos_col_0_o,
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
  cfg_start_pos_col_7_o
);
	
	//--------------------------------------------------
	// INPUT && OUTPUT ------- declaration
	//--------------------------------------------------
  input			clk;
  //input			rst_n;
  
  input             cfg_broadcast_i;
  
  input							pos_ok_start_pre_i;
	//input							pos_ok_start_en_i;
	
	input							cfg_row_column_i;
	input		[ 2:0]		cfg_ch_cluster_num_i;
	
  input		[15:0]		cfg_row_num_1st_i;
  input		[13:0]		cfg_column_num_1st_i;
	
  output	[15:0]    cfg_start_pos_row_0_o;
  output	[13:0]    cfg_start_pos_col_0_o;
  output	[15:0]    cfg_start_pos_row_1_o;
  output	[13:0]    cfg_start_pos_col_1_o;
  output	[15:0]    cfg_start_pos_row_2_o;
  output	[13:0]    cfg_start_pos_col_2_o;
  output	[15:0]    cfg_start_pos_row_3_o;
  output	[13:0]    cfg_start_pos_col_3_o;
  output	[15:0]    cfg_start_pos_row_4_o;
  output	[13:0]    cfg_start_pos_col_4_o;
  output	[15:0]    cfg_start_pos_row_5_o;
  output	[13:0]    cfg_start_pos_col_5_o;
  output	[15:0]    cfg_start_pos_row_6_o;
  output	[13:0]    cfg_start_pos_col_6_o;
  output	[15:0]    cfg_start_pos_row_7_o;
  output	[13:0]    cfg_start_pos_col_7_o;
	
	//--------------------------------------------------
	// REG && WIRE ------- declaration
	//--------------------------------------------------
//  reg     [15:0]    cfg_start_pos_row_0_r;
//  reg     [13:0]    cfg_start_pos_col_0_r;
  reg     [15:0]    cfg_start_pos_row_1_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_1_r = 'b0;
  reg     [15:0]    cfg_start_pos_row_2_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_2_r = 'b0;
  reg     [15:0]    cfg_start_pos_row_3_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_3_r = 'b0;
  reg     [15:0]    cfg_start_pos_row_4_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_4_r = 'b0;
  reg     [15:0]    cfg_start_pos_row_5_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_5_r = 'b0;
  reg     [15:0]    cfg_start_pos_row_6_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_6_r = 'b0;
  reg     [15:0]    cfg_start_pos_row_7_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_7_r = 'b0;
           
	reg		  [15:0]    pos_row_r = 'b0;
	reg		  [13:0]    pos_col_r = 'b0;
  
	reg		  [ 2:0]    cluster_cnt = 'b0;
	wire              calculate_en_int;
	reg               calculate_en_r = 'B0;
	wire              record_en_int;
	reg     [ 7:0]    shift_cnt = 'b0;
	
assign  calculate_en_int  = (|cluster_cnt);
assign  record_en_int     = calculate_en_r;
	
	//--------------------------------------------------
	// Code script
	//--------------------------------------------------
	  
	  //需要设定一个计数器，参与生成对应配置簇数目的高电平持续有效信号
    always@(posedge clk) begin
    	if(!cfg_broadcast_i & pos_ok_start_pre_i) //加入总开关: cfg_broadcast_i
    		cluster_cnt <= cfg_ch_cluster_num_i;
    	else if(|cluster_cnt)
    		cluster_cnt <= cluster_cnt - 1'b1;
    	else
    		cluster_cnt <= 3'b0;
    end
    
    always@(posedge clk) begin
    	  calculate_en_r <= calculate_en_int;
    end
    
    always@(posedge clk) begin
    	if(!cfg_broadcast_i & pos_ok_start_pre_i) //加入总开关: cfg_broadcast_i
        shift_cnt <= {shift_cnt[6:0], 1'b1}; //此时，高7位必为0 ------- 或许这样可以比{7'b0,1'b1}省资源
      else if(calculate_en_int)
        shift_cnt <= {shift_cnt[6:0], 1'b0};
      else
        shift_cnt <= 8'b0;
    end
    
	//将计算结果正确地写入对应的寄存器
    always@(posedge clk) begin
    	if(record_en_int & shift_cnt[1]) begin //每个分支状态维持时间为: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_1_r <= pos_row_r;
         cfg_start_pos_col_1_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
    always@(posedge clk) begin
    	if(record_en_int & shift_cnt[2]) begin //每个分支状态维持时间为: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_2_r <= pos_row_r;
         cfg_start_pos_col_2_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
    always@(posedge clk) begin
    	if(record_en_int & shift_cnt[3]) begin //每个分支状态维持时间为: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_3_r <= pos_row_r;
         cfg_start_pos_col_3_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
    always@(posedge clk) begin
    	if(record_en_int & shift_cnt[4]) begin //每个分支状态维持时间为: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_4_r <= pos_row_r;
         cfg_start_pos_col_4_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
    always@(posedge clk) begin
    	if(record_en_int & shift_cnt[5]) begin //每个分支状态维持时间为: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_5_r <= pos_row_r;
         cfg_start_pos_col_5_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
    always@(posedge clk) begin
    	/* if(!rst_n) begin
         cfg_start_pos_row_6_r <= 'b0;
         cfg_start_pos_col_6_r <= 'b0;
    	end
    	else  */if(record_en_int & shift_cnt[6]) begin //每个分支状态维持时间为: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_6_r <= pos_row_r;
         cfg_start_pos_col_6_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
    always@(posedge clk) begin
    	/* if(!rst_n) begin
         cfg_start_pos_row_7_r <= 'b0;
         cfg_start_pos_col_7_r <= 'b0;
    	end
    	else  */if(record_en_int & shift_cnt[7]) begin //每个分支状态维持时间为: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_7_r <= pos_row_r;
         cfg_start_pos_col_7_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
	
	//calculate the start pos
    always@(posedge clk) begin
    	/* if(!rst_n) begin
        pos_row_r <= 16'b0;
        pos_col_r <= 14'b0;
      end
//      else if(!cfg_broadcast_i & pos_ok_start_pre_i) begin//两点：1：【当前分支可以直接去掉】 2：【即使保留，这里也可以不加总开关】
//        pos_row_r <= 16'b0;
//        pos_col_r <= 14'b0;
//      end
      else  */if(!cfg_broadcast_i & calculate_en_int)
      begin
      	//--------------------------------------------------
          if(cfg_row_column_i) begin	//行优先
            if(pos_col_r == cfg_column_num_1st_i) begin
              pos_row_r <= pos_row_r + 1'b1;
              pos_col_r <= 'b0;
            end
            else begin
              pos_row_r <= pos_row_r;
              pos_col_r <= pos_col_r + 1'b1;
            end
          end
          
          else begin	//列优先
            if(pos_row_r == cfg_row_num_1st_i) begin
              pos_col_r <= pos_col_r + 1'b1;
              pos_row_r <= 'b0;
            end
            else begin
              pos_col_r <= pos_col_r;
              pos_row_r <= pos_row_r + 1'b1;
            end
          end
      	//--------------------------------------------------
      end
      else begin
        pos_row_r <= 16'b0;
        pos_col_r <= 14'b0;
      end
    end

	
	//########################################
	// OUTPUT ---------- connection
	//########################################
	
  assign  cfg_start_pos_row_0_o = {16{1'b0}};
  assign  cfg_start_pos_col_0_o = {14{1'b0}};
  assign  cfg_start_pos_row_1_o = cfg_start_pos_row_1_r;
  assign  cfg_start_pos_col_1_o = cfg_start_pos_col_1_r;
  assign  cfg_start_pos_row_2_o = cfg_start_pos_row_2_r;
  assign  cfg_start_pos_col_2_o = cfg_start_pos_col_2_r;
  assign  cfg_start_pos_row_3_o = cfg_start_pos_row_3_r;
  assign  cfg_start_pos_col_3_o = cfg_start_pos_col_3_r;
  assign  cfg_start_pos_row_4_o = cfg_start_pos_row_4_r;
  assign  cfg_start_pos_col_4_o = cfg_start_pos_col_4_r;
  assign  cfg_start_pos_row_5_o = cfg_start_pos_row_5_r;
  assign  cfg_start_pos_col_5_o = cfg_start_pos_col_5_r;
  assign  cfg_start_pos_row_6_o = cfg_start_pos_row_6_r;
  assign  cfg_start_pos_col_6_o = cfg_start_pos_col_6_r;
  assign  cfg_start_pos_row_7_o = cfg_start_pos_row_7_r;
  assign  cfg_start_pos_col_7_o = cfg_start_pos_col_7_r;
	
	
	
endmodule