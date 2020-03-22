module uart_tx(clk,reset_n,tx_start,tx_data,tx_done,tx_pin);
input           clk;
input           reset_n;
input           tx_start;
input      [7:0]tx_data;
output          tx_done;
output reg      tx_pin;

parameter S_CLK = 5_000_000;
parameter BAUT_RATE = 115200;
parameter COUNT_IS_MAX = S_CLK / BAUT_RATE;
reg [15:0]count;
reg [2:0]bit_cnt;
wire     flag;
assign flag = (count==COUNT_IS_MAX);

parameter [1:0] T_IDLE = 2'b00;
parameter [1:0] T_START = 2'b01;
parameter [1:0] T_WORK = 2'b10;
parameter [1:0] T_DONE = 2'b11;
reg [1:0]state;
reg [1:0]next_state;


assign tx_done = (state==T_DONE)&&(next_state==T_IDLE);


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		count[15:0] <= {16{1'b0}};
	end else if(flag) begin
		count[15:0] <= {16{1'b0}};
	end else if((state==T_IDLE))begin
		count[15:0] <= {16{1'b0}};
	end else begin
		count[15:0] <= count[15:0] + 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		bit_cnt[2:0] <= 3'b000;
	end else if((bit_cnt==3'b111) && flag)begin
		bit_cnt[2:0] <= 3'b000;
	end else if((state==T_WORK)&& flag)begin
		bit_cnt[2:0] <= bit_cnt[2:0] + 1'b1;
	end 
end




always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[1:0] <= T_IDLE[1:0];
	end else begin
		state[1:0] <= next_state[1:0];
	end
end


always @ (*) begin
	case(state[1:0])
		T_IDLE[1:0]:begin
			if(tx_start)begin
				next_state[1:0] = T_START[1:0];
			end else begin
				next_state[1:0] = T_IDLE[1:0];
			end
		end
		T_START[1:0]:next_state[1:0] = flag ? T_WORK[1:0] : T_START[1:0]; 
		T_WORK[1:0]:begin
			if((bit_cnt==3'b111) && (count==COUNT_IS_MAX))begin
				next_state[1:0] = T_DONE[1:0];
			end else begin
				next_state[1:0] = T_WORK[1:0];
			end
		end
		T_DONE[1:0]:next_state[1:0] = flag ? T_IDLE[1:0] : T_DONE[1:0];
		default:next_state[1:0] = T_IDLE[1:0];
	endcase
end



always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		tx_pin <= 1'b1;
	end else if((state==T_WORK) && (next_state==T_DONE))begin
		tx_pin <= 1'b1;
	end else if(state==T_WORK)begin
		tx_pin <= tx_data[bit_cnt];
	end else if((state==T_IDLE)||(state==T_DONE))begin
		tx_pin <= 1'b1;
	end else if((state==T_START))begin
		tx_pin <= 1'b0;
	end
end

endmodule
