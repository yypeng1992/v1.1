module spi_master(clk,reset_n,req,data,Q,flag,
	 	  ack,D,CLK,rdata);
input      clk;
input      reset_n;
input      req;
input [7:0]data;
input      Q;
input      flag;
output     ack;
output     D;
output reg CLK;
output reg[7:0]rdata;

reg [7 :0]shift_byte;
reg [4:0]clk_cnt;

parameter [1:0]S_IDLE = 2'd0;
parameter [1:0]S_WORK = 2'd1;
parameter [1:0]S_ACK  = 2'd2;
reg [1:0]state;
reg [1:0]next_state;
wire [2:0]index;
assign index[2:0] = clk_cnt[4:0]>>1;
assign ack = (state==S_ACK);


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		state[1:0] <= S_IDLE[1:0];
	end else begin
		state[1:0] <= next_state[1:0];
	end
end

always @ (*)begin
	next_state[1:0] = state[1:0];
	case(state[1:0])
		S_IDLE[1:0]:begin
			if(req)begin
				next_state[1:0] = S_WORK[1:0];
			end
		end 
		S_WORK[1:0]:begin
			if(clk_cnt[4:0]==5'hf)begin
				next_state[1:0] = S_ACK[1:0];
			end
		end
		S_ACK[1:0]:next_state[1:0] = S_IDLE[1:0];
	endcase
end

assign D   = shift_byte[7];


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		clk_cnt[4:0] <= {5{1'b0}};
	end else if(state==S_WORK)begin
		clk_cnt[4:0] <= clk_cnt[4:0] + 1'b1;
	end else begin
		clk_cnt[4:0] <= {5{1'b0}};
	end
end


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		rdata[7:0] <= {8{1'b0}};
	end else if(flag&&(!clk_cnt[0])&&(clk_cnt<=4'd15)) begin
		rdata[7-index] <= Q;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		shift_byte[7:0] <= {8{1'b0}};
	end else if(req )begin
		shift_byte[7:0] <= data[7:0];
	end else if(clk_cnt[0]) begin
		shift_byte[7:0] <= (shift_byte[7:0] << 1);
	end
end


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		CLK <= 1'b0;
	end else if((next_state==S_ACK)) begin
		CLK <= 1'b0;
	end else if((state==S_WORK))begin
		CLK <= ~CLK;
	end
end

endmodule
