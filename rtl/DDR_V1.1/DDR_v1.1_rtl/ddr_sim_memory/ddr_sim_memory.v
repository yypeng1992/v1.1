`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/07/10 21:12:25
// Design Name: 
// Module Name: ddr_sim_memory
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
// 
//////////////////////////////////////////////////////////////////////////////////
`define  DDR_PHY_INI_TIME  1000
`define  READ_LATENCE_TIME 0

module ddr_sim_memory(
  clk,
  rst_n,
  cmd,
  app_en,
  data_i,
  addr_i,
  data_o,
  data_o_valid,
  app_rdy,           
  app_wdf_rdy,
  phy_init_done_o
  );
  
  input                clk;    //ddr_clk_ref 200MHz
  input                rst_n;
  input     [  2:0]    cmd;
  input                app_en;
  input     [255:0]    data_i;
  input     [ 28:0]    addr_i;
  output    [255:0]    data_o;
  output               data_o_valid;
  output               app_rdy;
  output               app_wdf_rdy;
  output               phy_init_done_o;
  
  wire                 wr_en;
  wire                 rd_en;
  wire      [ 28:0]    addr;
  wire      [ 28:0]    addr_r;
  
  reg                  data_valid_r;
  reg                  app_en_r;
  reg                  phy_init_done_r;
  reg       [ 31:0]    time_cnt;  
  
  always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
	  app_en_r <= 1'b0;
	else
	  app_en_r <= app_en;
  end
  
  assign  memory_en = app_en_r | app_en;
  
  assign  wr_en = (cmd == 3'b000) & memory_en;
  
  assign  addr_r = {2'b0,addr_i>>2};  
  
  assign  addr = app_en?  addr_r : (app_en_r? (addr_r + 29'd1) : addr);
  
  always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
	  data_valid_r <= 1'b0;
	else
	  data_valid_r <= memory_en & (cmd == 3'b001); 
  end
  
//-------------------------------------------------------
// memory: 4GB
//-------------------------------------------------------
  reg    [255:0]    ddr_sim_memory[0:134217727];
  reg    [255:0]    data_o_r;
  
 /*  initial begin
    $readmemb("../sim_data/src_data_1.dat",ddr_sim_memory,16835208,16841351);
  end
  
  initial begin
    $readmemb("../sim_data/src_data_2.dat",ddr_sim_memory,18936456,18942599);
  end
  
 initial begin
    $readmemb("../sim_data/src_data_3.dat",ddr_sim_memory,49800,55943);
  end */
  
  always @(posedge clk) begin
    if(wr_en)
      ddr_sim_memory[addr] = data_i;
  end
  
  always @(posedge clk) begin
    if(~wr_en)
      data_o_r <= (`READ_LATENCE_TIME) ddr_sim_memory[addr];
  end
  
//------------------------------------------------------
// generate phy_init_done signal
//------------------------------------------------------
  always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
	  time_cnt <= 32'd0;
	else if(time_cnt == `DDR_PHY_INI_TIME)
	  time_cnt <= `DDR_PHY_INI_TIME;
	else
	  time_cnt <= time_cnt + 32'd1;
  end

  always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
	  phy_init_done_r <= 1'b0;
	else if(time_cnt == `DDR_PHY_INI_TIME)
	  phy_init_done_r <= 1'b1;
	else 
	  phy_init_done_r <= phy_init_done_r;
  end
  
//------------------------------------------------------
// output 
//------------------------------------------------------
  assign  app_rdy         = 1'b1;
  assign  app_wdf_rdy     = 1'b1;
  assign  data_o_valid    = data_valid_r;
  assign  phy_init_done_o = phy_init_done_r;
  assign  data_o          = data_o_r;
  
  
  
endmodule
