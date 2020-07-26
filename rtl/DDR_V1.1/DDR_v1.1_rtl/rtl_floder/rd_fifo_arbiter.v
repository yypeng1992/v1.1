`timescale 1ns / 1ps
`include "ddr_define.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:18 09/09/2014 
// Design Name: 
// Module Name:    ddr_app 
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
//////////////////////////////////////////////////////////////////////////////////
module rd_fifo_arbiter(	
					phy_init_done_i,
					sys_clk,
					sys_rst,
					ddr_clk,
					
//----------ddr_master-------------//
			ch1_rd_fifo_data_in, 
			ch1_rd_fifo_wr_en,
			ch1_rd_fifo_wr_count,
			ch2_rd_fifo_data_in, 
			ch2_rd_fifo_wr_en,
			ch2_rd_fifo_wr_count,
			ch3_rd_fifo_data_in, 
			ch3_rd_fifo_wr_en,
			ch3_rd_fifo_wr_count,			
			ch4_rd_fifo_data_in, 
			ch4_rd_fifo_wr_en,
			ch4_rd_fifo_wr_count,			
			ch5_rd_fifo_data_in, 
			ch5_rd_fifo_wr_en,
			ch5_rd_fifo_wr_count,
			ch6_rd_fifo_data_in, 
			ch6_rd_fifo_wr_en,
			ch6_rd_fifo_wr_count,
         
         ch1_req_i,
         ch2_req_i,
         ch3_req_i,
         ch4_req_i,
         ch5_req_i,
         ch6_req_i,
         
         ch1_address_i,
         ch2_address_i,
         ch3_address_i,
         ch4_address_i,
         ch5_address_i,
         ch6_address_i,
         
         ch1_addr_en_o,
         ch2_addr_en_o,
         ch3_addr_en_o,
         ch4_addr_en_o,
         ch5_addr_en_o,
         ch6_addr_en_o,

         rd_addr_fifo_rd_en,
         rd_addr_fifo_data_out,
         rd_addr_fifo_valid,
         rd_addr_fifo_empty,
         
         rd_ddr_fifo_wr_en,
         rd_ddr_fifo_data_in
			);
  
  input          phy_init_done_i;
  input          sys_clk;
  input          sys_rst;
  input          ddr_clk;
  
   input          ch1_req_i; 
   input          ch2_req_i;
   input          ch3_req_i;
   input          ch4_req_i;
   input          ch5_req_i;
   input          ch6_req_i;
  
  input [29:0]   ch1_address_i;
  input [29:0]   ch2_address_i;
  input [29:0]   ch3_address_i;
  input [29:0]   ch4_address_i;
  input [29:0]   ch5_address_i;
  input [29:0]   ch6_address_i;
  
  output         ch1_addr_en_o;
  output         ch2_addr_en_o;
  output         ch3_addr_en_o;
  output         ch4_addr_en_o;
  output         ch5_addr_en_o;
  output         ch6_addr_en_o; 
  
    
  output [511:0]         ch1_rd_fifo_data_in; 
  output    		         ch1_rd_fifo_wr_en;
  input  [5:0]           ch1_rd_fifo_wr_count;
  output [511:0]         ch2_rd_fifo_data_in; 
  output                  ch2_rd_fifo_wr_en; 
  input  [5:0]           ch2_rd_fifo_wr_count;
  output [511:0]         ch3_rd_fifo_data_in; 
  output                  ch3_rd_fifo_wr_en;				  
  input  [5:0]           ch3_rd_fifo_wr_count;
  output [511:0]         ch4_rd_fifo_data_in; 
  output                  ch4_rd_fifo_wr_en;				  
  input  [5:0]           ch4_rd_fifo_wr_count;
  output [511:0]         ch5_rd_fifo_data_in; 
  output                  ch5_rd_fifo_wr_en;				  
  input  [5:0]           ch5_rd_fifo_wr_count;
  output [511:0]         ch6_rd_fifo_data_in; 
  output                  ch6_rd_fifo_wr_en;
  input  [5:0]           ch6_rd_fifo_wr_count;
  
  output                 rd_addr_fifo_empty;
  output                 rd_addr_fifo_valid;
  output  [29:0]         rd_addr_fifo_data_out;
  input                  rd_addr_fifo_rd_en;
  
  input   [255:0]        rd_ddr_fifo_data_in;
  input                  rd_ddr_fifo_wr_en;

 parameter      SLICE_NUM=6'd32;
  
  reg           phy_init_done_r;
  reg           phy_init_done_r1;
  
  reg  [5:0]    ch_grant_r = 6'b000000;
  reg  [5:0]    ch_addr_grant_r;
  reg           ch_turn_en;
  reg           turn_over = 1'b0;
  
  reg  [5:0]    slice_cnt;
  reg  [5:0]    addr_slice_cnt;
  reg  [5:0]    ch1_address_cnt;
  reg  [5:0]    ch2_address_cnt;
  reg  [5:0]    ch3_address_cnt;
  reg  [5:0]    ch4_address_cnt;
  reg  [5:0]    ch5_address_cnt;
  reg  [5:0]    ch6_address_cnt;
  
  reg           rd_addr_fifo_wr_en;
  reg  [29:0]   rd_addr_fifo_data_in;
  
  reg           rd_ddr_fifo_rd_en;
  wire [511:0]  rd_ddr_fifo_data_out;
  

	rd_ddr_fifo  rd_ddr_fifo(
         .rst     (~sys_rst),
         
         .wr_clk  (ddr_clk),
         .wr_en   (rd_ddr_fifo_wr_en),
         .din     (rd_ddr_fifo_data_in),
         .full    (),
         
         .rd_clk  (sys_clk),
         .rd_en   (rd_ddr_fifo_rd_en),
         .dout    (rd_ddr_fifo_data_out),
         .valid   (rd_ddr_fifo_valid),
         .empty   (rd_ddr_fifo_empty)
        ); 
        
        
  rd_addr_fifo rd_addr_fifo (
         .rst     (~sys_rst),
         
         .wr_clk  (sys_clk),
         .wr_en   (rd_addr_fifo_wr_en),
         .din     (rd_addr_fifo_data_in),
         .full    (),
         
         .rd_clk  (ddr_clk),
         .rd_en   (rd_addr_fifo_rd_en),
         .dout    (rd_addr_fifo_data_out),
         .valid   (rd_addr_fifo_valid),
         .empty   (rd_addr_fifo_empty)
        ); 
          
          
 always @(posedge  sys_clk)
    begin
     phy_init_done_r<=phy_init_done_i;
     phy_init_done_r1<=phy_init_done_r;
    end
    
	
//***********************************************************
// FSM to issue address to ddr
//***********************************************************
always @(posedge sys_clk)
   if (~sys_rst)
       ch_addr_grant_r<=6'b000000;
   else 
   begin
   (*full_case*)
      case (ch_addr_grant_r)
      6'b000000:
         begin 
               if ((phy_init_done_r&!phy_init_done_r1)|turn_over)
                     ch_addr_grant_r<=6'b000001;
               else
                     ch_addr_grant_r<=6'b000000;
         end
      6'b000001:
         begin
               if ((ch1_address_cnt==SLICE_NUM)|!ch1_req_i)
                     ch_addr_grant_r<=6'b000010;
               else
                     ch_addr_grant_r<=6'b000001;
         end
      6'b000010: 
         begin 
               if ((ch2_address_cnt==SLICE_NUM)|!ch2_req_i)
                     ch_addr_grant_r<=6'b000100;
               else
                     ch_addr_grant_r<=6'b000010;  
         end
      6'b000100:
         begin
               if ((ch3_address_cnt==SLICE_NUM)|!ch3_req_i)
                     ch_addr_grant_r<=6'b001000;
               else
                     ch_addr_grant_r<=6'b000100;
         end
      6'b001000:
         begin 
               if ((ch4_address_cnt==SLICE_NUM)|!ch4_req_i)
                     ch_addr_grant_r<=6'b010000;
               else
                     ch_addr_grant_r<=6'b001000;
         end
      6'b010000:
         begin 
               if ((ch5_address_cnt==SLICE_NUM)|!ch5_req_i)
                     ch_addr_grant_r<=6'b100000;
               else
                     ch_addr_grant_r<=6'b010000;
         end
      6'b100000: 
         begin
               if ((ch6_address_cnt==SLICE_NUM)|!ch6_req_i)
                     ch_addr_grant_r<=6'b000000;
               else
                     ch_addr_grant_r<=6'b100000;
         end
      endcase
   end     
 
 //6个通道轮转一次
  always @(posedge sys_clk)
     /* if (~sys_rst)
       turn_over<=1'b0;
     else  */if(ch_grant_r[5] & (slice_cnt==ch6_address_cnt))
      turn_over<=1'b1;
     else
      turn_over<=1'b0;
      
    

//数据通道ch1发起读数据突发的次数
always @(posedge sys_clk)
  if (~sys_rst)
    ch1_address_cnt<=6'b0;
  else if (turn_over)
    ch1_address_cnt<=6'b0;
  else if (ch1_addr_en_o)
    ch1_address_cnt<=ch1_address_cnt+1;
  else 
    ch1_address_cnt<=ch1_address_cnt;


//数据通道ch2发起读数据突发的次数
 always @(posedge sys_clk)
  if (~sys_rst)
    ch2_address_cnt<=6'b0;
  else if (turn_over)
    ch2_address_cnt<=6'b0;
  else if (ch2_addr_en_o)
    ch2_address_cnt<=ch2_address_cnt+1;
  else 
    ch2_address_cnt<=ch2_address_cnt;
    
//数据通道ch3发起读数据突发的次数
 always @(posedge sys_clk)
  if (~sys_rst)
    ch3_address_cnt<=6'b0;
  else if (turn_over)
    ch3_address_cnt<=6'b0;
  else if (ch3_addr_en_o)
    ch3_address_cnt<=ch3_address_cnt+1;
  else 
    ch3_address_cnt<=ch3_address_cnt;         
      
//数据通道ch4发起读数据突发的次数
always @(posedge sys_clk)
  if (~sys_rst)
    ch4_address_cnt<=6'b0;
  else if (turn_over)
    ch4_address_cnt<=6'b0;
  else if (ch4_addr_en_o)
    ch4_address_cnt<=ch4_address_cnt+1;
  else 
    ch4_address_cnt<=ch4_address_cnt;

//数据通道ch5发起读数据突发的次数
always @(posedge sys_clk)
  if (~sys_rst)
    ch5_address_cnt<=6'b0;
  else if (turn_over)
    ch5_address_cnt<=6'b0;
  else if (ch5_addr_en_o)
    ch5_address_cnt<=ch5_address_cnt+1;
  else 
    ch5_address_cnt<=ch5_address_cnt;
    
//数据通道ch6发起读数据突发的次数
always @(posedge sys_clk)
  if (~sys_rst)
    ch6_address_cnt<=6'b0;
  else if (turn_over)
    ch6_address_cnt<=6'b0;
  else if (ch6_addr_en_o)
    ch6_address_cnt<=ch6_address_cnt+1;
  else 
    ch6_address_cnt<=ch6_address_cnt;
 
 
 //本地rd_addr_fifo的地址写入端的信号控制
 always @( * )
  begin
  (*full_case*)
  case (ch_addr_grant_r)
   6'b000000: begin
	              rd_addr_fifo_wr_en=1'b0;
	              rd_addr_fifo_data_in=30'd0;
              end
   6'b000001: begin
	              rd_addr_fifo_wr_en=ch1_req_i&(ch1_address_cnt<SLICE_NUM);
	              rd_addr_fifo_data_in=ch1_address_i;
              end             
   6'b000010: begin
	              rd_addr_fifo_wr_en=ch2_req_i&(ch2_address_cnt<SLICE_NUM);
	              rd_addr_fifo_data_in=ch2_address_i;
              end 
   6'b000100: begin
                  rd_addr_fifo_wr_en=ch3_req_i&(ch3_address_cnt<SLICE_NUM);
                  rd_addr_fifo_data_in=ch3_address_i;
              end
   6'b001000:begin
	             rd_addr_fifo_wr_en=ch4_req_i&(ch4_address_cnt<SLICE_NUM);
	             rd_addr_fifo_data_in=ch4_address_i;
             end
   6'b010000:begin
	             rd_addr_fifo_wr_en=ch5_req_i&(ch5_address_cnt<SLICE_NUM);
	             rd_addr_fifo_data_in=ch5_address_i;
            end 
   6'b100000:begin
	             rd_addr_fifo_wr_en=ch6_req_i&(ch6_address_cnt<SLICE_NUM);
	             rd_addr_fifo_data_in=ch6_address_i;
            end 
   endcase
  end                     
 
//chx_rd_addr_en_o的产生
assign  ch1_addr_en_o=ch_addr_grant_r[0]&rd_addr_fifo_wr_en;
assign  ch2_addr_en_o=ch_addr_grant_r[1]&rd_addr_fifo_wr_en;
assign  ch3_addr_en_o=ch_addr_grant_r[2]&rd_addr_fifo_wr_en;
assign  ch4_addr_en_o=ch_addr_grant_r[3]&rd_addr_fifo_wr_en;
assign  ch5_addr_en_o=ch_addr_grant_r[4]&rd_addr_fifo_wr_en;
assign  ch6_addr_en_o=ch_addr_grant_r[5]&rd_addr_fifo_wr_en;
//*************************************************************//




//***********************************************************
// FSM to get data from ddr
//***********************************************************
always @(posedge sys_clk)
  /*  if (~sys_rst)
       ch_grant_r<=6'b000000;
   else  */begin
   (*full_case*)
    case (ch_grant_r)
     6'b000000:
                if (|ch_addr_grant_r)                ch_grant_r<=6'b000001;
                else                                   ch_grant_r<=6'b000000;
     6'b000001:
                if (slice_cnt==ch1_address_cnt)     ch_grant_r<=6'b000010;
                else                                   ch_grant_r<=6'b000001;
     6'b000010:                                          
                if (slice_cnt==ch2_address_cnt)     ch_grant_r<=6'b000100;
                else                                   ch_grant_r<=6'b000010;					 
     6'b000100:                                          
                if (slice_cnt==ch3_address_cnt)     ch_grant_r<=6'b001000;
                else                                   ch_grant_r<=6'b000100;
     6'b001000:                                          
                if (slice_cnt==ch4_address_cnt)     ch_grant_r<=6'b010000;
                else                                   ch_grant_r<=6'b001000;
     6'b010000:                                          
                if (slice_cnt==ch5_address_cnt)     ch_grant_r<=6'b100000;
                else                                   ch_grant_r<=6'b010000;
     6'b100000:                                          
                if (slice_cnt==ch6_address_cnt)     ch_grant_r<=6'b000000;
                else                                   ch_grant_r<=6'b100000;
     endcase
   end
       
	//监测有效数据的个数-----------即成功读数据突发的次数
   always @(posedge sys_clk)
     if (~sys_rst)
       slice_cnt<=6'd0;
     else if (ch_turn_en)
       slice_cnt<=6'd0;
     else if (rd_ddr_fifo_valid)
       slice_cnt<=slice_cnt+1;
     else
       slice_cnt<=slice_cnt;
	   
  always @( * )
      (*full_case*)
      case (ch_grant_r)
       6'b000000:ch_turn_en=1'b0;
       6'b000001:ch_turn_en=(slice_cnt==ch1_address_cnt);//&ch1_skip;
       6'b000010:ch_turn_en=(slice_cnt==ch2_address_cnt);//&ch2_skip;
       6'b000100:ch_turn_en=(slice_cnt==ch3_address_cnt);//&ch3_skip;
       6'b001000:ch_turn_en=(slice_cnt==ch4_address_cnt);//&ch4_skip;
       6'b010000:ch_turn_en=(slice_cnt==ch5_address_cnt);//&ch5_skip; 
       6'b100000:ch_turn_en=(slice_cnt==ch6_address_cnt);//&ch6_skip;
      endcase 

 
	//监测读数据使能的次数----------即发起读数据突发的次数
    always @(posedge sys_clk)
     if (~sys_rst)
       addr_slice_cnt<=6'd0;
     else if (ch_turn_en)
       addr_slice_cnt<=6'd0;
     else if (rd_ddr_fifo_rd_en)
       addr_slice_cnt<=addr_slice_cnt+1;
     else
       addr_slice_cnt<=addr_slice_cnt;

 //本地rd_ddr_fifo的数据读出端的信号控制
 always @( * ) 
   begin
   (*full_case*)
    case (ch_grant_r)
   6'b000000:  rd_ddr_fifo_rd_en=1'b0;
   6'b000001:  rd_ddr_fifo_rd_en=(addr_slice_cnt<ch1_address_cnt)&(ch1_rd_fifo_wr_count<6'd60)&!rd_ddr_fifo_empty;
   6'b000010:  rd_ddr_fifo_rd_en=(addr_slice_cnt<ch2_address_cnt)&(ch2_rd_fifo_wr_count<6'd60)&!rd_ddr_fifo_empty;
   6'b000100:  rd_ddr_fifo_rd_en=(addr_slice_cnt<ch3_address_cnt)&(ch3_rd_fifo_wr_count<6'd60)&!rd_ddr_fifo_empty;
   6'b001000:  rd_ddr_fifo_rd_en=(addr_slice_cnt<ch4_address_cnt)&(ch4_rd_fifo_wr_count<6'd60)&!rd_ddr_fifo_empty;
   6'b010000:  rd_ddr_fifo_rd_en=(addr_slice_cnt<ch5_address_cnt)&(ch5_rd_fifo_wr_count<6'd60)&!rd_ddr_fifo_empty;
   6'b100000:  rd_ddr_fifo_rd_en=(addr_slice_cnt<ch6_address_cnt)&(ch6_rd_fifo_wr_count<6'd60)&!rd_ddr_fifo_empty;
   endcase
   end 

//chx_rd_fifo_data_in && chx_rd_fifo_wr_en的产生
assign  ch1_rd_fifo_data_in=rd_ddr_fifo_data_out;
assign  ch1_rd_fifo_wr_en=ch_grant_r[0]&rd_ddr_fifo_valid;

assign  ch2_rd_fifo_data_in=rd_ddr_fifo_data_out;
assign  ch2_rd_fifo_wr_en=ch_grant_r[1]&rd_ddr_fifo_valid;

assign  ch3_rd_fifo_data_in=rd_ddr_fifo_data_out;
assign  ch3_rd_fifo_wr_en=ch_grant_r[2]&rd_ddr_fifo_valid;

assign  ch4_rd_fifo_data_in=rd_ddr_fifo_data_out;
assign  ch4_rd_fifo_wr_en=ch_grant_r[3]&rd_ddr_fifo_valid;

assign  ch5_rd_fifo_data_in=rd_ddr_fifo_data_out;
assign  ch5_rd_fifo_wr_en=ch_grant_r[4]&rd_ddr_fifo_valid;

assign  ch6_rd_fifo_data_in=rd_ddr_fifo_data_out;
assign  ch6_rd_fifo_wr_en=ch_grant_r[5]&rd_ddr_fifo_valid;

endmodule
