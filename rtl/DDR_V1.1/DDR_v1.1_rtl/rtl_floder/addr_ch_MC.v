`timescale 1ns / 1ps
/*********************************************************************************
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/10 09:21:37
// Design Name: 
// Module Name: addr_ch_MC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 为主控制器的指令请求专门设定的地址通道，本模块不需要配置信息
//              接收：访问地址偏移量
//              生成：访问DDR的块起始地址
//
// Dependencies: 来源：<cfg_port>
//               目的：<req_MC_fifo>
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:MC有且仅有一个
	
	MC_IP指令存储地址： 258M --> (260M-1) 
			空间尺寸：2M
	其中，指令分为两类：TOP（顶层指令）、BTM（底层指令），各占1M
			TOP： 258M --> (259M-1)     每次访问256条指令
			BTM： 259M --> (260M-1)     每次访问512条指令
//////////////////////////////////////////////////////////////////////////////////
*********************************************************************************/
`include "ddr_define.vh"

module addr_ch_MC(
	clk,
	rst_n,
		
  //request info
  request_valid_i,
  request_pos_1st_i,
  request_pos_2nd_i,
  request_src_type_i,			//2'b01---256个数据   2'b10---512个数据
  request_access_addr_i, 	//适用于MC取配置信息
  
  //result
//  req_valid_o,
//  req_pos_1st_o,
//  req_pos_2st_o,
//  req_access_start_address_o,	//访存的起始地址
//  req_access_length_burst_o 	//访存长度
//  req_access_col_num_2nd_o,		//访存块的列数 ------ MC无需使用该参数
//  req_access_2nd_addr_burst_o	//访存块内相邻行之间的首地址增量 -------- MC无需使用该参数
 
   rd_en,
   dout,
   valid,
   empty 
    );

parameter		MC_IP_POS_1ST = `MC_POS_1ST;
parameter		MC_IP_POS_2ND = `MC_POS_2ND;


	//--------------------------------------------------
	// INPUT && OUTPUT ------- declaration
	//--------------------------------------------------
  input			clk;	//系统时钟
  input			rst_n;
  
  //request info
  input                 request_valid_i;
  input     [ 7:0]      request_pos_1st_i;
  input     [ 2:0]      request_pos_2nd_i;
  input     [ 1:0]      request_src_type_i;			//指出了MC取指令时要取多少条指令   2'b01---256条   2'b10---512条
  input     [19:0]      request_access_addr_i; 	//MC取指令时访存DDR的相对于基址的偏移量
    
   input                rd_en;
   output    [74:0]     dout;
   output               valid;
   output               empty;
   
	//--------------------------------------------------
	// REG && WIRE ------- declaration
	//--------------------------------------------------
   reg                  req_valid_r = 'b0;
   reg      [ 1:0]      req_src_type_r = 'b0;
   reg      [29:0]      access_start_address_r = 'b0;	
   reg      [29:0]      access_length_burst_r  = 'b0;
   
   //完全受访问类型控制的两个变量
   reg      [29:0]      access_base_address_mux = 'b0;
   reg      [29:0]      access_length_burst_mux = 'b0;
   

	//--------------------------------------------------
	// CODE ------- description
	//--------------------------------------------------
	
	/* 针对两种指令，提前选择对应的访问长度、基地址 */
	always@(posedge clk) begin
		/* if(!rst_n)
			access_length_burst_mux <= 30'b0;
		else  */if(request_src_type_i == `MC_IP_TOP_REQ_SRCTYPE)
			access_length_burst_mux <= `MC_IP_TOP_REQ_LENGTH;
		else if(request_src_type_i == `MC_IP_BTM_REQ_SRCTYPE)
			access_length_burst_mux <= `MC_IP_BTM_REQ_LENGTH;
		else
			access_length_burst_mux <= 30'b0;
	end
	always@(posedge clk) begin
		/* if(!rst_n)
			access_base_address_mux <= 30'b0;
		else  */if(request_src_type_i == `MC_IP_TOP_REQ_SRCTYPE)
			access_base_address_mux <= `MC_IP_TOP_REQ_STARTADDR;
		else if(request_src_type_i == `MC_IP_BTM_REQ_SRCTYPE)
			access_base_address_mux <= `MC_IP_BTM_REQ_STARTADDR;
		else
			access_base_address_mux <= 30'b0;
	end
	
	
	always@(posedge clk) begin
		/* if(!rst_n)
			req_valid_r <= 1'b0;
		else  */if(  request_valid_i	//单脉冲信号
						& (request_pos_2nd_i==MC_IP_POS_2ND)
						& (request_pos_1st_i==MC_IP_POS_1ST))
			req_valid_r <= 1'b1;
		else
			req_valid_r <= 1'b0;
	end
	
	always@(posedge clk) begin
		/* if(!rst_n)
			req_src_type_r <= 2'b0;
		else  */if(  request_valid_i	//单脉冲信号
						& (request_pos_2nd_i==MC_IP_POS_2ND)
						& (request_pos_1st_i==MC_IP_POS_1ST))
			req_src_type_r <= request_src_type_i;
		else
			req_src_type_r <= req_src_type_r;
	end
	
	always@(posedge clk) begin
		/* if(!rst_n)
			access_start_address_r <= 30'b0;
		else  */if(  request_valid_i	//单脉冲信号
						& (request_pos_2nd_i==MC_IP_POS_2ND)
						& (request_pos_1st_i==MC_IP_POS_1ST))
			access_start_address_r <= access_base_address_mux + request_access_addr_i;
		else
			access_start_address_r <= 30'b0;
	end
	
	always@(posedge clk) begin
		/* if(!rst_n)
			access_length_burst_r <= 30'b0;
		else  */if(  request_valid_i	//单脉冲信号
						& (request_pos_2nd_i==MC_IP_POS_2ND)
						& (request_pos_1st_i==MC_IP_POS_1ST))
			access_length_burst_r <= access_length_burst_mux;
		else
			access_length_burst_r <= 30'b0;
	end
	
   
	//########################################
	// OUTPUT ---------- connection
	//########################################
	
  wire   [74:0]   wr_data;
  reg    [74:0]   din;
  reg             wr_en;

assign  wr_data[ 1: 0] = {1'b0, req_valid_r};
assign  wr_data[ 9: 2] = MC_IP_POS_1ST;
assign  wr_data[12:10] = MC_IP_POS_2ND;
assign  wr_data[14:13] = req_src_type_r;
assign  wr_data[44:15] = access_start_address_r;  //真实值
assign  wr_data[74:45] = access_length_burst_r;   //真实值
  
	always@(posedge clk) begin
		if(!rst_n)
		  wr_en <= 1'b0;
		else
		  wr_en <= req_valid_r;
  end
		
	always@(posedge clk)	din <= wr_data;
  
  MC_CMD_FIFO MC_CMD_FIFO (
  .clk(clk),     // input clk
  .rst(~rst_n),  // input rst
  .wr_en(wr_en), // input wr_en
  .din(din),     // input [74 : 0] din
  .full(full),   // output full
  .rd_en(rd_en), // input rd_en
  .dout(dout),   // output [74 : 0] dout
  .valid(valid), // output valid
  .empty(empty)  // output empty
);
  
   
endmodule
