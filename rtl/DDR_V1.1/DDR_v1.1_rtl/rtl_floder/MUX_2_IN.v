`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:44:32 09/17/2016 
// Design Name: 
// Module Name:    MUX_2_IN 
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
module MUX_2_IN(
    clk,
  //  rst_n,
    
    sel_en,
    data0_i,
    data1_i,
    dout,
    valid
    );
    
    input                 clk;
  //  input                 rst_n;
    input    [  1:0]      sel_en;
    input    [322:0]      data0_i;
    input    [322:0]      data1_i;
    output   reg          valid;
    output   reg[322:0]   dout;
    
    //reg [322:0] data_r;
    
    always @(posedge clk) begin
      /* if(!rst_n)
         valid <= 1'b0;
      else */
         valid <= |sel_en;
    end
    
    //always @ (posedge clk)
    //    dout <= data_r;
    
    always @(posedge clk) begin
      /* if(!rst_n)
         dout <= 'b0;
      else  */if(sel_en[0])
         dout <= data0_i;
      else if(sel_en[1])
         dout <= data1_i;
      else
         dout <= dout;
    end
    
    // always@( sel_en )
     // (* full_case, parallel_case *)   case(sel_en)
        // 2'b00: data_r = {323{1'b0}};
        // 2'b01: data_r = data0_i;
        // 2'b10: data_r = data1_i;
     // endcase
endmodule
