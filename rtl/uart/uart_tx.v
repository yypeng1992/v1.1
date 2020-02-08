module uart_tx
#(
parameter CLK_FRE = 50_000_000,
parameter BAUD_RATE = 115200
)
(
input clk,
input rst_n,
input tx_data_valid,
input wire  [7:0]tx_data,

output reg  tx_pin
);


parameter COUNT_MAX = CLK_FRE/BAUD_RATE;

reg [2:0]cnt_bit;
reg [15:0]count;

localparam [2:0] S_IDLE = 3'b000;
localparam [2:0] S_START = 3'b001;
localparam [2:0] S_SEND_BYTE = 3'b010;
localparam [2:0] S_STOP = 3'b011;
reg [2:0] state;
reg [2:0] next_state; 

always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		count[15:0] <= 16'h0;
	end else if ((state == S_IDLE) || ((count[15:0]==COUNT_MAX-1)&&(state==S_SEND_BYTE) || (next_state != state) )) begin
		count[15:0] <= 16'h0;	
	end else begin
		count[15:0] <= count[15:0] + 1'b1;
	end
end


always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		state[2:0] <= S_IDLE;
	end else begin
		state[2:0] <= next_state[2:0];
	end
end

always @ (*) begin
next_state=state;
case(state)
	S_IDLE:begin
		if (tx_data_valid) begin
			next_state[2:0] = S_START[2:0];
		end else begin
			next_state[2:0] = S_IDLE[2:0];
		end
	end
	S_START:begin
		if(count[15:0]==COUNT_MAX-1) begin
			next_state[2:0] = S_SEND_BYTE[2:0];
		end else begin
			next_state[2:0] = S_START[2:0];
		end
	end
	S_SEND_BYTE:begin
		if((count[15:0]==COUNT_MAX-1) && cnt_bit==3'b111)begin
			next_state[2:0] = S_STOP[2:0];
		end else begin
			next_state[2:0] = S_SEND_BYTE[2:0];
		end
	end
	S_STOP:begin
		if(count[15:0]==COUNT_MAX/2) begin
			next_state[2:0] = S_IDLE[2:0];
		end else begin
			next_state[2:0] = S_STOP[2:0];
		end
	end 
	default:begin
		next_state[2:0] = S_IDLE[2:0];
	end
endcase
end

always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		cnt_bit[2:0] <= 3'b000;
	end else if (state==S_SEND_BYTE && (count[15:0]==COUNT_MAX-1) ) begin
		cnt_bit[2:0] <= cnt_bit[2:0] + 1'b1;	
	end else if (state != S_SEND_BYTE) begin
		cnt_bit[2:0] <= 3'b000;
	end
end




always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		tx_pin <= 1'd1;
	end else if(state==S_SEND_BYTE && count[15:0]==COUNT_MAX/2)begin
		tx_pin <= tx_data[cnt_bit];
	end else if(state==S_START)begin
		tx_pin <= 1'b0;
	end else if(state==S_STOP) begin
		tx_pin <= 1'b1;
	end
end




endmodule
