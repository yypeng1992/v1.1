
module  led_key(
input clk,/// 默认wire类型
input rst_n,/// 默认wire类型
input speed_up,  /// 高脉冲有效
output [3:0] led   /// 默认wire类型
);

parameter [27:0] TIME_MAX = 28'd60;
reg [27:0]timer;
reg [27:0]count;
wire      switch;

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		timer[27:0] <= TIME_MAX[27:0];
	end else if (speed_up==1'b1) begin
		timer[27:0] <= {1'b0,timer[27:1]};
	end
end

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		count[27:0] <= 28'b0;
	end else if(speed_up==1'b1) begin
		count[27:0] <= 28'b0;
	end else if (count==timer) begin
		count[27:0] <= 28'b0;
	end else begin
		count[27:0] <= count[27:0] + 1'b1;
	end
end

assign switch = (count[27:0] == timer[27:0]);

/////////////////////////////////////
/// 下面的参数声明，也可以放在考前的位置！
localparam [2:0] ST_IDLE = 3'd0; 
localparam [2:0] ST_LED0 = 3'd1;
localparam [2:0] ST_LED1 = 3'd2;
localparam [2:0] ST_LED2 = 3'd3;
localparam [2:0] ST_LED3 = 3'd4;
reg [2:0] state;
reg [2:0] next_state;
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		state[2:0] <= ST_IDLE[2:0];
	end else begin
		state[2:0] <= next_state[2:0];
	end
end
always@(*) begin
	next_state[2:0] = state[2:0];
	case(state[2:0])
	////-----------------------------
	ST_IDLE[2:0]: begin
		next_state[2:0] = ST_LED0[2:0];
    	end
	ST_LED0[2:0]: begin
		if(switch) begin
			next_state[2:0] = ST_LED1[2:0];
		end
    	end
	ST_LED1[2:0]: begin
		if(switch) begin
			next_state[2:0] = ST_LED2[2:0];
		end
    	end
	ST_LED2[2:0]: begin
		if(switch) begin
			next_state[2:0] = ST_LED3[2:0];
		end
    	end
	ST_LED3[2:0]: begin
		if(switch) begin
			next_state[2:0] = ST_LED2[2:0];
		end
    	end
	default: begin
		next_state[2:0] = ST_IDLE[2:0];
    	end
	////-----------------------------
	endcase
end

assign led[0] = (state[2:0] == ST_LED0[2:0]);
assign led[1] = (state[2:0] == ST_LED1[2:0]);
assign led[2] = (state[2:0] == ST_LED2[2:0]);
assign led[3] = (state[2:0] == ST_LED3[2:0]);

endmodule
