module spi_master_for_rtc(clk,reset_n,wr_req,dclk,data_in,wr_ack,data_for_read,D_in,r_pin,clk_div);
input            clk;
input            reset_n;
input            wr_req;
input      [7:0] data_in;
output           dclk;
output           wr_ack;
output     [7:0] data_for_read;
input            D_in;
output           r_pin;
input      [15:0]clk_div;

parameter [2:0] M_IDLE       = 3'd0;
parameter [2:0] M_DCLK_IDLE  = 3'd1;
parameter [2:0] M_DCLK_EDGE  = 3'd2;
parameter [2:0] M_HALF_CYCLE = 3'd3;
parameter [2:0] M_ACK        = 3'd4;
parameter [2:0] M_ACK_WAIT   = 3'd5;
reg [2 :0]state;
reg [2 :0]next_state;
reg [15:0]clk_cnt;
reg [4 :0]clk_edge_cnt;
reg       dclk_reg;
reg [7 :0]data_for_write;
reg [7 :0]D_in_shift;
reg [7 :0]r_pin_shift;

assign wr_ack = (state==M_ACK);
assign dclk   = dclk_reg;
assign data_for_read[7:0] =D_in_shift[7:0];
assign r_pin = r_pin_shift[7];

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		clk_cnt[15:0] <= {16{1'b0}};
	end else if((state==M_DCLK_IDLE) || (state==M_HALF_CYCLE)) begin
		clk_cnt[15:0] <= clk_cnt[15:0] + 1'b1;
	end else begin
		clk_cnt[15:0] <= {16{1'b0}};
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		clk_edge_cnt[4:0] <= {5{1'b0}};
	end else if( (state==M_IDLE))begin
		clk_edge_cnt[4:0] <= {5{1'b0}};
	end else if(state==M_DCLK_EDGE) begin
		clk_edge_cnt[4:0] <= clk_edge_cnt[4:0] + 1'b1;
	end
end



always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		dclk_reg <= 1'b0;
	end else if(state==M_DCLK_EDGE) begin
		dclk_reg <= ~dclk_reg;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		D_in_shift[7:0] <= {8{1'b0}}; 
	end else if((state==M_IDLE) && wr_req) begin
		D_in_shift[7:0] <= {8{1'b0}};
	end else if((state==M_DCLK_EDGE) &&(!clk_edge_cnt[0]))begin
		D_in_shift[7:0] <= {D_in_shift[6:0],D_in};
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		r_pin_shift[7:0] <= {8{1'b0}};
	end else if((state==M_IDLE) && wr_req) begin
		r_pin_shift[7:0] <= data_in[7:0];
	end else if((state==M_DCLK_EDGE)&&(clk_edge_cnt[0]))begin
		r_pin_shift[7:0] <= {r_pin_shift[6:0],r_pin_shift[7]};
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[2:0] <= M_IDLE[2:0];
	end else begin
		state[2:0] <= next_state[2:0];
	end
end


always @ (*) begin
	case(state[2:0])
		M_IDLE[2:0]:begin
			if(wr_req)begin
				next_state[2:0] = M_DCLK_IDLE[2:0];
			end else begin
				next_state[2:0] = M_IDLE[2:0];
			end
		end
		M_DCLK_IDLE[2:0]:begin
			if(clk_cnt==clk_div)begin
				next_state[2:0] = M_DCLK_EDGE[2:0];
			end else begin
				next_state[2:0] = M_DCLK_IDLE[2:0];
			end
		end
		M_DCLK_EDGE[2:0]:begin
			if(clk_edge_cnt==5'd15)begin
				next_state[2:0] = M_HALF_CYCLE[2:0];
			end else begin
				next_state[2:0] = M_DCLK_IDLE[2:0];
			end
		end
		M_HALF_CYCLE[2:0]:begin
			if(clk_cnt==clk_div)begin
				next_state[2:0] = M_ACK[2:0];
			end else begin
				next_state[2:0] = M_HALF_CYCLE[2:0];
			end
		end
		M_ACK[2:0]:next_state[2:0] = M_ACK_WAIT[2:0];
		M_ACK_WAIT[2:0]:next_state[2:0] = M_IDLE[2:0];
		default:next_state[2:0] = M_IDLE[2:0];
	endcase
end


endmodule
