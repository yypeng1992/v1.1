module mode_anaysis(clk,reset_n,mode_key,mode_select);
input           clk;
input           reset_n;
input           mode_key;
output reg [2:0]mode_select;

reg mode_key_d;
wire key_edge;
parameter [1:0]M_SEC=2'd0;
parameter [1:0]M_MIN=2'd1;
parameter [1:0]M_HOUR=2'd2;
reg [1:0]state;
reg [1:0]next_state;

assign key_edge = (!mode_key) && mode_key_d;

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		mode_key_d <= 1'b1;
	end else begin
		mode_key_d <= mode_key;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[1:0] <= M_SEC;
	end else begin
		state[1:0] <= next_state[1:0];
	end
end


always @ (*) begin
	case(state)
		M_SEC[1:0]:next_state[1:0] = key_edge ? M_MIN[1:0] : M_SEC[1:0];
		M_MIN[1:0]:next_state[1:0] = key_edge ? M_HOUR[1:0] : M_MIN[1:0];
		M_HOUR[1:0]:next_state[1:0] = key_edge ? M_SEC[1:0] : M_HOUR[1:0];
	endcase
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		mode_select[2:0] <= 3'b001;
	end else if(state==M_SEC) begin
		mode_select[2:0] <= 3'b001;
	end else if(state==M_MIN)begin
		mode_select[2:0] <= 3'b010;
	end else if(state==M_HOUR)begin
		mode_select[2:0] <= 3'b100;
	end 
end

endmodule
