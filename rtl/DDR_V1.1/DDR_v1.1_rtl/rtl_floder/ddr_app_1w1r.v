`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:06:03 07/08/2015 
// Design Name: 
// Module Name:    ddr_app_1w1r 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 该模块默认支持Burst_Length为8
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define MEW_APP
`ifdef MEW_APP

module ddr_app_1w1r( 

  clk,
  rst_n,
  
//***************** read **************
  raddr_fifo_rd_en,
  raddr_fifo_dout,
  raddr_fifo_valid,
  raddr_fifo_empty,
  
  rdata_fifo_din,
  rdata_fifo_wr_en,
//***********************************//
  
  
//**************** write **************
  waddr_fifo_rd_en,
  waddr_fifo_dout,
  waddr_fifo_empty,
  waddr_fifo_valid,
  /**
  \b((raddr_fifo_rd_en)|(raddr_fifo_dout)|(raddr_fifo_valid)|(raddr_fifo_empty)|(rdata_fifo_din)|(rdata_fifo_wr_en)|(waddr_fifo_rd_en)|(waddr_fifo_dout)|(waddr_fifo_empty)|(waddr_fifo_valid)|(wdata_fifo_rd_en)|(wdata_fifo_dout)|(wdata_fifo_valid)|(wdata_fifo_empty)|(wdata_fifo_rdepth)|(app_rdy)|(app_wdf_rdy)|(app_rd_data_valid)|(app_rd_data)|(app_en)|(app_cmd)|(app_addr)|(app_wdf_wren)|(app_wdf_data)|(app_wdf_mask)|(app_wdf_end))\,
  **/
  wdata_fifo_rd_en,
  wdata_fifo_dout,
  wdata_fifo_valid,
  wdata_fifo_empty,
  wdata_fifo_rdepth,
//***********************************//

//********* DDR user interface *******
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
//***********************************//
             );


//Input And Output
input               clk;
input               rst_n;


output              raddr_fifo_rd_en;
input    [29:0]     raddr_fifo_dout;
input               raddr_fifo_empty;
input               raddr_fifo_valid;

output   [255:0]    rdata_fifo_din;
output              rdata_fifo_wr_en;


/* (* MARK_DEBUG = "TRUE" *) */ output              waddr_fifo_rd_en;
/* (* MARK_DEBUG = "TRUE" *) */ input    [29:0]     waddr_fifo_dout;
/* (* MARK_DEBUG = "TRUE" *) */ input               waddr_fifo_empty;
/* (* MARK_DEBUG = "TRUE" *) */ input               waddr_fifo_valid;

/* (* MARK_DEBUG = "TRUE" *) */ output              wdata_fifo_rd_en;
/* (* MARK_DEBUG = "TRUE" *) */ input    [255:0]    wdata_fifo_dout;
/* (* MARK_DEBUG = "TRUE" *) */ input               wdata_fifo_empty;
/* (* MARK_DEBUG = "TRUE" *) */ input               wdata_fifo_valid;
/* (* MARK_DEBUG = "TRUE" *) */ input    [ 8:0]     wdata_fifo_rdepth;


/* (* MARK_DEBUG = "TRUE" *) */ input               app_rdy;
/* (* MARK_DEBUG = "TRUE" *) */ input               app_wdf_rdy;
input               app_rd_data_valid;
input    [255:0]    app_rd_data;
output              app_en;
output   [2:0]      app_cmd;
output   [28:0]     app_addr;
output              app_wdf_wren;
output   [255:0]    app_wdf_data;
output   [31:0]     app_wdf_mask;
output              app_wdf_end;

parameter WDATA_FIFO_DEPTH_SWH = 384;
parameter SLICE_NUM =7'd32;


/*	(* MARK_DEBUG = "TRUE" *) */ reg     						 ddr_state;
/*	                          */ reg                 ddr_state_r;
/*	(* MARK_DEBUG = "TRUE" *) */ reg      [6:0]      slice_cnt;
/*	(* MARK_DEBUG = "TRUE" *) */ reg      [6:0]      wr_data_cnt;
/*	(* MARK_DEBUG = "TRUE" *) */ reg      [6:0]      rd_data_cnt;

 reg                 rvalid_left_r;
 reg                 wvalid_left_r;
 reg                 burst_sample_w;
 reg                 burst_sample_r;
 reg                 burst_sample;
 
 wire               wr_cnt_trigger;
 wire               rd_cnt_trigger;
/*  (* MARK_DEBUG = "TRUE" *) */ wire               trigger;
//wire               trigger_w;
// wire               trigger_r;	

 wire               raddr_rd_en; 
/* (* MARK_DEBUG = "TRUE" *)  */ wire               wdata_rd_en; 
 reg                waddr_fifo_rd_en;

 wire               rapp_en_int; 
 wire               wapp_en_int; 
 wire               turnw;
 wire               turnr;
 
 
 wire  [2:0]       app_cmd_int; 
 wire              app_en_int;  
 wire  [28:0]      app_addr_int;
 
 
 reg   [1:0]            w2r;
 reg   [1:0]            r2w;
  
	always @(posedge clk)
	  if (~rst_n)
	    ddr_state<=1'b0;
	  else if  (turnw)
	    ddr_state<=1'b1;
	  else if (turnr)
		ddr_state<=1'b0;
	 else  
		ddr_state<=ddr_state;
		
  always @(posedge clk)
    if (~rst_n)
	   ddr_state_r<=1'b0;
    else
	   ddr_state_r<=ddr_state;

  
  always @(posedge clk)
     if (~rst_n)
       slice_cnt<=6'd0;
     else if (turnw|turnr)
      slice_cnt<=6'd0;
     else if (rapp_en_int|app_wdf_end)
       slice_cnt<=slice_cnt+1;
     else
       slice_cnt<=slice_cnt;
   
  assign trigger=(slice_cnt==SLICE_NUM)? 1:0;
  
  assign turnw=!ddr_state&(trigger|raddr_fifo_empty)&app_rdy;
  assign turnr= ddr_state&(trigger|wdata_fifo_empty)&app_rdy;
  
  
  //************ 用于写DDR时的写数据和写地址的相位调节调节 **********
  always @(posedge clk)	
    if  (~rst_n)
      burst_sample<=1'b0;
    else if (wdata_fifo_rd_en)
      burst_sample<=~burst_sample;
    else
      burst_sample<=burst_sample;
	
 always @(posedge clk)	
    if  (~rst_n)
     	waddr_fifo_rd_en<=1'b0;
    else
     	waddr_fifo_rd_en<=wdata_rd_en & !burst_sample; //注，这条语句在时序上无法确保地址的发布与数据的后半部分的发布是对齐的！！！


	//************* 检测读地址的遗留问题 ************
 always @(posedge clk) begin
    if(~rst_n)
      rvalid_left_r <= 1'b0;
    else if(raddr_fifo_valid & !app_rdy)
      rvalid_left_r <= 1'b1;
    else if(rvalid_left_r & app_rdy)
      rvalid_left_r <= 1'b0;
    else
      rvalid_left_r <= rvalid_left_r;
  end


	//************* 检测写地址的遗留问题 ************
  always @(posedge clk) begin
    if(~rst_n)
      wvalid_left_r <= 1'b0;
    else if(waddr_fifo_valid & !app_rdy)
      wvalid_left_r <= 1'b1;
    else if(wvalid_left_r & app_rdy)
      wvalid_left_r <= 1'b0;
    else
      wvalid_left_r <= wvalid_left_r;
  end

always @(posedge clk) begin
    if(~rst_n)
      burst_sample_w <= 1'b0;
    else if(wdata_fifo_valid)
      burst_sample_w <= ~burst_sample_w;
    else
      burst_sample_w <= burst_sample_w;
  end

  always @(posedge clk) 
    if(~rst_n)
      burst_sample_r <= 1'b0;
    else 
      burst_sample_r <= ~burst_sample_r;
  

 always @(posedge clk)
     if (~rst_n)
       r2w<=2'b00;
	  else  if (wr_cnt_trigger|(wdata_fifo_empty&app_rdy))
	    r2w<=2'b00; 
     else if (ddr_state&!ddr_state_r)
       r2w<=2'b01; 
     else  if (r2w==2'b01)
	    r2w<=2'b10;
	  else
       r2w<=r2w; 
 
 //清点写突发数据的次数
 always @(posedge clk)
     if (~rst_n)
       wr_data_cnt<=6'd0;
     else if (!ddr_state)
       wr_data_cnt<=6'd0;
     else if (wdata_fifo_rd_en&burst_sample)
       wr_data_cnt<=wr_data_cnt+1;
     else
       wr_data_cnt<=wr_data_cnt;

	//清点读地址FIFO的使能次数
  always @(posedge clk)
     if (~rst_n)
        rd_data_cnt<=6'd0;
     else if (ddr_state)
        rd_data_cnt<=6'd0;
     else if (raddr_rd_en)
        rd_data_cnt<=rd_data_cnt+1;
     else
        rd_data_cnt<=rd_data_cnt;
        
  always @(posedge clk)
		if (~rst_n)
		  w2r<=2'b00;
		else  if (rd_cnt_trigger|(raddr_fifo_empty&app_rdy))
		  w2r<=2'b00;
		else if (!ddr_state&ddr_state_r)
		  w2r<=2'b01;
		else  if (w2r==2'b01)
		  w2r<=2'b10;
		else
		  w2r<=w2r;
		

  assign wr_cnt_trigger =((wr_data_cnt==(SLICE_NUM-1))&wdata_rd_en&burst_sample);//|(wr_data_cnt==SLICE_NUM);
  assign rd_cnt_trigger =((rd_data_cnt==(SLICE_NUM-1))&raddr_rd_en);//|(rd_data_cnt==SLICE_NUM);  
  
  //读操作只需要发布读地址，可以背靠背连续发送读地址，而没有必要使用burst_sample_r来采样式发送！burst_sample_r可以完全的从程序中去除！！
  assign raddr_rd_en    = (w2r==2'b10) & app_rdy & !rvalid_left_r & !raddr_fifo_empty & burst_sample_r;
  assign wdata_rd_en    = (r2w==2'b10)& app_wdf_rdy & app_rdy &
                          (((wdata_fifo_rdepth > 1) & !burst_sample&!waddr_fifo_empty) | (!wdata_fifo_empty & burst_sample));
  assign rapp_en_int    = (raddr_fifo_valid & app_rdy) | (rvalid_left_r & app_rdy);
  assign wapp_en_int    = (waddr_fifo_valid & app_rdy) | (wvalid_left_r & app_rdy);
 
  assign app_cmd_int    = ddr_state ? 3'b000 : 3'b001;
  assign app_en_int     = ddr_state ? wapp_en_int : rapp_en_int;
  assign app_addr_int   = ddr_state ? waddr_fifo_dout[28:0] : raddr_fifo_dout[28:0];


  //--------------------------------------------------------------------------
  // Output
  //--------------------------------------------------------------------------
  assign raddr_fifo_rd_en   = raddr_rd_en;
  assign rdata_fifo_din     = app_rd_data;
  assign rdata_fifo_wr_en   = app_rd_data_valid;
  assign wdata_fifo_rd_en   = wdata_rd_en;

  assign app_cmd            = app_cmd_int;
  assign app_en             = app_en_int;
  assign app_addr           = app_addr_int;
  assign app_wdf_mask       = 32'b0;   
  assign app_wdf_data       = wdata_fifo_dout;
  assign app_wdf_wren       = wdata_fifo_valid;
  assign app_wdf_end        =app_wdf_wren&burst_sample_w ;


endmodule



`else


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

/*(* MARK_DEBUG = "TRUE" *) */ input               app_rdy;
/*(* MARK_DEBUG = "TRUE" *) */ input               app_wdf_rdy; 
/*(* MARK_DEBUG = "TRUE" *) */ input               app_rd_data_valid; 
/*(* MARK_DEBUG = "TRUE" *) */ input    [255:0]    app_rd_data;
/*(* MARK_DEBUG = "TRUE" *) */ output              app_en;   
/*(* MARK_DEBUG = "TRUE" *) */ output   [2:0]      app_cmd;    
/*(* MARK_DEBUG = "TRUE" *) */ output   [28:0]     app_addr;
/*(* MARK_DEBUG = "TRUE" *) */ output              app_wdf_wren;  
/*(* MARK_DEBUG = "TRUE" *) */ output   [255:0]    app_wdf_data;  
/*(* MARK_DEBUG = "TRUE" *) */ output   [31:0]     app_wdf_mask;
/*(* MARK_DEBUG = "TRUE" *) */ output              app_wdf_end;

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
    else if(`Burst_Length == 4'd4)
      wdf_sample <= 1'b1;
    else if((`Burst_Length == 4'd8) & wdata_fifo_valid)
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
    else if(`Burst_Length == 4'd4)
      burst_sample_w <= 1'b1;
    else if((`Burst_Length == 4'd8) & wdata_rd_en)
      burst_sample_w <= ~burst_sample_w;
    else
      burst_sample_w <= burst_sample_w;
  end

  always @(posedge clk) begin
    if(~rst_n)
      burst_sample_r <= 1'b0;
    else if(`Burst_Length == 4'd8)
      burst_sample_r <= ~burst_sample_r;
    else
      burst_sample_r <= 1'b1;
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

`endif
