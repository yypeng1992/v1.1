`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/24 20:43:34
// Design Name: 
// Module Name: status_info_select
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


module status_info_select
(
    sys_clk,
	sys_rst_n,
	
	
//---------status_port---------//
    status_idle_i,
    status_ack_o,
    status_ack_type_o,
    status_VR_id_o,
	status_VR_FR_o,
    status_channel_ID_o,
    status_pos_1st_o,
    status_pos_2nd_o,
    status_src_type_o,
	
//---------status request------from ddr_ch_fsm_01~~ddr_ch_fsm_06
    status01_grant_o,       status02_grant_o,       status03_grant_o,      status04_grant_o,      status05_grant_o,      status06_grant_o,      
    status01_ack_i,         status02_ack_i,         status03_ack_i,        status04_ack_i,        status05_ack_i,        status06_ack_i,
    status01_ack_type_i,    status02_ack_type_i,    status03_ack_type_i,   status04_ack_type_i,   status05_ack_type_i,   status06_ack_type_i,
    status01_VR_id_i,       status02_VR_id_i,       status03_VR_id_i,      status04_VR_id_i,      status05_VR_id_i,      status06_VR_id_i,
	status01_VR_FR_i,       status02_VR_FR_i,       status03_VR_FR_i,      status04_VR_FR_i,      status05_VR_FR_i,      status06_VR_FR_i,
    status01_channel_ID_i,  status02_channel_ID_i,  status03_channel_ID_i, status04_channel_ID_i, status05_channel_ID_i, status06_channel_ID_i,
    status01_pos_1st_i,     status02_pos_1st_i,     status03_pos_1st_i,    status04_pos_1st_i,    status05_pos_1st_i,    status06_pos_1st_i,
    status01_pos_2nd_i,     status02_pos_2nd_i,     status03_pos_2nd_i,    status04_pos_2nd_i,    status05_pos_2nd_i,    status06_pos_2nd_i,
    status01_src_type_i,    status02_src_type_i,    status03_src_type_i,   status04_src_type_i,   status05_src_type_i,   status06_src_type_i
    );
	
	input    sys_clk;
	input    sys_rst_n;
	
//---------status_port---------//
    input                  status_idle_i;
    output                 status_ack_o;
    output                 status_ack_type_o;
    output     [ 8:0]      status_VR_id_o;
	output     [ 2:0]      status_VR_FR_o;
    output     [ 4:0]      status_channel_ID_o;
    output     [ 7:0]      status_pos_1st_o;
    output     [ 2:0]      status_pos_2nd_o;
    output     [ 1:0]      status_src_type_o;	

//---------status request------from ddr_ch_fsm_01~~ddr_ch_fsm_06
    output      status01_grant_o,       status02_grant_o,       status03_grant_o,      status04_grant_o,      status05_grant_o,      status06_grant_o      ;
    input       status01_ack_i,         status02_ack_i,         status03_ack_i,        status04_ack_i,        status05_ack_i,        status06_ack_i        ;
    input       status01_ack_type_i,    status02_ack_type_i,    status03_ack_type_i,   status04_ack_type_i,   status05_ack_type_i,   status06_ack_type_i   ;
    input [8:0] status01_VR_id_i,       status02_VR_id_i,       status03_VR_id_i,      status04_VR_id_i,      status05_VR_id_i,      status06_VR_id_i      ;
	input [2:0] status01_VR_FR_i,       status02_VR_FR_i,       status03_VR_FR_i,      status04_VR_FR_i,      status05_VR_FR_i,      status06_VR_FR_i      ;
    input [4:0] status01_channel_ID_i,  status02_channel_ID_i,  status03_channel_ID_i, status04_channel_ID_i, status05_channel_ID_i, status06_channel_ID_i ;
    input [7:0] status01_pos_1st_i,     status02_pos_1st_i,     status03_pos_1st_i,    status04_pos_1st_i,    status05_pos_1st_i,    status06_pos_1st_i    ;
    input [2:0] status01_pos_2nd_i,     status02_pos_2nd_i,     status03_pos_2nd_i,    status04_pos_2nd_i,    status05_pos_2nd_i,    status06_pos_2nd_i    ;
    input [1:0] status01_src_type_i,    status02_src_type_i,    status03_src_type_i,   status04_src_type_i,   status05_src_type_i,   status06_src_type_i   ;


    reg        status01_ack_r;
	reg        status02_ack_r;
	reg        status03_ack_r;
	reg        status04_ack_r;
	reg        status05_ack_r;
	reg        status06_ack_r;
	
    reg  [5:0] status_grant_r;
    reg         status_idle_protect=0;  // add by yypeng, 2017-2-21
		
    reg        status_ack_r;
    reg        status_ack_type_r;
    reg [ 8:0] status_VR_id_r;
	reg [ 2:0] status_VR_FR_r;
    reg [ 4:0] status_channel_ID_r;
    reg [ 7:0] status_pos_1st_r;
    reg [ 2:0] status_pos_2nd_r;
    reg [ 1:0] status_src_type_r;
	

	//*****************************************
	// my code
	//*****************************************
	
     always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	  status01_ack_r <= 1'b0;
    	else if(status_grant_r[0])
    	  status01_ack_r <= 1'b0;
    	else if(status01_ack_i)
    	  status01_ack_r <= 1'b1;
    	else
    	  status01_ack_r <= status01_ack_r;
     end
     always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	  status02_ack_r <= 1'b0;
    	else if(status_grant_r[1])
    	  status02_ack_r <= 1'b0;
    	else if(status02_ack_i)
    	  status02_ack_r <= 1'b1;
    	else
    	  status02_ack_r <= status02_ack_r;
     end
     always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	  status03_ack_r <= 1'b0;
    	else if(status_grant_r[2])
    	  status03_ack_r <= 1'b0;
    	else if(status03_ack_i)
    	  status03_ack_r <= 1'b1;
    	else
    	  status03_ack_r <= status03_ack_r;
     end
     always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	  status04_ack_r <= 1'b0;
    	else if(status_grant_r[3])
    	  status04_ack_r <= 1'b0;
    	else if(status04_ack_i)
    	  status04_ack_r <= 1'b1;
    	else
    	  status04_ack_r <= status04_ack_r;
     end
     always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	  status05_ack_r <= 1'b0;
    	else if(status_grant_r[4])
    	  status05_ack_r <= 1'b0;
    	else if(status05_ack_i)
    	  status05_ack_r <= 1'b1;
    	else
    	  status05_ack_r <= status05_ack_r;
     end
     always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	  status06_ack_r <= 1'b0;
    	else if(status_grant_r[5])
    	  status06_ack_r <= 1'b0;
    	else if(status06_ack_i)
    	  status06_ack_r <= 1'b1;
    	else
    	  status06_ack_r <= status06_ack_r;
     end

	
	//**************************************
	// status request arbiter
	//**************************************
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	   status_grant_r <= {6{1'b0}};
    	else if(status_idle_i & !(|status_grant_r) & !status_idle_protect) begin
    		 if     (status01_ack_r)  status_grant_r <= 6'b000001;
    		 else if(status02_ack_r)  status_grant_r <= 6'b000010;
    		 else if(status03_ack_r)  status_grant_r <= 6'b000100;
    		 else if(status04_ack_r)  status_grant_r <= 6'b001000;
    		 else if(status05_ack_r)  status_grant_r <= 6'b010000;
    		 else if(status06_ack_r)  status_grant_r <= 6'b100000;
			 else                     status_grant_r <= 6'b000000;
    	end
    	else
    	   status_grant_r <= {6{1'b0}};
    end
	
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	   status_ack_r <= 1'b0;
    	else
    	   status_ack_r <= |status_grant_r;
    end
	
	always@(posedge sys_clk) begin
    	if(!status_idle_i)
        status_idle_protect <= 1'b0;
    else if(|status_grant_r)
        status_idle_protect <= 1'b1;
    else
        status_idle_protect <= status_idle_protect;
    end
    
	
	
	//*****************************************
	// arbiter result
	//*****************************************
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	   status_ack_type_r <= 1'b0;
    	else (*full_case*)
		case(status_grant_r)
    	//---------------------------
    	  6'b000001:  status_ack_type_r <= status01_ack_type_i;
    	  6'b000010:  status_ack_type_r <= status02_ack_type_i;
    	  6'b000100:  status_ack_type_r <= status03_ack_type_i;
    	  6'b001000:  status_ack_type_r <= status04_ack_type_i;
    	  6'b010000:  status_ack_type_r <= status05_ack_type_i;
    	  6'b100000:  status_ack_type_r <= status06_ack_type_i;
    	//---------------------------
    	endcase
    end
	
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	   status_VR_id_r <= 'b0;
    	else (*full_case*)
		case(status_grant_r)
    	//---------------------------
    	  6'b000001:  status_VR_id_r <= status01_VR_id_i;
    	  6'b000010:  status_VR_id_r <= status02_VR_id_i;
    	  6'b000100:  status_VR_id_r <= status03_VR_id_i;
    	  6'b001000:  status_VR_id_r <= status04_VR_id_i;
    	  6'b010000:  status_VR_id_r <= status05_VR_id_i;
    	  6'b100000:  status_VR_id_r <= status06_VR_id_i;
    	//---------------------------
    	endcase
    end
	
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	   status_VR_FR_r <= 'b0;
    	else (*full_case*)
		case(status_grant_r)
    	//---------------------------
    	  6'b000001:  status_VR_FR_r <= status01_VR_FR_i;
    	  6'b000010:  status_VR_FR_r <= status02_VR_FR_i;
    	  6'b000100:  status_VR_FR_r <= status03_VR_FR_i;
    	  6'b001000:  status_VR_FR_r <= status04_VR_FR_i;
    	  6'b010000:  status_VR_FR_r <= status05_VR_FR_i;
    	  6'b100000:  status_VR_FR_r <= status06_VR_FR_i;
    	//---------------------------
    	endcase
    end
	
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	   status_channel_ID_r <= 'b0;
    	else (*full_case*)
		case(status_grant_r)
    	//---------------------------
    	  6'b000001:  status_channel_ID_r <= status01_channel_ID_i;
    	  6'b000010:  status_channel_ID_r <= status02_channel_ID_i;
    	  6'b000100:  status_channel_ID_r <= status03_channel_ID_i;
    	  6'b001000:  status_channel_ID_r <= status04_channel_ID_i;
    	  6'b010000:  status_channel_ID_r <= status05_channel_ID_i;
    	  6'b100000:  status_channel_ID_r <= status06_channel_ID_i;
    	//---------------------------
    	endcase
    end
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	   status_pos_1st_r <= 'b0;
    	else (*full_case*)
		case(status_grant_r)
    	//---------------------------
    	  6'b000001:  status_pos_1st_r <= status01_pos_1st_i;
    	  6'b000010:  status_pos_1st_r <= status02_pos_1st_i;
    	  6'b000100:  status_pos_1st_r <= status03_pos_1st_i;
    	  6'b001000:  status_pos_1st_r <= status04_pos_1st_i;
    	  6'b010000:  status_pos_1st_r <= status05_pos_1st_i;
    	  6'b100000:  status_pos_1st_r <= status06_pos_1st_i;
    	//---------------------------
    	endcase
    end
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	   status_pos_2nd_r <= 'b0;
    	else (*full_case*)
		case(status_grant_r)
    	//---------------------------
    	  6'b000001:  status_pos_2nd_r <= status01_pos_2nd_i;
    	  6'b000010:  status_pos_2nd_r <= status02_pos_2nd_i;
    	  6'b000100:  status_pos_2nd_r <= status03_pos_2nd_i;
    	  6'b001000:  status_pos_2nd_r <= status04_pos_2nd_i;
    	  6'b010000:  status_pos_2nd_r <= status05_pos_2nd_i;
    	  6'b100000:  status_pos_2nd_r <= status06_pos_2nd_i;
    	//---------------------------
    	endcase
    end
    always@(posedge sys_clk) begin
    	if(!sys_rst_n)
    	   status_src_type_r <= 'b0;
    	else (*full_case*)
		case(status_grant_r)
    	//---------------------------
    	  6'b000001:  status_src_type_r <= status01_src_type_i;
    	  6'b000010:  status_src_type_r <= status02_src_type_i;
    	  6'b000100:  status_src_type_r <= status03_src_type_i;
    	  6'b001000:  status_src_type_r <= status04_src_type_i;
    	  6'b010000:  status_src_type_r <= status05_src_type_i;
    	  6'b100000:  status_src_type_r <= status06_src_type_i;
    	//---------------------------
    	endcase
    end
	
	
	////------------------------------------------------------
	//// OUTPUT
	////------------------------------------------------------
    assign  status_ack_o        = status_ack_r;
    assign  status_ack_type_o   = status_ack_type_r;
    assign  status_VR_id_o      = status_VR_id_r;
	assign  status_VR_FR_o      = status_VR_FR_r;
    assign  status_channel_ID_o = status_channel_ID_r;
    assign  status_pos_1st_o    = status_pos_1st_r;
    assign  status_pos_2nd_o    = status_pos_2nd_r;
    assign  status_src_type_o   = status_src_type_r;

    assign  status01_grant_o  =  status_grant_r[0];
    assign  status02_grant_o  =  status_grant_r[1];
    assign  status03_grant_o  =  status_grant_r[2];
    assign  status04_grant_o  =  status_grant_r[3];
    assign  status05_grant_o  =  status_grant_r[4];
    assign  status06_grant_o  =  status_grant_r[5];

	
endmodule
