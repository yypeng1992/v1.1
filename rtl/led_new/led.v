module led(clk,reset_n,key_status,led);
input           clk;
input           reset_n;
input     [2:0] key_status;

output reg [3:0]led;

parameter MAX = 20;
reg [29:0]speed;
reg [29:0]cnt;
wire flag;
parameter [2:0]S_IDLE = 3'b000;
parameter [2:0]S_LED0 = 3'b001;
parameter [2:0]S_LED1 = 3'b010;
parameter [2:0]S_LED2 = 3'b011;
parameter [2:0]S_LED3 = 3'b100;
reg [2:0]state;
reg [2:0]next_state;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		speed[29:0] <= MAX;
	end else if(key_status[0]) begin
		speed[29:0] <= speed[29:0] << 1;
	end else if(key_status[1])begin
		speed[29:0] <= speed[29:0] >> 1;
	end else if(key_status[2]) begin
		speed[29:0] <= MAX;
	end
end

assign flag = (cnt[29:0]==speed);
always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		cnt[29:0] <= {30{1'b0}};
	end else if(flag) begin
		cnt[29:0] <= {30{1'b0}};
	end else if(state[2:0]==S_IDLE[2:0])begin
		cnt[29:0] <= {30{1'b0}};
	end else begin
		cnt[29:0] <= cnt[29:0] + 1'b1;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[2:0] <= S_IDLE[2:0];
	end else begin
		state[2:0] <= next_state[2:0];
	end
end


always @ (*) begin
	if(key_status != 3'b0)begin
		next_state[2:0] = S_IDLE[2:0];
	end else begin
		case(state[2:0])
			S_IDLE[2:0]:next_state[2:0] = S_LED0[2:0];
			S_LED0[2:0]:next_state[2:0] = (flag) ? S_LED1[2:0] : S_LED0[2:0];
			S_LED1[2:0]:next_state[2:0] = (flag) ? S_LED2[2:0] : S_LED1[2:0];
			S_LED2[2:0]:next_state[2:0] = (flag) ? S_LED3[2:0] : S_LED2[2:0];
			S_LED3[2:0]:next_state[2:0] = (flag) ? S_LED0[2:0] : S_LED3[2:0];
			default:next_state[2:0] = S_LED0[2:0];
		endcase
	end
end


always @ (*) begin
	if(state[2:0]==S_IDLE[2:0]) begin
		led[3:0] = 4'b0000;
	end else if(state[2:0]==S_LED0) begin
		led[3:0] = 4'b0001;
	end else if(state[2:0]==S_LED1) begin
		led[3:0] = 4'b0010;
	end else if(state[2:0]==S_LED2) begin
		led[3:0] = 4'b0100;
	end else if(state[2:0]==S_LED3) begin
		led[3:0] = 4'b1000;
	end else begin
		led[3:0] = 4'b0000;
	end
end

endmodule 
