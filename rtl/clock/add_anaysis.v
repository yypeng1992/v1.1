module add_anaysis(clk,reset_n,add_key,add_select);
input           clk;
input           reset_n;
input           add_key;
output reg [2:0]add_select;

parameter LONG_ENTER = 10;
parameter CNT1_IS_MAX = 5;
parameter [2:0]A_IDLE        = 3'd0; 
parameter [2:0]A_START       = 3'd1;
parameter [2:0]A_LONG_ENTER  = 3'd2;
parameter [2:0]A_ONCE_ENTER  = 3'd3;
parameter [2:0]A_TWICE_ENTER = 3'd4;
reg [2:0]state;
reg [2:0]next_state;
reg      add_key_d;
wire     key_down_edge;
wire     key_up_edge;
reg [29:0]cnt0;
reg [29:0]cnt1;

assign key_down_edge = (~add_key) && add_key_d;
assign key_up_edge   = add_key && (~add_key_d);

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		add_key_d <= 1'b1;
	end else begin
		add_key_d <= add_key;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		cnt0[29:0] <= {30{1'b0}};
	end else if(add_key)begin
		cnt0[29:0] <= {30{1'b0}};
	end else begin
		cnt0[29:0] <= cnt0[29:0] + 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		cnt1[29:0] <= {30{1'b0}};
	end else if(!add_key)begin
		cnt1[29:0] <= {30{1'b0}};
	end else if(cnt1==2*CNT1_IS_MAX) begin
		cnt1[29:0] <= {30{1'b0}};
	end else if(state == A_ONCE_ENTER) begin
		cnt1[29:0] <= cnt1[29:0] + 1'b1;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[2:0] <= A_IDLE[2:0];
	end else begin
		state[2:0] <= next_state[2:0];
	end
end



always @ (*) begin
	case(state)
		A_IDLE[2:0]:begin
			if(key_down_edge)begin
				next_state[2:0] = A_START[2:0];
			end else begin
				next_state[2:0] = A_IDLE[2:0];
			end
		end
		A_START[2:0]:begin
			if(cnt0==LONG_ENTER-1)begin
				next_state[2:0] = A_LONG_ENTER[2:0];
			end else if(key_up_edge) begin
				next_state[2:0] = A_ONCE_ENTER[2:0];
			end
		end
		A_ONCE_ENTER[2:0]:begin
			if((cnt1 == CNT1_IS_MAX-1))begin
				next_state[2:0] = A_IDLE[2:0];
			end else if(key_down_edge) begin
				next_state[2:0] = A_TWICE_ENTER[2:0];
			end
		end
		A_LONG_ENTER[2:0]:next_state[2:0] = key_up_edge ?  A_IDLE[2:0] : A_LONG_ENTER[2:0];
		A_TWICE_ENTER[2:0]:next_state[2:0] =  A_IDLE[2:0] ;
	endcase
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		add_select[2:0] <= 3'b000;
	end else if((state==A_ONCE_ENTER)&&(next_state==A_IDLE)) begin
		add_select[2:0] <= 3'b001;
	end else if((state==A_TWICE_ENTER)&&(next_state==A_IDLE))begin
		add_select[2:0] <= 3'b010;
	end else if((state==A_LONG_ENTER))begin
		add_select[2:0] <= 3'b100;
	end else if(state==A_IDLE)begin
		add_select[2:0] <= 3'b000;
	end
end

endmodule
