`timescale 1ns / 1ps
/*********************************************************************************
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/10 10:40:41
// Design Name: 
// Module Name: addr_ch_COP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 为COP的指令请求专门设定的地址通道，本模块不需要配置信息
//              接收：访问地址偏移量
//              生成：访问DDR的块起始地址
// 
// Dependencies: 来源：<cfg_port>
//               目的：<req_COP_fifo>
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: COP最多8个(自适应)

	COP_IP指令存储地址：256M --> (258M-1)
				空间尺寸：2M         每次访问1k条指令
//////////////////////////////////////////////////////////////////////////////////
*********************************************************************************/
`include "ddr_define.vh"

module addr_ch_COP(
	clk,
	rst_n,
		
  //request info
  request_valid_i,
  request_pos_1st_i,
  request_pos_2nd_i,
  request_src_type_i,
  request_access_addr_i, //适用于COP取指令

  //result
//  req_valid_o,
//  req_pos_1st_o,
//  req_pos_2nd_o,
//  req_src_type_o,
//  req_access_start_address_o,	//访存的起始地址
 // req_access_length_burst_o 	//访存长度 --------------
  
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
  input     [19:0]      request_access_addr_i; 	//COP取指令时访问DDR的相对于基址的偏移量
  
  //result ---------------------------------------------总位宽 ： 75-bits ------------其实，可以将位宽减至45-bits，因为访问长度固定为1K
  //----------------------------------------------------送至FIFO的总位宽：45-bits
//  output    [ 1:0]      req_valid_o;	//[0]请求有效  [1]H:write  L:read
//  output    [ 7:0]      req_pos_1st_o;
//  output    [ 2:0]      req_pos_2nd_o;
//  output    [ 1:0]      req_src_type_o;
//  output    [29:0]      req_access_start_address_o;
 // output    [29:0]      req_access_length_burst_o;
   
   input                rd_en;
   output    [44:0]     dout;
   output               valid;
   output               empty;
   
   
	//--------------------------------------------------
	// REG && WIRE ------- declaration
	//--------------------------------------------------
	
	//----------------------------------------------------送至FIFO的总位宽：45-bits
   reg                  req_valid_r = 'b0;  //请求有效标志
   reg      [ 7:0]      req_pos_1st_r  = 'b0;
   reg      [ 2:0]      req_pos_2nd_r  = 'b0;
   reg      [ 1:0]      req_src_type_r = 'b0;
   reg      [29:0]      access_start_address_r = 'b0;	
   
   /** 记录请求到来时的坐标及源类型 **/ //-----------ps:只要是指令请求都会被记录，所以，MC指令请求也会被记录
   reg      [ 7:0]      pos_1st_record  = 'b0;
   reg      [ 2:0]      pos_2nd_record  = 'b0;
   reg      [ 1:0]      src_type_record = 'b0;
   
   /** 8个COP子通道 **/ //-------------------ps:用于检测指令请求是否来自COP
   reg      [ 7:0]      req_pos_x_valid_r = 'b0;
   wire                 req_cop_cmd_valid; //--------ps:只有当发生cop指令请求时，该信号才会拉高，记录器中的相关信息会被发送到输出。
   
   
   
	//--------------------------------------------------
	// CODE ------- description
	//--------------------------------------------------
	/** 坐标记录 **/
	always@(posedge clk) begin
		/* if(!rst_n) begin
			pos_1st_record <= 8'b0;
			pos_2nd_record <= 3'b0;
			src_type_record<= 2'b0;
		end
		else  */if(request_valid_i) begin	//除非遇到下个指令请求，否则记录保持不变
			pos_1st_record <= request_pos_1st_i;
			pos_2nd_record <= request_pos_2nd_i;
			src_type_record<= request_src_type_i;
		end
		else begin
			pos_1st_record <= pos_1st_record;
			pos_2nd_record <= pos_2nd_record;
			src_type_record<= src_type_record;
		end
	end
	
	/** 坐标匹配 **/
	always@(posedge clk) begin
		/* if(!rst_n)
			req_pos_x_valid_r <= 8'b0;
		else  */if(request_valid_i) begin	//没必要加入优先级，可以减小延时链长度
			if((request_pos_2nd_i==`COP_0_POS_2ND) & (request_pos_1st_i==`COP_0_POS_1ST))		req_pos_x_valid_r[0] <= 1'b1;
			if((request_pos_2nd_i==`COP_1_POS_2ND) & (request_pos_1st_i==`COP_1_POS_1ST))		req_pos_x_valid_r[1] <= 1'b1;
			if((request_pos_2nd_i==`COP_2_POS_2ND) & (request_pos_1st_i==`COP_2_POS_1ST))		req_pos_x_valid_r[2] <= 1'b1;
			if((request_pos_2nd_i==`COP_3_POS_2ND) & (request_pos_1st_i==`COP_3_POS_1ST))		req_pos_x_valid_r[3] <= 1'b1;
			if((request_pos_2nd_i==`COP_4_POS_2ND) & (request_pos_1st_i==`COP_4_POS_1ST))		req_pos_x_valid_r[4] <= 1'b1;
			if((request_pos_2nd_i==`COP_5_POS_2ND) & (request_pos_1st_i==`COP_5_POS_1ST))		req_pos_x_valid_r[5] <= 1'b1;
			if((request_pos_2nd_i==`COP_6_POS_2ND) & (request_pos_1st_i==`COP_6_POS_1ST))		req_pos_x_valid_r[6] <= 1'b1;
			if((request_pos_2nd_i==`COP_7_POS_2ND) & (request_pos_1st_i==`COP_7_POS_1ST))		req_pos_x_valid_r[7] <= 1'b1;
		end
		else
			req_pos_x_valid_r <= 8'b0;
	end
	
	/** 探测COP指令请求 **/
	assign  req_cop_cmd_valid = (|req_pos_x_valid_r);	//当有cop请求指令时，该信号拉高一个周期
	
	/** 请求结果 **/
	always@(posedge clk) begin
		/* if(!rst_n)
			req_valid_r <= 1'b0;
		else  */if(req_cop_cmd_valid)
			req_valid_r <= 1'b1;
		else
			req_valid_r <= 1'b0;			
	end
	always@(posedge clk) begin
		/* if(!rst_n) begin
			req_pos_1st_r <= 8'b0;
			req_pos_2nd_r <= 3'b0;
			req_src_type_r<= 2'b0;
		end
		else  */if(req_cop_cmd_valid) begin
			req_pos_1st_r <= pos_1st_record;
			req_pos_2nd_r <= pos_2nd_record;
			req_src_type_r<= src_type_record;
		end
		else begin
			req_pos_1st_r <= req_pos_1st_r;
			req_pos_2nd_r <= req_pos_2nd_r;
			req_src_type_r<= req_src_type_r;
		end
	end
	
	always@(posedge clk) begin
		/* if(!rst_n)
			access_start_address_r <= 30'b0;
		else  */if(request_valid_i)
			access_start_address_r <= `COP_IP_REQ_STARTADDR + request_access_addr_i;
		else
			access_start_address_r <= access_start_address_r;
	end
	
	//########################################
	// OUTPUT ---------- connection
	//########################################
	
//  assign  req_valid_o                  =  {1'b0, req_valid_r}; //COP: read-only
//  assign  req_pos_1st_o                =  req_pos_1st_r;
//  assign  req_pos_2nd_o                =  req_pos_2nd_r;
//  assign  req_src_type_o               =  req_src_type_r;
//  assign  req_access_start_address_o   =  access_start_address_r;
  //assign  req_access_length_burst_o    =  `COP_IP_REQ_LENGTH;
   
   wire      [44:0]       wr_data;
   reg       [44:0]       din = 'b0;
   reg                    wr_en = 'b0;
   
assign  wr_data[ 1: 0] = {1'b0, req_valid_r};
assign  wr_data[ 9: 2] = req_pos_1st_r;
assign  wr_data[12:10] = req_pos_2nd_r;
assign  wr_data[14:13] = req_src_type_r;
assign  wr_data[44:15] = access_start_address_r;
   
	always@(posedge clk) begin
		/* if(!rst_n)
		  wr_en <= 1'b0;
		else */
		  wr_en <= req_valid_r;
  end
		
	always@(posedge clk) begin
		/* if(!rst_n)
		  din <= 45'b0;
		else */
		  din <= wr_data;
  end
		
   COP_CMD_FIFO  COP_CMD_FIFO (
  .clk(clk), // input clk
  .rst(~rst_n), // input rst
  .wr_en(wr_en), // input wr_en
  .din(din), // input [44 : 0] din
  .full( /*reserved*/ ), // output full
  
  .rd_en(rd_en), // input rd_en
  .dout(dout), // output [44 : 0] dout
  .valid(valid), // output valid
  .empty(empty) // output empty
);
endmodule
