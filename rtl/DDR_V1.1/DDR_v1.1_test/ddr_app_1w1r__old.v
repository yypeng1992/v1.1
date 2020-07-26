`timescale 1ns / 1ps

`define Burst_Length 8

module ddr_app_1w1r(
  clk,
  rst_n,

  raddr_fifo_rd_en,
  raddr_fifo_dout,
  raddr_fifo_empty,
  raddr_fifo_valid,
  rdata_fifo_din,
  rdata_fifo_wr_en,
//  rdata_fifo_depth,
  
  waddr_fifo_rd_en,
  waddr_fifo_dout,
  waddr_fifo_empty,
  waddr_fifo_valid,
  wdata_fifo_rd_en,
  wdata_fifo_dout,
  wdata_fifo_empty,
  wdata_fifo_valid,
  wdata_fifo_rdepth,

  //DDR user interface
  app_rdy,            
  app_wdf_rdy, 
  app_rd_data_valid,       
  app_rd_data,        
  app_en,             
  app_cmd,            
  app_addr,           
  app_wdf_wren,       
  app_wdf_data,       
  app_wdf_mask,       
  app_wdf_end                            
  );

  //Parameter
  //parameter RDATA_FIFO_DEPTH          = 1024;
  parameter WDATA_FIFO_DEPTH          = 512;

  parameter WDATA_FIFO_DEPTH_SWH      = 384;
  parameter WDATA_FIFO_DEPTH_SWL      = 128;
  parameter SAMPLE_RATE               = 64;


  //Input And Output
  input               clk;
  input               rst_n;

  output              raddr_fifo_rd_en;
  input    [29:0]     raddr_fifo_dout;
  input               raddr_fifo_empty;
  input               raddr_fifo_valid;
  output   [255:0]    rdata_fifo_din;
  output              rdata_fifo_wr_en;
//  input    [ 9:0]     rdata_fifo_depth;

  output              waddr_fifo_rd_en;
  input    [29:0]     waddr_fifo_dout;
  input               waddr_fifo_empty;
  input               waddr_fifo_valid;
  output              wdata_fifo_rd_en;
  input    [255:0]    wdata_fifo_dout;
  input               wdata_fifo_empty;
  input               wdata_fifo_valid;
  input    [ 8:0]     wdata_fifo_rdepth;

  
input               app_rdy;
input               app_wdf_rdy; 

output              app_en;
output   [2:0]      app_cmd;
output   [28:0]     app_addr;

output              app_wdf_wren;
output   [255:0]    app_wdf_data;
output              app_wdf_end;
output   [31:0]     app_wdf_mask;

input               app_rd_data_valid; 
input    [255:0]    app_rd_data;

  //Register And Wire
  reg                 ddr_ctrl_state;
  reg                 ddr_ctrl_state_dl1;
  reg                 ddr_ctrl_state_dl2;

  reg      [255:0]    app_wdf_data_r;
  reg                 app_wdf_wren_r;
  reg                 app_wdf_end_r;
  reg                 app_rdy_r;
  reg                 rvalid_left_r;
  reg                 wvalid_left_r;
  reg      [ 1:0]     r2w_cnt;
  reg      [ 1:0]     w2r_cnt;
  reg      [ 9:0]     sample_cnt;
  reg                 wdf_sample;
  reg                 burst_sample_w;
  reg                 burst_sample_r;

  wire                sample_trigger;
  wire                raddr_rd_en;
  wire                wdata_rd_en;
  wire                rapp_en_int;
  wire                wapp_en_int;
  wire                app_en_int;   
  wire     [ 2:0]     app_cmd_int;    
  wire     [28:0]     app_addr_int;


  //--------------------------------------------------------------------------
  // Register 
  //--------------------------------------------------------------------------

  always @(posedge clk) begin
    if(~rst_n)
      sample_cnt <= 10'b0;
    else if(sample_trigger)
      sample_cnt <= 10'b0;
    else
      sample_cnt <= sample_cnt + 1'b1;
  end

  always @(posedge clk) begin
    if(~rst_n)                                                                     // default: Read
      ddr_ctrl_state <= 1'b0;
    else if(sample_trigger & app_rdy_r & app_rdy & waddr_fifo_empty)                                // keep R_mode
      ddr_ctrl_state <= 1'b0;
    else if(sample_trigger & app_rdy_r & app_rdy & raddr_fifo_empty)                                // if(!waddr_fifo_empty), keep W_mode
      ddr_ctrl_state <= 1'b1;
    else if(sample_trigger & app_rdy_r & app_rdy & wdata_fifo_rdepth >= WDATA_FIFO_DEPTH_SWH)       // R_mode switch to W_mode at 0.75*depth
      ddr_ctrl_state <= 1'b1;
    else if(sample_trigger & app_rdy_r & app_rdy & wdata_fifo_rdepth <= WDATA_FIFO_DEPTH_SWL)       // W_mode switch to R_mode at 0.25*depth
      ddr_ctrl_state <= 1'b0;
    else
      ddr_ctrl_state <= ddr_ctrl_state;
  end

  always @(posedge clk) begin
    if(~rst_n)
      ddr_ctrl_state_dl1 <= 1'b0;
    else
      ddr_ctrl_state_dl1 <= ddr_ctrl_state;
  end

  always @(posedge clk) begin
    if(~rst_n)
      ddr_ctrl_state_dl2 <= 1'b0;
    else
      ddr_ctrl_state_dl2 <= ddr_ctrl_state_dl1;
  end

  always @(posedge clk) begin
    if(~rst_n)
      r2w_cnt <= 2'b00;
    else if((r2w_cnt == 2'b00) & ddr_ctrl_state & !ddr_ctrl_state_dl1)
      r2w_cnt <= 2'b01;
    else if(r2w_cnt == 2'b01)
      r2w_cnt <= 2'b10;
    else if(r2w_cnt == 2'b10)
      r2w_cnt <= 2'b11;
    else if((r2w_cnt == 2'b11) & !ddr_ctrl_state & ddr_ctrl_state_dl1)
      r2w_cnt <= 2'b00;
    else
      r2w_cnt <= r2w_cnt;
  end

  always @(posedge clk) begin
    if(~rst_n)
      w2r_cnt <= 2'b00;
    else if((w2r_cnt == 2'b00) & !ddr_ctrl_state & ddr_ctrl_state_dl1)
      w2r_cnt <= 2'b01;
    else if(w2r_cnt == 2'b01)
      w2r_cnt <= 2'b10;
    else if(w2r_cnt == 2'b10)
      w2r_cnt <= 2'b11;
    else if((w2r_cnt == 2'b11) & ddr_ctrl_state & !ddr_ctrl_state_dl1)
      w2r_cnt <= 2'b00;
    else
      w2r_cnt <= w2r_cnt;
  end

  always @(posedge clk) begin
    if(~rst_n)
      app_wdf_data_r <= 256'b0;
    else
      app_wdf_data_r <= wdata_fifo_dout;
  end

  always @(posedge clk) begin
    if(~rst_n)
      app_wdf_wren_r <= 1'b0;
    else
      app_wdf_wren_r <= wdata_fifo_valid;
  end

  always @(posedge clk) begin
    if(~rst_n)
      wdf_sample <= 1'b0;
    else if(wdata_fifo_valid)
      wdf_sample <= ~wdf_sample;
    else
      wdf_sample <= wdf_sample;
  end

  always @(posedge clk) begin
    if(~rst_n)
      app_wdf_end_r <= 1'b0;
    else
      app_wdf_end_r <= wdf_sample & wdata_fifo_valid;
  end

  always @(posedge clk) begin
    if(~rst_n)
      app_rdy_r <= 1'b0;
    else
      app_rdy_r <= app_rdy;
  end

  always @(posedge clk) begin
    if(~rst_n)
      rvalid_left_r <= 1'b0;
    else if(raddr_fifo_valid & !app_rdy)
      rvalid_left_r <= 1'b1;
    else if((w2r_cnt == 2'b11) & app_rdy)
      rvalid_left_r <= 1'b0;
    else
      rvalid_left_r <= rvalid_left_r;
  end

  always @(posedge clk) begin
    if(~rst_n)
      wvalid_left_r <= 1'b0;
    else if(waddr_fifo_valid & !app_rdy)
      wvalid_left_r <= 1'b1;
    else if((r2w_cnt == 2'b11) & app_rdy)
      wvalid_left_r <= 1'b0;
    else
      wvalid_left_r <= wvalid_left_r;
  end

  always @(posedge clk) begin
    if(~rst_n)
      burst_sample_w <= 1'b0;
    else if(wdata_rd_en)
      burst_sample_w <= ~burst_sample_w;
    else
      burst_sample_w <= burst_sample_w;
  end

  always @(posedge clk) begin
    if(~rst_n)
      burst_sample_r <= 1'b0;
    else
      burst_sample_r <= ~burst_sample_r;
  end


  //--------------------------------------------------------------------------
  // Generate
  //--------------------------------------------------------------------------
/*
  assign app_cmd_int        = ddr_ctrl_state_dl2 ? 3'b000 : 3'b001;
  assign app_en_int         = ddr_ctrl_state_dl2 ? waddr_fifo_valid : raddr_fifo_valid;
  assign app_addr_int       = ddr_ctrl_state_dl2 ? waddr_fifo_dout[28:0] : raddr_fifo_dout[28:0];
*/
  assign sample_trigger = (sample_cnt == SAMPLE_RATE) ? 1'b1 : 1'b0;
  //assign raddr_rd_en    = (w2r_cnt == 2'b11) & app_rdy & !rvalid_left_r & !raddr_fifo_empty & (rdata_fifo_depth <= RDATA_FIFO_DEPTH - 48);
  assign raddr_rd_en    = (w2r_cnt == 2'b11) & app_rdy & !rvalid_left_r & !raddr_fifo_empty & burst_sample_r;//& (rdata_fifo_depth <= RDATA_FIFO_DEPTH - 48) 
  //assign wdata_rd_en    = (r2w_cnt == 2'b11) & app_wdf_rdy & app_rdy & !wvalid_left_r & !waddr_fifo_empty & !wdata_fifo_empty;
  assign wdata_rd_en    = (r2w_cnt == 2'b11) & app_wdf_rdy & app_rdy & !wvalid_left_r & !waddr_fifo_empty & 
                          (((wdata_fifo_rdepth > 1) & !burst_sample_w) | (!wdata_fifo_empty & burst_sample_w));
  assign rapp_en_int    = (raddr_fifo_valid & app_rdy) | ((w2r_cnt == 2'b11) & rvalid_left_r & app_rdy);
  assign wapp_en_int    = (waddr_fifo_valid & app_rdy) | ((r2w_cnt == 2'b11) & wvalid_left_r & app_rdy);
  //assign wapp_en_int    = (wdata_fifo_valid & app_rdy) | ((r2w_cnt == 2'b11) & wvalid_left_r & app_rdy);
  assign app_cmd_int    = ddr_ctrl_state_dl2 ? 3'b000 : 3'b001;
  assign app_en_int     = ddr_ctrl_state_dl2 ? wapp_en_int : rapp_en_int;
  assign app_addr_int   = ddr_ctrl_state_dl2 ? waddr_fifo_dout[28:0] : raddr_fifo_dout[28:0];


  //--------------------------------------------------------------------------
  // Output
  //--------------------------------------------------------------------------

  assign raddr_fifo_rd_en   = raddr_rd_en;
  assign rdata_fifo_din     = app_rd_data;
  assign rdata_fifo_wr_en   = app_rd_data_valid;
  //assign waddr_fifo_rd_en   = wdata_rd_en & !burst_sample_w;
  assign waddr_fifo_rd_en   = wdata_rd_en & burst_sample_w;
  assign wdata_fifo_rd_en   = wdata_rd_en;

  assign app_cmd            = app_cmd_int;
  assign app_en             = app_en_int;
  assign app_addr           = app_addr_int;
  assign app_wdf_mask       = 32'b0;   
  assign app_wdf_data       = app_wdf_data_r;
  assign app_wdf_wren       = app_wdf_wren_r;
  assign app_wdf_end        = app_wdf_end_r;


endmodule
