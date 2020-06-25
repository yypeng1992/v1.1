module spi_flash_test(clk,reset_n,key_in,sel,seg,r_pin,
			dclk,ncs,w_pin);
input       clk;
input       reset_n;
input       key_in;
output [5:0]sel;
output [7:0]seg;
input       r_pin;
output      dclk;
output      ncs;
output      w_pin;

parameter TIMER_IS_MAX = 4;
parameter [2:0]L_IDLE = 3'd0;
parameter [2:0]L_READ = 3'd1;
parameter [2:0]L_WITE = 3'd2;
parameter [2:0]L_SE   = 3'd3;
parameter [2:0]L_PP   = 3'd4;
reg [2 :0]state;
reg [2 :0]next_state;
wire      key;
reg [31:0]time_cnt;
wire      flash_ack;       
wire      flash_read_req;        
wire      flash_pp_req;
wire      flash_se_req;
wire[23:0]read_addr; 
wire[23:0]write_addr;
wire[23:0]se_addr;   
wire [7:0]data_for_write;
wire [7:0]ready_for_rdata;
reg  [7:0]read_data;

assign flash_read_req     = (state==L_READ);
assign flash_pp_req       = (state==L_PP);
assign flash_se_req       = (state==L_SE);
assign read_addr[23:0]    = 24'd0;
assign write_addr[23:0]   = 24'd0;
assign se_addr[23:0]      = 24'd0;
assign data_for_write[7:0] = read_data[7:0];


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		time_cnt[31:0] <= {32{1'b0}};
	end else if(state != L_IDLE)begin
		time_cnt[31:0] <= {32{1'b0}};
	end else begin
		time_cnt[31:0] <= time_cnt[31:0] + 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		read_data[7:0] <= 8'h11;
	end else if(key) begin
		read_data[7:0] <= ready_for_rdata[7:0] + 1'b1;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[2:0] <= L_IDLE[2:0];
	end else begin
		state[2:0] <= next_state[2:0];
	end
end


always @ (*) begin
	case(state)
		L_IDLE[2:0]:begin
			if(time_cnt >= TIMER_IS_MAX)begin
				next_state[2:0] = L_READ[2:0];
			end else begin
				next_state[2:0] = L_IDLE[2:0];
			end
		end
		L_READ[2:0]:begin
			if(flash_ack)begin
				next_state[2:0] = L_WITE[2:0];
			end else begin
				next_state[2:0] = L_READ[2:0];
			end
		end
		L_WITE[2:0]:begin
			if(key)begin
				next_state[2:0] = L_SE[2:0];
			end else begin
				next_state[2:0] = L_WITE[2:0];
			end
		end
		L_SE[2:0]:begin
			if(flash_ack)begin
				next_state[2:0] = L_PP[2:0];
			end else begin
				next_state[2:0] = L_SE[2:0];
			end
		end
		L_PP[2:0]:begin
			if(flash_ack)begin
				next_state[2:0] = L_READ[2:0];
			end else begin
				next_state[2:0] = L_PP[2:0];
			end
		end
		default:next_state[2:0] = L_IDLE[2:0];
	endcase
end

debounce_for_flash debounce0(
 .clk      (clk        ),
 .reset_n  (reset_n    ),
 .key_in   (key_in     ),
 .key      (key        )
);

seg_for_flash seg0(
 .clk      (clk                  ),
 .reset_n  (reset_n              ),
 .data     (ready_for_rdata[7:0] ),
 .sel      (sel[5:0]             ),
 .seg_out  (seg[7:0]             )
 );

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
 .rdata            (ready_for_rdata[7:0]),
 .rd_addr          (read_addr[23:0]     ),
 .wr_addr          (write_addr[23:0]    ),
 .se_addr          (se_addr[23:0]       )
 );


endmodule
