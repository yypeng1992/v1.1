`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/12 13:08:38
// Design Name: 
// Module Name: one_cluster
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
// 模块定位:负责产生请求矩阵块的网格坐标
//////////////////////////////////////////////////////////////////////////////////
/*********************************************************************************
  坐标运算器、下次坐标记录器、当次坐标记录器
  循环计数器、
*********************************************************************************/

module one_cluster#(
  parameter      TIME  = 8  //需要耗费9个时钟周期得到运算结果
)
(
      clk, rst_n,
      
      channel_period_en,
      cfg_cluster_mask_i, //簇通道屏蔽开关,包括广播模式下的1~7号、非广播模式下的未配置簇对应标号
      
      cluster_req_i, //请求脉冲
      cfg_valid_i,   //配置脉冲
      cfg_broadcast_i,
      cfg_third_i,
      cluster_num_i, //配置簇个数
      cfg_circu_times_i, //循环次数
      cfg_row_column_i,  //行列优先级
      cfg_row_num_1st_i,
      cfg_column_num_1st_i,
      cfg_start_pos_row_i,
      cfg_start_pos_col_i,
      ddr_1st_row_pos,
      ddr_1st_col_pos,
      ddr_last_trans,
      
      cluster_request_allow, //配置簇请求允许信号，高有效
      cluster_release_allow, //配置簇释放允许信号，高有效
      cluster_pos_row,  //产生请求的矩阵块行坐标
      cluster_pos_col   //产生请求的矩阵块列坐标
    );
  
	//--------------------------------------------------
	// INPUT && OUTPUT ------- declaration
	//-------------------------------------------------- 
	    
  input               clk;
  input               rst_n;
  
  input               channel_period_en;
  input               cfg_cluster_mask_i;
  
  input               cluster_req_i;
  input               cfg_valid_i;
  input               cfg_broadcast_i;
  input               cfg_third_i;
  input               cfg_row_column_i;
  
  input     [ 2:0]    cluster_num_i;
  input     [29:0]    cfg_circu_times_i;
  
  input     [15:0]    cfg_row_num_1st_i;
  input     [13:0]    cfg_column_num_1st_i;
  
  input     [15:0]    cfg_start_pos_row_i;
  input     [13:0]    cfg_start_pos_col_i;
  
  input     [15:0]    ddr_1st_row_pos;
  input     [13:0]    ddr_1st_col_pos;
  input               ddr_last_trans;
  
  output    reg[15:0]    cluster_pos_row;
  output    reg[13:0]    cluster_pos_col;
  
  output    reg       cluster_request_allow;
  output    reg       cluster_release_allow;
  
  
	//--------------------------------------------------
	// REG && WIRE ------- declaration
	//--------------------------------------------------

  //入口：一次交换，行列翻转
//--------------------------------------------------------------------
  wire      [15:0]    cfg_row_num_1st;
  wire      [15:0]    cfg_col_num_1st;
  wire      [15:0]    cfg_start_pos_row;
  wire      [15:0]    cfg_start_pos_col;
  
  assign  cfg_row_num_1st    =  cfg_row_column_i ? cfg_row_num_1st_i : cfg_column_num_1st_i;
  assign  cfg_col_num_1st    = !cfg_row_column_i ? cfg_row_num_1st_i : cfg_column_num_1st_i;
  assign  cfg_start_pos_row  =  cfg_row_column_i ? cfg_start_pos_row_i : cfg_start_pos_col_i;
  assign  cfg_start_pos_col  = !cfg_row_column_i ? cfg_start_pos_row_i : cfg_start_pos_col_i;
//--------------------------------------------------------------------

  //出口：再次交换，回正
//--------------------------------------------------------------------
  reg       [15:0]    temporary_row;
  reg       [15:0]    temporary_col;
  reg       [15:0]    next_row;
  reg       [15:0]    next_col;
  reg       [15:0]    now_row;
  reg       [15:0]    now_col;
//--------------------------------------------------------------------
  
  
  
//----------------------------------------------------------------
// STATE-MACHINE (FSM)
// FSM_ENCODING  (GRAY)
//----------------------------------------------------------------
      localparam     IDLE       = 2'b00;  //空闲态，检测簇数据请求
      localparam     CALCULATA  = 2'b01;  //计算下次请求时的矩阵块坐标
      localparam     WAIT       = 2'b11;  //等待，周期填充
      localparam     RESULT     = 2'b10;  //用于搜集结果，不停留
      
      (*fsm_encoding="gray"*)reg       [ 1:0]    state_cs;
      (*fsm_encoding="gray"*)reg       [ 1:0]    state_ns;
	  
      reg       [ 3:0]    state_cnt;
  
always@(posedge clk) begin
	if(!rst_n)
	  state_cs <= IDLE;
	else if(channel_period_en)
	  state_cs <= state_ns;
	else
	  state_cs <= IDLE;
end
  
always@( * ) begin
	case(state_cs)
	//------------------------------
	  IDLE:
	      begin
	      	  if(cfg_cluster_mask_i) //加入簇通道屏蔽开关,屏蔽FSM
	      	    state_ns = IDLE;
	      	  else if(cluster_req_i)
	      	    state_ns = CALCULATA;
	      	  else
	      	    state_ns = IDLE;
	      end
	  CALCULATA:
	      begin
	      	  if(cfg_broadcast_i)
	      	    state_ns = WAIT;
	      	  else if(state_cnt == cluster_num_i)
	      	    state_ns = WAIT;
	      	  else
	      	    state_ns = CALCULATA;
	      end
	  WAIT:
	      begin
	      	  if(state_cnt == TIME)
	      	    state_ns = RESULT;
	      	  else
	      	    state_ns = WAIT;
	      end
	  RESULT:   state_ns = IDLE;
	//------------------------------
	endcase
end
  
always@(posedge clk) begin
	if(!rst_n) 
	  state_cnt <= 'b0;
	else if(state_cs == CALCULATA || state_cs == WAIT) //total: 8 clk-period
	  state_cnt <= state_cnt + 1'b1;
	else
	  state_cnt <= 'b0;
end
  

////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

//坐标控制
//--------------------------------------------------------START
  always@(posedge clk) begin
  	if(!rst_n) begin
  	  now_row <= 16'b0;
  	  now_col <= 16'b0;
  	end
  	else if(cluster_req_i) begin
  	  now_row <= next_row;
  	  now_col <= next_col;
  	end
  end
  
  //记录下次访问的矩阵块坐标
  always@(posedge clk) begin
  	if(!rst_n) begin
  	  next_row <= 16'b0;
  	  next_col <= 16'b0;
  	end
  	else if(cfg_cluster_mask_i) begin //加入簇通道屏蔽开关，屏蔽下次坐标记录器
  		next_row <= 16'b0;
  	  next_col <= 16'b0;
  	end
  	else if(cfg_broadcast_i & cfg_valid_i) begin
  	  next_row <= 16'b0;
  	  next_col <= 16'b0;
  	end
  	else if(cfg_valid_i) begin
  	  next_row <= cfg_start_pos_row;
  	  next_col <= cfg_start_pos_col;
  	end
  	else if(state_cs == CALCULATA && state_ns == WAIT) begin
  	  next_row <= temporary_row;
  	  next_col <= temporary_col;
  	end
  end
  
  //计算过程
//  always@(posedge clk) begin
//  	if(!rst_n) begin
//  	  temporary_row <= 16'b0;
//  	  temporary_col <= 16'b0;
//  	end
//  	else if(cfg_cluster_mask_i) begin //加入簇通道屏蔽开关，屏蔽坐标运算器
//  		temporary_row <= 16'b0;
//  		temporary_col <= 16'b0;
//  	end
//  	else if(cfg_valid_i) begin
//  	  temporary_row <= cfg_start_pos_row;
//  	  temporary_col <= cfg_start_pos_col;
//  	end
//  	else if(state_ns == CALCULATA) begin
//	  		if (temporary_col == cfg_col_num_1st && temporary_row==cfg_row_num_1st)
//	  		begin
//	  		    temporary_col <= 16'b0;
//	  		    temporary_row <= 16'b0;
//	  		end
//	  		else if(temporary_col == cfg_col_num_1st)
//	  		begin
//	  		    temporary_col <= 16'b0;
//	  		    temporary_row <= temporary_row+1'b1;
//	  		end
//	  		else
//	  		begin
//	  		    temporary_col <= temporary_col + 1'b1;
//	  		    temporary_row <= temporary_row;
//	  		end
//  	end
//  end
  
  always@(posedge clk) begin
  	if(!rst_n)
  	  temporary_row <= 16'b0;
  	else if(cfg_cluster_mask_i) //加入簇通道屏蔽开关，屏蔽坐标运算器
  		temporary_row <= 16'b0;
  	else if(cfg_broadcast_i&cfg_valid_i) //当广播开启且当前模块未被屏蔽,则配置坐标运算器清零
  		temporary_row <= 16'b0;
  	else if(cfg_valid_i)
  	  temporary_row <= cfg_start_pos_row;
  	else if(state_ns == CALCULATA && temporary_col == cfg_col_num_1st)
	  	temporary_row <= (temporary_row == cfg_row_num_1st) ? 16'b0 :(temporary_row+1'b1);
	  else
	  	temporary_row <= temporary_row;
  end
  always@(posedge clk) begin
  	if(!rst_n)
  	  temporary_col <= 16'b0;
  	else if(cfg_cluster_mask_i)//加入簇通道屏蔽开关，屏蔽坐标运算器
  		temporary_col <= 16'b0;
  	else if(cfg_broadcast_i&cfg_valid_i) //当广播开启且当前模块未被屏蔽,则配置坐标运算器清零
  		temporary_col <= 16'b0;
  	else if(cfg_valid_i)
  	  temporary_col <= cfg_start_pos_col;
  	else if(state_ns == CALCULATA)
	  	temporary_col <= (temporary_col==cfg_col_num_1st) ? 16'b0 : (temporary_col+1'b1);
	  else
	    temporary_col <= temporary_col;
  end
//--------------------------------------------------------END


//循环控制
//--------------------------------------------------------START
  reg       [29:0]    loop_cnt;
  wire                loop_add_en; //循环计数器加使能
  wire                loop_end_en; //最后一次循环标志
  reg       [15:0]    temporary_row_r1;
  reg       [15:0]    temporary_col_r1;
  reg                 cluster_release_en;
  
  always@(posedge clk) begin
  	if(!rst_n) begin
       temporary_row_r1 <= 16'b0;
       temporary_col_r1 <= 16'b0;  		
  	end
  	else begin
       temporary_row_r1 <= temporary_row;
       temporary_col_r1 <= temporary_col;
  	end
  end
  
assign  loop_add_en = (temporary_row_r1 == cfg_row_num_1st) &&
                      (temporary_col_r1 == cfg_col_num_1st) &&
                      (state_cs == CALCULATA);
assign  loop_end_en = (loop_cnt == cfg_circu_times_i);
  
  //记录循环次数
  always@(posedge clk) begin
  	if(!rst_n)
  	   loop_cnt <= 'b0;
  	else if(cfg_valid_i) //配置初始化
  	   loop_cnt <= 'b0;
  	else if(loop_add_en && !loop_end_en)
  	   loop_cnt <= loop_cnt + 1'b1;
  	else
  	   loop_cnt <= loop_cnt;
  end
  
  //单个配置簇释放允许
  always@(posedge clk) begin
  	if(!rst_n)
  	   cluster_release_en <= 1'b0;
  	else if(cfg_valid_i) //当配置脉冲到来时，必须初始化内部相关寄存器
  	   cluster_release_en <= 1'b0;
  	else if(loop_add_en && loop_end_en)
  	   cluster_release_en <= 1'b1;
  	else
  	   cluster_release_en <= cluster_release_en;
  end
//--------------------------------------------------------END


//结果搜集
//--------------------------------------------------------START
  always@(posedge clk) begin
  	if(!rst_n)
  	   cluster_request_allow <= 1'b0;
  	else if(state_ns == RESULT)
  	   cluster_request_allow <= 1'b1;
  	else
  	   cluster_request_allow <= 1'b0;
  end
  
  always@(posedge clk) begin
  	if(!rst_n) begin
  		cluster_pos_row <= 'b0;
  		cluster_pos_col <= 'b0;
  	end
  	else if(state_ns == RESULT) begin
	  		if(cfg_third_i) begin //若三方开启，则直接传送矩阵块坐标
	  			cluster_pos_row <= ddr_1st_row_pos;
		  		cluster_pos_col <= ddr_1st_col_pos;
	  		end
	  		else begin
		  		cluster_pos_row <=  cfg_row_column_i ? now_row[15:0] : now_col[15:0];
		  		cluster_pos_col <= !cfg_row_column_i ? now_row[13:0] : now_col[13:0];
	  		end
  	end
  end
  
  always@(posedge clk) begin
  	if(!rst_n)
  	   cluster_release_allow <= 1'b0;
  	else if(!channel_period_en)
  	   cluster_release_allow <= 1'b0;
  	else if(cfg_cluster_mask_i)
  	   cluster_release_allow <= 1'b1;
  	else if(state_ns == RESULT)
  	   if(cfg_third_i)
  	     cluster_release_allow <= ddr_last_trans;
  	   else
  	     cluster_release_allow <= cluster_release_en;
  end
//--------------------------------------------------------END

endmodule
