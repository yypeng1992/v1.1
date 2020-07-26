////////////////////////////////////////////////////////////////////////////////
// Company: <Company Name>
// Engineer: yuanyapeng
//
// Create Date: 2016-10-19
// Design Name: v7-2000-old test
// Module Name: ddr3_ip_top
// Target Device: v7-2000-1925-1
// Tool versions: vivado 14.3
// Description:
// Additional Comments:
//    <Additional_comments>
////////////////////////////////////////////////////////////////////////////////

module ddr3_ip_top(
	
  // Inouts
  inout [63:0]       ddr3_dq,
  inout [7:0]        ddr3_dqs_n,
  inout [7:0]        ddr3_dqs_p,
  // Outputs
  output [15:0]      ddr3_addr,
  output [2:0]       ddr3_ba,
  output             ddr3_ras_n,
  output             ddr3_cas_n,
  output             ddr3_we_n,
  output             ddr3_reset_n,
  output [0:0]       ddr3_ck_p,
  output [0:0]       ddr3_ck_n,
  output [0:0]       ddr3_cke,
  output [0:0]       ddr3_cs_n,
  output [7:0]       ddr3_dm,
  output [0:0]       ddr3_odt,
  // Inputs
  // Single-ended system clock
  input             sys_clk_i,
  // Single-ended iodelayctrl clk (reference clock)
  input             clk_ref_i,
  // user interface signals
  //input [29:0]      app_addr,   //// 最高位[29]被封装 -- 接地
  input [29-1:0]      app_addr,
  input [2:0]       app_cmd,
  input             app_en,
  input [255:0]     app_wdf_data,
  input             app_wdf_end,
  input [31:0]      app_wdf_mask,
  input             app_wdf_wren,
  output [255:0]    app_rd_data,
  output            app_rd_data_end,
  output            app_rd_data_valid,
  output            app_rdy,
  output            app_wdf_rdy,
  // input             app_sr_req,      //// 被封装 -- 接地
  // input             app_ref_req,     //// 被封装 -- 接地
  // input             app_zq_req,      //// 被封装 -- 接地
  // output            app_sr_active,   //// 被封装 -- 悬空
  // output            app_ref_ack,     //// 被封装 -- 悬空
  // output            app_zq_ack,      //// 被封装 -- 悬空
  output            ui_clk,
  output            ui_clk_sync_rst,
  output            init_calib_complete,
  input			    sys_rst
	);
	
	wire [29:0]     UI_app_addr;
	assign UI_app_addr = {1'b0, app_addr};
	
  /***********************************************************************************
   ps1:this module is aviliable for "KVR16LS11/4-SP" 4G-DDR3-1600 memory.
   ps2:in fact, the address of UI-interface signal "app_addr" contains 30-bits, where
       the highest bit is of no use, at least for user, so it is generally be connected
       to GND, which is been boxed in ddr3-ip, as a result, user can only see 29-bits
       in app_addr.
  ***********************************************************************************/
  ddr3_ctrl_ip u_ddr3_ctrl_ip ( 

    // Memory interface ports
    .ddr3_addr                      (ddr3_addr),            // output [15:0]	ddr3_addr
    .ddr3_ba                        (ddr3_ba),              // output [2:0]		ddr3_ba
    .ddr3_cas_n                     (ddr3_cas_n),           // output			ddr3_cas_n
    .ddr3_ck_n                      (ddr3_ck_n),            // output [0:0]		ddr3_ck_n
    .ddr3_ck_p                      (ddr3_ck_p),            // output [0:0]		ddr3_ck_p
    .ddr3_cke                       (ddr3_cke),             // output [0:0]		ddr3_cke
    .ddr3_ras_n                     (ddr3_ras_n),           // output			ddr3_ras_n
    .ddr3_reset_n                   (ddr3_reset_n),          // output			ddr3_reset_n
    .ddr3_we_n                      (ddr3_we_n),            // output			ddr3_we_n
    .ddr3_dq                        (ddr3_dq),              // inout [63:0]		ddr3_dq
    .ddr3_dqs_n                     (ddr3_dqs_n),           // inout [7:0]		ddr3_dqs_n
    .ddr3_dqs_p                     (ddr3_dqs_p),           // inout [7:0]		ddr3_dqs_p
    .init_calib_complete            (init_calib_complete),  // output			init_calib_complete
      
	.ddr3_cs_n                      (ddr3_cs_n),            // output [0:0]		ddr3_cs_n
    .ddr3_dm                        (ddr3_dm),              // output [7:0]		ddr3_dm
    .ddr3_odt                       (ddr3_odt),             // output [0:0]		ddr3_odt
    // Application interface ports
    .app_addr                       (UI_app_addr),        // input [29:0]		UI_app_addr
    .app_cmd                        (app_cmd),            // input [2:0]		app_cmd
    .app_en                         (app_en),             // input				app_en
    .app_wdf_data                   (app_wdf_data),       // input [255:0]		app_wdf_data
    .app_wdf_mask                   (app_wdf_mask),       // input [31:0]		app_wdf_mask
    .app_wdf_end                    (app_wdf_end),        // input				app_wdf_end
    .app_wdf_wren                   (app_wdf_wren),       // input				app_wdf_wren
    .app_rd_data                    (app_rd_data),        // output [255:0]		app_rd_data
    .app_rd_data_end                (app_rd_data_end),    // output			app_rd_data_end
    .app_rd_data_valid              (app_rd_data_valid),  // output			app_rd_data_valid
    .app_rdy                        (app_rdy),            // output			app_rdy
    .app_wdf_rdy                    (app_wdf_rdy),        // output			app_wdf_rdy
    .app_sr_req                     (1'b0),   // input			app_sr_req     /// 接地
    .app_ref_req                    (1'b0),   // input			app_ref_req    /// 接地
    .app_zq_req                     (1'b0),   // input			app_zq_req     /// 接地
    .app_sr_active                  ( ),      // output			app_sr_active     /// 悬空
    .app_ref_ack                    ( ),      // output			app_ref_ack       /// 悬空
    .app_zq_ack                     ( ),      // output			app_zq_ack        /// 悬空
    .ui_clk                         (ui_clk),             // output			ui_clk
    .ui_clk_sync_rst                (ui_clk_sync_rst),    // output			ui_clk_sync_rst --- HIGH
    // System Clock Ports
    .sys_clk_i                      (sys_clk_i),          // input			sys_clk_i
    // Reference Clock Ports
    .clk_ref_i                      (clk_ref_i),          // input			clk_ref_i
    .sys_rst                        (sys_rst)             // input          sys_rst  ---------- ACTIVE LOW
    );
	
	
	
	
endmodule