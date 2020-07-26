// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.3 (win64) Build 1034051 Fri Oct  3 17:18:25 MDT 2014
// Date        : Thu Feb 16 18:08:26 2017
// Host        : FL-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               E:/v7_2000/DDR_broad__v1/src/DDR/ip_floder/GENERAL_DATA_FIFO/GENERAL_DATA_FIFO_stub.v
// Design      : GENERAL_DATA_FIFO
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7v2000tflg1925-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v12_0,Vivado 2014.3" *)
module GENERAL_DATA_FIFO(clk, rst, din, wr_en, rd_en, dout, full, empty, valid)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,din[233:0],wr_en,rd_en,dout[233:0],full,empty,valid" */;
  input clk;
  input rst;
  input [233:0]din;
  input wr_en;
  input rd_en;
  output [233:0]dout;
  output full;
  output empty;
  output valid;
endmodule
