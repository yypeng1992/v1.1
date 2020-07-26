`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/05 08:57:02
// Design Name: 
// Module Name: ddr_ch_fsm
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
`include "ddr_define.vh"

module ddr_ch_fsm(
          sys_clk,
          sys_rst_n,

        phy_init_done_i,

//---------status_port---------//
        status_grant_i,
        status_ack_o,
        status_ack_type_o,
        status_VR_id_o,
		  status_VR_FR_o,
        status_channel_ID_o,
        status_pos_1st_o,
        status_pos_2nd_o,
        status_src_type_o,
 
//---------地址通道一侧---------//
         ach_idle_o,
         ach_eof_o,
         ach_request_i,
         ach_pos_1st_i,
         ach_pos_2nd_i,
         ach_src_type_i,
         ach_start_addr_i,
         ach_data_length_i,
         ach_2nd_addr_burst_i,
         ach_column_num_2nd_i,   //
      
         ach_broadcast_i,  //H:broadcast enable    L:broadcast unable
         ach_pos0_1st_i,
         ach_pos1_1st_i,
         ach_pos2_1st_i,
         ach_pos3_1st_i,
         ach_pos4_1st_i,
         ach_pos5_1st_i,
         ach_pos6_1st_i,
         ach_pos7_1st_i,
         ach_pos0_src_type_i,
         ach_pos1_src_type_i,
         ach_pos2_src_type_i,
         ach_pos3_src_type_i,
         ach_pos4_src_type_i,
         ach_pos5_src_type_i,
         ach_pos6_src_type_i,
         ach_pos7_src_type_i,
         
         ach_release_i,  //H:channel release enable   L:channel release unable
         ach_VR_id_i,
		 ach_VR_FR_i,
         ach_channel_ID_i,

//---------pcc_crossbar--------//
          dch_ip_data_i,
          dch_ip_fwd_i,
          dch_ip_stb_i,
          dch_ip_fail_o,
          dch_ip_pack_o,
          dch_ip_suspend_o,
          dch_ip_cancel_o,
          
          dch_op_fail_i,
          dch_op_pack_i,
          dch_op_suspend_i,
          dch_op_cancel_i,
          dch_op_data_o,
          dch_op_fwd_o,
          dch_op_stb_o,
          
          dch_pos_1st_rd,
          dch_pos_1st_wr,
        
//--------broadcast_crossbar-------//
          broad_grant_i,
          broad_link_o,
          broad_fwd_o,
          broad_data_o,

//-----------DFS----------//(DATA_FIFO_S)
         RD_DFS_rd_en,
         RD_DFS_dout,
         RD_DFS_valid,
         RD_DFS_empty,
         
         WR_DFS_wr_en,
         WR_DFS_din,
         WR_DFS_full,
         WR_DFS_wr_count,

//------------ddr_app----------//
        ch_req_rd_o,
        ch_rd_addr_en_i,
        ch_wr_addr_en_i,
        ch_address_o
    );
    
localparam    WR_DFS_COUNT_UPPER = 2**8 - 20;
    
    //------------------------------------------------
    // I/O-PORT declaration
    //------------------------------------------------
    
      input           sys_clk;
      input           sys_rst_n;
      input           phy_init_done_i;
      
      input                  status_grant_i;
      output                 status_ack_o;
      output                 status_ack_type_o;
      output     [ 8:0]      status_VR_id_o;
	  output     [ 2:0]      status_VR_FR_o;
      output     [ 4:0]      status_channel_ID_o;
      output     [ 7:0]      status_pos_1st_o;
      output     [ 2:0]      status_pos_2nd_o;
      output     [ 1:0]      status_src_type_o;
      
      output                 ach_idle_o;
      output                 ach_eof_o;
      
      input      [ 1:0]      ach_request_i;  //[0]: H/L----valid/invalid    [1]:H/L----write/read
      input      [ 7:0]      ach_pos_1st_i;
      input      [ 2:0]      ach_pos_2nd_i;
      input      [ 1:0]      ach_src_type_i;
      input      [29:0]      ach_start_addr_i;
      input      [29:0]      ach_data_length_i;
      input      [29:0]      ach_2nd_addr_burst_i;
      input      [29:0]      ach_column_num_2nd_i;
      
      input                  ach_broadcast_i;  //H:broadcast enable    L:broadcast unable
      input      [ 7:0]      ach_pos0_1st_i;
      input      [ 7:0]      ach_pos1_1st_i;
      input      [ 7:0]      ach_pos2_1st_i;
      input      [ 7:0]      ach_pos3_1st_i;
      input      [ 7:0]      ach_pos4_1st_i;
      input      [ 7:0]      ach_pos5_1st_i;
      input      [ 7:0]      ach_pos6_1st_i;
      input      [ 7:0]      ach_pos7_1st_i;
      input      [ 1:0]      ach_pos0_src_type_i;
      input      [ 1:0]      ach_pos1_src_type_i;
      input      [ 1:0]      ach_pos2_src_type_i;
      input      [ 1:0]      ach_pos3_src_type_i;
      input      [ 1:0]      ach_pos4_src_type_i;
      input      [ 1:0]      ach_pos5_src_type_i;
      input      [ 1:0]      ach_pos6_src_type_i;
      input      [ 1:0]      ach_pos7_src_type_i;

      input                  ach_release_i;  //H:channel release enable   L:channel release unable
      input      [ 8:0]      ach_VR_id_i;
	  input      [ 2:0]      ach_VR_FR_i;
      input      [ 4:0]      ach_channel_ID_i;

    //--------------------------------------pcc
      input      [65:0]      dch_ip_data_i;
      input                  dch_ip_fwd_i;
      input                  dch_ip_stb_i;
      output                 dch_ip_fail_o;
      output                 dch_ip_pack_o;
      output                 dch_ip_suspend_o;
      output                 dch_ip_cancel_o;
      
      input                  dch_op_fail_i;
      input                  dch_op_pack_i;
      input                  dch_op_suspend_i;
      input                  dch_op_cancel_i;
      output     [65:0]      dch_op_data_o;
      output                 dch_op_fwd_o;
      output                 dch_op_stb_o;
      
	  
      output     [ 3:0]      dch_pos_1st_rd;  //// changed by yypeng, 2017-2-25
      reg        [ 3:0]      dch_pos_1st_rd = 4'b0;
      /* output     [ 7:0]      dch_pos_1st_rd;
      reg        [ 7:0]      dch_pos_1st_rd = 8'b0; */
      output     [ 7:0]      dch_pos_1st_wr;
      reg        [ 7:0]      dch_pos_1st_wr = 8'b0;
      
    //--------------------------------------broadcast
      input                  broad_grant_i;
      output                 broad_link_o;
      output                 broad_fwd_o;
      output     [65:0]      broad_data_o;
      
     ///---------------DFS-----------------
      output                 RD_DFS_rd_en;
      reg                    RD_DFS_rd_en = 1'b0;
      input      [63:0]      RD_DFS_dout;
      input                  RD_DFS_valid;
      input                  RD_DFS_empty;
      
      output                 WR_DFS_wr_en;
      output     [63:0]      WR_DFS_din;
      input                  WR_DFS_full;
      input      [ 7:0]      WR_DFS_wr_count;
     ///---------------DFS-----------------
     
      output                 ch_req_rd_o;
      output     [29:0]      ch_address_o;
      input                  ch_rd_addr_en_i;
      input                  ch_wr_addr_en_i;
    
    //------------------------------------------------
    // Register/Wire declaration
    //------------------------------------------------
      
      reg                    ach_idle_r = 1'b0;
      reg                    ach_eof_r  = 1'b0;
      
      reg                    dch_ip_pack_r    = 1'b0;
      reg                    dch_ip_suspend_r = 1'b0;
      reg                    dch_ip_cancel_r  = 1'b0;
      
      reg        [65:0]      dch_op_data_r = {66{1'b0}};
      reg                    dch_op_fwd_r  = 1'b0;
      reg                    dch_op_stb_r  = 1'b0;
			
      reg                    broad_link_r = 1'b0;
      reg                    broad_fwd_r  = 1'b0;
      reg        [65:0]      broad_data_r = {66{1'b0}};
			
      reg                    ch_req_rd_r = 1'b0;
			
			reg        [29:0]      rd_data_count;  //读数据计数器------用于清点从RD_DATA_FIFO_S中读出的数据的个数
			reg        [29:0]      ch_address_cnt; //地址计数器--------用于清点读/写操作取地址的个数(* Burst_Length)
			
      reg        [29:0]      ch_start_addr_r;
      reg        [29:0]      ch_column_num_2nd_cnt;
      wire                   ch_row_change_en;

	  reg                 phy_init_done_r = 1'b0;
      reg     [65:0]      dch_ip_data_r = {66{1'b0}};
      reg                 dch_ip_fwd_r  = 1'b0;
      reg                 dch_ip_stb_r  = 1'b0;
	  
	  // add by yypeng, 2017-2-25
	  // Function: to avoid resulting worst path from PCC.
	  always@(posedge sys_clk)
	  begin
		phy_init_done_r <= phy_init_done_i;
		dch_ip_data_r <= dch_ip_data_i;
		dch_ip_fwd_r  <= dch_ip_fwd_i;
		dch_ip_stb_r  <= dch_ip_stb_i;
	  end
	  

//###############################################
// STATE-MACHINE  (FSM)
//###############################################
      localparam     IDLE    = 4'b0000;
      localparam     RD_REQ  = 4'b0001;  //申请建立广播网链路(广播模式)/申请建立PCC网链路并发送PCC起始包(非广播模式)
      localparam     RD_CFG0 = 4'b0011;  //发送广播 坐标 包(广播模式)/发送PCC配置包0(非广播模式)
      localparam     RD_CFG1 = 4'b0010;  //发送广播源类型包(广播模式)/发送PCC配置包1(非广播模式)
      localparam     RD_LOCK = 4'b0110;  //发送正常数据
      localparam     RD_DONE = 4'b0111;  //主动撤销广播网链路(广播模式)/接收PCC网链路撤销信号后到DONE状态(非广播模式)
      localparam     RD_FAIL = 4'b1001;  //只有在飞非广播模式下才会出现
      localparam     WR_WAIT = 4'b1000;  
      localparam     WR_ACK  = 4'b1010;  
      localparam     WR_CFG0 = 4'b1011;  
      localparam     WR_CFG1 = 4'b1111;  
      localparam     WR_LOCK = 4'b1110;  
      localparam     WR_DONE = 4'b1100;  
      localparam     DONE    = 4'b0100;  
      localparam     RELEASE = 4'b0101;  
      
     
 (*FSM_ENCODING = "GRAY"*) reg  [3:0]  state_cs;
 (*FSM_ENCODING = "GRAY"*) reg  [3:0]  state_ns;

always@(posedge sys_clk)
  if(!sys_rst_n)
    state_cs <= IDLE;
  else
    state_cs <= state_ns;

always@( * ) begin
  case(state_cs)
  //------------------------------------------
    IDLE   :
       begin
         	 if (phy_init_done_r & ach_request_i[0] & (!ach_request_i[1]))
         	     state_ns = RD_REQ;
         	 else if(phy_init_done_r & ach_request_i[0] & ach_request_i[1])
         	     state_ns = WR_WAIT;
         	 else
         	     state_ns = IDLE;
       end
       
    ////-----------read------------
    RD_REQ :
       begin
       	   if (ach_broadcast_i) begin
       	     if (broad_grant_i) //接收到广播网链路建立成功的应答信号后，开始发送坐标包
         	       state_ns = RD_CFG0;
       	     else
         	       state_ns = RD_REQ;
       	   end
         	 else begin
         	   if (dch_op_pack_i) //接收到PCC网链路建立成功的应答信号后，开始发送配置包0
         	       state_ns = RD_CFG0;
         	   else if(dch_op_fail_i)
         	       state_ns = RD_FAIL;
         	   else
         	       state_ns = RD_REQ;
         	 end
       end
       
    RD_CFG0:   state_ns = RD_CFG1;
    RD_CFG1:   state_ns = RD_LOCK;
    
    RD_LOCK:  //在该阶段，地址计数器必会先完成计数，然后停止地址使能，
              //但持续数据的读取，直到读数据计数器达到规定的次数并即刻离开RD_LOCK状态
       begin
         	 if (rd_data_count==ach_data_length_i)
         	     state_ns = RD_DONE;
         	 else
         	     state_ns = RD_LOCK;
       end
    RD_DONE:
       begin  //这里使用短路操作符
       	   if (ach_broadcast_i | dch_op_cancel_i) //广播模式下主动撤销广播链路 //非广播模式下被动撤销PCC链路
         	     state_ns = DONE;
         	 else
         	     state_ns = RD_DONE;
       end
       
    RD_FAIL:   state_ns = RD_REQ;
    
    ////-----------write------------
    WR_WAIT:
       begin
         	 if (dch_ip_stb_r & (dch_ip_data_r[65:64]==2'b10)) //head-package
         	     state_ns = WR_ACK;
         	 else
         	     state_ns = WR_WAIT;
       end
    WR_ACK :
       begin
         	 if (dch_ip_stb_r & dch_ip_fwd_r & (dch_ip_data_r[65:64]==2'b01)) //cfg0-package
         	     state_ns = WR_CFG0;
         	 else
         	     state_ns = WR_ACK;
       end
    WR_CFG0:
       begin
         	 if (dch_ip_stb_r & dch_ip_fwd_r & (dch_ip_data_r[65:64]==2'b01)) //cfg1-package
         	     state_ns = WR_CFG1;
         	 else
         	     state_ns = WR_CFG0;
       end
    WR_CFG1:
       begin
         	 if (dch_ip_stb_r & dch_ip_fwd_r & (dch_ip_data_r[65:64]==2'b00)) //data-package
         	     state_ns = WR_LOCK;
         	 else
         	     state_ns = WR_CFG1;
       end
    WR_LOCK:
       begin
         	 if (dch_ip_stb_r & dch_ip_fwd_r & (dch_ip_data_r[65:63]==3'b011)) //end-package
         	     state_ns = WR_DONE;
         	 else
         	     state_ns = WR_LOCK;
       end
    WR_DONE:
       begin
         	 if (ch_address_cnt == ach_data_length_i)
         	     state_ns = DONE;
         	 else
         	     state_ns = WR_DONE;
       end
       
    ////-----------done------------
    DONE   :
       begin
         	 if (ach_release_i)
         	     state_ns = RELEASE;
         	 else
         	     state_ns = IDLE;
       end    
    
    ////-----------release---------
    RELEASE: //当前状态下，之所以设置握手信号status_grant_i，是考虑到极可能出现如下情况：“(2)请求发出时(1)请求还未得到处理”，将会导致通道释放请求被覆盖。
       begin                        //(1)发出通道释放请求时status_port没有及时处理该请求。
         	 if (status_grant_i)      //(2)当前数据通道退出到idle状态后，立马响应另一个写请求，发出写应答信号。
         	     state_ns = IDLE;
         	 else
         	     state_ns = RELEASE;
       end
       
    default:   state_ns = IDLE;
  //------------------------------------------
  endcase
end
    
    
always@(posedge sys_clk) begin
  /* if(!sys_rst_n)
      ach_idle_r <= 1'b0;
  else  */if(state_cs == IDLE & state_ns == IDLE)
      ach_idle_r <= 1'b1;
  else
      ach_idle_r <= 1'b0;
end
always@(posedge sys_clk) begin
  /* if(!sys_rst_n)
      ach_eof_r <= 1'b0;
  else  */if((state_cs == DONE | state_cs == RELEASE) && (state_ns == IDLE))
      ach_eof_r <= 1'b1;
  else
      ach_eof_r <= 1'b0;
end

assign  ach_idle_o  = ach_idle_r;
assign  ach_eof_o   = ach_eof_r;


  //-----------------------------------------------------
  // Code script
  //-----------------------------------------------------
    
  //------------------broadcast----------------------
    always@(posedge sys_clk) begin
    	/* if(!sys_rst_n)
    	  broad_link_r <= 1'b0;
    	else  */if(!ach_broadcast_i)
    	  broad_link_r <= 1'b0;
    	else case(state_ns)
    	///----------------------------
        IDLE   :  broad_link_r <= 1'b0;
        RD_REQ :  broad_link_r <= 1'b1;
        RD_CFG0:  broad_link_r <= 1'b1;
        RD_CFG1:  broad_link_r <= 1'b1;
        RD_LOCK:  broad_link_r <= 1'b1;
        RD_DONE:  broad_link_r <= 1'b1;
        default:  broad_link_r <= 1'b0;
    	///----------------------------
      endcase
    end
    
    always@(posedge sys_clk) begin
    	/* if(!sys_rst_n)
    	  broad_fwd_r <= 1'b0;
    	else  */if(!ach_broadcast_i)
    	  broad_fwd_r <= 1'b0;
    	else case(state_ns)
    	///----------------------------
        IDLE   :  broad_fwd_r <= 1'b0;
        RD_REQ :  broad_fwd_r <= 1'b0;
        RD_CFG0:  broad_fwd_r <= 1'b1;
        RD_CFG1:  broad_fwd_r <= 1'b1;
        RD_LOCK:  broad_fwd_r <= RD_DFS_valid;
        RD_DONE:  broad_fwd_r <= 1'b1;
        default:  broad_fwd_r <= 1'b0;
    	///----------------------------
      endcase
    end
    
    always@(posedge sys_clk) begin
    	/* if(!sys_rst_n)
    	  broad_data_r <= 66'b0;
    	else  */if(!ach_broadcast_i)
    	  broad_data_r <= 66'b0;
    	else case(state_ns)
    	///----------------------------
        IDLE   :  broad_data_r <= 66'b0;
        RD_REQ :  broad_data_r <= 66'b0;
        RD_CFG0:  broad_data_r <= { 2'b01, //广播坐标包
                                    ach_pos7_1st_i[7:0],
                                    ach_pos6_1st_i[7:0],
                                    ach_pos5_1st_i[7:0],
                                    ach_pos4_1st_i[7:0],
                                    ach_pos3_1st_i[7:0],
                                    ach_pos2_1st_i[7:0],
                                    ach_pos1_1st_i[7:0],
                                    ach_pos0_1st_i[7:0]
                                  };
        RD_CFG1:  broad_data_r <= { 2'b10, //广播源类型包
		                            {48{1'b0}},
                                    ach_pos7_src_type_i[1:0],
                                    ach_pos6_src_type_i[1:0],
                                    ach_pos5_src_type_i[1:0],
                                    ach_pos4_src_type_i[1:0],
                                    ach_pos3_src_type_i[1:0],
                                    ach_pos2_src_type_i[1:0],
                                    ach_pos1_src_type_i[1:0],
                                    ach_pos0_src_type_i[1:0]
                                  };
        RD_LOCK:  broad_data_r <= RD_DFS_valid ? {2'b00, RD_DFS_dout[63:0]} : {66{1'b0}}; //广播数据包
        RD_DONE:  broad_data_r <= {2'b11,{64{1'b0}}}; //广播结束包
        default:  broad_data_r <= 66'b0;
    	///----------------------------
      endcase
    end
    
    assign  broad_link_o  = broad_link_r;
    assign  broad_fwd_o   = broad_fwd_r;
    assign  broad_data_o  = broad_data_r;
  ///---------------------------------------------------------------------------------------------------///
    
  //------------------pcc----------------------------
    always@(posedge sys_clk) begin
    	/* if(!sys_rst_n)
    	  dch_op_stb_r <= 1'b0;
    	else  */if(ach_broadcast_i)
    	  dch_op_stb_r <= 1'b0;
    	else case(state_ns)
    	///----------------------------
        IDLE   :  dch_op_stb_r <= 1'b0;
        RD_REQ :  dch_op_stb_r <= 1'b1;
        RD_CFG0:  dch_op_stb_r <= 1'b1;
        RD_CFG1:  dch_op_stb_r <= 1'b1;
        RD_LOCK:  dch_op_stb_r <= 1'b1;
        RD_DONE:  dch_op_stb_r <= 1'b1;
        RD_FAIL:  dch_op_stb_r <= 1'b0;
        default:  dch_op_stb_r <= 1'b0;
    	///----------------------------
      endcase
    end
    
    always@(posedge sys_clk) begin
    	/* if(!sys_rst_n)
    	  dch_op_fwd_r <= 1'b0;
    	else  */if(ach_broadcast_i)
    	  dch_op_fwd_r <= 1'b0;
    	else case(state_ns)
    	///----------------------------
        IDLE   :  dch_op_fwd_r <= 1'b0;
        RD_REQ :  dch_op_fwd_r <= 1'b0;
        RD_CFG0:  dch_op_fwd_r <= 1'b1;
        RD_CFG1:  dch_op_fwd_r <= 1'b1;
        RD_LOCK:  dch_op_fwd_r <= RD_DFS_valid;
        RD_DONE:  dch_op_fwd_r <= 1'b1;
        default:  dch_op_fwd_r <= 1'b0;
    	///----------------------------
      endcase
    end
    
    always@(posedge sys_clk) begin
    	/* if(!sys_rst_n)
    	  dch_op_data_r <= {66{1'b0}};
    	else  */if(ach_broadcast_i)
    	  dch_op_data_r <= {66{1'b0}};
    	else case(state_ns)
    	///----------------------------
        IDLE   :  dch_op_data_r <= {66{1'b0}};
        RD_REQ :  dch_op_data_r <= {2'b10,{46{1'b0}},ach_src_type_i,{{4{1'b0}},ach_pos_1st_i[3:0]}, ach_pos_1st_i[7:0]};
        RD_CFG0:  dch_op_data_r <= {2'b01,{63{1'b0}},{1'b0}};
        RD_CFG1:  dch_op_data_r <= {2'b01,{63{1'b0}},{1'b1}};
        RD_LOCK:  dch_op_data_r <= RD_DFS_valid ? {{2{1'b0}}, RD_DFS_dout[63:0]} : {66{1'b0}};
        RD_DONE:  dch_op_data_r <= {3'b011,{63{1'b0}}};
        default:  dch_op_data_r <= {66{1'b0}};
    	///----------------------------
      endcase
    end
    
    assign  dch_op_data_o  = dch_op_data_r;
    assign  dch_op_fwd_o   = dch_op_fwd_r;
    assign  dch_op_stb_o   = dch_op_stb_r;
  ///---------------------------------------------------------------------------------------------------///
    
    
    always@(posedge sys_clk) begin
    	/* if(!sys_rst_n)
    	    RD_DFS_rd_en <= 1'b0;
    	else  */if((state_ns==RD_LOCK) & !dch_op_suspend_i & !RD_DFS_empty)
    	    RD_DFS_rd_en <= 1'b1;
    	else
    	    RD_DFS_rd_en <= 1'b0;
    end
    
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	    rd_data_count <= 30'b0;
    	else if(state_ns==RD_DONE)
    	    rd_data_count <= 30'b0;
      else if(RD_DFS_valid)
    	    rd_data_count <= rd_data_count + 1'b1;
    	else
    	    rd_data_count <= rd_data_count;
    end

    always@(posedge sys_clk) begin
    	/* if(!sys_rst_n)
    	    ch_req_rd_r <= 1'b0;
    	else  */if(state_ns==RD_LOCK)
    	begin
          if ((ch_address_cnt==ach_data_length_i-`Burst_Length) & ch_rd_addr_en_i)
              ch_req_rd_r <= 1'b0;
          else if(ch_address_cnt<ach_data_length_i)
              ch_req_rd_r <= 1'b1;
          else
              ch_req_rd_r <= ch_req_rd_r;
      end
    	else
    	    ch_req_rd_r <= 1'b0;
    end
    
  //-----get best pcc-port when assert a read-request,
  //-----which then be sent to <pcc_crossbar>, in order
  //-----to link dch-port with the best no-occupied pcc-port.
  //-----get ready to transfer send-data through the link-channel.
  //replace the pos_Y with zero, form {pos_Y, pos_X} to {4'b0, pos_X}.
    always@(posedge sys_clk) begin
    	/* if(!sys_rst_n)
    	    dch_pos_1st_rd <= 4'b0;
    	else  */
		if(ach_request_i[0] & (!ach_request_i[1]))
    	    dch_pos_1st_rd <= {ach_pos_1st_i[3:0]};
    	else
    	    dch_pos_1st_rd <= 4'b0;
    end
    
    
///--------read      (up)
///----------------------------------------------华丽的分割线-------------------------
///--------write    (down)


  //-----get best pcc-port when assert a write-request,
  //-----which then be sent to <pcc_crossbar>, in order
  //-----to link dch-port with the right pcc-port.
  //-----get ready to transfer recieve-data through the link-channel.
  //get the pos from the cfg-information directly .
    always@(posedge sys_clk) begin
    	/* if(!sys_rst_n)
    	    dch_pos_1st_wr <= 8'b0;
    	else  */if(dch_ip_cancel_o)
    	    dch_pos_1st_wr <= 8'b0;
    	else if(state_ns == WR_WAIT)
    	    dch_pos_1st_wr <= ach_pos_1st_i[7:0];
    	else
    	    dch_pos_1st_wr <= dch_pos_1st_wr;
    end
    
    always@(posedge sys_clk) begin
      /* if(!sys_rst_n)
          dch_ip_pack_r <= 1'b0;
      else  */if((state_cs==WR_WAIT)&(state_ns==WR_ACK))
          dch_ip_pack_r <= 1'b1;
      else
          dch_ip_pack_r <= 1'b0;
    end
    
    always@(posedge sys_clk) begin
      /* if(!sys_rst_n)
          dch_ip_suspend_r <= 1'b0;
      else  */if((state_ns==WR_LOCK)&(WR_DFS_wr_count>WR_DFS_COUNT_UPPER))
          dch_ip_suspend_r <= 1'b1;
      else
          dch_ip_suspend_r <= 1'b0;
    end
    
    always@(posedge sys_clk) begin
      /* if(!sys_rst_n)
          dch_ip_cancel_r <= 1'b0;
      else  */if((state_cs==WR_LOCK)&(state_ns==WR_DONE))
          dch_ip_cancel_r <= 1'b1;
      else
          dch_ip_cancel_r <= 1'b0;
    end
    
    assign  dch_ip_fail_o     = 1'b0;
    assign  dch_ip_pack_o     = dch_ip_pack_r;
    assign  dch_ip_suspend_o  = dch_ip_suspend_r;
    assign  dch_ip_cancel_o   = dch_ip_cancel_r;
    
    assign  WR_DFS_wr_en  = dch_ip_fwd_r && (dch_ip_data_r[65:64]==2'b00);
    assign  WR_DFS_din    = dch_ip_data_r[63:0];
  ///---------------------------------------------------------------------------------------------------///
    
    assign  ch_req_rd_o  = ch_req_rd_r;
    assign  ch_address_o = ch_start_addr_r + {ch_column_num_2nd_cnt, 3'b000};
    
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	    ch_start_addr_r <= 30'b0;
    	else if((state_cs == RD_REQ) | (state_cs == WR_WAIT))
    	    ch_start_addr_r <= ach_start_addr_i;
    	else if(ch_row_change_en)
    	    ch_start_addr_r <= ch_start_addr_r + ach_2nd_addr_burst_i;
    	else
    	    ch_start_addr_r <= ch_start_addr_r;
    end
    
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	    ch_column_num_2nd_cnt <= 30'b0;
    	else if(ch_rd_addr_en_i | ch_wr_addr_en_i)
    	    ch_column_num_2nd_cnt <= (ch_column_num_2nd_cnt==ach_column_num_2nd_i) ? 30'b0 : (ch_column_num_2nd_cnt + 1'b1);
    	else
    	    ch_column_num_2nd_cnt <= ch_column_num_2nd_cnt;
    end
    
    assign  ch_row_change_en = (ch_column_num_2nd_cnt==ach_column_num_2nd_i) & (ch_rd_addr_en_i | ch_wr_addr_en_i);
  ///---------------------------------------------------------------------------------------------------///

    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	    ch_address_cnt <= 30'b0;
    	else if(state_ns == DONE)
    	    ch_address_cnt <= 30'b0;
    	else if(ch_rd_addr_en_i | ch_wr_addr_en_i)
    	    ch_address_cnt <= ch_address_cnt + `Burst_Length;
    	else
    	    ch_address_cnt <= ch_address_cnt;
    end
    
    
    //--------------------------------------------------
     reg      write_ack_r   = 1'b0;
     reg      release_ack_r = 1'b0;
     
     always@(posedge sys_clk) begin
    	/* if(!sys_rst_n)
    	  write_ack_r <= 1'b0;
    	else  */if(state_cs==IDLE && state_ns==WR_WAIT)
    	  write_ack_r <= 1'b1;
    	else if(status_grant_i)
    	  write_ack_r <= 1'b0;
     end

     always@(posedge sys_clk) begin
    	/* if(!sys_rst_n)
    	  release_ack_r <= 1'b0;
    	else  */if(state_cs==DONE && state_ns==RELEASE)
    	  release_ack_r <= 1'b1;
    	else if(status_grant_i)
    	  release_ack_r <= 1'b0;
     end
     
     
     assign  status_ack_o        =  write_ack_r | release_ack_r;
     assign  status_ack_type_o   = !write_ack_r & release_ack_r; //H:release request    L:write ack
     assign  status_VR_id_o      = ach_VR_id_i;
	  assign  status_VR_FR_o      = ach_VR_FR_i;
     assign  status_channel_ID_o = ach_channel_ID_i;
     assign  status_pos_1st_o    = ach_pos_1st_i;
     assign  status_pos_2nd_o    = ach_pos_2nd_i;
     assign  status_src_type_o   = ach_src_type_i;
  ///---------------------------------------------------------------------------------------------------///

endmodule
