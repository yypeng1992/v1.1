module master(clk,reset_n,i2c_scl_o,i2c_sda,i2c_sda_en,
	      i2c_write_req,i2c_write_ack,i2c_read_req,i2c_read_ack,wr_dev_addr,wr_reg_addr,wdata_in,rd_dev_addr,rd_reg_addr,rdata);
input           clk;
input           reset_n;
output reg      i2c_scl_o;
inout           i2c_sda;
output          i2c_sda_en;

input           i2c_write_req;
input           i2c_read_req;
output          i2c_write_ack;
output          i2c_read_ack;
input      [7:0]wr_dev_addr;
input      [7:0]wr_reg_addr;
input      [7:0]wdata_in;
input      [7:0]rd_dev_addr;
input      [7:0]rd_reg_addr;
output reg [7:0]rdata;

parameter SCL_FRE = 10;
parameter [4:0]I_IDLE         = 5'd0;
parameter [4:0]I_START        = 5'd1;
parameter [4:0]I_WR_DEV_ADDR  = 5'd2;
parameter [4:0]I_WR_DEV_ACK   = 5'd3;
parameter [4:0]I_WR_REG_ADDR  = 5'd4;
parameter [4:0]I_WR_REG_ACK   = 5'd5;
parameter [4:0]I_WR_DATA      = 5'd6;
parameter [4:0]I_WR_DATA_ACK  = 5'd7;
parameter [4:0]I_RD_REG_ADDR  = 5'd8;
parameter [4:0]I_RD_REG_ACK   = 5'd9;
parameter [4:0]I_RD_START     = 5'd10;
parameter [4:0]I_RD_DEV_ADDR  = 5'd11;
parameter [4:0]I_RD_DEV_ACK   = 5'd12;
parameter [4:0]I_RD_DATA      = 5'd13;
parameter [4:0]I_RD_DATA_ACK  = 5'd14;
parameter [4:0]I_STOP         = 5'd15;
parameter [4:0]I_ACK          = 5'd16;   
reg [4:0]state;
reg [4:0]next_state;
reg [19:0]scl_cnt;
reg [2:0]bit_cnt;
wire     flag;
wire     i2c_sda_i;
reg      i2c_sda_o;
reg [7:0]rdata_o;
assign i2c_sda_i = i2c_sda;
assign i2c_sda = i2c_sda_en ? 1'bz : i2c_sda_o;



assign i2c_write_ack = (state==I_ACK);
assign i2c_read_ack  = (state==I_ACK);
assign flag          = (scl_cnt==SCL_FRE);
assign i2c_sda_en    = ((state==I_WR_DEV_ACK)||(state==I_WR_REG_ACK)||(state==I_WR_DATA_ACK)||(state==I_RD_REG_ACK)||(state==I_RD_DEV_ACK)||(state==I_RD_DATA));


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		rdata[7:0] <= 8'hff;
	end else if((state==I_RD_DATA) && (next_state != state)) begin
		rdata[7:0] <= rdata_o[7:0];
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		scl_cnt[19:0] <= {20{1'b0}};
	end else if(flag)begin
		scl_cnt[19:0] <= {20{1'b0}};
	end else if(state != next_state) begin
		scl_cnt[19:0] <= {20{1'b0}};
	end else if((state==I_IDLE) ||  (state==I_STOP))begin
		scl_cnt[19:0] <= {20{1'b0}};
	end else begin
		scl_cnt[19:0] <= scl_cnt[19:0] + 20'd1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		bit_cnt[2:0] <= {3{1'b0}};
	end else if(state != next_state) begin
		bit_cnt[2:0] <= {3{1'b0}};
	end else if((bit_cnt==3'd7) && flag) begin
		bit_cnt[2:0] <= {3{1'b0}};
	end else if(flag)begin
		bit_cnt[2:0] <= bit_cnt[2:0] + 3'd1;
	end
end



always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		i2c_scl_o <= 1'b1;
	end else if((state==I_IDLE) || (state==I_STOP) || (state==I_ACK)) begin
		i2c_scl_o <= 1'b1;
	end else if((state==I_START) || (state==I_RD_START))begin
		if(scl_cnt<=SCL_FRE/4)begin
			i2c_scl_o <= 1'b1;
		end else begin
			i2c_scl_o <= 1'b0;
		end
	end else if((scl_cnt<=SCL_FRE/4) || (scl_cnt >3*SCL_FRE/4))begin
		i2c_scl_o <= 1'b0;
	end else if((scl_cnt>SCL_FRE/4) || (scl_cnt <=3*SCL_FRE/4))begin
		i2c_scl_o <= 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		i2c_sda_o <= 1'b1;
	end else if((state==I_IDLE) ) begin
		i2c_sda_o <= 1'b1;
	end else if((state==I_START) || (state==I_RD_START))begin
		i2c_sda_o <= 1'b0;
	end else if(state==I_WR_DEV_ADDR)begin
		i2c_sda_o <= wr_dev_addr[7-bit_cnt];
	end else if(state==I_WR_REG_ADDR)begin
		i2c_sda_o <= wr_reg_addr[7-bit_cnt];
	end else if(state==I_WR_DATA)begin
		i2c_sda_o <= wdata_in[7-bit_cnt];
	end else if(state==I_RD_REG_ADDR)begin
		i2c_sda_o <= rd_reg_addr[7-bit_cnt];
	end else if(state==I_RD_DEV_ADDR)begin
		i2c_sda_o <= rd_dev_addr[7-bit_cnt];
	end else if(state==I_RD_DATA_ACK)begin
		i2c_sda_o <= 1'b1;
	end else if(((state==I_ACK) || (state==I_STOP)) && i2c_scl_o )begin
		i2c_sda_o <= 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		rdata_o[7:0]     <= {8{1'b0}};
	end else if(state==I_RD_DATA) begin
		rdata_o[bit_cnt] <= i2c_sda;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[4:0] <= I_IDLE[4:0];
	end else begin
		state[4:0] <= next_state[4:0];
	end
end


always @ (*) begin
	case(state)
		I_IDLE[4:0]:begin
			if(i2c_write_req || i2c_read_req)begin
				next_state[4:0] =I_START[4:0];
			end else begin	
				next_state[4:0] = I_IDLE[4:0];
			end
		end
		I_START       [4:0]:next_state[4:0] = (scl_cnt==SCL_FRE/2)        ? I_WR_DEV_ADDR[4:0] : I_START[4:0];
		I_WR_DEV_ADDR [4:0]:next_state[4:0] = ((bit_cnt==3'd7) && flag)   ? I_WR_DEV_ACK [4:0] : I_WR_DEV_ADDR[4:0];
		I_WR_DEV_ACK  [4:0]:begin
			if(flag && (!i2c_sda) && i2c_write_req)begin
				next_state[4:0] = I_WR_REG_ADDR[4:0];
			end else if(flag && (!i2c_sda) && i2c_read_req)begin
				next_state[4:0] = I_RD_REG_ADDR[4:0];
			end else begin
				next_state[4:0] = I_WR_DEV_ACK[4:0];
			end
		end
		I_WR_REG_ADDR [4:0]:next_state[4:0] = ((bit_cnt==3'd7) && flag)    ? I_WR_REG_ACK [4:0] : I_WR_REG_ADDR[4:0];
		I_WR_REG_ACK  [4:0]:next_state[4:0] = (flag && (!i2c_sda))       ? I_WR_DATA    [4:0] : I_WR_REG_ACK[4:0];
		I_WR_DATA     [4:0]:next_state[4:0] = ((bit_cnt==3'd7) && flag)    ? I_WR_DATA_ACK[4:0] : I_WR_DATA[4:0];
		I_WR_DATA_ACK [4:0]:next_state[4:0] = (scl_cnt==SCL_FRE/2)         ? I_STOP[4:0] : I_WR_DATA_ACK;
		I_RD_REG_ADDR [4:0]:next_state[4:0] = ((bit_cnt==3'd7) && flag)    ? I_RD_REG_ACK [4:0] : I_RD_REG_ADDR[4:0];
		I_RD_REG_ACK  [4:0]:next_state[4:0] = (flag && (!i2c_sda))       ? I_RD_START   [4:0] : I_RD_REG_ACK [4:0];
		I_RD_START    [4:0]:next_state[4:0] = (scl_cnt==SCL_FRE/2)         ? I_RD_DEV_ADDR[4:0] : I_RD_START[4:0];
		I_RD_DEV_ADDR [4:0]:next_state[4:0] = ((bit_cnt==3'd7) && flag)    ? I_RD_DEV_ACK [4:0] : I_RD_DEV_ADDR[4:0];
		I_RD_DEV_ACK  [4:0]:next_state[4:0] = (flag && (!i2c_sda))         ? I_RD_DATA[4:0] : I_RD_DEV_ACK[4:0];
		I_RD_DATA     [4:0]:next_state[4:0] = ((bit_cnt==3'd7) && flag)    ? I_RD_DATA_ACK[4:0] : I_RD_DATA[4:0];
		I_RD_DATA_ACK [4:0]:next_state[4:0] =  (scl_cnt==SCL_FRE/2)       ? I_STOP[4:0] : I_RD_DATA_ACK;
		I_STOP        [4:0]:next_state[4:0] =  I_ACK [4:0];
		I_ACK         [4:0]:next_state[4:0] =   I_IDLE[4:0] ;
		default:next_state[4:0] = I_IDLE[4:0];
	endcase
end



endmodule
