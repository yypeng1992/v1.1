//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:11:36 09/27/2016 
// Design Name: 
// Module Name:    status_port 
// Project Name: 
// Target Devices: 
// Tool versions: 
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

`timescale 1ns/10ps

module status_port(
    clk, rst_n,
    
   //status_network
    request_o,
    ack_i,
    data_o,
    valid_o,
    
    
    //master port    
    status_req_i,
    status_req_type_i,   ////H:release request    L:write ack
    status_VR_id_i,
	status_VR_FR_i,
    status_channel_ID_i,
    status_pos_1st_i,
    status_pos_2nd_i,
    status_src_type_i,
    
    status_idle_o,
	
	first_release_flag    //// by yyp, 2017-01-03, special for COP
    );
    
  //Parameter
  parameter DDRID           = 1'b0;
  parameter DDR0CfgPortY    = `DDR0CfgPortY;
  parameter DDR0CfgPortX    = `DDR0CfgPortX;
  parameter DDR1CfgPortY    = `DDR1CfgPortY;
  parameter DDR1CfgPortX    = `DDR1CfgPortX;
  
 // parameter CLUSTER_TYPE    = `DDR_CLUSTER_TYPE;

  localparam F_IDLE      = 3'b001;
  localparam F_REQ       = 3'b010;
  localparam F_SEND      = 3'b100;
  
  
  //Input And Output
  input                  clk;
  input                  rst_n;
  output                 request_o;
  input                  ack_i;
  output    [31:0]       data_o;
  output                 valid_o;
  
  input                  status_req_i;
  input                  status_req_type_i;
  input     [ 8:0]       status_VR_id_i;
  input     [ 2:0]       status_VR_FR_i;
  input     [ 4:0]       status_channel_ID_i;
  input     [ 7:0]       status_pos_1st_i;
  input     [ 2:0]       status_pos_2nd_i;
  input     [ 1:0]       status_src_type_i;
  
  output                 status_idle_o;

  output                 first_release_flag; //// by yyp, 2017-01-03, special for COP
  reg                    first_release_flag; //// by yyp, 2017-01-03, special for COP
  wire                   first_release_edge; //// by yyp, 2017-01-03, special for COP
  
  //Register And Wire
(*FSM_ENCODING = "one_hot"*)  reg       [ 2:0]       state_cs;
(*FSM_ENCODING = "one_hot"*)  reg       [ 2:0]       state_ns;
  reg       [ 1:0]       data_cnt = 2'b00;
  reg                    request_r= 'b0;
  reg       [31:0]       data_r = 32'b0;
  reg                    valid_r= 1'b0;
  reg                    status_idle_r = 1'b0;

  reg                    req_type_r   = 'b0;
  reg       [ 8:0]       VR_id_r      = 'b0;
  reg       [ 2:0]       VR_FR_r      = 'b0;
  reg       [ 4:0]       channel_ID_r = 'b0;
  reg       [ 7:0]       pos_1st_r    = 'b0;
  reg       [ 2:0]       pos_2nd_r    = 'b0;
  reg       [ 1:0]       src_type_r   = 'b0;
  
  //wire      [ 2:0]       cluster_type;
  wire      [ 7:0]       ddrport;
  wire      [ 7:0]       ddr_pcc_port;
  reg       [ 7:0]       ddr_pcc_port_r = 'b0;
  
  //--------------------------------------------------------------------------
  // Generate
  //--------------------------------------------------------------------------
  
  //assign cluster_type = CLUSTER_TYPE;
  //assign cluster_type = 3'b000;
  assign ddrport      = (DDRID == 1'b1) ? {DDR1CfgPortY, DDR1CfgPortX} : {DDR0CfgPortY, DDR0CfgPortX};
  assign ddr_pcc_port = {4'b0000, status_pos_1st_i[3:0]};


  //--------------------------------------------------------------------------
  // Config Register
  //--------------------------------------------------------------------------
  
  //record the status request's type    [H:release request    L:write ack]
  always @(posedge clk) begin
    /* if(~rst_n)
    	req_type_r  <= 1'b0;
    else  */if(status_req_i)
    	req_type_r  <= status_req_type_i;
    else
    	req_type_r  <= req_type_r;
  end
  
  assign  first_release_edge = (~req_type_r) & status_req_type_i;  //// by yyp, 2017-01-03, special for COP
  
  always @(posedge clk)         //// by yyp, 2017-01-03, special for COP
	if(~rst_n)                                   //// by yyp, 2017-01-03, special for COP
	  first_release_flag <= 1'b0;                //// by yyp, 2017-01-03, special for COP
	else if(first_release_edge)                  //// by yyp, 2017-01-03, special for COP
	  first_release_flag <= 1'b1;                //// by yyp, 2017-01-03, special for COP
	else                                         //// by yyp, 2017-01-03, special for COP
	  first_release_flag <= first_release_flag;  //// by yyp, 2017-01-03, special for COP

	  
  //release information
  always @(posedge clk) begin
    /* if(~rst_n) begin
    	VR_id_r     <= 9'b0;
		VR_FR_r     <= 3'b0;
    	channel_ID_r<= 5'b0;
    end
    else  */if(status_req_i & status_req_type_i) begin
    	VR_id_r     <= status_VR_id_i;
		VR_FR_r     <= status_VR_FR_i;
    	channel_ID_r<= status_channel_ID_i;
    end
    else begin
    	VR_id_r     <= VR_id_r;
		VR_FR_r     <= VR_FR_r;
    	channel_ID_r<= channel_ID_r;
    end
  end
  
  //write ack information
  always @(posedge clk) begin
    /* if(~rst_n) begin
      pos_1st_r   <= 8'b0;
      pos_2nd_r   <= 2'b0;
      src_type_r  <= 2'b0;
      ddr_pcc_port_r <= 8'b0;
    end
    else  */if(status_req_i & ~status_req_type_i) begin
      pos_1st_r   <= status_pos_1st_i;
      pos_2nd_r   <= status_pos_2nd_i;
      src_type_r  <= status_src_type_i;
      ddr_pcc_port_r <= ddr_pcc_port;
    end
    else begin
      pos_1st_r   <= pos_1st_r;
      pos_2nd_r   <= pos_2nd_r;
      src_type_r  <= src_type_r;
      ddr_pcc_port_r <= ddr_pcc_port_r;
    end
  end
  
  //--------------------------------------------------------------------------
  // State Machine
  //--------------------------------------------------------------------------
  always @(posedge clk) 
    /* if(~rst_n)
	   status_idle_r<=0;
	 else  */if  (state_ns==F_IDLE)
	   status_idle_r<=1;
	 else
	   status_idle_r<=0;

  always @(posedge clk) begin
    if(~rst_n)
      state_cs <= F_IDLE;
    else
      state_cs <= state_ns;
  end

  always @( * ) begin
    case(state_cs)
      F_IDLE:
        begin
          if(status_req_i)
            state_ns = F_REQ;
          else
            state_ns = F_IDLE;
        end
      
      F_REQ:
        begin
          if(ack_i)
            state_ns = F_SEND;
          else
            state_ns = F_REQ;
        end
    
      F_SEND:
        begin
          if(data_cnt == 2'b11)
            state_ns = F_IDLE;
          else
            state_ns = F_SEND;
        end
      
      default:
        state_ns = F_IDLE;
    endcase
  end

  //--------------------------------------------------------------------------
  // Script code
  //--------------------------------------------------------------------------
   
  always @(posedge clk) begin
    /* if(~rst_n)
      data_cnt <= 2'b00;
    else  */if(state_ns == F_SEND)
      data_cnt <= data_cnt + 1'b1;
    else
      data_cnt <= 2'b00;
  end

  always @(posedge clk) begin
    /* if(~rst_n)
      data_r <= 32'b0;
    else  */if(state_ns == F_SEND)
    (*full_case*)case(data_cnt)
    			2'b00:	data_r <= req_type_r ? {1'b1, 14'b0, VR_id_r, VR_FR_r, channel_ID_r}
    			                             : {10'b0,src_type_r, 1'b0, pos_2nd_r, ddrport, pos_1st_r};
    			2'b01:	data_r <= req_type_r ? {32'b0}
    			                             : {24'b0,ddr_pcc_port_r};
    			2'b10:	data_r <= {31'b0, 1'b1};
    			//default:data_r <= 32'b0;
    		endcase
    else
      data_r <= 32'b0;
  end

  always @(posedge clk) begin
    /* if(~rst_n)
      valid_r <= 1'b0;
    else  */if(state_ns == F_SEND)
      valid_r <= 1'b1;
    else
      valid_r <= 1'b0;
  end
  
  always @(posedge clk) begin
    /* if(~rst_n)
      request_r <= 1'b0;
    else  */if((state_ns == F_REQ) | (state_ns == F_SEND))
      request_r <= 1'b1;
    else
      request_r <= 1'b0;
  end

  
  //--------------------------------------------------------------------------
  // Output
  //--------------------------------------------------------------------------
  assign request_o     = request_r;
  assign data_o        = data_r;
  assign valid_o       = valid_r;
  assign status_idle_o = status_idle_r;

endmodule
