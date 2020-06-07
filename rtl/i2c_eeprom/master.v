module master(
input       clk,
input       reset_n,
inout       sda,
output      scl,
input       rd_req,
input       wd_req,
input  [7:0]wr_reg_addr,
input  [7:0]rd_reg_addr,
input  [7:0]wr_data,
output reg[7:0]rd_data,
output      wr_ack,
output      rd_ack
);

parameter [8:0]CLK_IS_MAX     = 50;
parameter [7:0]WR_DEV_ADDR    = 8'ha0;
parameter [7:0]RD_DEV_ADDR    = 8'ha1;

parameter [3:0]ST_IDLE        = 4'd0;
parameter [3:0]ST_START       = 4'd1;
parameter [3:0]ST_DEV_ADDR    = 4'd2;
parameter [3:0]ST_WD_REG_ADDR = 4'd3;
parameter [3:0]ST_RD_REG_ADDR = 4'd4;
parameter [3:0]ST_WD_DATA     = 4'd5;
parameter [3:0]ST_STOP        = 4'd6;
parameter [3:0]ST_RESTART     = 4'd7;
parameter [3:0]ST_RD_DEV_ADDR = 4'd8;
parameter [3:0]ST_RD_DATA     = 4'd9;
reg [3:0]state;
reg [3:0]next_state;
wire flag;
wire byte_flag;
reg mt_sda;
reg mt_scl;
wire sl_sda;
wire en ;
reg [8:0]clk_cnt;
reg [3:0]byte_cnt;

assign scl       = mt_scl;
assign flag      = (clk_cnt[8:0]==CLK_IS_MAX-1);
assign byte_flag = (byte_cnt==4'd8);
assign en        = (((state==ST_DEV_ADDR)||(state==ST_WD_REG_ADDR)||(state==ST_WD_DATA)||(state==ST_RD_REG_ADDR))&&(byte_cnt==4'd8))||
		   ((state==ST_RD_DATA)&&(byte_cnt!=4'd8));

assign sl_sda = sda;
assign sda = (!en) ? mt_sda : 1'bz;
assign wr_ack = (state==ST_STOP)&&(next_state==ST_IDLE);
assign rd_ack = (state==ST_STOP)&&(next_state==ST_IDLE);


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		mt_scl <=1'b1;
	end else if(state==ST_IDLE)begin
		mt_scl <=1'b1;
	end else if(((state==ST_RD_DATA)||(state==ST_RESTART))&&(next_state!=state))begin
		mt_scl <=1'b1;
	end else if((state==ST_START)&&(clk_cnt==37))begin
		mt_scl <= 1'b0;
	end else if(clk_cnt==(12))begin
		mt_scl <= 1'b1;
	end else if(clk_cnt==(37))begin
		mt_scl <= 1'b0;
	end else if(state==ST_STOP)begin
		mt_scl <=1'b1;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		mt_sda <=1'b1;
	end else if((state==ST_START) || (state==ST_RESTART)) begin
		mt_sda <=1'b0;
	end else if(state==ST_DEV_ADDR) begin
		mt_sda <=WR_DEV_ADDR[7-byte_cnt];
	end else if(state==ST_WD_REG_ADDR)begin
		mt_sda <=wr_reg_addr[7-byte_cnt];
	end else if(state==ST_RD_REG_ADDR)begin
		mt_sda <=rd_reg_addr[7-byte_cnt];
	end else if(state==ST_WD_DATA)begin
		mt_sda <=wr_data[7-byte_cnt];
	end else if(state==ST_RD_DEV_ADDR)begin
		mt_sda <=RD_DEV_ADDR[7-byte_cnt];
	end else if(flag&&(byte_cnt==7))begin
		mt_sda <=1'b1;
	end
end


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		rd_data[7:0] <= {8{1'b0}};
	end else if(state==ST_RD_DATA)begin
		rd_data[7-byte_cnt] <= sda;
	end
end
always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		clk_cnt[8:0] <= {9{1'b0}};
	end else if(flag || (state!=next_state)) begin
		clk_cnt[8:0] <= {9{1'b0}};
	end else if((state!=ST_IDLE))begin
		clk_cnt[8:0] <= clk_cnt[8:0] + 1'b1;
	end
end


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		byte_cnt[3:0] <= {4{1'b0}};
	end else if(state!=next_state)begin
		byte_cnt[3:0] <= {4{1'b0}};
	end else if(byte_flag && flag)begin
		byte_cnt[3:0] <= {4{1'b0}};
	end else if(flag) begin
		byte_cnt[3:0] <= byte_cnt[3:0] + 1'b1;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		state[3:0] <= ST_IDLE[3:0];
	end else begin
		state[3:0] <= next_state[3:0];
	end
end


always @ (*)begin
	next_state[3:0] = state[3:0];
	case(state[3:0])
		ST_IDLE[3:0]:begin
			if(wd_req || rd_req)begin
				next_state[3:0] = ST_START[3:0];
			end
		end
		ST_START[3:0]:begin
			if(flag)begin
				next_state[3:0] = ST_DEV_ADDR[3:0];
			end
		end
		ST_DEV_ADDR[3:0]:begin
			if((byte_flag)&&(!sda)&&flag)begin
				if(wd_req)begin
					next_state[3:0] = ST_WD_REG_ADDR[3:0];
				end else if(rd_req) begin
					next_state[3:0] = ST_RD_REG_ADDR[3:0];
				end
			end
		end
		ST_WD_REG_ADDR[3:0]:begin
			if((byte_flag)&&(!sda)&&flag)begin
				next_state[3:0] = ST_WD_DATA[3:0];
			end
		end
		ST_WD_DATA[3:0]:begin
			if((byte_flag)&&(!sda)&&flag)begin
				next_state[3:0] = ST_STOP[3:0];
			end
		end
		ST_RD_REG_ADDR[3:0]:begin
			if((byte_flag)&&(!sda)&&flag)begin
				next_state[3:0] = ST_RESTART[3:0];
			end
		end
		ST_RESTART[3:0]:begin
			if(flag)begin
				next_state[3:0] = ST_RD_DEV_ADDR[3:0];
			end
		end
		ST_RD_DEV_ADDR[3:0]:begin
			if((byte_cnt==4'd7) && flag)begin
				next_state[3:0] = ST_RD_DATA[3:0];
			end
		end
		ST_RD_DATA[3:0]:begin
			if((byte_flag)&&(sda)&&flag)begin
				next_state[3:0] = ST_STOP[3:0];
			end
		end
		ST_STOP[3:0]:next_state[3:0] = ST_IDLE[3:0];
	endcase
end

endmodule
