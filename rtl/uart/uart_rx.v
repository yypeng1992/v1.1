module uart_rx
#(parameter CLK_FRE = 50_000_000,
parameter BAUD_RATE = 115200
)
(
input clk,
input rst_n,
input rx_pin,
input rx_data_ready,
output reg rx_data_valid,

output reg [7:0] rx_data
);

reg rx_pin_delay;
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		rx_pin_delay <= 1'b1;
	end else begin
		rx_pin_delay <= rx_pin;
	end
end
assign rx_negedge = (~rx_pin) && rx_pin_delay;


localparam [2:0] S_IDLE = 3'b000;
localparam [2:0] S_START = 3'b001;
localparam [2:0] S_REC_BYTE = 3'b010;
localparam [2:0] S_STOP = 3'b011;
localparam [2:0] S_DATA = 3'b100;
reg [2:0] state;
reg [2:0] next_state;

parameter CNT_IS_MAX = CLK_FRE / BAUD_RATE;
reg [15:0] time_cnt;

reg [2:0]bit_cnt;
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		bit_cnt[2:0] <= 3'b000;
	end else if ((state==S_REC_BYTE) && (time_cnt == CNT_IS_MAX-1 ))  begin
		bit_cnt[2:0] <= bit_cnt[2:0] + 1'b1;
	end else if(state!=S_REC_BYTE)begin
		bit_cnt[2:0] <= 3'b000;
	end
end

always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		time_cnt[15:0] <= 16'd0;
	end else if(((state==S_REC_BYTE)&&(time_cnt == CNT_IS_MAX-1)) || (state==S_IDLE)||(state!=state)) begin
		time_cnt[15:0] <= 16'd0;
	end else begin
		time_cnt[15:0] <= time_cnt[15:0] + 1'b1;
	end
end


always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		state[2:0] <= S_IDLE[2:0] ;
	end else begin
		state[2:0]  <= next_state[2:0] ;
	end
end

always @ (*) begin
	if(!rst_n) begin
		next_state[2:0]  = S_IDLE[2:0] ;
	end else begin
		case(state)
			S_IDLE:
				if(rx_negedge) begin
					next_state[2:0]  = S_START[2:0] ;
				end else begin
					next_state[2:0]  = S_IDLE[2:0] ;
				end
			S_START:
				if(time_cnt == CNT_IS_MAX-1) begin
					next_state[2:0]  = S_REC_BYTE[2:0] ; 
				end else begin
					next_state[2:0]  = S_START[2:0] ;
				end
			S_REC_BYTE:
				if ((time_cnt == CNT_IS_MAX-1) && (bit_cnt == 3'b111)) begin
					next_state[2:0]  = S_STOP[2:0] ;
				end else begin
					next_state[2:0]  = S_REC_BYTE[2:0] ;
				end
			S_STOP:
				if (time_cnt == CNT_IS_MAX/2) begin
					next_state[2:0]  = S_DATA[2:0] ;
				end else begin
					next_state[2:0]  = S_STOP[2:0] ;
				end
			S_DATA:
				if(rx_data_ready) begin
					next_state[2:0]  = S_IDLE[2:0] ;
				end else begin
					next_state[2:0]  = S_DATA[2:0] ; 
				end
			default:next_state[2:0]  = S_IDLE[2:0] ;
		endcase	
	end

end

reg [7:0]rx_bits;
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		rx_bits <= 8'd0;
	end else if (state==S_REC_BYTE && time_cnt==CNT_IS_MAX/2) begin
		rx_bits[bit_cnt] <= rx_pin;
	end else begin
		rx_bits <= rx_bits;
	end
end

always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		rx_data_valid <= 1'b0;
	end else if (state==S_STOP && next_state != state ) begin
		rx_data_valid <= 1'b1;
	end else begin
		rx_data_valid <= 1'b0;
	end
end

always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		rx_data[7:0] <= 8'd0;	
	end else if (rx_data_valid) begin
		rx_data[7:0] <= rx_bits[7:0];
	end
end

endmodule
