module spi_flash_test(clk,reset_n,r_pin,
			dclk,ncs,w_pin,
			req,c_addr,ack,valid,data);
input        clk;
input        reset_n;
input        req;
input  [19:0]c_addr;
output reg   ack;
output       valid;
output [31:0]data;
input        r_pin;
output       dclk;
output       ncs;
output       w_pin;


parameter [1:0]L_IDLE = 2'd0;
parameter [1:0]L_READ = 2'd1;
reg [1 :0]state;
reg [1 :0]next_state;
wire      flash_ack;       
wire      flash_read_req;        
wire      flash_pp_req;
wire      flash_se_req;
wire[23:0]read_addr; 
wire[23:0]write_addr;
wire[23:0]se_addr;   
wire [7:0]data_for_write;
wire [31:0]ready_for_rdata;
reg  [7:0]read_data;

wire r_pin;
wire dclk;
wire ncs;
wire w_pin;

assign flash_read_req     = (state==L_READ);
//assign flash_pp_req       = (state==L_PP);
//assign flash_se_req       = (state==L_SE);
assign read_addr[23:0]    = c_addr[19:0];
//assign write_addr[23:0]   = 24'd0;
//assign se_addr[23:0]      = 24'd0;
//assign data_for_write[7:0] = read_data[7:0];
assign data[31:0] = ready_for_rdata[31:0];




always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		ack <= 1'b0;
	end else if(req) begin
		ack <= 1'b1;
	end else begin
		ack <= 1'b0;
	end
end



always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[1:0] <= L_IDLE[1:0];
	end else begin
		state[1:0] <= next_state[1:0];
	end
end


always @ (*) begin
	next_state[1:0] = state[1:0];
	case(state)
		L_IDLE[1:0]:begin
			if(req)begin
				next_state[1:0] = L_READ[1:0];
			end
		end
		L_READ[1:0]:begin
			if(flash_ack )begin
				next_state[1:0] = L_IDLE[1:0];
			end
		end
		default:next_state[1:0] = L_IDLE[1:0];
	endcase
end



flash_ctrl ctrl0(
 .clk              (clk                 ),
 .reset_n          (reset_n             ),
 .CS               (ncs                 ),
 .CLK              (dclk                ),
 .Q                (r_pin               ),
 .D                (w_pin               ),
 .rd_req           (flash_read_req      ),
 .pp_req           (flash_pp_req        ),
 .se_req           (flash_se_req        ),
 .flash_ack        (flash_ack           ),
 .data_into_flash  (data_for_write[7:0] ),
 .rdata            (ready_for_rdata[31:0]),
 .rd_addr          (read_addr[23:0]     ),
 .wr_addr          (write_addr[23:0]    ),
 .se_addr          (se_addr[23:0]       ),
 .valid            (valid               )
 );


endmodule
