`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:42:09 09/18/2016 
// Design Name: 
// Module Name:    broadcast_crossbar 
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
module broadcast_crossbar(
    sys_clk,
    sys_rst_n,
    
    ch1_link_i,
    ch2_link_i,
    ch3_link_i,
    ch4_link_i,
    ch5_link_i,
    ch6_link_i,
    
    ch1_grant_o,
    ch2_grant_o,
    ch3_grant_o,
    ch4_grant_o,
    ch5_grant_o,
    ch6_grant_o,
    
    ch1_data_i,
    ch2_data_i,
    ch3_data_i,
    ch4_data_i,
    ch5_data_i,
    ch6_data_i,
    ch1_fwd_i,
    ch2_fwd_i,
    ch3_fwd_i,
    ch4_fwd_i,
    ch5_fwd_i,
    ch6_fwd_i,
    
    broadcast_data_o,
    broadcast_fwd_o
    );

    //------------------------------------------------
    // I/O-PORT declaration
    //------------------------------------------------
    
      input           sys_clk;
      input           sys_rst_n;
      
      input                  ch1_link_i;
      input                  ch2_link_i;
      input                  ch3_link_i;
      input                  ch4_link_i;
      input                  ch5_link_i;
      input                  ch6_link_i;

      output                 ch1_grant_o;
      output                 ch2_grant_o;
      output                 ch3_grant_o;
      output                 ch4_grant_o;
      output                 ch5_grant_o;
      output                 ch6_grant_o;
    
      input      [65:0]      ch1_data_i;
      input      [65:0]      ch2_data_i;
      input      [65:0]      ch3_data_i;
      input      [65:0]      ch4_data_i;
      input      [65:0]      ch5_data_i;
      input      [65:0]      ch6_data_i;
			input                  ch1_fwd_i;
			input                  ch2_fwd_i;
			input                  ch3_fwd_i;
			input                  ch4_fwd_i;
			input                  ch5_fwd_i;
			input                  ch6_fwd_i;
			
			output     [65:0]      broadcast_data_o;
			output                 broadcast_fwd_o;
      
      
    //------------------------------------------------
    // Register/Wire declaration
    //------------------------------------------------
			reg        [65:0]      data_r;
			reg                    fwd_r;
			
      reg        [ 5:0]      lock_r1;
      reg        [ 5:0]      lock_r2;
		  
      reg        [ 5:0]      ch_link_r1;
      reg        [ 5:0]      ch_link_r2;
      
      wire                   ch1_link_neg;
      wire                   ch2_link_neg;
      wire                   ch3_link_neg;
      wire                   ch4_link_neg;
      wire                   ch5_link_neg;
      wire                   ch6_link_neg;
      
      wire                   ch1_grant_int;
      wire                   ch2_grant_int;
      wire                   ch3_grant_int;
      wire                   ch4_grant_int;
      wire                   ch5_grant_int;
      wire                   ch6_grant_int;

    //------------------------------------------------
    // Script ---------Code
    //------------------------------------------------
    
		  always@(posedge sys_clk) begin
		  	if(!sys_rst_n)
		  	  ch_link_r1 <= 6'b0;
		  	else
		  	  ch_link_r1 <= {ch6_link_i,ch5_link_i,ch4_link_i,ch3_link_i,ch2_link_i,ch1_link_i};
		  end
		  
		  always@(posedge sys_clk) begin
		  	if(!sys_rst_n)
		  	  ch_link_r2 <= 6'b0;
		  	else
		  	  ch_link_r2 <= ch_link_r1;
		  end
		
		//检测当前链路申请的撤销沿
		  assign  ch1_link_neg = !ch_link_r1[0] & ch_link_r2[0];
      assign  ch2_link_neg = !ch_link_r1[1] & ch_link_r2[1];
      assign  ch3_link_neg = !ch_link_r1[2] & ch_link_r2[2];
      assign  ch4_link_neg = !ch_link_r1[3] & ch_link_r2[3];
      assign  ch5_link_neg = !ch_link_r1[4] & ch_link_r2[4];
      assign  ch6_link_neg = !ch_link_r1[5] & ch_link_r2[5];
		  	
		  always@(posedge sys_clk) begin
		  	if(!sys_rst_n)
		  	  lock_r1 <= 6'b0;
		  	else if(ch1_link_neg|ch2_link_neg|ch3_link_neg|ch4_link_neg|ch5_link_neg|ch6_link_neg) //当前通道链路申请退出时，链路锁密码重置！！
		  	  lock_r1 <= 6'b0;
		  	else if( (ch1_link_i|ch2_link_i|ch3_link_i|ch4_link_i|ch5_link_i|ch6_link_i) & (!(|lock_r1)) ) begin
		  	  if     (ch1_link_i)		  	    lock_r1 <= 6'b000001;
		  	  else if(ch2_link_i)		  	    lock_r1 <= 6'b000010;
		  	  else if(ch3_link_i)		  	    lock_r1 <= 6'b000100;
		  	  else if(ch4_link_i)		  	    lock_r1 <= 6'b001000;
		  	  else if(ch5_link_i)		  	    lock_r1 <= 6'b010000;
		  	  else		  	                  lock_r1 <= 6'b100000;
		  	end
		  	else
		  	  lock_r1 <= lock_r1;
		  end
		  
		  always@(posedge sys_clk) begin
		  	if(!sys_rst_n)
		  	  lock_r2 <= 6'b0;
		  	else
		  	  lock_r2 <= lock_r1;
		  end
		  
		//检测当前链路锁的锁定沿
		  assign  ch1_grant_int = lock_r1[0] & !lock_r2[0];
      assign  ch2_grant_int = lock_r1[1] & !lock_r2[1];
      assign  ch3_grant_int = lock_r1[2] & !lock_r2[2];
      assign  ch4_grant_int = lock_r1[3] & !lock_r2[3];
      assign  ch5_grant_int = lock_r1[4] & !lock_r2[4];
      assign  ch6_grant_int = lock_r1[5] & !lock_r2[5];
		
		//链路锁定
		  always@( * )
		  begin
		  	case(lock_r1)
		  	//--------------------------------
		  	  6'b000000:  data_r = 66'b0;
		  	  6'b000001:  data_r = ch1_data_i;
		  	  6'b000010:  data_r = ch2_data_i;
		  	  6'b000100:  data_r = ch3_data_i;
		  	  6'b001000:  data_r = ch4_data_i;
		  	  6'b010000:  data_r = ch5_data_i;
		  	  6'b100000:  data_r = ch6_data_i;
		  	  default:    data_r = 'bx;
		  	//--------------------------------
		  	endcase
		  end

		  always@( * )
		  begin
		  	case(lock_r1)
		  	//--------------------------------
		  	  6'b000000:  fwd_r = 1'b0;
		  	  6'b000001:  fwd_r = ch1_fwd_i;
		  	  6'b000010:  fwd_r = ch2_fwd_i;
		  	  6'b000100:  fwd_r = ch3_fwd_i;
		  	  6'b001000:  fwd_r = ch4_fwd_i;
		  	  6'b010000:  fwd_r = ch5_fwd_i;
		  	  6'b100000:  fwd_r = ch6_fwd_i;
		  	  default:    fwd_r = 'b0;
		  	//--------------------------------
		  	endcase
		  end


    //------------------------------------------------
    // OUTPUT connection
    //------------------------------------------------
      assign  broadcast_data_o = data_r;
      assign  broadcast_fwd_o  = fwd_r;
      
      assign  ch1_grant_o = ch1_grant_int;
      assign  ch2_grant_o = ch2_grant_int;
      assign  ch3_grant_o = ch3_grant_int;
      assign  ch4_grant_o = ch4_grant_int;
      assign  ch5_grant_o = ch5_grant_int;
      assign  ch6_grant_o = ch6_grant_int;
      
endmodule
