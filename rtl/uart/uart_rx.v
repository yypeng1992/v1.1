module uart_rx(clk,reset_n,rx_ready,rx_pin,rx_data,rx_done);
input           clk;
input           reset_n;
input           rx_ready;
input           rx_pin;
output reg  [7:0]rx_data;
output reg       rx_done;

parameter TX_CLK = 5_000_000;
parameter BAUR_RATE = 115200;
parameter COUNR_IS_MAX = TX_CLK / BAUR_RATE;
reg [15:0]count;
reg [2:0]bit_cnt;
reg rx_pin_d;
wire down_edge;
reg [7:0]get_data;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		rx_pin_d <= 1'b1;
	end else begin
		rx_pin_d <= rx_pin;
	end
end
assign down_edge = (~rx_pin) && rx_pin_d;

parameter [2:0] R_IDLE = 3'b000;
parameter [2:0] R_START = 3'b001;
parameter [2:0] R_SEND = 3'b010;
parameter [2:0] R_DONE = 3'b011;
parameter [2:0] R_GER_DATA = 3'b100;
reg [2:0]state;
reg [2:0]next_state;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		count[15:0] <= {16{1'b0}};
	end else if(state != next_state)begin
		count[15:0] <= {16{1'b0}};
	end else if(count==COUNR_IS_MAX) begin
		count[15:0] <= {16{1'b0}};
	end else if((state==R_IDLE))begin
		count[15:0] <= {16{1'b0}};
	end else begin
		count[15:0] <= count[15:0] + 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		bit_cnt[2:0] <= 3'b000;
	end else if((bit_cnt==3'b111) && (count==COUNR_IS_MAX))begin
		bit_cnt[2:0] <= 3'b000;
	end else if((state==R_SEND)&&(count==COUNR_IS_MAX)) begin
		bit_cnt[2:0] <= bit_cnt[2:0] + 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[2:0] <= R_IDLE[2:0];
	end else begin
		state[2:0] <= next_state[2:0];
	end
end


always @ (*) begin
	case(state[2:0])
		R_IDLE[2:0]:next_state[2:0]= (down_edge&&rx_ready) ? R_START[2:0] : R_IDLE[2:0];
		R_START[2:0]:next_state[2:0]=(count==COUNR_IS_MAX) ? R_SEND[2:0] : R_START[2:0];
		R_SEND[2:0]:next_state[2:0]= ((bit_cnt==3'b111) && (count==COUNR_IS_MAX)) ? R_DONE[2:0] : R_SEND[2:0];
		R_DONE[2:0]: next_state[2:0] = (count==COUNR_IS_MAX/2) ? R_GER_DATA[2:0] : R_DONE[2:0];
		R_GER_DATA[2:0]:next_state[2:0] = rx_ready ? R_IDLE[2:0] : R_GER_DATA[2:0];
		default:next_state[2:0] = R_IDLE[2:0];
	endcase
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		get_data[7:0] <= {8{1'b0}};
	end else if((state==R_SEND)&&(count==COUNR_IS_MAX/2))begin
		get_data[bit_cnt] <= rx_pin;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		rx_done <= 1'b0;
	end else if((state==R_DONE)&&(next_state==R_GER_DATA)) begin
		rx_done <= 1'b1;
	end else begin
		rx_done <= 1'b0;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		rx_data[7:0] <= {8{1'b0}};
	end else if((state==R_DONE) && (next_state != R_DONE)) begin
		rx_data[7:0] <= get_data[7:0];
	end
end

endmodule
