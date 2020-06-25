module key_anaysis(clk,reset_n,key,key_status);
input clk;
input reset_n;
input key;
output reg [2:0]key_status;

parameter LONG_ENTER = 50;
parameter ONCE_TIME = 5;
reg [17:0]enter_cnt0;
reg [17:0]enter_cnt1;
reg key_d;
wire up_edge;
wire down_edge;

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		key_d <= 1'b1;
	end else begin
		key_d <= key;
	end
end

assign down_edge = (~key) && key_d;
assign up_edge   = key && (~key_d);

parameter [1:0]K_IDLE       = 2'b00;
parameter [1:0]K_LONG_ENTER = 2'b01;
parameter [1:0]K_ONE_ENTER  = 2'b10;
parameter [1:0]K_TWICE_ENTER= 2'b11;
reg [1:0]state;
reg [1:0]next_state;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		enter_cnt0[17:0] <= {18{1'b0}};
	end else if(key)begin
		enter_cnt0[17:0] <= {18{1'b0}};
	end else begin
		enter_cnt0[17:0] <= enter_cnt0[17:0] + 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		enter_cnt1[17:0] <= {18{1'b0}};
	end else if(!key)begin
		enter_cnt1[17:0] <= {18{1'b0}};
	end else begin
		enter_cnt1[17:0] <= enter_cnt1[17:0] + 1'b1;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[1:0] <= K_IDLE[1:0];
	end else begin
		state[1:0] <= next_state[1:0];
	end
end


always @ (*) begin
	case(state[1:0])
		K_IDLE[1:0]:begin
			if(up_edge && (enter_cnt0>=LONG_ENTER))begin
				next_state[1:0] = K_LONG_ENTER[1:0];
			end else if(up_edge) begin
				next_state[1:0] = K_ONE_ENTER[1:0];
			end else begin
				next_state[1:0] = K_IDLE[1:0];
			end
		end
		K_ONE_ENTER[1:0]:begin
			if(down_edge && (enter_cnt1>=ONCE_TIME))begin
				next_state[1:0] = K_IDLE[1:0];
			end else if(down_edge) begin
				next_state[1:0] = K_TWICE_ENTER[1:0];
			end else begin
				next_state[1:0] = K_ONE_ENTER[1:0];
			end
		end
		K_TWICE_ENTER[1:0]:next_state[1:0] = K_IDLE[1:0];
		K_LONG_ENTER[1:0] :next_state[1:0] = K_IDLE[1:0];
		default:next_state[1:0] = K_IDLE[1:0];
	endcase
end


always @ (*) begin
	if(!reset_n) begin
		key_status[2:0] = 3'b000;
	end else if((state[1:0]==K_IDLE[1:0])&&(next_state[1:0]==K_LONG_ENTER))begin
		key_status[2:0] = 3'b100;
	end else if((state==K_ONE_ENTER)&&(next_state==K_IDLE))begin
		key_status[2:0] = 3'b001;
	end else if((state==K_ONE_ENTER)&&(next_state==K_TWICE_ENTER)) begin
		key_status[2:0] = 3'b010;
	end else begin
		key_status[2:0] = 3'b000;
	end
end

endmodule
