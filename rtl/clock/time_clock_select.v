module time_clock_select(clk,reset_n,key_in,time_clock_key);
input       clk;
input       reset_n;
input       key_in;
output reg[1:0]time_clock_key;

parameter [1:0]T_IDLE  = 2'b00;
parameter [1:0]T_TIME  = 2'b01;
parameter [1:0]T_CLOCK = 2'b10;
reg [1:0]state;
reg [1:0]next_state;
reg      key_in_d;
wire     key_edge;

assign key_edge = (~key_in) && key_in_d;
always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		key_in_d <= 1'b1;
	end else begin
		key_in_d <= key_in;
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
	case(state)
		T_IDLE[1:0]:next_state[1:0] = T_TIME[1:0];
		T_TIME[1:0]:next_state[1:0] = key_edge ? T_CLOCK[1:0] : T_TIME[1:0];
		T_CLOCK[1:0]:next_state[1:0] = key_edge ? T_TIME[1:0] : T_CLOCK[1:0];
	endcase
end



always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		time_clock_key[1:0] <= 2'b01;
	end else if((state==T_IDLE)||(state==T_TIME)) begin
		time_clock_key[1:0] <= 2'b01;
	end else begin
		time_clock_key[1:0] <= 2'b10;
	end
end
endmodule
