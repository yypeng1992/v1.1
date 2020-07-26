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
module wr_fifo_arbiter(			     
//----------ddr_master-------------//
         ch1_wr_fifo_data_out,
         ch1_wr_fifo_rd_en,
         ch1_wr_fifo_valid,
         ch1_wr_fifo_empty,
         
         ch2_wr_fifo_data_out,
         ch2_wr_fifo_rd_en,
         ch2_wr_fifo_valid,
         ch2_wr_fifo_empty,
         
         ch3_wr_fifo_data_out,
         ch3_wr_fifo_rd_en,
         ch3_wr_fifo_valid,
         ch3_wr_fifo_empty,
         
         ch4_wr_fifo_data_out,
         ch4_wr_fifo_rd_en,
         ch4_wr_fifo_valid,
         ch4_wr_fifo_empty,
         
         ch5_wr_fifo_data_out,
         ch5_wr_fifo_rd_en,
         ch5_wr_fifo_valid,
         ch5_wr_fifo_empty,
         
         ch6_wr_fifo_data_out,
         ch6_wr_fifo_rd_en,
         ch6_wr_fifo_valid,
         ch6_wr_fifo_empty,
         
         
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
         
         
         wr_addr_fifo_rd_en,
         wr_addr_fifo_data_out,
         wr_addr_fifo_valid,
         wr_addr_fifo_empty,
         
         wr_ddr_fifo_rd_en,
         wr_ddr_fifo_data_out,
         wr_ddr_fifo_valid,
         wr_ddr_fifo_empty,
         wr_ddr_fifo_rd_count,
         
         phy_init_done_i,
         sys_clk,
         sys_rst,
         ddr_clk			
                      );
  

  
  input          phy_init_done_i;
  input          sys_rst;
  input          sys_clk;
  input          ddr_clk;
  
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
    
       input [511:0]           ch1_wr_fifo_data_out;
       input                   ch1_wr_fifo_empty;
       input                   ch1_wr_fifo_valid;  
       output                  ch1_wr_fifo_rd_en;			  
       
       input [511:0]           ch2_wr_fifo_data_out;
       input                   ch2_wr_fifo_empty;
       input                   ch2_wr_fifo_valid;	
       output                  ch2_wr_fifo_rd_en; 
       
       input [511:0]           ch3_wr_fifo_data_out;
       input                   ch3_wr_fifo_empty;
       input                   ch3_wr_fifo_valid;  
       output                  ch3_wr_fifo_rd_en;				  
       
       input [511:0]           ch4_wr_fifo_data_out;
       input                   ch4_wr_fifo_empty;
       input                   ch4_wr_fifo_valid;  
       output                  ch4_wr_fifo_rd_en;				  
       
       input [511:0]           ch5_wr_fifo_data_out;
       input                   ch5_wr_fifo_empty;
       input                   ch5_wr_fifo_valid;  
       output                  ch5_wr_fifo_rd_en;				  
       
       input [511:0]           ch6_wr_fifo_data_out;
       input                   ch6_wr_fifo_empty;
       input                   ch6_wr_fifo_valid;  
       output                  ch6_wr_fifo_rd_en;
       
       
       input                   wr_addr_fifo_rd_en;
       output     [29:0]       wr_addr_fifo_data_out;
       output                  wr_addr_fifo_valid;
       output                  wr_addr_fifo_empty;
       
       input                   wr_ddr_fifo_rd_en;
       output     [255:0]      wr_ddr_fifo_data_out;
       output                  wr_ddr_fifo_empty;
       output                  wr_ddr_fifo_valid;  
       output     [8:0]        wr_ddr_fifo_rd_count;    
	

  parameter     SLICE_NUM=7'd41;
    
  wire          ch1_wr_fifo_rd_en;
  wire          ch1_addr_en_o;
  reg           ch1_addr_en_r;
   
  wire          ch2_wr_fifo_rd_en; 
  wire          ch2_addr_en_o;  
  reg           ch2_addr_en_r;
  
  wire          ch3_wr_fifo_rd_en;
  wire          ch3_addr_en_o;  
  reg           ch3_addr_en_r;
  
  wire          ch4_wr_fifo_rd_en;
  wire          ch4_addr_en_o;  
  reg           ch4_addr_en_r;
   
  wire          ch5_wr_fifo_rd_en;
  wire          ch5_addr_en_o;  
  reg           ch5_addr_en_r;   
                   
  wire          ch6_wr_fifo_rd_en;
  wire          ch6_addr_en_o;  
  reg           ch6_addr_en_r; 
  
  reg           phy_init_done_r;
  reg           phy_init_done_r1;
  
  reg  [5:0]    ch_grant_r;
  //reg  [5:0]    ch_grant_r1;
  
  reg  [6:0]    slice_cnt;
  
  reg            wr_ddr_fifo_wr_en;
  reg   [511:0]  wr_ddr_fifo_data_in;
  wire           wr_ddr_fifo_full;
  
  wire           wr_addr_fifo_wr_en;
  reg   [29:0]   wr_addr_fifo_data_in;
  
  wr_ddr_fifo    wr_ddr_fifo(
         .rst     (~sys_rst),
         
         .wr_clk  (sys_clk),
         .wr_en   (wr_ddr_fifo_wr_en),
         .din     (wr_ddr_fifo_data_in),
         .full    (wr_ddr_fifo_full),
         
         .rd_clk  (ddr_clk),
         .rd_en   (wr_ddr_fifo_rd_en),
         .dout    (wr_ddr_fifo_data_out),
         .empty   (wr_ddr_fifo_empty),
         .valid   (wr_ddr_fifo_valid),
         .rd_data_count  (wr_ddr_fifo_rd_count)
        ); 
  
  wr_addr_fifo wr_addr_fifo (
         .rst     (~sys_rst),
         
         .wr_clk  (sys_clk),
         .wr_en   (wr_addr_fifo_wr_en),
         .din     (wr_addr_fifo_data_in),
         .full    (),
         
         .rd_clk  (ddr_clk),
         .rd_en   (wr_addr_fifo_rd_en),
         .dout    (wr_addr_fifo_data_out),
         .valid   (wr_addr_fifo_valid),
         .empty   (wr_addr_fifo_empty)
        ); 
  
	// because 'phy_init_done_i' across the different clock field.
  always @(posedge  sys_clk or negedge sys_rst)
   if (~sys_rst)
    begin
     phy_init_done_r<=1'b0;
     phy_init_done_r1<=1'b0;
    end
   else
    begin
     phy_init_done_r<=phy_init_done_i;
     phy_init_done_r1<=phy_init_done_r;
    end
    
	
	
  //*********************************************
  // FSM
  //*********************************************
   always @(posedge sys_clk or negedge sys_rst)
     if (~sys_rst)
       slice_cnt<=7'd0;
     else if (slice_cnt==SLICE_NUM)
       slice_cnt<=7'd0;
     else 
       slice_cnt<=slice_cnt+1;
    
   // always @(posedge sys_clk or negedge sys_rst)
     // if (~sys_rst)
      // ch_grant_r1<=6'b0;
     // else
      // ch_grant_r1<=ch_grant_r;
	  
 always @(posedge sys_clk or negedge sys_rst)
    if (~sys_rst)
      ch_grant_r<=6'b000000;
    else 
     begin
      case (ch_grant_r)
       6'b000000:
                  if (phy_init_done_r1)       ch_grant_r<=6'b000001;
                  else                          ch_grant_r<=6'b000000;
       6'b000001:
                  if (slice_cnt==SLICE_NUM)   ch_grant_r<=6'b000010;
                  else                          ch_grant_r<=6'b000001;
       6'b000010:                               
                  if (slice_cnt==SLICE_NUM)   ch_grant_r<=6'b000100;
                  else                          ch_grant_r<=6'b000010;
       6'b000100:                               
                  if (slice_cnt==SLICE_NUM)   ch_grant_r<=6'b001000;
                  else                          ch_grant_r<=6'b000100;
       6'b001000:                               
                  if (slice_cnt==SLICE_NUM)   ch_grant_r<=6'b010000;
                  else                          ch_grant_r<=6'b001000;
       6'b010000:                               
                  if (slice_cnt==SLICE_NUM)   ch_grant_r<=6'b100000;
                  else                          ch_grant_r<=6'b010000;
       6'b100000:                               
                  if (slice_cnt==SLICE_NUM)   ch_grant_r<=6'b000001;
                  else                          ch_grant_r<=6'b100000;
	    default:
                  ch_grant_r<=6'b000000;
     endcase
	end
    
		
		 
 always @(posedge sys_clk or negedge sys_rst)
	 if (~sys_rst)
	 	begin
			wr_ddr_fifo_wr_en<=1'b0;
			wr_ddr_fifo_data_in<=512'd0;
			wr_addr_fifo_data_in<=30'd0;
		end
	else begin
      case (ch_grant_r)
       6'b000000: begin
              wr_ddr_fifo_wr_en<=1'b0;
              wr_ddr_fifo_data_in<=512'd0;
			 wr_addr_fifo_data_in<=30'd0;
              end
      6'b000001: begin
              wr_ddr_fifo_wr_en<=ch1_wr_fifo_valid;
              wr_ddr_fifo_data_in<=ch1_wr_fifo_data_out;
			 wr_addr_fifo_data_in<=ch1_address_i;
              end             
      6'b000010: begin
              wr_ddr_fifo_wr_en<=ch2_wr_fifo_valid;
              wr_ddr_fifo_data_in<=ch2_wr_fifo_data_out;
			 wr_addr_fifo_data_in<=ch2_address_i;
              end 
      6'b000100: begin
              wr_ddr_fifo_wr_en<=ch3_wr_fifo_valid;
              wr_ddr_fifo_data_in<=ch3_wr_fifo_data_out;
			 wr_addr_fifo_data_in<=ch3_address_i;
              end
      6'b001000:begin
              wr_ddr_fifo_wr_en<=ch4_wr_fifo_valid;
              wr_ddr_fifo_data_in<=ch4_wr_fifo_data_out;
			 wr_addr_fifo_data_in<=ch4_address_i;
             end
    6'b010000:begin
              wr_ddr_fifo_wr_en<=ch5_wr_fifo_valid;
              wr_ddr_fifo_data_in<=ch5_wr_fifo_data_out;
			 wr_addr_fifo_data_in<=ch5_address_i;
            end 
    6'b100000:begin
              wr_ddr_fifo_wr_en<=ch6_wr_fifo_valid;
              wr_ddr_fifo_data_in<=ch6_wr_fifo_data_out;
			 wr_addr_fifo_data_in<=ch6_address_i;
            end				
   endcase
  end                        
 
  assign  wr_addr_fifo_wr_en=wr_ddr_fifo_wr_en;
  
  

always @(posedge sys_clk or negedge sys_rst)
   if (~sys_rst)
    begin
             ch1_addr_en_r<=1'b0;
			ch2_addr_en_r<=1'b0;
			ch3_addr_en_r<=1'b0;
			ch4_addr_en_r<=1'b0;
			ch5_addr_en_r<=1'b0;
			ch6_addr_en_r<=1'b0;
	  end
	 else
	  begin
			ch1_addr_en_r<=ch1_wr_fifo_rd_en;
			ch2_addr_en_r<=ch2_wr_fifo_rd_en;
			ch3_addr_en_r<=ch3_wr_fifo_rd_en;
			ch4_addr_en_r<=ch4_wr_fifo_rd_en;
			ch5_addr_en_r<=ch5_wr_fifo_rd_en;
			ch6_addr_en_r<=ch6_wr_fifo_rd_en;
	 end
	
assign  ch1_addr_en_o=ch1_addr_en_r;
assign  ch2_addr_en_o=ch2_addr_en_r;
assign  ch3_addr_en_o=ch3_addr_en_r;
assign  ch4_addr_en_o=ch4_addr_en_r;
assign  ch5_addr_en_o=ch5_addr_en_r;
assign  ch6_addr_en_o=ch6_addr_en_r;

assign  ch1_wr_fifo_rd_en=ch_grant_r[0]&!ch1_wr_fifo_empty&!(slice_cnt==SLICE_NUM)&!wr_ddr_fifo_full;
assign  ch2_wr_fifo_rd_en=ch_grant_r[1]&!ch2_wr_fifo_empty&!(slice_cnt==SLICE_NUM)&!wr_ddr_fifo_full;
assign  ch3_wr_fifo_rd_en=ch_grant_r[2]&!ch3_wr_fifo_empty&!(slice_cnt==SLICE_NUM)&!wr_ddr_fifo_full;
assign  ch4_wr_fifo_rd_en=ch_grant_r[3]&!ch4_wr_fifo_empty&!(slice_cnt==SLICE_NUM)&!wr_ddr_fifo_full;
assign  ch5_wr_fifo_rd_en=ch_grant_r[4]&!ch5_wr_fifo_empty&!(slice_cnt==SLICE_NUM)&!wr_ddr_fifo_full;
assign  ch6_wr_fifo_rd_en=ch_grant_r[5]&!ch6_wr_fifo_empty&!(slice_cnt==SLICE_NUM)&!wr_ddr_fifo_full;

endmodule




