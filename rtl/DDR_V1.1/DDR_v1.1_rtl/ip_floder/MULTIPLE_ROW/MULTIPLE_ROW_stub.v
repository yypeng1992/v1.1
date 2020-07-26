// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.3 (win64) Build 1034051 Fri Oct  3 17:18:25 MDT 2014
// Date        : Thu Feb 16 18:00:58 2017
// Host        : FL-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               E:/v7_2000/DDR_broad__v1/src/DDR/ip_floder/MULTIPLE_ROW/MULTIPLE_ROW_stub.v
// Design      : MULTIPLE_ROW
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7v2000tflg1925-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0,Vivado 2014.3" *)
module MULTIPLE_ROW(CLK, A, B, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[29:0],B[15:0],P[29:0]" */;
  input CLK;
  input [29:0]A;
  input [15:0]B;
  output [29:0]P;
endmodule
