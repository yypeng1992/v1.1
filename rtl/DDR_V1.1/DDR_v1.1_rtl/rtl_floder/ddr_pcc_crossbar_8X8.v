//****************************************************************************
// -----------------------------------------------------------------------------
// FILE NAME      : pcc_crossbar7_3.v
// TYPE           : rtl design
// DEPARTMENT     : NOC working group, Hefei, China.
// AUTHOR         : sunl
// AUTHOR'S EMAIL : mengqunsun@163.com
// -----------------------------------------------------------------------------
// Release history
// VERSION    DATE       AUTHOR       DESCRIPTION
//
// -----------------------------------------------------------------------------
// KEYWORDS :
//
// -----------------------------------------------------------------------------
// Institute of VLSI, HFUT NOC working group
//
//****************************************************************************
`timescale 1ns/10ps

module ddr_pcc_crossbar_8X8(
  clk,
  rst_n,
  
  ch1_ddr_pos_1st_wr,
  ch2_ddr_pos_1st_wr,
  ch3_ddr_pos_1st_wr,
  ch4_ddr_pos_1st_wr,
  ch5_ddr_pos_1st_wr,
  ch6_ddr_pos_1st_wr,
  
  ch1_ddr_pos_1st_rd,
  ch2_ddr_pos_1st_rd,
  ch3_ddr_pos_1st_rd,
  ch4_ddr_pos_1st_rd,
  ch5_ddr_pos_1st_rd,
  ch6_ddr_pos_1st_rd,

//----------------------------8个输入通道 <--| PCC网络
  pcc_ip_data1_i,    pcc_ip_data2_i,    pcc_ip_data3_i,    pcc_ip_data4_i,    pcc_ip_data5_i,    pcc_ip_data6_i,    pcc_ip_data7_i,    pcc_ip_data8_i,    
  pcc_ip_stb1_i,     pcc_ip_stb2_i,     pcc_ip_stb3_i,     pcc_ip_stb4_i,     pcc_ip_stb5_i,     pcc_ip_stb6_i,     pcc_ip_stb7_i,     pcc_ip_stb8_i,     
  pcc_ip_fwd1_i,     pcc_ip_fwd2_i,     pcc_ip_fwd3_i,     pcc_ip_fwd4_i,     pcc_ip_fwd5_i,     pcc_ip_fwd6_i,     pcc_ip_fwd7_i,     pcc_ip_fwd8_i,     
  pcc_ip_fail1_o,    pcc_ip_fail2_o,    pcc_ip_fail3_o,    pcc_ip_fail4_o,    pcc_ip_fail5_o,    pcc_ip_fail6_o,    pcc_ip_fail7_o,    pcc_ip_fail8_o,    
  pcc_ip_pack1_o,    pcc_ip_pack2_o,    pcc_ip_pack3_o,    pcc_ip_pack4_o,    pcc_ip_pack5_o,    pcc_ip_pack6_o,    pcc_ip_pack7_o,    pcc_ip_pack8_o,    
  pcc_ip_suspend1_o, pcc_ip_suspend2_o, pcc_ip_suspend3_o, pcc_ip_suspend4_o, pcc_ip_suspend5_o, pcc_ip_suspend6_o, pcc_ip_suspend7_o, pcc_ip_suspend8_o, 
  pcc_ip_cancel1_o,  pcc_ip_cancel2_o,  pcc_ip_cancel3_o,  pcc_ip_cancel4_o,  pcc_ip_cancel5_o,  pcc_ip_cancel6_o,  pcc_ip_cancel7_o,  pcc_ip_cancel8_o,  


//-----------------------6个通道————用于接收数据
  ch1_ip_data_o,     ch2_ip_data_o,     ch3_ip_data_o,     ch4_ip_data_o,     ch5_ip_data_o,     ch6_ip_data_o,     
  ch1_ip_stb_o,      ch2_ip_stb_o,      ch3_ip_stb_o,      ch4_ip_stb_o,      ch5_ip_stb_o,      ch6_ip_stb_o,      
  ch1_ip_fwd_o,      ch2_ip_fwd_o,      ch3_ip_fwd_o,      ch4_ip_fwd_o,      ch5_ip_fwd_o,      ch6_ip_fwd_o,      
  ch1_ip_fail_i,     ch2_ip_fail_i,     ch3_ip_fail_i,     ch4_ip_fail_i,     ch5_ip_fail_i,     ch6_ip_fail_i,     
  ch1_ip_pack_i,     ch2_ip_pack_i,     ch3_ip_pack_i,     ch4_ip_pack_i,     ch5_ip_pack_i,     ch6_ip_pack_i,     
  ch1_ip_suspend_i,  ch2_ip_suspend_i,  ch3_ip_suspend_i,  ch4_ip_suspend_i,  ch5_ip_suspend_i,  ch6_ip_suspend_i,  
  ch1_ip_cancel_i,   ch2_ip_cancel_i,   ch3_ip_cancel_i,   ch4_ip_cancel_i,   ch5_ip_cancel_i,   ch6_ip_cancel_i,   


//----------------------------8个输出通道 |--> PCC网络
  pcc_op_data1_o,    pcc_op_data2_o,    pcc_op_data3_o,    pcc_op_data4_o,    pcc_op_data5_o,    pcc_op_data6_o,    pcc_op_data7_o,    pcc_op_data8_o,    
  pcc_op_stb1_o,     pcc_op_stb2_o,     pcc_op_stb3_o,     pcc_op_stb4_o,     pcc_op_stb5_o,     pcc_op_stb6_o,     pcc_op_stb7_o,     pcc_op_stb8_o,     
  pcc_op_fwd1_o,     pcc_op_fwd2_o,     pcc_op_fwd3_o,     pcc_op_fwd4_o,     pcc_op_fwd5_o,     pcc_op_fwd6_o,     pcc_op_fwd7_o,     pcc_op_fwd8_o,     
  pcc_op_fail1_i,    pcc_op_fail2_i,    pcc_op_fail3_i,    pcc_op_fail4_i,    pcc_op_fail5_i,    pcc_op_fail6_i,    pcc_op_fail7_i,    pcc_op_fail8_i,    
  pcc_op_pack1_i,    pcc_op_pack2_i,    pcc_op_pack3_i,    pcc_op_pack4_i,    pcc_op_pack5_i,    pcc_op_pack6_i,    pcc_op_pack7_i,    pcc_op_pack8_i,    
  pcc_op_suspend1_i, pcc_op_suspend2_i, pcc_op_suspend3_i, pcc_op_suspend4_i, pcc_op_suspend5_i, pcc_op_suspend6_i, pcc_op_suspend7_i, pcc_op_suspend8_i, 
  pcc_op_cancel1_i,  pcc_op_cancel2_i,  pcc_op_cancel3_i,  pcc_op_cancel4_i,  pcc_op_cancel5_i,  pcc_op_cancel6_i,  pcc_op_cancel7_i,  pcc_op_cancel8_i,  


//-----------------------6个通道————用于发送数据
  ch1_op_data_i,     ch2_op_data_i,     ch3_op_data_i,     ch4_op_data_i,     ch5_op_data_i,     ch6_op_data_i,     
  ch1_op_stb_i,      ch2_op_stb_i,      ch3_op_stb_i,      ch4_op_stb_i,      ch5_op_stb_i,      ch6_op_stb_i,      
  ch1_op_fwd_i,      ch2_op_fwd_i,      ch3_op_fwd_i,      ch4_op_fwd_i,      ch5_op_fwd_i,      ch6_op_fwd_i,      
  ch1_op_fail_o,     ch2_op_fail_o,     ch3_op_fail_o,     ch4_op_fail_o,     ch5_op_fail_o,     ch6_op_fail_o,     
  ch1_op_pack_o,     ch2_op_pack_o,     ch3_op_pack_o,     ch4_op_pack_o,     ch5_op_pack_o,     ch6_op_pack_o,     
  ch1_op_suspend_o,  ch2_op_suspend_o,  ch3_op_suspend_o,  ch4_op_suspend_o,  ch5_op_suspend_o,  ch6_op_suspend_o,  
  ch1_op_cancel_o,   ch2_op_cancel_o,   ch3_op_cancel_o,   ch4_op_cancel_o,   ch5_op_cancel_o,   ch6_op_cancel_o   
  
  );

  //Input And Output
  input                  clk;
  input                  rst_n;
  
  //15/4/14
  //////****************************************** read
  input     [3:0]        ch1_ddr_pos_1st_rd; 
  input     [3:0]        ch2_ddr_pos_1st_rd;
  input     [3:0]        ch3_ddr_pos_1st_rd;
  input     [3:0]        ch4_ddr_pos_1st_rd;
  input     [3:0]        ch5_ddr_pos_1st_rd;
  input     [3:0]        ch6_ddr_pos_1st_rd;
  
  output    [65:0]       pcc_op_data1_o;
  output                 pcc_op_stb1_o;
  output                 pcc_op_fwd1_o;
  input                  pcc_op_fail1_i;
  input                  pcc_op_pack1_i;
  input                  pcc_op_suspend1_i;
  input                  pcc_op_cancel1_i;
  
  output    [65:0]       pcc_op_data2_o;
  output                 pcc_op_stb2_o;
  output                 pcc_op_fwd2_o;
  input                  pcc_op_fail2_i;
  input                  pcc_op_pack2_i;
  input                  pcc_op_suspend2_i;
  input                  pcc_op_cancel2_i;
 
  output    [65:0]       pcc_op_data3_o;
  output                 pcc_op_stb3_o;
  output                 pcc_op_fwd3_o;
  input                  pcc_op_fail3_i;
  input                  pcc_op_pack3_i;
  input                  pcc_op_suspend3_i;
  input                  pcc_op_cancel3_i;
 
  output    [65:0]       pcc_op_data4_o;
  output                 pcc_op_stb4_o;
  output                 pcc_op_fwd4_o;
  input                  pcc_op_fail4_i;
  input                  pcc_op_pack4_i;
  input                  pcc_op_suspend4_i;
  input                  pcc_op_cancel4_i;
  
  output    [65:0]       pcc_op_data5_o;
  output                 pcc_op_stb5_o;
  output                 pcc_op_fwd5_o;
  input                  pcc_op_fail5_i;
  input                  pcc_op_pack5_i;
  input                  pcc_op_suspend5_i;
  input                  pcc_op_cancel5_i;
   
  output    [65:0]       pcc_op_data6_o;
  output                 pcc_op_stb6_o;
  output                 pcc_op_fwd6_o;
  input                  pcc_op_fail6_i;
  input                  pcc_op_pack6_i;
  input                  pcc_op_suspend6_i;
  input                  pcc_op_cancel6_i;
                
  output    [65:0]       pcc_op_data7_o;
  output                 pcc_op_stb7_o;
  output                 pcc_op_fwd7_o;
  input                  pcc_op_fail7_i;
  input                  pcc_op_pack7_i;
  input                  pcc_op_suspend7_i;
  input                  pcc_op_cancel7_i;
  
  output    [65:0]       pcc_op_data8_o;
  output                 pcc_op_stb8_o;
  output                 pcc_op_fwd8_o;
  input                  pcc_op_fail8_i;
  input                  pcc_op_pack8_i;
  input                  pcc_op_suspend8_i;
  input                  pcc_op_cancel8_i;
  
  input    [65:0]        ch1_op_data_i;   
  input                  ch1_op_stb_i;    
  input                  ch1_op_fwd_i;    
  output                 ch1_op_fail_o;   
  output                 ch1_op_pack_o;   
  output                 ch1_op_suspend_o;
  output                 ch1_op_cancel_o;
  
  input    [65:0]        ch2_op_data_i;   
  input                  ch2_op_stb_i;    
  input                  ch2_op_fwd_i;    
  output                 ch2_op_fail_o;   
  output                 ch2_op_pack_o;   
  output                 ch2_op_suspend_o;
  output                 ch2_op_cancel_o;
  
  input    [65:0]        ch3_op_data_i;   
  input                  ch3_op_stb_i;    
  input                  ch3_op_fwd_i;    
  output                 ch3_op_fail_o;   
  output                 ch3_op_pack_o;   
  output                 ch3_op_suspend_o;
  output                 ch3_op_cancel_o;
  
  input    [65:0]        ch4_op_data_i;   
  input                  ch4_op_stb_i;    
  input                  ch4_op_fwd_i;    
  output                 ch4_op_fail_o;   
  output                 ch4_op_pack_o;   
  output                 ch4_op_suspend_o;
  output                 ch4_op_cancel_o;
  
  input    [65:0]        ch5_op_data_i;   
  input                  ch5_op_stb_i;    
  input                  ch5_op_fwd_i;    
  output                 ch5_op_fail_o;   
  output                 ch5_op_pack_o;   
  output                 ch5_op_suspend_o;
  output                 ch5_op_cancel_o;
  
  input    [65:0]        ch6_op_data_i;   
  input                  ch6_op_stb_i;    
  input                  ch6_op_fwd_i;    
  output                 ch6_op_fail_o;   
  output                 ch6_op_pack_o;   
  output                 ch6_op_suspend_o;
  output                 ch6_op_cancel_o;
  
  
  //////****************************************** write
  input     [7:0]        ch1_ddr_pos_1st_wr; 
  input     [7:0]        ch2_ddr_pos_1st_wr;
  input     [7:0]        ch3_ddr_pos_1st_wr;
  input     [7:0]        ch5_ddr_pos_1st_wr;
  input     [7:0]        ch4_ddr_pos_1st_wr;
  input     [7:0]        ch6_ddr_pos_1st_wr; 
  
    
  input     [65:0]       pcc_ip_data1_i;
  input                  pcc_ip_stb1_i;
  input                  pcc_ip_fwd1_i;
  output                 pcc_ip_fail1_o;
  output                 pcc_ip_pack1_o;
  output                 pcc_ip_suspend1_o;
  output                 pcc_ip_cancel1_o;
 
  input     [65:0]       pcc_ip_data2_i;
  input                  pcc_ip_stb2_i;
  input                  pcc_ip_fwd2_i;
  output                 pcc_ip_fail2_o;
  output                 pcc_ip_pack2_o;
  output                 pcc_ip_suspend2_o;
  output                 pcc_ip_cancel2_o;
  
  input     [65:0]       pcc_ip_data3_i;
  input                  pcc_ip_stb3_i;
  input                  pcc_ip_fwd3_i;
  output                 pcc_ip_fail3_o;
  output                 pcc_ip_pack3_o;
  output                 pcc_ip_suspend3_o;
  output                 pcc_ip_cancel3_o;

  input     [65:0]       pcc_ip_data4_i;
  input                  pcc_ip_stb4_i;
  input                  pcc_ip_fwd4_i;
  output                 pcc_ip_fail4_o;
  output                 pcc_ip_pack4_o;
  output                 pcc_ip_suspend4_o;
  output                 pcc_ip_cancel4_o;

  input     [65:0]       pcc_ip_data5_i;
  input                  pcc_ip_stb5_i;
  input                  pcc_ip_fwd5_i;
  output                 pcc_ip_fail5_o;
  output                 pcc_ip_pack5_o;
  output                 pcc_ip_suspend5_o;
  output                 pcc_ip_cancel5_o;

  input     [65:0]       pcc_ip_data6_i;
  input                  pcc_ip_stb6_i;
  input                  pcc_ip_fwd6_i;
  output                 pcc_ip_fail6_o;
  output                 pcc_ip_pack6_o;
  output                 pcc_ip_suspend6_o;
  output                 pcc_ip_cancel6_o;

  input     [65:0]       pcc_ip_data7_i;
  input                  pcc_ip_stb7_i;
  input                  pcc_ip_fwd7_i;
  output                 pcc_ip_fail7_o;
  output                 pcc_ip_pack7_o;
  output                 pcc_ip_suspend7_o;
  output                 pcc_ip_cancel7_o;
  
  input     [65:0]       pcc_ip_data8_i;      //// 输入来自寄存器
  input                  pcc_ip_stb8_i;
  input                  pcc_ip_fwd8_i;
  output                 pcc_ip_fail8_o;      //// 寄存器输出
  output                 pcc_ip_pack8_o;
  output                 pcc_ip_suspend8_o;
  output                 pcc_ip_cancel8_o;

  output    [65:0]       ch1_ip_data_o;   
  output                 ch1_ip_stb_o;    
  output                 ch1_ip_fwd_o;    
  input                  ch1_ip_fail_i;   
  input                  ch1_ip_pack_i;   
  input                  ch1_ip_suspend_i;
  input                  ch1_ip_cancel_i; 
  
  output    [65:0]       ch2_ip_data_o;   
  output                 ch2_ip_stb_o;    
  output                 ch2_ip_fwd_o;    
  input                  ch2_ip_fail_i;   
  input                  ch2_ip_pack_i;   
  input                  ch2_ip_suspend_i;
  input                  ch2_ip_cancel_i;
  
  output    [65:0]       ch3_ip_data_o;   
  output                 ch3_ip_stb_o;    
  output                 ch3_ip_fwd_o;    
  input                  ch3_ip_fail_i;   
  input                  ch3_ip_pack_i;   
  input                  ch3_ip_suspend_i;
  input                  ch3_ip_cancel_i;
  
  output    [65:0]       ch4_ip_data_o;   
  output                 ch4_ip_stb_o;    
  output                 ch4_ip_fwd_o;    
  input                  ch4_ip_fail_i;   
  input                  ch4_ip_pack_i;   
  input                  ch4_ip_suspend_i;
  input                  ch4_ip_cancel_i;
  
  output    [65:0]       ch5_ip_data_o;   
  output                 ch5_ip_stb_o;    
  output                 ch5_ip_fwd_o;    
  input                  ch5_ip_fail_i;   
  input                  ch5_ip_pack_i;   
  input                  ch5_ip_suspend_i;
  input                  ch5_ip_cancel_i;
  
  output    [65:0]       ch6_ip_data_o;   //// 组合逻辑输出
  output                 ch6_ip_stb_o;    
  output                 ch6_ip_fwd_o;    
  input                  ch6_ip_fail_i;    //// 输入来自寄存器
  input                  ch6_ip_pack_i;    
  input                  ch6_ip_suspend_i; 
  input                  ch6_ip_cancel_i;  
     
                                           
 
            
  //Register And Wire
  reg   [7:0]    ch1_lock_r;
  reg   [7:0]    ch2_lock_r;
  reg   [7:0]    ch3_lock_r;
  reg   [7:0]    ch4_lock_r;
  reg   [7:0]    ch5_lock_r;
  reg   [7:0]    ch6_lock_r;
  
  reg   [65:0]   ch1_ip_data_r;
  reg            ch1_ip_stb_r; 
  reg            ch1_ip_fwd_r;
  
  reg   [65:0]   ch2_ip_data_r;
  reg            ch2_ip_stb_r; 
  reg            ch2_ip_fwd_r;
  
  reg   [65:0]   ch3_ip_data_r;
  reg            ch3_ip_stb_r; 
  reg            ch3_ip_fwd_r;
  
  reg   [65:0]   ch4_ip_data_r;
  reg            ch4_ip_stb_r; 
  reg            ch4_ip_fwd_r;
  
  reg   [65:0]   ch5_ip_data_r;
  reg            ch5_ip_stb_r; 
  reg            ch5_ip_fwd_r;
  
  reg   [65:0]   ch6_ip_data_r;
  reg            ch6_ip_stb_r; 
  reg            ch6_ip_fwd_r; 
  
  reg             pcc_ip_fail1_r;   
  reg             pcc_ip_pack1_r;   
  reg             pcc_ip_suspend1_r;
  reg             pcc_ip_cancel1_r;
  
  reg             pcc_ip_fail2_r;   
  reg             pcc_ip_pack2_r;   
  reg             pcc_ip_suspend2_r;
  reg             pcc_ip_cancel2_r;
  
  reg             pcc_ip_fail3_r;   
  reg             pcc_ip_pack3_r;   
  reg             pcc_ip_suspend3_r;
  reg             pcc_ip_cancel3_r;
  
  reg             pcc_ip_fail4_r;   
  reg             pcc_ip_pack4_r;   
  reg             pcc_ip_suspend4_r;
  reg             pcc_ip_cancel4_r;
  
  reg             pcc_ip_fail5_r;   
  reg             pcc_ip_pack5_r;   
  reg             pcc_ip_suspend5_r;
  reg             pcc_ip_cancel5_r;
  
  reg             pcc_ip_fail6_r;   
  reg             pcc_ip_pack6_r;   
  reg             pcc_ip_suspend6_r;
  reg             pcc_ip_cancel6_r;
  
  reg             pcc_ip_fail7_r;   
  reg             pcc_ip_pack7_r;   
  reg             pcc_ip_suspend7_r;
  reg             pcc_ip_cancel7_r; 
  
  reg             pcc_ip_fail8_r;   
  reg             pcc_ip_pack8_r;   
  reg             pcc_ip_suspend8_r;
  reg             pcc_ip_cancel8_r; 
  
  
  wire   [5:0]  ddr_pos1_lock; 
  wire   [5:0]  ddr_pos2_lock; 
  wire   [5:0]  ddr_pos3_lock;
  wire   [5:0]  ddr_pos4_lock;
  wire   [5:0]  ddr_pos5_lock;
  wire   [5:0]  ddr_pos6_lock;
  wire   [5:0]  ddr_pos7_lock;
  wire   [5:0]  ddr_pos8_lock;
  
  reg    [7:0]   ch1_rd_lock_r;
  reg    [7:0]   ch2_rd_lock_r; 
  reg    [7:0]   ch3_rd_lock_r;
  reg    [7:0]   ch4_rd_lock_r; 
  reg    [7:0]   ch5_rd_lock_r;  
  reg    [7:0]   ch6_rd_lock_r; 
  
  
  reg            ch1_op_fail_o;   
  reg            ch1_op_pack_o;   
  reg            ch1_op_suspend_o;
  reg            ch1_op_cancel_o;
  
  reg            ch2_op_fail_o;   
  reg            ch2_op_pack_o;   
  reg            ch2_op_suspend_o;
  reg            ch2_op_cancel_o;
  
  reg            ch3_op_fail_o;   
  reg            ch3_op_pack_o;   
  reg            ch3_op_suspend_o;
  reg            ch3_op_cancel_o;
  
  reg            ch4_op_fail_o;   
  reg            ch4_op_pack_o;   
  reg            ch4_op_suspend_o;
  reg            ch4_op_cancel_o;
  
  reg            ch5_op_fail_o;   
  reg            ch5_op_pack_o;   
  reg            ch5_op_suspend_o;
  reg            ch5_op_cancel_o;
  
  reg            ch6_op_fail_o;   
  reg            ch6_op_pack_o;   
  reg            ch6_op_suspend_o;
  reg            ch6_op_cancel_o; 
  
  reg   [65:0]     pcc_op_data1_o;
  reg              pcc_op_stb1_o; 
  reg              pcc_op_fwd1_o; 

  reg   [65:0]     pcc_op_data2_o;
  reg              pcc_op_stb2_o; 
  reg              pcc_op_fwd2_o; 
 
  reg   [65:0]     pcc_op_data3_o;
  reg              pcc_op_stb3_o; 
  reg              pcc_op_fwd3_o; 

  reg   [65:0]     pcc_op_data4_o;
  reg              pcc_op_stb4_o; 
  reg              pcc_op_fwd4_o; 

  reg   [65:0]     pcc_op_data5_o;
  reg              pcc_op_stb5_o; 
  reg              pcc_op_fwd5_o; 

  reg   [65:0]     pcc_op_data6_o;
  reg              pcc_op_stb6_o; 
  reg              pcc_op_fwd6_o; 

  reg   [65:0]     pcc_op_data7_o;
  reg              pcc_op_stb7_o; 
  reg              pcc_op_fwd7_o; 

  reg   [65:0]     pcc_op_data8_o;
  reg              pcc_op_stb8_o; 
  reg              pcc_op_fwd8_o; 
 
  always @(posedge clk)
    if (~rst_n)
      ch1_lock_r<=8'd0;
	 else if (ch1_ip_cancel_i)//
	    ch1_lock_r<=8'd0;
    else if (pcc_ip_stb1_i && (pcc_ip_data1_i[65:64] == 2'b10) && (pcc_ip_data1_i[15:8] ==ch1_ddr_pos_1st_wr ))
      ch1_lock_r<=8'b00000001;
    else if (pcc_ip_stb2_i && (pcc_ip_data2_i[65:64] == 2'b10) && (pcc_ip_data2_i[15:8] ==ch1_ddr_pos_1st_wr ))
      ch1_lock_r<=8'b00000010;
    else if (pcc_ip_stb3_i && (pcc_ip_data3_i[65:64] == 2'b10) && (pcc_ip_data3_i[15:8] ==ch1_ddr_pos_1st_wr ))
      ch1_lock_r<=8'b00000100; 
    else if (pcc_ip_stb4_i && (pcc_ip_data4_i[65:64] == 2'b10) && (pcc_ip_data4_i[15:8] ==ch1_ddr_pos_1st_wr ))
      ch1_lock_r<=8'b00001000;
    else if (pcc_ip_stb5_i && (pcc_ip_data5_i[65:64] == 2'b10) && (pcc_ip_data5_i[15:8] ==ch1_ddr_pos_1st_wr ))
      ch1_lock_r<=8'b00010000;
    else if (pcc_ip_stb6_i && (pcc_ip_data6_i[65:64] == 2'b10) && (pcc_ip_data6_i[15:8] ==ch1_ddr_pos_1st_wr ))
      ch1_lock_r<=8'b00100000;
    else if (pcc_ip_stb7_i && (pcc_ip_data7_i[65:64] == 2'b10) && (pcc_ip_data7_i[15:8] ==ch1_ddr_pos_1st_wr ))
      ch1_lock_r<=8'b01000000;
    else if (pcc_ip_stb8_i && (pcc_ip_data8_i[65:64] == 2'b10) && (pcc_ip_data8_i[15:8] ==ch1_ddr_pos_1st_wr ))
      ch1_lock_r<=8'b10000000;
   else
      ch1_lock_r<=ch1_lock_r;

  always @( * )
    begin
     (*full_case*)
    case(ch1_lock_r)
	      8'b00000000:
          begin
            ch1_ip_data_r = 66'b0;
            ch1_ip_stb_r  = 1'b0;
            ch1_ip_fwd_r  = 1'b0;
          end
      	8'b00000001: 
      	  begin
      			ch1_ip_data_r = pcc_ip_data1_i;
            ch1_ip_stb_r  = pcc_ip_stb1_i;
            ch1_ip_fwd_r  = pcc_ip_fwd1_i;
          end
      	8'b00000010:
      	  begin
      			ch1_ip_data_r = pcc_ip_data2_i;
            ch1_ip_stb_r  = pcc_ip_stb2_i;
            ch1_ip_fwd_r  = pcc_ip_fwd2_i;
          end
      	8'b00000100:
      	  begin
      			ch1_ip_data_r = pcc_ip_data3_i;
            ch1_ip_stb_r  = pcc_ip_stb3_i;
            ch1_ip_fwd_r  = pcc_ip_fwd3_i;
          end
      	8'b00001000:
      	  begin
      			ch1_ip_data_r = pcc_ip_data4_i;
            ch1_ip_stb_r  = pcc_ip_stb4_i;
            ch1_ip_fwd_r  = pcc_ip_fwd4_i;
          end
      	8'b00010000:
      	  begin
      			ch1_ip_data_r = pcc_ip_data5_i;
            ch1_ip_stb_r  = pcc_ip_stb5_i;
            ch1_ip_fwd_r  = pcc_ip_fwd5_i;
          end
      	8'b00100000:
      	  begin
      			ch1_ip_data_r = pcc_ip_data6_i;
            ch1_ip_stb_r  = pcc_ip_stb6_i;
            ch1_ip_fwd_r  = pcc_ip_fwd6_i;
          end
      	8'b01000000:
      	  begin
      			ch1_ip_data_r = pcc_ip_data7_i;
            ch1_ip_stb_r  = pcc_ip_stb7_i;
            ch1_ip_fwd_r  = pcc_ip_fwd7_i;
          end
      	8'b10000000:
      	  begin
      			ch1_ip_data_r = pcc_ip_data8_i;
            ch1_ip_stb_r  = pcc_ip_stb8_i;
            ch1_ip_fwd_r  = pcc_ip_fwd8_i;
          end
        
      endcase
  end

  always @(posedge clk)
    if (~rst_n)
      ch2_lock_r<=8'd0;
	 else if (ch2_ip_cancel_i)
	    ch2_lock_r<=8'd0;
    else if (pcc_ip_stb1_i && (pcc_ip_data1_i[65:64] == 2'b10) && (pcc_ip_data1_i[15:8] ==ch2_ddr_pos_1st_wr ))
      ch2_lock_r<=8'b00000001;
    else if (pcc_ip_stb2_i && (pcc_ip_data2_i[65:64] == 2'b10) && (pcc_ip_data2_i[15:8] ==ch2_ddr_pos_1st_wr ))
      ch2_lock_r<=8'b00000010;
    else if (pcc_ip_stb3_i && (pcc_ip_data3_i[65:64] == 2'b10) && (pcc_ip_data3_i[15:8] ==ch2_ddr_pos_1st_wr ))
      ch2_lock_r<=8'b00000100; 
    else if (pcc_ip_stb4_i && (pcc_ip_data4_i[65:64] == 2'b10) && (pcc_ip_data4_i[15:8] ==ch2_ddr_pos_1st_wr ))
      ch2_lock_r<=8'b00001000;
    else if (pcc_ip_stb5_i && (pcc_ip_data5_i[65:64] == 2'b10) && (pcc_ip_data5_i[15:8] ==ch2_ddr_pos_1st_wr ))
      ch2_lock_r<=8'b00010000;
    else if (pcc_ip_stb6_i && (pcc_ip_data6_i[65:64] == 2'b10) && (pcc_ip_data6_i[15:8] ==ch2_ddr_pos_1st_wr ))
      ch2_lock_r<=8'b00100000;
    else if (pcc_ip_stb7_i && (pcc_ip_data7_i[65:64] == 2'b10) && (pcc_ip_data7_i[15:8] ==ch2_ddr_pos_1st_wr ))
      ch2_lock_r<=8'b01000000;
    else if (pcc_ip_stb8_i && (pcc_ip_data8_i[65:64] == 2'b10) && (pcc_ip_data8_i[15:8] ==ch2_ddr_pos_1st_wr ))
      ch2_lock_r<=8'b10000000;
   else
     ch2_lock_r<=ch2_lock_r;

  always @( * )
     begin
     (*full_case*)
      case(ch2_lock_r)
		   8'b00000000:
			  	begin
			   		ch2_ip_data_r = 66'b0;
            ch2_ip_stb_r  = 0;
            ch2_ip_fwd_r  = 0;
          end 
      	8'b00000001: 
      	  begin
      			ch2_ip_data_r = pcc_ip_data1_i;
            ch2_ip_stb_r  = pcc_ip_stb1_i;
            ch2_ip_fwd_r  = pcc_ip_fwd1_i;
          end
      	8'b00000010:
      	  begin
      			ch2_ip_data_r = pcc_ip_data2_i;
            ch2_ip_stb_r  = pcc_ip_stb2_i;
            ch2_ip_fwd_r  = pcc_ip_fwd2_i;
          end
      	8'b00000100:
      	  begin
      			ch2_ip_data_r = pcc_ip_data3_i;
            ch2_ip_stb_r  = pcc_ip_stb3_i;
            ch2_ip_fwd_r  = pcc_ip_fwd3_i;
          end
      	8'b00001000:
      	  begin
      			ch2_ip_data_r = pcc_ip_data4_i;
            ch2_ip_stb_r  = pcc_ip_stb4_i;
            ch2_ip_fwd_r  = pcc_ip_fwd4_i;
          end
      	8'b00010000:
      	  begin
      			ch2_ip_data_r = pcc_ip_data5_i;
            ch2_ip_stb_r  = pcc_ip_stb5_i;
            ch2_ip_fwd_r  = pcc_ip_fwd5_i;
          end
      	8'b00100000:
      	  begin
      			ch2_ip_data_r = pcc_ip_data6_i;
            ch2_ip_stb_r  = pcc_ip_stb6_i;
            ch2_ip_fwd_r  = pcc_ip_fwd6_i;
          end
      	8'b01000000:
      	  begin
      			ch2_ip_data_r = pcc_ip_data7_i;
            ch2_ip_stb_r  = pcc_ip_stb7_i;
            ch2_ip_fwd_r  = pcc_ip_fwd7_i;
          end
      	8'b10000000:
      	  begin
      			ch2_ip_data_r = pcc_ip_data8_i;
            ch2_ip_stb_r  = pcc_ip_stb8_i;
            ch2_ip_fwd_r  = pcc_ip_fwd8_i;
          end
      endcase
  end
always @(posedge clk)
    if (~rst_n)
      ch3_lock_r<=8'd0;
	 else if (ch3_ip_cancel_i)//(ch3_ip_data_r[65:63]==3'b011)&ch3_ip_stb_r&ch3_ip_fwd_r)
	    ch3_lock_r<=8'd0;
    else if (pcc_ip_stb1_i && (pcc_ip_data1_i[65:64] == 2'b10) && (pcc_ip_data1_i[15:8] ==ch3_ddr_pos_1st_wr ))
      ch3_lock_r<=8'b00000001;
    else if (pcc_ip_stb2_i && (pcc_ip_data2_i[65:64] == 2'b10) && (pcc_ip_data2_i[15:8] ==ch3_ddr_pos_1st_wr ))
      ch3_lock_r<=8'b00000010;
    else if (pcc_ip_stb3_i && (pcc_ip_data3_i[65:64] == 2'b10) && (pcc_ip_data3_i[15:8] ==ch3_ddr_pos_1st_wr ))
      ch3_lock_r<=8'b00000100; 
    else if (pcc_ip_stb4_i && (pcc_ip_data4_i[65:64] == 2'b10) && (pcc_ip_data4_i[15:8] ==ch3_ddr_pos_1st_wr ))
      ch3_lock_r<=8'b00001000;
    else if (pcc_ip_stb5_i && (pcc_ip_data5_i[65:64] == 2'b10) && (pcc_ip_data5_i[15:8] ==ch3_ddr_pos_1st_wr ))
      ch3_lock_r<=8'b00010000;
    else if (pcc_ip_stb6_i && (pcc_ip_data6_i[65:64] == 2'b10) && (pcc_ip_data6_i[15:8] ==ch3_ddr_pos_1st_wr ))
      ch3_lock_r<=8'b00100000;
    else if (pcc_ip_stb7_i && (pcc_ip_data7_i[65:64] == 2'b10) && (pcc_ip_data7_i[15:8] ==ch3_ddr_pos_1st_wr ))
      ch3_lock_r<=8'b01000000;
    else if (pcc_ip_stb8_i && (pcc_ip_data8_i[65:64] == 2'b10) && (pcc_ip_data8_i[15:8] ==ch3_ddr_pos_1st_wr ))
      ch3_lock_r<=8'b10000000;
   else
     ch3_lock_r<=ch3_lock_r;

  always @( * )
    begin
     (*full_case*)
     case(ch3_lock_r)
	      8'b00000000:
			  	begin
			   		ch3_ip_data_r = 66'b0;
            ch3_ip_stb_r  = 1'b0;
            ch3_ip_fwd_r  = 1'b0;
			  	end
      	8'b00000001: 
      	  begin
      			ch3_ip_data_r = pcc_ip_data1_i;
            ch3_ip_stb_r  = pcc_ip_stb1_i;
            ch3_ip_fwd_r  = pcc_ip_fwd1_i;
          end
      	8'b00000010:
      	  begin
      			ch3_ip_data_r = pcc_ip_data2_i;
            ch3_ip_stb_r  = pcc_ip_stb2_i;
            ch3_ip_fwd_r  = pcc_ip_fwd2_i;
          end
      	8'b00000100:
      	  begin
      			ch3_ip_data_r = pcc_ip_data3_i;
            ch3_ip_stb_r  = pcc_ip_stb3_i;
            ch3_ip_fwd_r  = pcc_ip_fwd3_i;
          end
      	8'b00001000:
      	  begin
      			ch3_ip_data_r = pcc_ip_data4_i;
            ch3_ip_stb_r  = pcc_ip_stb4_i;
            ch3_ip_fwd_r  = pcc_ip_fwd4_i;
          end
      	8'b00010000:
      	  begin
      			ch3_ip_data_r = pcc_ip_data5_i;
            ch3_ip_stb_r  = pcc_ip_stb5_i;
            ch3_ip_fwd_r  = pcc_ip_fwd5_i;
          end
      	8'b00100000:
      	  begin
      			ch3_ip_data_r = pcc_ip_data6_i;
            ch3_ip_stb_r  = pcc_ip_stb6_i;
            ch3_ip_fwd_r  = pcc_ip_fwd6_i;
          end
      	8'b01000000:
      	  begin
      			ch3_ip_data_r = pcc_ip_data7_i;
            ch3_ip_stb_r  = pcc_ip_stb7_i;
            ch3_ip_fwd_r  = pcc_ip_fwd7_i;
          end
      	8'b10000000:
      	  begin
      			ch3_ip_data_r = pcc_ip_data8_i;
            ch3_ip_stb_r  = pcc_ip_stb8_i;
            ch3_ip_fwd_r  = pcc_ip_fwd8_i;
          end
      endcase
  end
  
  always @(posedge clk)
    if (~rst_n)
      ch4_lock_r<=8'd0;
	 else if (ch4_ip_cancel_i)//(ch4_ip_data_r[65:63]==3'b011)&ch4_ip_stb_r&ch4_ip_fwd_r)
	    ch4_lock_r<=8'd0;
    else if (pcc_ip_stb1_i && (pcc_ip_data1_i[65:64] == 2'b10) && (pcc_ip_data1_i[15:8] ==ch4_ddr_pos_1st_wr ))
      ch4_lock_r<=8'b00000001;
    else if (pcc_ip_stb2_i && (pcc_ip_data2_i[65:64] == 2'b10) && (pcc_ip_data2_i[15:8] ==ch4_ddr_pos_1st_wr ))
      ch4_lock_r<=8'b00000010;
    else if (pcc_ip_stb3_i && (pcc_ip_data3_i[65:64] == 2'b10) && (pcc_ip_data3_i[15:8] ==ch4_ddr_pos_1st_wr ))
      ch4_lock_r<=8'b00000100; 
    else if (pcc_ip_stb4_i && (pcc_ip_data4_i[65:64] == 2'b10) && (pcc_ip_data4_i[15:8] ==ch4_ddr_pos_1st_wr ))
      ch4_lock_r<=8'b00001000;
    else if (pcc_ip_stb5_i && (pcc_ip_data5_i[65:64] == 2'b10) && (pcc_ip_data5_i[15:8] ==ch4_ddr_pos_1st_wr ))
      ch4_lock_r<=8'b00010000;
    else if (pcc_ip_stb6_i && (pcc_ip_data6_i[65:64] == 2'b10) && (pcc_ip_data6_i[15:8] ==ch4_ddr_pos_1st_wr ))
      ch4_lock_r<=8'b00100000;
    else if (pcc_ip_stb7_i && (pcc_ip_data7_i[65:64] == 2'b10) && (pcc_ip_data7_i[15:8] ==ch4_ddr_pos_1st_wr ))
      ch4_lock_r<=8'b01000000;
    else if (pcc_ip_stb8_i && (pcc_ip_data8_i[65:64] == 2'b10) && (pcc_ip_data8_i[15:8] ==ch4_ddr_pos_1st_wr ))
      ch4_lock_r<=8'b10000000;
   else
     ch4_lock_r<=ch4_lock_r;

  always @( * )
    begin
     (*full_case*)
      case(ch4_lock_r)
		   8'b00000000:
			 		begin
	          ch4_ip_data_r = 66'b0;
	          ch4_ip_stb_r  = 1'b0;
	          ch4_ip_fwd_r  = 1'b0;
          end
      	8'b00000001: 
      	  begin
      			ch4_ip_data_r = pcc_ip_data1_i;
            ch4_ip_stb_r  = pcc_ip_stb1_i;
            ch4_ip_fwd_r  = pcc_ip_fwd1_i;
          end
      	8'b00000010:
      	  begin
      			ch4_ip_data_r = pcc_ip_data2_i;
            ch4_ip_stb_r  = pcc_ip_stb2_i;
            ch4_ip_fwd_r  = pcc_ip_fwd2_i;
          end
      	8'b00000100:
      	  begin
      			ch4_ip_data_r = pcc_ip_data3_i;
            ch4_ip_stb_r  = pcc_ip_stb3_i;
            ch4_ip_fwd_r  = pcc_ip_fwd3_i;
          end
      	8'b00001000:
      	  begin
      			ch4_ip_data_r = pcc_ip_data4_i;
            ch4_ip_stb_r  = pcc_ip_stb4_i;
            ch4_ip_fwd_r  = pcc_ip_fwd4_i;
          end
      	8'b00010000:
      	  begin
      			ch4_ip_data_r = pcc_ip_data5_i;
            ch4_ip_stb_r  = pcc_ip_stb5_i;
            ch4_ip_fwd_r  = pcc_ip_fwd5_i;
          end
      	8'b00100000:
      	  begin
      			ch4_ip_data_r = pcc_ip_data6_i;
            ch4_ip_stb_r  = pcc_ip_stb6_i;
            ch4_ip_fwd_r  = pcc_ip_fwd6_i;
          end
      	8'b01000000:
      	  begin
      			ch4_ip_data_r = pcc_ip_data7_i;
            ch4_ip_stb_r  = pcc_ip_stb7_i;
            ch4_ip_fwd_r  = pcc_ip_fwd7_i;
          end
      	8'b10000000:
      	  begin
      			ch4_ip_data_r = pcc_ip_data8_i;
            ch4_ip_stb_r  = pcc_ip_stb8_i;
            ch4_ip_fwd_r  = pcc_ip_fwd8_i;
          end
      endcase
  end
  
  always @(posedge clk)
    if (~rst_n)
      ch5_lock_r<=8'd0;
	 else if (ch5_ip_cancel_i)//(ch5_ip_data_r[65:63]==3'b011)&ch5_ip_stb_r&ch5_ip_fwd_r)
	    ch5_lock_r<=8'd0;
    else if (pcc_ip_stb1_i && (pcc_ip_data1_i[65:64] == 2'b10) && (pcc_ip_data1_i[15:8] ==ch5_ddr_pos_1st_wr ))
      ch5_lock_r<=8'b00000001;
    else if (pcc_ip_stb2_i && (pcc_ip_data2_i[65:64] == 2'b10) && (pcc_ip_data2_i[15:8] ==ch5_ddr_pos_1st_wr ))
      ch5_lock_r<=8'b00000010;
    else if (pcc_ip_stb3_i && (pcc_ip_data3_i[65:64] == 2'b10) && (pcc_ip_data3_i[15:8] ==ch5_ddr_pos_1st_wr ))
      ch5_lock_r<=8'b00000100; 
    else if (pcc_ip_stb4_i && (pcc_ip_data4_i[65:64] == 2'b10) && (pcc_ip_data4_i[15:8] ==ch5_ddr_pos_1st_wr ))
      ch5_lock_r<=8'b00001000;
    else if (pcc_ip_stb5_i && (pcc_ip_data5_i[65:64] == 2'b10) && (pcc_ip_data5_i[15:8] ==ch5_ddr_pos_1st_wr ))
      ch5_lock_r<=8'b00010000;
    else if (pcc_ip_stb6_i && (pcc_ip_data6_i[65:64] == 2'b10) && (pcc_ip_data6_i[15:8] ==ch5_ddr_pos_1st_wr ))
      ch5_lock_r<=8'b00100000;
    else if (pcc_ip_stb7_i && (pcc_ip_data7_i[65:64] == 2'b10) && (pcc_ip_data7_i[15:8] ==ch5_ddr_pos_1st_wr ))
      ch5_lock_r<=8'b01000000;
    else if (pcc_ip_stb8_i && (pcc_ip_data8_i[65:64] == 2'b10) && (pcc_ip_data8_i[15:8] ==ch5_ddr_pos_1st_wr ))
      ch5_lock_r<=8'b10000000;
   else
     ch5_lock_r<=ch5_lock_r;

  always @( * ) begin
     (*full_case*)
      case(ch5_lock_r)
		   8'b00000000:
			  	begin
						ch5_ip_data_r = 66'b0;
						ch5_ip_stb_r  = 1'b0;
						ch5_ip_fwd_r  = 1'b0;
			  	end		
      	8'b00000001: 
      	  begin
      			ch5_ip_data_r = pcc_ip_data1_i;
            ch5_ip_stb_r  = pcc_ip_stb1_i;
            ch5_ip_fwd_r  = pcc_ip_fwd1_i;
          end
      	8'b00000010:
      	  begin
      			ch5_ip_data_r = pcc_ip_data2_i;
            ch5_ip_stb_r  = pcc_ip_stb2_i;
            ch5_ip_fwd_r  = pcc_ip_fwd2_i;
          end
      	8'b00000100:
      	  begin
      			ch5_ip_data_r = pcc_ip_data3_i;
            ch5_ip_stb_r  = pcc_ip_stb3_i;
            ch5_ip_fwd_r  = pcc_ip_fwd3_i;
          end
      	8'b00001000:
      	  begin
      			ch5_ip_data_r = pcc_ip_data4_i;
            ch5_ip_stb_r  = pcc_ip_stb4_i;
            ch5_ip_fwd_r  = pcc_ip_fwd4_i;
          end
      	8'b00010000:
      	  begin
      			ch5_ip_data_r = pcc_ip_data5_i;
            ch5_ip_stb_r  = pcc_ip_stb5_i;
            ch5_ip_fwd_r  = pcc_ip_fwd5_i;
          end
      	8'b00100000:
      	  begin
      			ch5_ip_data_r = pcc_ip_data6_i;
            ch5_ip_stb_r  = pcc_ip_stb6_i;
            ch5_ip_fwd_r  = pcc_ip_fwd6_i;
          end
      	8'b01000000:
      	  begin
      			ch5_ip_data_r = pcc_ip_data7_i;
            ch5_ip_stb_r  = pcc_ip_stb7_i;
            ch5_ip_fwd_r  = pcc_ip_fwd7_i;
          end
      	8'b10000000:
      	  begin
      			ch5_ip_data_r = pcc_ip_data8_i;
            ch5_ip_stb_r  = pcc_ip_stb8_i;
            ch5_ip_fwd_r  = pcc_ip_fwd8_i;
          end
      endcase
  end
  
  always @(posedge clk)
    if (~rst_n)
      ch6_lock_r<=8'd0;
	 else if (ch6_ip_cancel_i)//(ch6_ip_data_r[65:63]==3'b011)&ch6_ip_stb_r&ch6_ip_fwd_r)
	    ch6_lock_r<=8'd0;
    else if (pcc_ip_stb1_i && (pcc_ip_data1_i[65:64] == 2'b10) && (pcc_ip_data1_i[15:8] ==ch6_ddr_pos_1st_wr ))
      ch6_lock_r<=8'b00000001;
    else if (pcc_ip_stb2_i && (pcc_ip_data2_i[65:64] == 2'b10) && (pcc_ip_data2_i[15:8] ==ch6_ddr_pos_1st_wr ))
      ch6_lock_r<=8'b00000010;
    else if (pcc_ip_stb3_i && (pcc_ip_data3_i[65:64] == 2'b10) && (pcc_ip_data3_i[15:8] ==ch6_ddr_pos_1st_wr ))
      ch6_lock_r<=8'b00000100; 
    else if (pcc_ip_stb4_i && (pcc_ip_data4_i[65:64] == 2'b10) && (pcc_ip_data4_i[15:8] ==ch6_ddr_pos_1st_wr ))
      ch6_lock_r<=8'b00001000;
    else if (pcc_ip_stb5_i && (pcc_ip_data5_i[65:64] == 2'b10) && (pcc_ip_data5_i[15:8] ==ch6_ddr_pos_1st_wr ))
      ch6_lock_r<=8'b00010000;
    else if (pcc_ip_stb6_i && (pcc_ip_data6_i[65:64] == 2'b10) && (pcc_ip_data6_i[15:8] ==ch6_ddr_pos_1st_wr ))
      ch6_lock_r<=8'b00100000;
    else if (pcc_ip_stb7_i && (pcc_ip_data7_i[65:64] == 2'b10) && (pcc_ip_data7_i[15:8] ==ch6_ddr_pos_1st_wr ))
      ch6_lock_r<=8'b01000000;
    else if (pcc_ip_stb8_i && (pcc_ip_data8_i[65:64] == 2'b10) && (pcc_ip_data8_i[15:8] ==ch6_ddr_pos_1st_wr ))
      ch6_lock_r<=8'b10000000;
   else
     ch6_lock_r<=ch6_lock_r;

  always @( * ) begin
     (*full_case*)
      case(ch6_lock_r)
		  8'b00000000:
			 		begin
						ch6_ip_data_r = 66'b0;
						ch6_ip_stb_r  = 1'b0;
						ch6_ip_fwd_r  = 1'b0;
          end
      	8'b00000001: 
      	  begin
      			ch6_ip_data_r = pcc_ip_data1_i;
            ch6_ip_stb_r  = pcc_ip_stb1_i;
            ch6_ip_fwd_r  = pcc_ip_fwd1_i;
          end
      	8'b00000010:
      	  begin
      			ch6_ip_data_r = pcc_ip_data2_i;
            ch6_ip_stb_r  = pcc_ip_stb2_i;
            ch6_ip_fwd_r  = pcc_ip_fwd2_i;
          end
      	8'b00000100:
      	  begin
      			ch6_ip_data_r = pcc_ip_data3_i;
            ch6_ip_stb_r  = pcc_ip_stb3_i;
            ch6_ip_fwd_r  = pcc_ip_fwd3_i;
          end
      	8'b00001000:
      	  begin
      			ch6_ip_data_r = pcc_ip_data4_i;
            ch6_ip_stb_r  = pcc_ip_stb4_i;
            ch6_ip_fwd_r  = pcc_ip_fwd4_i;
          end
      	8'b00010000:
      	  begin
      			ch6_ip_data_r = pcc_ip_data5_i;
            ch6_ip_stb_r  = pcc_ip_stb5_i;
            ch6_ip_fwd_r  = pcc_ip_fwd5_i;
          end
      	8'b00100000:
      	  begin
      			ch6_ip_data_r = pcc_ip_data6_i;
            ch6_ip_stb_r  = pcc_ip_stb6_i;
            ch6_ip_fwd_r  = pcc_ip_fwd6_i;
          end
      	8'b01000000:
      	  begin
      			ch6_ip_data_r = pcc_ip_data7_i;
            ch6_ip_stb_r  = pcc_ip_stb7_i;
            ch6_ip_fwd_r  = pcc_ip_fwd7_i;
          end
      	8'b10000000:
      	  begin
      			ch6_ip_data_r = pcc_ip_data8_i;
            ch6_ip_stb_r  = pcc_ip_stb8_i;
            ch6_ip_fwd_r  = pcc_ip_fwd8_i;
          end
      endcase
  end
  
 always @(posedge clk)
  /* if (~rst_n)
     begin
      pcc_ip_fail1_r   <=0;
      pcc_ip_pack1_r   <= 0;   
      pcc_ip_suspend1_r<= 0;
      pcc_ip_cancel1_r <= 0;
     end
  else */
    begin
     (*full_case*)
     case ({ch1_lock_r[0],ch2_lock_r[0],ch3_lock_r[0],ch4_lock_r[0],ch5_lock_r[0],ch6_lock_r[0]})
        6'b000000:
          begin
           pcc_ip_fail1_r   <= 0;
           pcc_ip_pack1_r   <= 0;
           pcc_ip_suspend1_r<= 0;
           pcc_ip_cancel1_r <= 0;
          end
        6'b100000:
          begin
           pcc_ip_fail1_r   <= ch1_ip_fail_i;  
           pcc_ip_pack1_r   <= ch1_ip_pack_i;   
           pcc_ip_suspend1_r<= ch1_ip_suspend_i;
           pcc_ip_cancel1_r <= ch1_ip_cancel_i; 
          end
        6'b010000:
          begin
           pcc_ip_fail1_r   <= ch2_ip_fail_i;  
           pcc_ip_pack1_r   <= ch2_ip_pack_i;   
           pcc_ip_suspend1_r<= ch2_ip_suspend_i;
           pcc_ip_cancel1_r <= ch2_ip_cancel_i; 
          end
         6'b001000:
          begin
           pcc_ip_fail1_r   <= ch3_ip_fail_i;  
           pcc_ip_pack1_r   <= ch3_ip_pack_i;   
           pcc_ip_suspend1_r<= ch3_ip_suspend_i;
           pcc_ip_cancel1_r <= ch3_ip_cancel_i; 
          end 
         6'b000100:
          begin
           pcc_ip_fail1_r   <= ch4_ip_fail_i;  
           pcc_ip_pack1_r   <= ch4_ip_pack_i;   
           pcc_ip_suspend1_r<= ch4_ip_suspend_i;
           pcc_ip_cancel1_r <= ch4_ip_cancel_i; 
          end 
         6'b000010:
          begin
           pcc_ip_fail1_r   <= ch5_ip_fail_i;  
           pcc_ip_pack1_r   <= ch5_ip_pack_i;   
           pcc_ip_suspend1_r<= ch5_ip_suspend_i;
           pcc_ip_cancel1_r <= ch5_ip_cancel_i; 
          end
        6'b000001:
          begin
           pcc_ip_fail1_r   <= ch6_ip_fail_i;  
           pcc_ip_pack1_r   <= ch6_ip_pack_i;   
           pcc_ip_suspend1_r<= ch6_ip_suspend_i;
           pcc_ip_cancel1_r <= ch6_ip_cancel_i; 
          end
       endcase
      end
      
 always @(posedge clk)
    /* if (~rst_n)
     begin
      pcc_ip_fail2_r	 <= 0;
      pcc_ip_pack2_r   <= 0;   
      pcc_ip_suspend2_r<= 0;
      pcc_ip_cancel2_r <= 0;
     end
    else */
     begin
     (*full_case*)
     case ({ch1_lock_r[1],ch2_lock_r[1],ch3_lock_r[1],ch4_lock_r[1],ch5_lock_r[1],ch6_lock_r[1]})
        6'b000000:
          begin
           pcc_ip_fail2_r		<= 0;
           pcc_ip_pack2_r   <= 0;   
           pcc_ip_suspend2_r<= 0;
           pcc_ip_cancel2_r <= 0;
          end
        6'b100000:
          begin
           pcc_ip_fail2_r   <= ch1_ip_fail_i;  
           pcc_ip_pack2_r   <= ch1_ip_pack_i;   
           pcc_ip_suspend2_r<= ch1_ip_suspend_i;
           pcc_ip_cancel2_r <= ch1_ip_cancel_i; 
          end
        6'b010000:
          begin
           pcc_ip_fail2_r   <= ch2_ip_fail_i;  
           pcc_ip_pack2_r   <= ch2_ip_pack_i;   
           pcc_ip_suspend2_r<= ch2_ip_suspend_i;
           pcc_ip_cancel2_r <= ch2_ip_cancel_i; 
          end
         6'b001000:
          begin
           pcc_ip_fail2_r   <= ch3_ip_fail_i;  
           pcc_ip_pack2_r   <= ch3_ip_pack_i;   
           pcc_ip_suspend2_r<= ch3_ip_suspend_i;
           pcc_ip_cancel2_r <= ch3_ip_cancel_i; 
          end 
         6'b000100:
          begin
           pcc_ip_fail2_r   <= ch4_ip_fail_i;  
           pcc_ip_pack2_r   <= ch4_ip_pack_i;   
           pcc_ip_suspend2_r<= ch4_ip_suspend_i;
           pcc_ip_cancel2_r <= ch4_ip_cancel_i; 
          end 
         6'b000010:
          begin
           pcc_ip_fail2_r   <= ch5_ip_fail_i;  
           pcc_ip_pack2_r   <= ch5_ip_pack_i;   
           pcc_ip_suspend2_r<= ch5_ip_suspend_i;
           pcc_ip_cancel2_r <= ch5_ip_cancel_i; 
          end
        6'b000001:
          begin
           pcc_ip_fail2_r   <= ch6_ip_fail_i;  
           pcc_ip_pack2_r   <= ch6_ip_pack_i;   
           pcc_ip_suspend2_r<= ch6_ip_suspend_i;
           pcc_ip_cancel2_r <= ch6_ip_cancel_i; 
          end
       endcase
      end  
      
 always @(posedge clk)
    /* if (~rst_n)
     begin
      pcc_ip_fail3_r	 <= 0;
      pcc_ip_pack3_r   <= 0;   
      pcc_ip_suspend3_r<= 0;
      pcc_ip_cancel3_r <= 0;
     end
    else */
     begin
     (*full_case*)
     case ({ch1_lock_r[2],ch2_lock_r[2],ch3_lock_r[2],ch4_lock_r[2],ch5_lock_r[2],ch6_lock_r[2]})
        6'b000000:
          begin
           pcc_ip_fail3_r		<= 0;
           pcc_ip_pack3_r   <= 0;   
           pcc_ip_suspend3_r<= 0;
           pcc_ip_cancel3_r <= 0;
          end
        6'b100000:
          begin
           pcc_ip_fail3_r   <= ch1_ip_fail_i;  
           pcc_ip_pack3_r   <= ch1_ip_pack_i;   
           pcc_ip_suspend3_r<= ch1_ip_suspend_i;
           pcc_ip_cancel3_r <= ch1_ip_cancel_i; 
          end
        6'b010000:
          begin
           pcc_ip_fail3_r   <= ch2_ip_fail_i;  
           pcc_ip_pack3_r   <= ch2_ip_pack_i;   
           pcc_ip_suspend3_r<= ch2_ip_suspend_i;
           pcc_ip_cancel3_r <= ch2_ip_cancel_i; 
          end
         6'b001000:
          begin
           pcc_ip_fail3_r   <= ch3_ip_fail_i;  
           pcc_ip_pack3_r   <= ch3_ip_pack_i;   
           pcc_ip_suspend3_r<= ch3_ip_suspend_i;
           pcc_ip_cancel3_r <= ch3_ip_cancel_i; 
          end 
         6'b000100:
          begin
           pcc_ip_fail3_r   <= ch4_ip_fail_i;  
           pcc_ip_pack3_r   <= ch4_ip_pack_i;   
           pcc_ip_suspend3_r<= ch4_ip_suspend_i;
           pcc_ip_cancel3_r <= ch4_ip_cancel_i; 
          end 
         6'b000010:
          begin
           pcc_ip_fail3_r   <= ch5_ip_fail_i;  
           pcc_ip_pack3_r   <= ch5_ip_pack_i;   
           pcc_ip_suspend3_r<= ch5_ip_suspend_i;
           pcc_ip_cancel3_r <= ch5_ip_cancel_i; 
          end
        6'b000001:
          begin
           pcc_ip_fail3_r   <= ch6_ip_fail_i;  
           pcc_ip_pack3_r   <= ch6_ip_pack_i;   
           pcc_ip_suspend3_r<= ch6_ip_suspend_i;
           pcc_ip_cancel3_r <= ch6_ip_cancel_i; 
          end
       endcase
      end 
      
     always @(posedge clk)
    /* if (~rst_n)
     begin
      pcc_ip_fail4_r	 <= 0;
      pcc_ip_pack4_r   <= 0;   
      pcc_ip_suspend4_r<= 0;
      pcc_ip_cancel4_r <= 0;
     end
    else */
     begin
     (*full_case*)
     case ({ch1_lock_r[3],ch2_lock_r[3],ch3_lock_r[3],ch4_lock_r[3],ch5_lock_r[3],ch6_lock_r[3]})
        6'b000000:
          begin
           pcc_ip_fail4_r		<= 0;
           pcc_ip_pack4_r   <= 0;   
           pcc_ip_suspend4_r<= 0;
           pcc_ip_cancel4_r <= 0;
          end
        6'b100000:
          begin
           pcc_ip_fail4_r   <= ch1_ip_fail_i;  
           pcc_ip_pack4_r   <= ch1_ip_pack_i;   
           pcc_ip_suspend4_r<= ch1_ip_suspend_i;
           pcc_ip_cancel4_r <= ch1_ip_cancel_i; 
          end
        6'b010000:
          begin
           pcc_ip_fail4_r   <= ch2_ip_fail_i;  
           pcc_ip_pack4_r   <= ch2_ip_pack_i;   
           pcc_ip_suspend4_r<= ch2_ip_suspend_i;
           pcc_ip_cancel4_r <= ch2_ip_cancel_i; 
          end
         6'b001000:
          begin
           pcc_ip_fail4_r   <= ch3_ip_fail_i;  
           pcc_ip_pack4_r   <= ch3_ip_pack_i;   
           pcc_ip_suspend4_r<= ch3_ip_suspend_i;
           pcc_ip_cancel4_r <= ch3_ip_cancel_i; 
          end 
         6'b000100:
          begin
           pcc_ip_fail4_r   <= ch4_ip_fail_i;  
           pcc_ip_pack4_r   <= ch4_ip_pack_i;   
           pcc_ip_suspend4_r<= ch4_ip_suspend_i;
           pcc_ip_cancel4_r <= ch4_ip_cancel_i; 
          end 
         6'b000010:
          begin
           pcc_ip_fail4_r   <= ch5_ip_fail_i;  
           pcc_ip_pack4_r   <= ch5_ip_pack_i;   
           pcc_ip_suspend4_r<= ch5_ip_suspend_i;
           pcc_ip_cancel4_r <= ch5_ip_cancel_i; 
          end
        6'b000001:
          begin
           pcc_ip_fail4_r   <= ch6_ip_fail_i;  
           pcc_ip_pack4_r   <= ch6_ip_pack_i;   
           pcc_ip_suspend4_r<= ch6_ip_suspend_i;
           pcc_ip_cancel4_r <= ch6_ip_cancel_i; 
          end
       endcase
      end 
  
   always @(posedge clk)
    /* if (~rst_n)
     begin
      pcc_ip_fail5_r	 <=	0;
      pcc_ip_pack5_r   <= 0;   
      pcc_ip_suspend5_r<= 0;
      pcc_ip_cancel5_r <= 0;
     end
    else */
     begin
     (*full_case*)
     case ({ch1_lock_r[4],ch2_lock_r[4],ch3_lock_r[4],ch4_lock_r[4],ch5_lock_r[4],ch6_lock_r[4]})
        6'b000000:
          begin
           pcc_ip_fail5_r		<= 0;
           pcc_ip_pack5_r   <= 0;   
           pcc_ip_suspend5_r<= 0;
           pcc_ip_cancel5_r <= 0;
          end
        6'b100000:
          begin
           pcc_ip_fail5_r   <= ch1_ip_fail_i;  
           pcc_ip_pack5_r   <= ch1_ip_pack_i;   
           pcc_ip_suspend5_r<= ch1_ip_suspend_i;
           pcc_ip_cancel5_r <= ch1_ip_cancel_i; 
          end
        6'b010000:
          begin
           pcc_ip_fail5_r   <= ch2_ip_fail_i;  
           pcc_ip_pack5_r   <= ch2_ip_pack_i;   
           pcc_ip_suspend5_r<= ch2_ip_suspend_i;
           pcc_ip_cancel5_r <= ch2_ip_cancel_i; 
          end
         6'b001000:
          begin
           pcc_ip_fail5_r   <= ch3_ip_fail_i;  
           pcc_ip_pack5_r   <= ch3_ip_pack_i;   
           pcc_ip_suspend5_r<= ch3_ip_suspend_i;
           pcc_ip_cancel5_r <= ch3_ip_cancel_i; 
          end 
         6'b000100:
          begin
           pcc_ip_fail5_r   <= ch4_ip_fail_i;  
           pcc_ip_pack5_r   <= ch4_ip_pack_i;   
           pcc_ip_suspend5_r<= ch4_ip_suspend_i;
           pcc_ip_cancel5_r <= ch4_ip_cancel_i; 
          end 
         6'b000010:
          begin
           pcc_ip_fail5_r   <= ch5_ip_fail_i;  
           pcc_ip_pack5_r   <= ch5_ip_pack_i;   
           pcc_ip_suspend5_r<= ch5_ip_suspend_i;
           pcc_ip_cancel5_r <= ch5_ip_cancel_i; 
          end
        6'b000001:
          begin
           pcc_ip_fail5_r   <= ch6_ip_fail_i;  
           pcc_ip_pack5_r   <= ch6_ip_pack_i;   
           pcc_ip_suspend5_r<= ch6_ip_suspend_i;
           pcc_ip_cancel5_r <= ch6_ip_cancel_i; 
          end
       endcase
      end      
   always @(posedge clk)
    /* if (~rst_n)
     begin
      pcc_ip_fail6_r	 <= 0;
      pcc_ip_pack6_r   <= 0;   
      pcc_ip_suspend6_r<= 0;
      pcc_ip_cancel6_r <= 0;
     end
    else */
     begin
     (*full_case*)
     case ({ch1_lock_r[5],ch2_lock_r[5],ch3_lock_r[5],ch4_lock_r[5],ch5_lock_r[5],ch6_lock_r[5]})
        6'b000000:
          begin
           pcc_ip_fail6_r		<= 0;
           pcc_ip_pack6_r   <= 0;   
           pcc_ip_suspend6_r<= 0;
           pcc_ip_cancel6_r <= 0;
          end
        6'b100000:
          begin
           pcc_ip_fail6_r   <= ch1_ip_fail_i;  
           pcc_ip_pack6_r   <= ch1_ip_pack_i;   
           pcc_ip_suspend6_r<= ch1_ip_suspend_i;
           pcc_ip_cancel6_r <= ch1_ip_cancel_i; 
          end
        6'b010000:
          begin
           pcc_ip_fail6_r   <= ch2_ip_fail_i;  
           pcc_ip_pack6_r   <= ch2_ip_pack_i;   
           pcc_ip_suspend6_r<= ch2_ip_suspend_i;
           pcc_ip_cancel6_r <= ch2_ip_cancel_i; 
          end
         6'b001000:
          begin
           pcc_ip_fail6_r   <= ch3_ip_fail_i;  
           pcc_ip_pack6_r   <= ch3_ip_pack_i;   
           pcc_ip_suspend6_r<= ch3_ip_suspend_i;
           pcc_ip_cancel6_r <= ch3_ip_cancel_i; 
          end 
         6'b000100:
          begin
           pcc_ip_fail6_r   <= ch4_ip_fail_i;  
           pcc_ip_pack6_r   <= ch4_ip_pack_i;   
           pcc_ip_suspend6_r<= ch4_ip_suspend_i;
           pcc_ip_cancel6_r <= ch4_ip_cancel_i; 
          end 
         6'b000010:
          begin
          pcc_ip_fail6_r   <= ch5_ip_fail_i;  
          pcc_ip_pack6_r   <= ch5_ip_pack_i;   
          pcc_ip_suspend6_r<= ch5_ip_suspend_i;
          pcc_ip_cancel6_r <= ch5_ip_cancel_i; 
          end
        6'b000001:
          begin
           pcc_ip_fail6_r   <= ch6_ip_fail_i;  
           pcc_ip_pack6_r   <= ch6_ip_pack_i;   
           pcc_ip_suspend6_r<= ch6_ip_suspend_i;
           pcc_ip_cancel6_r <= ch6_ip_cancel_i; 
          end
       endcase
      end 
      
  always @(posedge clk)
    /* if (~rst_n)
     begin
      pcc_ip_fail7_r	 <= 0;
      pcc_ip_pack7_r   <= 0;   
      pcc_ip_suspend7_r<= 0;
      pcc_ip_cancel7_r <= 0;
     end
    else */
     begin
     (*full_case*)
     case ({ch1_lock_r[6],ch2_lock_r[6],ch3_lock_r[6],ch4_lock_r[6],ch5_lock_r[6],ch6_lock_r[6]})
        6'b000000:
          begin
           pcc_ip_fail7_r		<= 0;
           pcc_ip_pack7_r   <= 0;   
           pcc_ip_suspend7_r<= 0;
           pcc_ip_cancel7_r <= 0;
          end
        6'b100000:
          begin
           pcc_ip_fail7_r   <= ch1_ip_fail_i;  
           pcc_ip_pack7_r   <= ch1_ip_pack_i;   
           pcc_ip_suspend7_r<= ch1_ip_suspend_i;
           pcc_ip_cancel7_r <= ch1_ip_cancel_i; 
          end
        6'b010000:
          begin
           pcc_ip_fail7_r   <= ch2_ip_fail_i;  
           pcc_ip_pack7_r   <= ch2_ip_pack_i;   
           pcc_ip_suspend7_r<= ch2_ip_suspend_i;
           pcc_ip_cancel7_r <= ch2_ip_cancel_i; 
          end
         6'b001000:
          begin
           pcc_ip_fail7_r   <= ch3_ip_fail_i;  
           pcc_ip_pack7_r   <= ch3_ip_pack_i;   
           pcc_ip_suspend7_r<= ch3_ip_suspend_i;
           pcc_ip_cancel7_r <= ch3_ip_cancel_i; 
          end 
         6'b000100:
          begin
           pcc_ip_fail7_r   <= ch4_ip_fail_i;  
           pcc_ip_pack7_r   <= ch4_ip_pack_i;
           pcc_ip_suspend7_r<= ch4_ip_suspend_i;
           pcc_ip_cancel7_r <= ch4_ip_cancel_i; 
          end 
         6'b000010:
          begin
           pcc_ip_fail7_r   <= ch5_ip_fail_i;  
           pcc_ip_pack7_r   <= ch5_ip_pack_i;   
           pcc_ip_suspend7_r<= ch5_ip_suspend_i;
           pcc_ip_cancel7_r <= ch5_ip_cancel_i; 
          end
        6'b000001:
          begin
           pcc_ip_fail7_r   <= ch6_ip_fail_i;
           pcc_ip_pack7_r   <= ch6_ip_pack_i;
           pcc_ip_suspend7_r<= ch6_ip_suspend_i;
           pcc_ip_cancel7_r <= ch6_ip_cancel_i; 
          end
       endcase
      end
      
  always @(posedge clk)
    /* if (~rst_n)
     begin
      pcc_ip_fail8_r	 <= 0;
      pcc_ip_pack8_r   <= 0;   
      pcc_ip_suspend8_r<= 0;
      pcc_ip_cancel8_r <= 0;
     end
    else */
     begin
     (*full_case*)
     case ({ch1_lock_r[7],ch2_lock_r[7],ch3_lock_r[7],ch4_lock_r[7],ch5_lock_r[7],ch6_lock_r[7]})
        6'b000000:
          begin
           pcc_ip_fail8_r		<= 0;
           pcc_ip_pack8_r   <= 0;   
           pcc_ip_suspend8_r<= 0;
           pcc_ip_cancel8_r <= 0;
          end
        6'b100000:
          begin
           pcc_ip_fail8_r   <= ch1_ip_fail_i;  
           pcc_ip_pack8_r   <= ch1_ip_pack_i;   
           pcc_ip_suspend8_r<= ch1_ip_suspend_i;
           pcc_ip_cancel8_r <= ch1_ip_cancel_i; 
          end
        6'b010000:
          begin
           pcc_ip_fail8_r   <= ch2_ip_fail_i;  
           pcc_ip_pack8_r   <= ch2_ip_pack_i;   
           pcc_ip_suspend8_r<= ch2_ip_suspend_i;
           pcc_ip_cancel8_r <= ch2_ip_cancel_i; 
          end
         6'b001000:
          begin
           pcc_ip_fail8_r   <= ch3_ip_fail_i;  
           pcc_ip_pack8_r   <= ch3_ip_pack_i;   
           pcc_ip_suspend8_r<= ch3_ip_suspend_i;
           pcc_ip_cancel8_r <= ch3_ip_cancel_i; 
          end 
         6'b000100:
          begin
           pcc_ip_fail8_r   <= ch4_ip_fail_i;  
           pcc_ip_pack8_r   <= ch4_ip_pack_i;
           pcc_ip_suspend8_r<= ch4_ip_suspend_i;
           pcc_ip_cancel8_r <= ch4_ip_cancel_i; 
          end 
         6'b000010:
          begin
           pcc_ip_fail8_r   <= ch5_ip_fail_i;  
           pcc_ip_pack8_r   <= ch5_ip_pack_i;   
           pcc_ip_suspend8_r<= ch5_ip_suspend_i;
           pcc_ip_cancel8_r <= ch5_ip_cancel_i; 
          end
        6'b000001:
          begin
           pcc_ip_fail8_r   <= ch6_ip_fail_i;
           pcc_ip_pack8_r   <= ch6_ip_pack_i;
           pcc_ip_suspend8_r<= ch6_ip_suspend_i;
           pcc_ip_cancel8_r <= ch6_ip_cancel_i; 
          end
       endcase
      end   
  //--------------------------------------------------------------------------
  // Output
  //--------------------------------------------------------------------------
  
    assign pcc_ip_fail1_o    = pcc_ip_fail1_r;
    assign pcc_ip_pack1_o    = pcc_ip_pack1_r;
    assign pcc_ip_suspend1_o = pcc_ip_suspend1_r;
    assign pcc_ip_cancel1_o  = pcc_ip_cancel1_r;


    assign pcc_ip_fail2_o    = pcc_ip_fail2_r;
    assign pcc_ip_pack2_o    = pcc_ip_pack2_r;
    assign pcc_ip_suspend2_o = pcc_ip_suspend2_r;
    assign pcc_ip_cancel2_o  = pcc_ip_cancel2_r;

    assign pcc_ip_fail3_o    = pcc_ip_fail3_r;
    assign pcc_ip_pack3_o    = pcc_ip_pack3_r;
    assign pcc_ip_suspend3_o = pcc_ip_suspend3_r;
    assign pcc_ip_cancel3_o  = pcc_ip_cancel3_r;

    assign pcc_ip_fail4_o    = pcc_ip_fail4_r;
    assign pcc_ip_pack4_o    = pcc_ip_pack4_r;
    assign pcc_ip_suspend4_o = pcc_ip_suspend4_r;
    assign pcc_ip_cancel4_o  = pcc_ip_cancel4_r;

    assign pcc_ip_fail5_o    = pcc_ip_fail5_r;
    assign pcc_ip_pack5_o    = pcc_ip_pack5_r;
    assign pcc_ip_suspend5_o = pcc_ip_suspend5_r;
    assign pcc_ip_cancel5_o  = pcc_ip_cancel5_r;

    assign pcc_ip_fail6_o    = pcc_ip_fail6_r;
    assign pcc_ip_pack6_o    = pcc_ip_pack6_r;
    assign pcc_ip_suspend6_o = pcc_ip_suspend6_r;
    assign pcc_ip_cancel6_o  = pcc_ip_cancel6_r;

    assign pcc_ip_fail7_o    = pcc_ip_fail7_r;
    assign pcc_ip_pack7_o    = pcc_ip_pack7_r;
    assign pcc_ip_suspend7_o = pcc_ip_suspend7_r;
    assign pcc_ip_cancel7_o  = pcc_ip_cancel7_r;
    
    assign pcc_ip_fail8_o    = pcc_ip_fail8_r;
    assign pcc_ip_pack8_o    = pcc_ip_pack8_r;
    assign pcc_ip_suspend8_o = pcc_ip_suspend8_r;
    assign pcc_ip_cancel8_o  = pcc_ip_cancel8_r;

    assign  ch1_ip_data_o=ch1_ip_data_r;
    assign  ch1_ip_stb_o =ch1_ip_stb_r;
    assign  ch1_ip_fwd_o =ch1_ip_fwd_r;
    
    assign  ch2_ip_data_o=ch2_ip_data_r;
    assign  ch2_ip_stb_o =ch2_ip_stb_r;
    assign  ch2_ip_fwd_o =ch2_ip_fwd_r;
    
    assign  ch3_ip_data_o=ch3_ip_data_r;
    assign  ch3_ip_stb_o =ch3_ip_stb_r;
    assign  ch3_ip_fwd_o =ch3_ip_fwd_r;
    
    assign  ch4_ip_data_o=ch4_ip_data_r;
    assign  ch4_ip_stb_o =ch4_ip_stb_r;
    assign  ch4_ip_fwd_o =ch4_ip_fwd_r;
    
    assign  ch5_ip_data_o=ch5_ip_data_r;
    assign  ch5_ip_stb_o =ch5_ip_stb_r;
    assign  ch5_ip_fwd_o =ch5_ip_fwd_r;
    
    assign  ch6_ip_data_o=ch6_ip_data_r;
    assign  ch6_ip_stb_o =ch6_ip_stb_r;
    assign  ch6_ip_fwd_o =ch6_ip_fwd_r;
/////////////////////15/4/14/rd_crossbar//

   

   always @(posedge clk)
	  if (~rst_n)
	    ch1_rd_lock_r<=8'd0;
	 else  if (ch1_op_cancel_o)
	    ch1_rd_lock_r<=8'd0;
    else if ((ch1_op_data_i[65:64]==2'b10)&ch1_op_stb_i&(!(|ch1_rd_lock_r)))
      begin
     (*full_case*)
		 case (ch1_ddr_pos_1st_rd)
		  8'h01:
		    begin
			  if 			(!(|ddr_pos1_lock))					ch1_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos2_lock))			    ch1_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos3_lock))			    ch1_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos4_lock))			    ch1_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch1_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch1_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch1_rd_lock_r<=8'b01000000;
			  else 														    ch1_rd_lock_r<=8'b10000000;
			 end

       8'h02:
         begin
			  if 			(!(|ddr_pos2_lock))	    		ch1_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos3_lock))			    ch1_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos1_lock))			    ch1_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos4_lock))			    ch1_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch1_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch1_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch1_rd_lock_r<=8'b01000000;
			  else 														    ch1_rd_lock_r<=8'b10000000;
			 end
	    8'h03:
         begin
			  if 			(!(|ddr_pos3_lock))			    ch1_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos4_lock))			    ch1_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos2_lock))			    ch1_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos5_lock))			    ch1_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos1_lock))			    ch1_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos6_lock))			    ch1_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch1_rd_lock_r<=8'b01000000;
			  else 														    ch1_rd_lock_r<=8'b10000000;
			 end
		 8'h04:
         begin
			  if 			(!(|ddr_pos4_lock))			    ch1_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch1_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos3_lock))			    ch1_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos6_lock))			    ch1_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos2_lock))			    ch1_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos7_lock))			    ch1_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos1_lock))			    ch1_rd_lock_r<=8'b00000001;
			  else 														    ch1_rd_lock_r<=8'b10000000;
			 end
		 8'h05:
         begin
			  if 			(!(|ddr_pos5_lock))			    ch1_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch1_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos4_lock))			    ch1_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos7_lock))			    ch1_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos3_lock))			    ch1_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos8_lock))			    ch1_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos2_lock))			    ch1_rd_lock_r<=8'b00000010;
			  else 														    ch1_rd_lock_r<=8'b00000001;
			 end	 	 
			 			  
		 8'h06:
         begin
			  if 			(!(|ddr_pos6_lock))			    ch1_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch1_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos5_lock))			    ch1_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos8_lock))			    ch1_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos4_lock))			    ch1_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch1_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch1_rd_lock_r<=8'b00000010;
			  else 														    ch1_rd_lock_r<=8'b00000001;
			 end	 
		 
	   8'h07:
         begin
			  if 			(!(|ddr_pos7_lock))			    ch1_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos8_lock))			    ch1_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos6_lock))			    ch1_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos5_lock))			    ch1_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos4_lock))			    ch1_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch1_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch1_rd_lock_r<=8'b00000010;
			  else 														    ch1_rd_lock_r<=8'b00000001;
			 end
	   8'h08:
         begin
			  if 			(!(|ddr_pos8_lock))			    ch1_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos7_lock))			    ch1_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos6_lock))			    ch1_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos5_lock))			    ch1_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos4_lock))			    ch1_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch1_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch1_rd_lock_r<=8'b00000010;
			  else 														    ch1_rd_lock_r<=8'b00000001;
			 end	 
     endcase
	 end
	else 
	  ch1_rd_lock_r<=ch1_rd_lock_r;
	  
	  
	 always @(posedge clk)
	  if (~rst_n)
	    ch2_rd_lock_r<=8'd0;
	 else  if (ch2_op_cancel_o)
	    ch2_rd_lock_r<=8'd0;
    else if ((ch2_op_data_i[65:64]==2'b10)&ch2_op_stb_i&(!(|ch2_rd_lock_r)))
      begin
     (*full_case*)
		 case (ch2_ddr_pos_1st_rd)
		  8'h01:
		    begin
			  if 			(!(|ddr_pos1_lock))					ch2_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos2_lock))			    ch2_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos3_lock))			    ch2_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos4_lock))			    ch2_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch2_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch2_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch2_rd_lock_r<=8'b01000000;
			  else 														    ch2_rd_lock_r<=8'b10000000;
			 end

       8'h02:
         begin
			  if 			(!(|ddr_pos2_lock))	    		ch2_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos3_lock))			    ch2_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos1_lock))			    ch2_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos4_lock))			    ch2_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch2_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch2_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch2_rd_lock_r<=8'b01000000;
			  else 														    ch2_rd_lock_r<=8'b10000000;
			 end
	    8'h03:
         begin
			  if 			(!(|ddr_pos3_lock))			    ch2_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos4_lock))			    ch2_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos2_lock))			    ch2_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos5_lock))			    ch2_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos1_lock))			    ch2_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos6_lock))			    ch2_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch2_rd_lock_r<=8'b01000000;
			  else 														    ch2_rd_lock_r<=8'b10000000;
			 end
		 8'h04:
         begin
			  if 			(!(|ddr_pos4_lock))			    ch2_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch2_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos3_lock))			    ch2_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos6_lock))			    ch2_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos2_lock))			    ch2_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos7_lock))			    ch2_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos1_lock))			    ch2_rd_lock_r<=8'b00000001;
			  else 														    ch2_rd_lock_r<=8'b10000000;
			 end
		 8'h05:
         begin
			  if 			(!(|ddr_pos5_lock))			    ch2_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch2_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos4_lock))			    ch2_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos7_lock))			    ch2_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos3_lock))			    ch2_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos8_lock))			    ch2_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos2_lock))			    ch2_rd_lock_r<=8'b00000010;
			  else 														    ch2_rd_lock_r<=8'b00000001;
			 end	 	 
			 			  
		 8'h06:
         begin
			  if 			(!(|ddr_pos6_lock))			    ch2_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch2_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos5_lock))			    ch2_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos8_lock))			    ch2_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos4_lock))			    ch2_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch2_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch2_rd_lock_r<=8'b00000010;
			  else 														    ch2_rd_lock_r<=8'b00000001;
			 end	 
		 
	   8'h07:
         begin
			  if 			(!(|ddr_pos7_lock))			    ch2_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos8_lock))			    ch2_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos6_lock))			    ch2_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos5_lock))			    ch2_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos4_lock))			    ch2_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch2_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch2_rd_lock_r<=8'b00000010;
			  else 														    ch2_rd_lock_r<=8'b00000001;
			 end
	   8'h08:
         begin
			  if 			(!(|ddr_pos8_lock))			    ch2_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos7_lock))			    ch2_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos6_lock))			    ch2_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos5_lock))			    ch2_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos4_lock))			    ch2_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch2_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch2_rd_lock_r<=8'b00000010;
			  else 														    ch2_rd_lock_r<=8'b00000001;
			 end	 
     endcase
	 end
	else 
	  ch2_rd_lock_r<=ch2_rd_lock_r;  
	  
	  
	  
  always @(posedge clk)
	  if (~rst_n)
	    ch3_rd_lock_r<=8'd0;
	 else  if (ch3_op_cancel_o)
	    ch3_rd_lock_r<=8'd0;
    else if ((ch3_op_data_i[65:64]==2'b10)&ch3_op_stb_i&(!(|ch3_rd_lock_r)))
      begin
     (*full_case*)
		 case (ch3_ddr_pos_1st_rd)
		  8'h01:
		    begin
			  if 			(!(|ddr_pos1_lock))					ch3_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos2_lock))			    ch3_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos3_lock))			    ch3_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos4_lock))			    ch3_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch3_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch3_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch3_rd_lock_r<=8'b01000000;
			  else 														    ch3_rd_lock_r<=8'b10000000;
			 end

       8'h02:
         begin
			  if 			(!(|ddr_pos2_lock))	    		ch3_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos3_lock))			    ch3_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos1_lock))			    ch3_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos4_lock))			    ch3_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch3_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch3_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch3_rd_lock_r<=8'b01000000;
			  else 														    ch3_rd_lock_r<=8'b10000000;
			 end
	    8'h03:
         begin
			  if 			(!(|ddr_pos3_lock))			    ch3_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos4_lock))			    ch3_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos2_lock))			    ch3_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos5_lock))			    ch3_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos1_lock))			    ch3_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos6_lock))			    ch3_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch3_rd_lock_r<=8'b01000000;
			  else 														    ch3_rd_lock_r<=8'b10000000;
			 end
		 8'h04:
         begin
			  if 			(!(|ddr_pos4_lock))			    ch3_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch3_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos3_lock))			    ch3_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos6_lock))			    ch3_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos2_lock))			    ch3_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos7_lock))			    ch3_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos1_lock))			    ch3_rd_lock_r<=8'b00000001;
			  else 														    ch3_rd_lock_r<=8'b10000000;
			 end
		 8'h05:
         begin
			  if 			(!(|ddr_pos5_lock))			    ch3_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch3_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos4_lock))			    ch3_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos7_lock))			    ch3_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos3_lock))			    ch3_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos8_lock))			    ch3_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos2_lock))			    ch3_rd_lock_r<=8'b00000010;
			  else 														    ch3_rd_lock_r<=8'b00000001;
			 end	 	 
			 			  
		 8'h06:
         begin
			  if 			(!(|ddr_pos6_lock))			    ch3_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch3_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos5_lock))			    ch3_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos8_lock))			    ch3_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos4_lock))			    ch3_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch3_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch3_rd_lock_r<=8'b00000010;
			  else 														    ch3_rd_lock_r<=8'b00000001;
			 end	 
		 
	   8'h07:
         begin
			  if 			(!(|ddr_pos7_lock))			    ch3_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos8_lock))			    ch3_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos6_lock))			    ch3_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos5_lock))			    ch3_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos4_lock))			    ch3_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch3_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch3_rd_lock_r<=8'b00000010;
			  else 														    ch3_rd_lock_r<=8'b00000001;
			 end
	   8'h08:
         begin
			  if 			(!(|ddr_pos8_lock))			    ch3_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos7_lock))			    ch3_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos6_lock))			    ch3_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos5_lock))			    ch3_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos4_lock))			    ch3_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch3_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch3_rd_lock_r<=8'b00000010;
			  else 														    ch3_rd_lock_r<=8'b00000001;
			 end	 
     endcase
	 end
	else 
	  ch3_rd_lock_r<=ch3_rd_lock_r;    
	  
	  
	  
	always @(posedge clk)
	  if (~rst_n)
	    ch4_rd_lock_r<=8'd0;
	 else  if (ch4_op_cancel_o)
	    ch4_rd_lock_r<=8'd0;
    else if ((ch4_op_data_i[65:64]==2'b10)&ch4_op_stb_i&(!(|ch4_rd_lock_r)))
      begin
     (*full_case*)
		 case (ch4_ddr_pos_1st_rd)
		  8'h01:
		    begin
			  if 			(!(|ddr_pos1_lock))					ch4_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos2_lock))			    ch4_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos3_lock))			    ch4_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos4_lock))			    ch4_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch4_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch4_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch4_rd_lock_r<=8'b01000000;
			  else 														    ch4_rd_lock_r<=8'b10000000;
			 end

       8'h02:
         begin
			  if 			(!(|ddr_pos2_lock))	    		ch4_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos3_lock))			    ch4_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos1_lock))			    ch4_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos4_lock))			    ch4_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch4_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch4_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch4_rd_lock_r<=8'b01000000;
			  else 														    ch4_rd_lock_r<=8'b10000000;
			 end
	    8'h03:
         begin
			  if 			(!(|ddr_pos3_lock))			    ch4_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos4_lock))			    ch4_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos2_lock))			    ch4_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos5_lock))			    ch4_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos1_lock))			    ch4_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos6_lock))			    ch4_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch4_rd_lock_r<=8'b01000000;
			  else 														    ch4_rd_lock_r<=8'b10000000;
			 end
		 8'h04:
         begin
			  if 			(!(|ddr_pos4_lock))			    ch4_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch4_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos3_lock))			    ch4_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos6_lock))			    ch4_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos2_lock))			    ch4_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos7_lock))			    ch4_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos1_lock))			    ch4_rd_lock_r<=8'b00000001;
			  else 														    ch4_rd_lock_r<=8'b10000000;
			 end
		 8'h05:
         begin
			  if 			(!(|ddr_pos5_lock))			    ch4_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch4_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos4_lock))			    ch4_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos7_lock))			    ch4_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos3_lock))			    ch4_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos8_lock))			    ch4_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos2_lock))			    ch4_rd_lock_r<=8'b00000010;
			  else 														    ch4_rd_lock_r<=8'b00000001;
			 end	 	 
			 			  
		 8'h06:
         begin
			  if 			(!(|ddr_pos6_lock))			    ch4_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch4_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos5_lock))			    ch4_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos8_lock))			    ch4_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos4_lock))			    ch4_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch4_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch4_rd_lock_r<=8'b00000010;
			  else 														    ch4_rd_lock_r<=8'b00000001;
			 end	 
		 
	   8'h07:
         begin
			  if 			(!(|ddr_pos7_lock))			    ch4_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos8_lock))			    ch4_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos6_lock))			    ch4_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos5_lock))			    ch4_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos4_lock))			    ch4_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch4_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch4_rd_lock_r<=8'b00000010;
			  else 														    ch4_rd_lock_r<=8'b00000001;
			 end
	   8'h08:
         begin
			  if 			(!(|ddr_pos8_lock))			    ch4_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos7_lock))			    ch4_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos6_lock))			    ch4_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos5_lock))			    ch4_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos4_lock))			    ch4_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch4_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch4_rd_lock_r<=8'b00000010;
			  else 														    ch4_rd_lock_r<=8'b00000001;
			 end	 
     endcase
	 end
	else 
	  ch4_rd_lock_r<=ch4_rd_lock_r;    
	  
	  
 always @(posedge clk)
	  if (~rst_n)
	    ch5_rd_lock_r<=8'd0;
	 else  if (ch5_op_cancel_o)
	    ch5_rd_lock_r<=8'd0;
    else if ((ch5_op_data_i[65:64]==2'b10)&ch5_op_stb_i&(!(|ch5_rd_lock_r)))
      begin
     (*full_case*)
		 case (ch5_ddr_pos_1st_rd)
		  8'h01:
		    begin
			  if 			(!(|ddr_pos1_lock))					ch5_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos2_lock))			    ch5_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos3_lock))			    ch5_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos4_lock))			    ch5_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch5_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch5_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch5_rd_lock_r<=8'b01000000;
			  else 														    ch5_rd_lock_r<=8'b10000000;
			 end

       8'h02:
         begin
			  if 			(!(|ddr_pos2_lock))	    		ch5_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos3_lock))			    ch5_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos1_lock))			    ch5_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos4_lock))			    ch5_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch5_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch5_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch5_rd_lock_r<=8'b01000000;
			  else 														    ch5_rd_lock_r<=8'b10000000;
			 end
	    8'h03:
         begin
			  if 			(!(|ddr_pos3_lock))			    ch5_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos4_lock))			    ch5_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos2_lock))			    ch5_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos5_lock))			    ch5_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos1_lock))			    ch5_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos6_lock))			    ch5_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch5_rd_lock_r<=8'b01000000;
			  else 														    ch5_rd_lock_r<=8'b10000000;
			 end
		 8'h04:
         begin
			  if 			(!(|ddr_pos4_lock))			    ch5_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch5_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos3_lock))			    ch5_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos6_lock))			    ch5_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos2_lock))			    ch5_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos7_lock))			    ch5_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos1_lock))			    ch5_rd_lock_r<=8'b00000001;
			  else 														    ch5_rd_lock_r<=8'b10000000;
			 end
		 8'h05:
         begin
			  if 			(!(|ddr_pos5_lock))			    ch5_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch5_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos4_lock))			    ch5_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos7_lock))			    ch5_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos3_lock))			    ch5_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos8_lock))			    ch5_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos2_lock))			    ch5_rd_lock_r<=8'b00000010;
			  else 														    ch5_rd_lock_r<=8'b00000001;
			 end	 	 
			 			  
		 8'h06:
         begin
			  if 			(!(|ddr_pos6_lock))			    ch5_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch5_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos5_lock))			    ch5_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos8_lock))			    ch5_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos4_lock))			    ch5_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch5_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch5_rd_lock_r<=8'b00000010;
			  else 														    ch5_rd_lock_r<=8'b00000001;
			 end	 
		 
	   8'h07:
         begin
			  if 			(!(|ddr_pos7_lock))			    ch5_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos8_lock))			    ch5_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos6_lock))			    ch5_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos5_lock))			    ch5_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos4_lock))			    ch5_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch5_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch5_rd_lock_r<=8'b00000010;
			  else 														    ch5_rd_lock_r<=8'b00000001;
			 end
	   8'h08:
         begin
			  if 			(!(|ddr_pos8_lock))			    ch5_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos7_lock))			    ch5_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos6_lock))			    ch5_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos5_lock))			    ch5_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos4_lock))			    ch5_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch5_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch5_rd_lock_r<=8'b00000010;
			  else 														    ch5_rd_lock_r<=8'b00000001;
			 end	  
     endcase
	 end
	else 
	  ch5_rd_lock_r<=ch5_rd_lock_r;
	  
	  
	 always @(posedge clk)
	  if (~rst_n)
	    ch6_rd_lock_r<=8'd0;
	 else  if (ch6_op_cancel_o)	//一旦检测到链路撤销信号，就关闭通道与端口的连接
	    ch6_rd_lock_r<=8'd0;
    else if ((ch6_op_data_i[65:64]==2'b10)&ch6_op_stb_i&(!(|ch6_rd_lock_r)))
      begin
     (*full_case*)
		 case (ch6_ddr_pos_1st_rd)
		  8'h01:
		    begin
			  if 			(!(|ddr_pos1_lock))					ch6_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos2_lock))			    ch6_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos3_lock))			    ch6_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos4_lock))			    ch6_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch6_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch6_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch6_rd_lock_r<=8'b01000000;
			  else 														    ch6_rd_lock_r<=8'b10000000;
			 end

       8'h02:
         begin
			  if 			(!(|ddr_pos2_lock))	    		ch6_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos3_lock))			    ch6_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos1_lock))			    ch6_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos4_lock))			    ch6_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch6_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch6_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch6_rd_lock_r<=8'b01000000;
			  else 														    ch6_rd_lock_r<=8'b10000000;
			 end
	    8'h03:
         begin
			  if 			(!(|ddr_pos3_lock))			    ch6_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos4_lock))			    ch6_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos2_lock))			    ch6_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos5_lock))			    ch6_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos1_lock))			    ch6_rd_lock_r<=8'b00000001;
			  else if (!(|ddr_pos6_lock))			    ch6_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch6_rd_lock_r<=8'b01000000;
			  else 														    ch6_rd_lock_r<=8'b10000000;
			 end
		 8'h04:
         begin
			  if 			(!(|ddr_pos4_lock))			    ch6_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos5_lock))			    ch6_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos3_lock))			    ch6_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos6_lock))			    ch6_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos2_lock))			    ch6_rd_lock_r<=8'b00000010;
			  else if (!(|ddr_pos7_lock))			    ch6_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos1_lock))			    ch6_rd_lock_r<=8'b00000001;
			  else 														    ch6_rd_lock_r<=8'b10000000;
			 end
		 8'h05:
         begin
			  if 			(!(|ddr_pos5_lock))			    ch6_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos6_lock))			    ch6_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos4_lock))			    ch6_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos7_lock))			    ch6_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos3_lock))			    ch6_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos8_lock))			    ch6_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos2_lock))			    ch6_rd_lock_r<=8'b00000010;
			  else 														    ch6_rd_lock_r<=8'b00000001;
			 end	 	 
			 			  
		 8'h06:
         begin
			  if 			(!(|ddr_pos6_lock))			    ch6_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos7_lock))			    ch6_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos5_lock))			    ch6_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos8_lock))			    ch6_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos4_lock))			    ch6_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch6_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch6_rd_lock_r<=8'b00000010;
			  else 														    ch6_rd_lock_r<=8'b00000001;
			 end	 
		 
	   8'h07:
         begin
			  if 			(!(|ddr_pos7_lock))			    ch6_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos8_lock))			    ch6_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos6_lock))			    ch6_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos5_lock))			    ch6_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos4_lock))			    ch6_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch6_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch6_rd_lock_r<=8'b00000010;
			  else 														    ch6_rd_lock_r<=8'b00000001;
			 end
	   8'h08:
         begin
			  if 			(!(|ddr_pos8_lock))			    ch6_rd_lock_r<=8'b10000000;
			  else if (!(|ddr_pos7_lock))			    ch6_rd_lock_r<=8'b01000000;
			  else if (!(|ddr_pos6_lock))			    ch6_rd_lock_r<=8'b00100000;
			  else if (!(|ddr_pos5_lock))			    ch6_rd_lock_r<=8'b00010000;
			  else if (!(|ddr_pos4_lock))			    ch6_rd_lock_r<=8'b00001000;
			  else if (!(|ddr_pos3_lock))			    ch6_rd_lock_r<=8'b00000100;
			  else if (!(|ddr_pos2_lock))			    ch6_rd_lock_r<=8'b00000010;
			  else 														    ch6_rd_lock_r<=8'b00000001;
			 end	 
     endcase
	 end
	else
	  ch6_rd_lock_r<=ch6_rd_lock_r;
	  
	  

	assign   ddr_pos1_lock={ch6_rd_lock_r[0],ch5_rd_lock_r[0],ch4_rd_lock_r[0],ch3_rd_lock_r[0],ch2_rd_lock_r[0],ch1_rd_lock_r[0]};  
	assign   ddr_pos2_lock={ch6_rd_lock_r[1],ch5_rd_lock_r[1],ch4_rd_lock_r[1],ch3_rd_lock_r[1],ch2_rd_lock_r[1],ch1_rd_lock_r[1]};    
	assign   ddr_pos3_lock={ch6_rd_lock_r[2],ch5_rd_lock_r[2],ch4_rd_lock_r[2],ch3_rd_lock_r[2],ch2_rd_lock_r[2],ch1_rd_lock_r[2]};    
	assign   ddr_pos4_lock={ch6_rd_lock_r[3],ch5_rd_lock_r[3],ch4_rd_lock_r[3],ch3_rd_lock_r[3],ch2_rd_lock_r[3],ch1_rd_lock_r[3]};    
	assign   ddr_pos5_lock={ch6_rd_lock_r[4],ch5_rd_lock_r[4],ch4_rd_lock_r[4],ch3_rd_lock_r[4],ch2_rd_lock_r[4],ch1_rd_lock_r[4]};    
	assign   ddr_pos6_lock={ch6_rd_lock_r[5],ch5_rd_lock_r[5],ch4_rd_lock_r[5],ch3_rd_lock_r[5],ch2_rd_lock_r[5],ch1_rd_lock_r[5]};    
	assign   ddr_pos7_lock={ch6_rd_lock_r[6],ch5_rd_lock_r[6],ch4_rd_lock_r[6],ch3_rd_lock_r[6],ch2_rd_lock_r[6],ch1_rd_lock_r[6]};     
	assign   ddr_pos8_lock={ch6_rd_lock_r[7],ch5_rd_lock_r[7],ch4_rd_lock_r[7],ch3_rd_lock_r[7],ch2_rd_lock_r[7],ch1_rd_lock_r[7]};   
	  
	  
	  
	 
//********************* 8路数据端口的输出通道的信号产生 ************** stb/data/fwd
    always @( * )
    begin
     (*full_case*)
     case (ddr_pos1_lock)  
      6'b000000:
       begin
      pcc_op_data1_o  =66'b0;
      pcc_op_stb1_o   =0;
      pcc_op_fwd1_o   =0;
       end
      6'b000001:
       begin
      pcc_op_data1_o  =ch1_op_data_i;
      pcc_op_stb1_o   =ch1_op_stb_i;
      pcc_op_fwd1_o   =ch1_op_fwd_i;
       end
      6'b000010:
       begin
      pcc_op_data1_o  =ch2_op_data_i;
      pcc_op_stb1_o   =ch2_op_stb_i;
      pcc_op_fwd1_o   =ch2_op_fwd_i;
       end 
       6'b000100:
       begin
      pcc_op_data1_o  =ch3_op_data_i;
      pcc_op_stb1_o   =ch3_op_stb_i;
      pcc_op_fwd1_o   =ch3_op_fwd_i;
       end
       6'b001000:
       begin
      pcc_op_data1_o  =ch4_op_data_i;
      pcc_op_stb1_o   =ch4_op_stb_i;
      pcc_op_fwd1_o   =ch4_op_fwd_i;
       end
       6'b010000:
       begin
      pcc_op_data1_o  =ch5_op_data_i;
      pcc_op_stb1_o   =ch5_op_stb_i;
      pcc_op_fwd1_o   =ch5_op_fwd_i;
       end
        6'b100000:
       begin
      pcc_op_data1_o  =ch6_op_data_i;
      pcc_op_stb1_o   =ch6_op_stb_i;
      pcc_op_fwd1_o   =ch6_op_fwd_i;
       end
     endcase
    end 
    
     
     always @( * )
     begin 
     (*full_case*)
      case (ddr_pos2_lock)      
      6'b000000:
       begin
      pcc_op_data2_o  =66'b0;
      pcc_op_stb2_o   =0;
      pcc_op_fwd2_o   =0;
       end
      6'b000001:
       begin
      pcc_op_data2_o  =ch1_op_data_i;
      pcc_op_stb2_o   =ch1_op_stb_i;
      pcc_op_fwd2_o   =ch1_op_fwd_i;
       end
      6'b000010:
       begin
      pcc_op_data2_o  =ch2_op_data_i;
      pcc_op_stb2_o   =ch2_op_stb_i;
      pcc_op_fwd2_o   =ch2_op_fwd_i;
       end 
       6'b000100:
       begin
      pcc_op_data2_o  =ch3_op_data_i;
      pcc_op_stb2_o   =ch3_op_stb_i;
      pcc_op_fwd2_o   =ch3_op_fwd_i;
       end
       6'b001000:
       begin
      pcc_op_data2_o  =ch4_op_data_i;
      pcc_op_stb2_o   =ch4_op_stb_i;
      pcc_op_fwd2_o   =ch4_op_fwd_i;
       end
       6'b010000:
       begin
      pcc_op_data2_o  =ch5_op_data_i;
      pcc_op_stb2_o   =ch5_op_stb_i;
      pcc_op_fwd2_o   =ch5_op_fwd_i;
       end
        6'b100000:
       begin
      pcc_op_data2_o  =ch6_op_data_i;
      pcc_op_stb2_o   =ch6_op_stb_i;
      pcc_op_fwd2_o   =ch6_op_fwd_i;
       end
     endcase
   end
    
    always @( * )
    begin
     (*full_case*)
     case (ddr_pos3_lock)      
      6'b000000:
       begin
     pcc_op_data3_o  	=66'b0;
      pcc_op_stb3_o   =0;
      pcc_op_fwd3_o   =0;
       end
      6'b000001:
       begin
     pcc_op_data3_o  	=ch1_op_data_i;
      pcc_op_stb3_o   =ch1_op_stb_i;
      pcc_op_fwd3_o   =ch1_op_fwd_i;
       end
      6'b000010:
       begin
     pcc_op_data3_o  =ch2_op_data_i;
      pcc_op_stb3_o   =ch2_op_stb_i;
      pcc_op_fwd3_o   =ch2_op_fwd_i;
       end 
       6'b000100:
       begin
     pcc_op_data3_o  =ch3_op_data_i;
      pcc_op_stb3_o   =ch3_op_stb_i;
      pcc_op_fwd3_o   =ch3_op_fwd_i;
       end
       6'b001000:
       begin
      pcc_op_data3_o  =ch4_op_data_i;
      pcc_op_stb3_o   =ch4_op_stb_i;
      pcc_op_fwd3_o   =ch4_op_fwd_i;
       end
       6'b010000:
       begin
     pcc_op_data3_o  =ch5_op_data_i;
      pcc_op_stb3_o   =ch5_op_stb_i;
      pcc_op_fwd3_o   =ch5_op_fwd_i;
       end
        6'b100000:
       begin
     pcc_op_data3_o  =ch6_op_data_i;
      pcc_op_stb3_o   =ch6_op_stb_i;
      pcc_op_fwd3_o   =ch6_op_fwd_i;
       end
     endcase 
   end
     
   always @( * )
   begin
     (*full_case*)
     case (ddr_pos4_lock)      
      6'b000000:
       begin
     pcc_op_data4_o  =66'b0;
      pcc_op_stb4_o   =0;
      pcc_op_fwd4_o   =0;
       end
      6'b000001:
       begin
     pcc_op_data4_o  =ch1_op_data_i;
      pcc_op_stb4_o   =ch1_op_stb_i;
      pcc_op_fwd4_o   =ch1_op_fwd_i;
       end
      6'b000010:
       begin
     pcc_op_data4_o  =ch2_op_data_i;
      pcc_op_stb4_o   =ch2_op_stb_i;
      pcc_op_fwd4_o   =ch2_op_fwd_i;
       end 
       6'b000100:
       begin
     pcc_op_data4_o  =ch3_op_data_i;
      pcc_op_stb4_o   =ch3_op_stb_i;
      pcc_op_fwd4_o   =ch3_op_fwd_i;
       end
       6'b001000:
       begin
      pcc_op_data4_o  =ch4_op_data_i;
      pcc_op_stb4_o   =ch4_op_stb_i;
      pcc_op_fwd4_o   =ch4_op_fwd_i;
       end
       6'b010000:
       begin
     pcc_op_data4_o  =ch5_op_data_i;
      pcc_op_stb4_o   =ch5_op_stb_i;
      pcc_op_fwd4_o   =ch5_op_fwd_i;
       end
        6'b100000:
       begin
     pcc_op_data4_o  =ch6_op_data_i;
      pcc_op_stb4_o   =ch6_op_stb_i;
      pcc_op_fwd4_o   =ch6_op_fwd_i;
       end
     endcase 
   end
      
   always @( * )
    begin
     (*full_case*)
     case (ddr_pos5_lock)      
      6'b000000:
       begin
     pcc_op_data5_o  =66'b0;
      pcc_op_stb5_o   =0;
      pcc_op_fwd5_o   =0;
       end
      6'b000001:
       begin
     pcc_op_data5_o  =ch1_op_data_i;
      pcc_op_stb5_o   =ch1_op_stb_i;
      pcc_op_fwd5_o   =ch1_op_fwd_i;
       end
      6'b000010:
       begin
     pcc_op_data5_o  =ch2_op_data_i;
      pcc_op_stb5_o   =ch2_op_stb_i;
      pcc_op_fwd5_o   =ch2_op_fwd_i;
       end 
       6'b000100:
       begin
     pcc_op_data5_o  =ch3_op_data_i;
      pcc_op_stb5_o   =ch3_op_stb_i;
      pcc_op_fwd5_o   =ch3_op_fwd_i;
       end
       6'b001000:
       begin
      pcc_op_data5_o  =ch4_op_data_i;
      pcc_op_stb5_o   =ch4_op_stb_i;
      pcc_op_fwd5_o   =ch4_op_fwd_i;
       end
       6'b010000:
       begin
     pcc_op_data5_o  =ch5_op_data_i;
      pcc_op_stb5_o   =ch5_op_stb_i;
      pcc_op_fwd5_o   =ch5_op_fwd_i;
       end
        6'b100000:
       begin
     pcc_op_data5_o  =ch6_op_data_i;
      pcc_op_stb5_o   =ch6_op_stb_i;
      pcc_op_fwd5_o   =ch6_op_fwd_i;
       end
     endcase   
   end 
    
    always @( * )
     begin
     (*full_case*)
     case (ddr_pos6_lock)      
      6'b000000:
       begin
     pcc_op_data6_o  =66'b0;
      pcc_op_stb6_o   =0;
      pcc_op_fwd6_o   =0;
       end
      6'b000001:
       begin
     pcc_op_data6_o  =ch1_op_data_i;
      pcc_op_stb6_o   =ch1_op_stb_i;
      pcc_op_fwd6_o   =ch1_op_fwd_i;
       end
      6'b000010:
       begin
     pcc_op_data6_o  =ch2_op_data_i;
      pcc_op_stb6_o   =ch2_op_stb_i;
      pcc_op_fwd6_o   =ch2_op_fwd_i;
       end 
       6'b000100:
       begin
     pcc_op_data6_o   =ch3_op_data_i;
      pcc_op_stb6_o   =ch3_op_stb_i;
      pcc_op_fwd6_o   =ch3_op_fwd_i;
       end
       6'b001000:
       begin
     pcc_op_data6_o   =ch4_op_data_i;
      pcc_op_stb6_o   =ch4_op_stb_i;
      pcc_op_fwd6_o   =ch4_op_fwd_i;
       end
       6'b010000:
       begin
     pcc_op_data6_o   =ch5_op_data_i;
      pcc_op_stb6_o   =ch5_op_stb_i;
      pcc_op_fwd6_o   =ch5_op_fwd_i;
       end
        6'b100000:
       begin
     pcc_op_data6_o   =ch6_op_data_i;
      pcc_op_stb6_o   =ch6_op_stb_i;
      pcc_op_fwd6_o   =ch6_op_fwd_i;
       end
     endcase 
    end 
   
    always @( * )
     begin
     (*full_case*)
     case (ddr_pos7_lock)
      6'b000000:
       begin
     pcc_op_data7_o  =66'b0;
      pcc_op_stb7_o   =0;
      pcc_op_fwd7_o   =0;
       end
      6'b000001:
       begin
     pcc_op_data7_o  =ch1_op_data_i;
      pcc_op_stb7_o   =ch1_op_stb_i;
      pcc_op_fwd7_o   =ch1_op_fwd_i;
       end
      6'b000010:
       begin
     pcc_op_data7_o  =ch2_op_data_i;
      pcc_op_stb7_o   =ch2_op_stb_i;
      pcc_op_fwd7_o   =ch2_op_fwd_i;
       end 
       6'b000100:
       begin
     pcc_op_data7_o  =ch3_op_data_i;
      pcc_op_stb7_o   =ch3_op_stb_i;
      pcc_op_fwd7_o   =ch3_op_fwd_i;
       end
       6'b001000:
       begin
      pcc_op_data7_o  =ch4_op_data_i;
      pcc_op_stb7_o   =ch4_op_stb_i;
      pcc_op_fwd7_o   =ch4_op_fwd_i;
       end
       6'b010000:
       begin
     pcc_op_data7_o  =ch5_op_data_i;
      pcc_op_stb7_o   =ch5_op_stb_i;
      pcc_op_fwd7_o   =ch5_op_fwd_i;
       end
        6'b100000:
       begin
     pcc_op_data7_o  =ch6_op_data_i;
      pcc_op_stb7_o   =ch6_op_stb_i;
      pcc_op_fwd7_o   =ch6_op_fwd_i;
       end
     endcase 
    end  
   
    always @( * )
     begin
     (*full_case*)
     case (ddr_pos8_lock)
      6'b000000:
       begin
     pcc_op_data8_o  =66'b0;
      pcc_op_stb8_o   =0;
      pcc_op_fwd8_o   =0;
       end
      6'b000001:
       begin
     pcc_op_data8_o  =ch1_op_data_i;
      pcc_op_stb8_o   =ch1_op_stb_i;
      pcc_op_fwd8_o   =ch1_op_fwd_i;
       end
      6'b000010:
       begin
     pcc_op_data8_o  =ch2_op_data_i;
      pcc_op_stb8_o   =ch2_op_stb_i;
      pcc_op_fwd8_o   =ch2_op_fwd_i;
       end 
       6'b000100:
       begin
     pcc_op_data8_o  =ch3_op_data_i;
      pcc_op_stb8_o   =ch3_op_stb_i;
      pcc_op_fwd8_o   =ch3_op_fwd_i;
       end
       6'b001000:
       begin
      pcc_op_data8_o  =ch4_op_data_i;
      pcc_op_stb8_o   =ch4_op_stb_i;
      pcc_op_fwd8_o   =ch4_op_fwd_i;
       end
       6'b010000:
       begin
     pcc_op_data8_o  =ch5_op_data_i;
      pcc_op_stb8_o   =ch5_op_stb_i;
      pcc_op_fwd8_o   =ch5_op_fwd_i;
       end
        6'b100000:
       begin
     pcc_op_data8_o  =ch6_op_data_i;
      pcc_op_stb8_o   =ch6_op_stb_i;
      pcc_op_fwd8_o   =ch6_op_fwd_i;
       end
     endcase 
    end  
     


//****************** 选择op_fail_i/op_pack_i/op_suspend_i/op_cancel_i ---------------从7个输出通道中选择
   always @( * )
     begin
     (*full_case*)
      case (ch1_rd_lock_r)   
       8'b00000000:
       begin
        ch1_op_fail_o   =0;   
        ch1_op_pack_o   =0;
        ch1_op_suspend_o=0;
        ch1_op_cancel_o =0;
       end
       8'b00000001:
       begin
        ch1_op_fail_o   =pcc_op_fail1_i;   
        ch1_op_pack_o   =pcc_op_pack1_i;   
        ch1_op_suspend_o=pcc_op_suspend1_i;
        ch1_op_cancel_o =pcc_op_cancel1_i;
       end
      
       8'b00000010:
       begin
        ch1_op_fail_o   =pcc_op_fail2_i;   
        ch1_op_pack_o   =pcc_op_pack2_i;   
        ch1_op_suspend_o=pcc_op_suspend2_i;
        ch1_op_cancel_o =pcc_op_cancel2_i;
       end  
       8'b00000100:
       begin
        ch1_op_fail_o   =pcc_op_fail3_i;   
        ch1_op_pack_o   =pcc_op_pack3_i;   
        ch1_op_suspend_o=pcc_op_suspend3_i;
        ch1_op_cancel_o =pcc_op_cancel3_i;
       end
        8'b00001000:
       begin
        ch1_op_fail_o   =pcc_op_fail4_i;   
        ch1_op_pack_o   =pcc_op_pack4_i;   
        ch1_op_suspend_o=pcc_op_suspend4_i;
        ch1_op_cancel_o =pcc_op_cancel4_i;
       end
        8'b00010000:
       begin
        ch1_op_fail_o   =pcc_op_fail5_i;   
        ch1_op_pack_o   =pcc_op_pack5_i;   
        ch1_op_suspend_o=pcc_op_suspend5_i;
        ch1_op_cancel_o =pcc_op_cancel5_i;
       end
         8'b00100000:
       begin
        ch1_op_fail_o   =pcc_op_fail6_i;   
        ch1_op_pack_o   =pcc_op_pack6_i;   
        ch1_op_suspend_o=pcc_op_suspend6_i;
        ch1_op_cancel_o =pcc_op_cancel6_i;
       end
        8'b01000000:
       begin
        ch1_op_fail_o   =pcc_op_fail7_i;   
        ch1_op_pack_o   =pcc_op_pack7_i;   
        ch1_op_suspend_o=pcc_op_suspend7_i;
        ch1_op_cancel_o =pcc_op_cancel7_i;
       end 
        8'b10000000:
       begin
        ch1_op_fail_o   =pcc_op_fail8_i;   
        ch1_op_pack_o   =pcc_op_pack8_i;   
        ch1_op_suspend_o=pcc_op_suspend8_i;
        ch1_op_cancel_o =pcc_op_cancel8_i;
       end 
      endcase
    end 
       always @( * )
     begin
     (*full_case*)
      case (ch2_rd_lock_r)   
       8'b00000000:
       begin
        ch2_op_fail_o   =0;   
        ch2_op_pack_o   =0;   
        ch2_op_suspend_o=0;
        ch2_op_cancel_o =0;
       end
      8'b00000001:
       begin
        ch2_op_fail_o   =pcc_op_fail1_i;   
        ch2_op_pack_o   =pcc_op_pack1_i;   
        ch2_op_suspend_o=pcc_op_suspend1_i;
        ch2_op_cancel_o =pcc_op_cancel1_i;
       end
      
       8'b00000010:
       begin
        ch2_op_fail_o   =pcc_op_fail2_i;   
        ch2_op_pack_o   =pcc_op_pack2_i;   
        ch2_op_suspend_o=pcc_op_suspend2_i;
        ch2_op_cancel_o =pcc_op_cancel2_i;
       end  
       8'b00000100:
       begin
        ch2_op_fail_o   =pcc_op_fail3_i;   
        ch2_op_pack_o   =pcc_op_pack3_i;   
        ch2_op_suspend_o=pcc_op_suspend3_i;
        ch2_op_cancel_o =pcc_op_cancel3_i;
       end
        8'b00001000:
       begin
        ch2_op_fail_o   =pcc_op_fail4_i;   
        ch2_op_pack_o   =pcc_op_pack4_i;   
        ch2_op_suspend_o=pcc_op_suspend4_i;
        ch2_op_cancel_o =pcc_op_cancel4_i;
       end
        8'b00010000:
       begin
        ch2_op_fail_o   =pcc_op_fail5_i;   
        ch2_op_pack_o   =pcc_op_pack5_i;   
        ch2_op_suspend_o=pcc_op_suspend5_i;
        ch2_op_cancel_o =pcc_op_cancel5_i;
       end
         8'b00100000:
       begin
        ch2_op_fail_o   =pcc_op_fail6_i;   
        ch2_op_pack_o   =pcc_op_pack6_i;   
        ch2_op_suspend_o=pcc_op_suspend6_i;
        ch2_op_cancel_o =pcc_op_cancel6_i;
       end
        8'b01000000:
       begin
        ch2_op_fail_o   =pcc_op_fail7_i;   
        ch2_op_pack_o   =pcc_op_pack7_i;   
        ch2_op_suspend_o=pcc_op_suspend7_i;
        ch2_op_cancel_o =pcc_op_cancel7_i;
       end 
        8'b10000000:
       begin
        ch2_op_fail_o   =pcc_op_fail8_i;   
        ch2_op_pack_o   =pcc_op_pack8_i;   
        ch2_op_suspend_o=pcc_op_suspend8_i;
        ch2_op_cancel_o =pcc_op_cancel8_i;
       end 
      endcase
    end 
      always @( * )
     begin
     (*full_case*)
      case (ch3_rd_lock_r)   
       8'b00000000:
       begin
        ch3_op_fail_o   =0;   
        ch3_op_pack_o   =0;   
        ch3_op_suspend_o=0;
        ch3_op_cancel_o =0;
       end
      8'b00000001:
       begin
        ch3_op_fail_o   =pcc_op_fail1_i;   
        ch3_op_pack_o   =pcc_op_pack1_i;   
        ch3_op_suspend_o=pcc_op_suspend1_i;
        ch3_op_cancel_o =pcc_op_cancel1_i;
       end
      
       8'b00000010:
       begin
        ch3_op_fail_o   =pcc_op_fail2_i;   
        ch3_op_pack_o   =pcc_op_pack2_i;   
        ch3_op_suspend_o=pcc_op_suspend2_i;
        ch3_op_cancel_o =pcc_op_cancel2_i;
       end  
       8'b00000100:
       begin
        ch3_op_fail_o   =pcc_op_fail3_i;   
        ch3_op_pack_o   =pcc_op_pack3_i;   
        ch3_op_suspend_o=pcc_op_suspend3_i;
        ch3_op_cancel_o =pcc_op_cancel3_i;
       end
        8'b00001000:
       begin
        ch3_op_fail_o   =pcc_op_fail4_i;   
        ch3_op_pack_o   =pcc_op_pack4_i;   
        ch3_op_suspend_o=pcc_op_suspend4_i;
        ch3_op_cancel_o =pcc_op_cancel4_i;
       end
        8'b00010000:
       begin
        ch3_op_fail_o   =pcc_op_fail5_i;   
        ch3_op_pack_o   =pcc_op_pack5_i;   
        ch3_op_suspend_o=pcc_op_suspend5_i;
        ch3_op_cancel_o =pcc_op_cancel5_i;
       end
         8'b00100000:
       begin
        ch3_op_fail_o   =pcc_op_fail6_i;   
        ch3_op_pack_o   =pcc_op_pack6_i;   
        ch3_op_suspend_o=pcc_op_suspend6_i;
        ch3_op_cancel_o =pcc_op_cancel6_i;
       end
        8'b01000000:
       begin
        ch3_op_fail_o   =pcc_op_fail7_i;   
        ch3_op_pack_o   =pcc_op_pack7_i;   
        ch3_op_suspend_o=pcc_op_suspend7_i;
        ch3_op_cancel_o =pcc_op_cancel7_i;
       end 
        8'b10000000:
       begin
        ch3_op_fail_o   =pcc_op_fail8_i;   
        ch3_op_pack_o   =pcc_op_pack8_i;   
        ch3_op_suspend_o=pcc_op_suspend8_i;
        ch3_op_cancel_o =pcc_op_cancel8_i;
       end 
      endcase
    end   
      always @( * )
     begin
     (*full_case*)
      case (ch4_rd_lock_r)   
       8'b00000000:
       begin
        ch4_op_fail_o   =0;   
        ch4_op_pack_o   =0;   
        ch4_op_suspend_o=0;
        ch4_op_cancel_o =0;
       end
      8'b00000001:
       begin
        ch4_op_fail_o   =pcc_op_fail1_i;   
        ch4_op_pack_o   =pcc_op_pack1_i;   
        ch4_op_suspend_o=pcc_op_suspend1_i;
        ch4_op_cancel_o =pcc_op_cancel1_i;
       end
      
       8'b00000010:
       begin
        ch4_op_fail_o   =pcc_op_fail2_i;   
        ch4_op_pack_o   =pcc_op_pack2_i;   
        ch4_op_suspend_o=pcc_op_suspend2_i;
        ch4_op_cancel_o =pcc_op_cancel2_i;
       end  
       8'b00000100:
       begin
        ch4_op_fail_o   =pcc_op_fail3_i;   
        ch4_op_pack_o   =pcc_op_pack3_i;   
        ch4_op_suspend_o=pcc_op_suspend3_i;
        ch4_op_cancel_o =pcc_op_cancel3_i;
       end
        8'b00001000:
       begin
        ch4_op_fail_o   =pcc_op_fail4_i;   
        ch4_op_pack_o   =pcc_op_pack4_i;   
        ch4_op_suspend_o=pcc_op_suspend4_i;
        ch4_op_cancel_o =pcc_op_cancel4_i;
       end
        8'b00010000:
       begin
        ch4_op_fail_o   =pcc_op_fail5_i;   
        ch4_op_pack_o   =pcc_op_pack5_i;   
        ch4_op_suspend_o=pcc_op_suspend5_i;
        ch4_op_cancel_o =pcc_op_cancel5_i;
       end
         8'b00100000:
       begin
        ch4_op_fail_o   =pcc_op_fail6_i;   
        ch4_op_pack_o   =pcc_op_pack6_i;   
        ch4_op_suspend_o=pcc_op_suspend6_i;
        ch4_op_cancel_o =pcc_op_cancel6_i;
       end
        8'b01000000:
       begin
        ch4_op_fail_o   =pcc_op_fail7_i;   
        ch4_op_pack_o   =pcc_op_pack7_i;   
        ch4_op_suspend_o=pcc_op_suspend7_i;
        ch4_op_cancel_o =pcc_op_cancel7_i;
       end 
        8'b10000000:
       begin
        ch4_op_fail_o   =pcc_op_fail8_i;   
        ch4_op_pack_o   =pcc_op_pack8_i;   
        ch4_op_suspend_o=pcc_op_suspend8_i;
        ch4_op_cancel_o =pcc_op_cancel8_i;
       end 
      endcase
    end 
       always @( * )
     begin
     (*full_case*)
      case (ch5_rd_lock_r)   
       8'b00000000:
       begin
        ch5_op_fail_o   =0;   
        ch5_op_pack_o   =0;   
        ch5_op_suspend_o=0;
        ch5_op_cancel_o =0;
       end
      8'b00000001:
       begin
        ch5_op_fail_o   =pcc_op_fail1_i;   
        ch5_op_pack_o   =pcc_op_pack1_i;   
        ch5_op_suspend_o=pcc_op_suspend1_i;
        ch5_op_cancel_o =pcc_op_cancel1_i;
       end
      
       8'b00000010:
       begin
        ch5_op_fail_o   =pcc_op_fail2_i;   
        ch5_op_pack_o   =pcc_op_pack2_i;   
        ch5_op_suspend_o=pcc_op_suspend2_i;
        ch5_op_cancel_o =pcc_op_cancel2_i;
       end  
       8'b00000100:
       begin
        ch5_op_fail_o   =pcc_op_fail3_i;   
        ch5_op_pack_o   =pcc_op_pack3_i;   
        ch5_op_suspend_o=pcc_op_suspend3_i;
        ch5_op_cancel_o =pcc_op_cancel3_i;
       end
        8'b00001000:
       begin
        ch5_op_fail_o   =pcc_op_fail4_i;   
        ch5_op_pack_o   =pcc_op_pack4_i;   
        ch5_op_suspend_o=pcc_op_suspend4_i;
        ch5_op_cancel_o =pcc_op_cancel4_i;
       end
        8'b00010000:
       begin
        ch5_op_fail_o   =pcc_op_fail5_i;   
        ch5_op_pack_o   =pcc_op_pack5_i;   
        ch5_op_suspend_o=pcc_op_suspend5_i;
        ch5_op_cancel_o =pcc_op_cancel5_i;
       end
         8'b00100000:
       begin
        ch5_op_fail_o   =pcc_op_fail6_i;   
        ch5_op_pack_o   =pcc_op_pack6_i;   
        ch5_op_suspend_o=pcc_op_suspend6_i;
        ch5_op_cancel_o =pcc_op_cancel6_i;
       end
        8'b01000000:
       begin
        ch5_op_fail_o   =pcc_op_fail7_i;   
        ch5_op_pack_o   =pcc_op_pack7_i;   
        ch5_op_suspend_o=pcc_op_suspend7_i;
        ch5_op_cancel_o =pcc_op_cancel7_i;
       end 
        8'b10000000:
       begin
        ch5_op_fail_o   =pcc_op_fail8_i;   
        ch5_op_pack_o   =pcc_op_pack8_i;   
        ch5_op_suspend_o=pcc_op_suspend8_i;
        ch5_op_cancel_o =pcc_op_cancel8_i;
       end 
      endcase
    end 
    
   always @( * )
     begin
     (*full_case*)
      case (ch6_rd_lock_r)   
       8'b00000000:
       begin
        ch6_op_fail_o   =0;   
        ch6_op_pack_o   =0;   
        ch6_op_suspend_o=0;
        ch6_op_cancel_o =0;
       end
      8'b00000001:
       begin
        ch6_op_fail_o   =pcc_op_fail1_i;   
        ch6_op_pack_o   =pcc_op_pack1_i;   
        ch6_op_suspend_o=pcc_op_suspend1_i;
        ch6_op_cancel_o =pcc_op_cancel1_i;
       end
      
       8'b00000010:
       begin
        ch6_op_fail_o   =pcc_op_fail2_i;   
        ch6_op_pack_o   =pcc_op_pack2_i;   
        ch6_op_suspend_o=pcc_op_suspend2_i;
        ch6_op_cancel_o =pcc_op_cancel2_i;
       end  
       8'b00000100:
       begin
        ch6_op_fail_o   =pcc_op_fail3_i;   
        ch6_op_pack_o   =pcc_op_pack3_i;   
        ch6_op_suspend_o=pcc_op_suspend3_i;
        ch6_op_cancel_o =pcc_op_cancel3_i;
       end
        8'b00001000:
       begin
        ch6_op_fail_o   =pcc_op_fail4_i;   
        ch6_op_pack_o   =pcc_op_pack4_i;   
        ch6_op_suspend_o=pcc_op_suspend4_i;
        ch6_op_cancel_o =pcc_op_cancel4_i;
       end
        8'b00010000:
       begin
        ch6_op_fail_o   =pcc_op_fail5_i;   
        ch6_op_pack_o   =pcc_op_pack5_i;   
        ch6_op_suspend_o=pcc_op_suspend5_i;
        ch6_op_cancel_o =pcc_op_cancel5_i;
       end
         8'b00100000:
       begin
        ch6_op_fail_o   =pcc_op_fail6_i;   
        ch6_op_pack_o   =pcc_op_pack6_i;   
        ch6_op_suspend_o=pcc_op_suspend6_i;
        ch6_op_cancel_o =pcc_op_cancel6_i;
       end
        8'b01000000:
       begin
        ch6_op_fail_o   =pcc_op_fail7_i;   
        ch6_op_pack_o   =pcc_op_pack7_i;   
        ch6_op_suspend_o=pcc_op_suspend7_i;
        ch6_op_cancel_o =pcc_op_cancel7_i;
       end 
        8'b10000000:
       begin
        ch6_op_fail_o   =pcc_op_fail8_i;   
        ch6_op_pack_o   =pcc_op_pack8_i;   
        ch6_op_suspend_o=pcc_op_suspend8_i;
        ch6_op_cancel_o =pcc_op_cancel8_i;
       end 
      endcase
    end 
       
       
     
      
          
endmodule 