//****************************************************************************
// Revision:      
//
// Last Updated:  
// Modified by:   
// Exported:
// 
// Copyright(C)VLSI Design Institute of Nanjing University,2009
// Proprietary and Confidential,all Rights Reserved
// 
//****************************************************************************

`timescale 1ns/10ps


module Cfg_port_ddr(
   // Inputs
   clk,
   rst_n,
   fwd_i,
   data_i,
   // Outputs
   cfgid_o,
   cfgfwd_o,
   cfgdata_o,
   cfgreq_o,
   cfgdone_o
   );

  //PARAMETER
  parameter LOCAL_Y     = 4'b0001;   
  parameter LOCAL_X     = 4'b0001; 
  parameter DATAW       = 34;
  parameter CFGTIME     = 8;
  parameter F_IDLE      = 2'b01;
  parameter F_LOCK      = 2'b10;  

  //INPUT AND OUTPUT
  input                     clk;
  input                     rst_n;
  input                     fwd_i;
  input   [DATAW-1:0]       data_i; 

  output  [CFGTIME-1:0]     cfgid_o;
  output                    cfgfwd_o;
  output  [DATAW-3:0]       cfgdata_o;
  output                    cfgreq_o;
  output                    cfgdone_o;
    
  //REGISTER AND WIRE\
  reg                       fwd_r;
  reg     [DATAW-1:0]       data_r;
  reg     [CFGTIME-1:0]     cfgid_r;
  reg                       cfgreq_r;

  reg     [1:0]             state_cs;
  reg     [1:0]             state_ns;

  wire    [CFGTIME-1:0]     cfgid_int;
  wire                      cfgreq_int;
  wire                      cfgdone_int;

  //--------------------------------------------------------------------------
  // FSM
  //--------------------------------------------------------------------------
  always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
      state_cs <= F_IDLE;
    else
      state_cs <= state_ns;
  end

  always @( * ) begin
    case(state_cs)
      F_IDLE:
        //if(fwd_i && (data_i[33:32] == 2'b10) && (data_i[31:28] == LOCAL_Y) && (data_i[27:24] == LOCAL_X))
        if(fwd_i && (data_i[33:32] == 2'b10) && (data_i[31:28] == LOCAL_Y))
          state_ns = F_LOCK;
        else
          state_ns = F_IDLE;
      F_LOCK:
        if(fwd_i && (data_i[33:32] == 2'b11))
          state_ns = F_IDLE;
        else
          state_ns = F_LOCK;
      default:
        state_ns = F_IDLE;
    endcase
  end

  //--------------------------------------------------------------------------
  // register cfgid_r, cfgreq_r, fwd_r, data_r
  //--------------------------------------------------------------------------

  always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
      cfgid_r <= {CFGTIME{1'b0}};
    else if(state_ns == F_IDLE)
      cfgid_r <= {CFGTIME{1'b0}};
    else if(fwd_r)
      cfgid_r <= cfgid_r + 1'd1;
    else
      cfgid_r <= cfgid_r;
  end


  always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
      cfgreq_r <= 1'b0;
    else if(state_ns == F_IDLE)
      cfgreq_r <= 1'b0;
    else if((state_cs == F_IDLE) && (state_ns == F_LOCK))
      cfgreq_r <= data_i[23];
    else
      cfgreq_r <= cfgreq_r;
  end


  always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
      fwd_r <= 1'b0;
    else if((state_ns == F_LOCK) && (state_cs == F_LOCK))
      fwd_r <= fwd_i;
    else
      fwd_r <= 1'b0;
  end


  always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
      data_r <= {(DATAW-2){1'b0}};
    else if((state_ns == F_LOCK) && (state_cs == F_LOCK))
      data_r <= data_i[DATAW-3:0];
    else
      data_r <= {(DATAW-2){1'b0}};
  end


  //--------------------------------------------------------------------------
  // generate cfgid_int, cfgdone_int, cfgreq_int, 
  //--------------------------------------------------------------------------

  assign  cfgid_int   = fwd_r ? cfgid_r : {CFGTIME{1'b0}};
  assign  cfgdone_int = ((state_cs == F_LOCK) && (state_ns == F_IDLE)) ? 1'b1 : 1'b0;
  assign  cfgreq_int  = fwd_r ? cfgreq_r : 1'b0;

  //--------------------------------------------------------------------------
  // OUTPUT
  //--------------------------------------------------------------------------

  assign  cfgid_o     = cfgid_int;
  assign  cfgfwd_o    = fwd_r;
  assign  cfgdata_o   = data_r;
  assign  cfgreq_o    = cfgreq_int;
  assign  cfgdone_o   = cfgdone_int;



endmodule
