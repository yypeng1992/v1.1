`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:35:21 09/16/2016 
// Design Name: 
// Module Name:    MUL_4_IN 
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
module MUX_4_IN(
    clk,
  //  rst_n,
    
    sel_en,
    data0_i,
    data1_i,
    data2_i,
    data3_i,
    dout,
    valid
    );
    
    input                 clk;
 //   input                 rst_n;
    input    [  3:0]      sel_en;
    input    [322:0]      data0_i;
    input    [322:0]      data1_i;
    input    [322:0]      data2_i;
    input    [322:0]      data3_i;
    output   reg          valid = 1'b0;
    output   reg[322:0]   dout = {323{1'b0}};
    
   // reg [322:0] data_r;
    always @(posedge clk) begin
      /* if(!rst_n)
         valid <= 1'b0;
      else */
         valid <= |sel_en;
    end
    
    // always @ (posedge clk)
        // dout <= data_r;
    
    always @(posedge clk) begin
      /* if(!rst_n)
         dout <= 'b0;
      else  */if(sel_en[0])
         dout <= data0_i;
      else if(sel_en[1])
         dout <= data1_i;
      else if(sel_en[2])
         dout <= data2_i;
      else if(sel_en[3])
         dout <= data3_i;
      else
        // dout <= dout;  // 该条语句会导致在进入寄存器之前产生一个锁存器！
		 dout <= {323{1'b0}};
    end
    
    /* always@(posedge clk)
     (* full_case, parallel_case *)   case(sel_en)
        4'b0000: dout <= {323{1'b0}};
        4'b0001: dout <= data0_i;
        4'b0010: dout <= data1_i;
        4'b0100: dout <= data2_i;
        4'b1000: dout <= data3_i;
     endcase */
    
endmodule
