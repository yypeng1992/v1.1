module seg_top(clk,reset_n,sel);
input           clk;
input           reset_n;
output reg      [5:0]sel;

parameter MAX = 20_000;
reg [29:0]count;
wire flag;
assign flag = (count[29:0]==MAX);

parameter [2:0]S_IDLE = 3'b000;
parameter [2:0]S_DIG0 = 3'b001;
parameter [2:0]S_DIG1 = 3'b010;
parameter [2:0]S_DIG2 = 3'b011;
parameter [2:0]S_DIG3 = 3'b100;
parameter [2:0]S_DIG4 = 3'b101;
parameter [2:0]S_DIG5 = 3'b110;
reg [2:0]state;
reg [2:0]next_state;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[2:0] <= S_IDLE[2:0];
	end else begin
		state[2:0] <= next_state[2:0];
	end
end


always @ (*) begin
	case(state)
		S_IDLE[2:0]:next_state[2:0] = S_DIG0[2:0];
		S_DIG0[2:0]:next_state[2:0] = flag ? S_DIG1[2:0] : S_DIG0[2:0];
		S_DIG1[2:0]:next_state[2:0] = flag ? S_DIG2[2:0] : S_DIG1[2:0];
		S_DIG2[2:0]:next_state[2:0] = flag ? S_DIG3[2:0] : S_DIG2[2:0];
		S_DIG3[2:0]:next_state[2:0] = flag ? S_DIG4[2:0] : S_DIG3[2:0];
		S_DIG4[2:0]:next_state[2:0] = flag ? S_DIG5[2:0] : S_DIG4[2:0];
		S_DIG5[2:0]:next_state[2:0] = flag ? S_DIG0[2:0] : S_DIG5[2:0];
	endcase
end

 

always @ (*) begin
	if(!reset_n) begin
		sel[5:0] = 6'b111111;
	end else if(state==S_IDLE) begin
		sel[5:0] = 6'b111111;
	end else if(state==S_DIG0)begin
		sel[5:0] = 6'b111110;
	end else if(state==S_DIG1)begin
		sel[5:0] = 6'b111101;
	end else if(state==S_DIG2)begin
		sel[5:0] = 6'b111011;
	end else if(state==S_DIG3)begin
		sel[5:0] = 6'b110111;
	end else if(state==S_DIG4)begin
		sel[5:0] = 6'b101111;
	end else if(state==S_DIG5)begin
		sel[5:0] = 6'b011111;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		count[29:0] <= {30{1'b0}};
	end else if(flag) begin
		count[29:0] <= {30{1'b0}};
	end else begin
		count[29:0] <= count[29:0] + 1'b1;
	end
end

endmodule
