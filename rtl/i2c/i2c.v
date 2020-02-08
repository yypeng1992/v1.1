module i2c(
input wire clk,
input wire rst_n,
output reg scl,
inout wire sda
);

wire [7:0]id=8'b10100000;
wire [7:0]reg_addr=8'b10111001;
wire [7:0]wdata=8'b11100010;

reg [3:0]I2C_IDLE = 4'b000;
reg [3:0]I2C_START = 4'b001;
reg [3:0]I2C_ID = 4'b010;
reg [3:0]I2C_ID_ACK = 4'b011;
reg [3:0]I2C_REG_ADDR = 4'b100;
reg [3:0]I2C_REG_ACK = 4'b101;
reg [3:0]I2C_WDATA = 4'b110;
reg [3:0]I2C_WDATA_ACK = 4'b0111;
reg [3:0]I2C_STOP = 4'b1000;
reg [3:0]state;
reg [3:0]next_state;

wire en_sda;
assign en_sda = ((state==I2C_ID_ACK)||(state==I2C_REG_ACK)||(state==I2C_WDATA_ACK));


reg [6:0]cnt;
parameter CNT_IS_MAX =7'd18;
reg [2:0]bit_cnt;
parameter BITCNT_IS_MAX = 3'b111;


reg flag ;
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		flag <= 1'b0;
	end else if(cnt==CNT_IS_MAX) begin
		flag <= 1'b1;
	end else begin
		flag <= 1'b0;
	end
end 
reg b_flag;
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		b_flag <= 1'b0;
	end else if((bit_cnt==BITCNT_IS_MAX) && (cnt==CNT_IS_MAX)) begin
		b_flag <= 1'b1;
	end else begin
		b_flag <= 1'b0;
	end
end 


always @ (posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		cnt[6:0] <= 7'd0;
	end else if((flag) || (state==I2C_IDLE)||(next_state != state)) begin
		cnt[6:0] <= 7'd0;
	end else begin
		cnt[6:0] <= cnt[6:0]+1'b1;
	end
end

always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		bit_cnt[2:0]<=3'b000;
	end else if(b_flag && flag) begin
		bit_cnt[2:0]<=3'b000;	
	end else if(state==I2C_IDLE)begin
		bit_cnt[2:0]<=3'b000;
	end else if(flag)begin
		if((state==I2C_ID) ||(state==I2C_REG_ADDR)||(state==I2C_WDATA))begin
			bit_cnt[2:0]<=bit_cnt[2:0]+1'b1;
		end
	end
end

always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		state[3:0] <= I2C_IDLE[3:0];
	end else begin
		state[3:0] <= next_state[3:0];
	end 
end 

always @ (*) begin
case(state)
	I2C_IDLE[3:0]:begin
			next_state[3:0] = I2C_START[3:0];
	end 
	I2C_START[3:0]:begin
		if(flag)begin
			next_state[3:0] = I2C_ID[3:0];
		end else begin
			next_state[3:0] = I2C_START[3:0];
		end
	end 
	I2C_ID[3:0]:begin
		if(b_flag)begin
			next_state[3:0] = I2C_ID_ACK[3:0];
		end else begin
			next_state[3:0] = I2C_ID[3:0];
		end
	end 
	I2C_ID_ACK[3:0]:begin
		if(sda==1'b0 && flag)begin
			next_state[3:0] = I2C_REG_ADDR[3:0];
		end else begin
			next_state[3:0] = I2C_ID_ACK[3:0];
		end
	end
	I2C_REG_ADDR[3:0]:begin
		if(b_flag) begin
			next_state[3:0] = I2C_REG_ACK[3:0];
		end else begin
			next_state[3:0] = I2C_REG_ADDR[3:0];
		end
	end 
	I2C_REG_ACK[3:0]:begin
		if(sda==1'b0 && flag)begin
			next_state[3:0] = I2C_WDATA[3:0];
		end else begin
			next_state[3:0] = I2C_REG_ACK[3:0];	
		end
	end
	I2C_WDATA[3:0]:begin
		if(b_flag) begin
			next_state[3:0] = I2C_WDATA_ACK[3:0];
		end else begin
			next_state[3:0] = I2C_WDATA[3:0];
		end

	end
	I2C_WDATA_ACK[3:0]:begin
			if(flag) begin
				next_state[3:0] = I2C_STOP[3:0];
			end else begin
				next_state[3:0] = I2C_WDATA_ACK[3:0];
			end
	end 
	I2C_STOP:begin
		if(flag) begin
			next_state[3:0] = I2C_IDLE[3:0];
		end else begin
			next_state[3:0] = I2C_STOP[3:0];
		end
	end
	default:begin
		next_state[3:0] = I2C_IDLE[3:0];	
	end
endcase
end

always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		scl <= 1'b1;
	end else if((state==I2C_START) && (cnt==CNT_IS_MAX/2)) begin
		scl<=1'b0;	
	end else if(state==I2C_IDLE)begin
		scl <= 1'b1;
	end else if( cnt==CNT_IS_MAX/4) begin
		scl <= 1'b1;
	end else if(cnt==3*CNT_IS_MAX/4) begin
		scl<=1'b0;	
	end
end 


reg sda_r;
always @ (*) begin
	if(!rst_n) begin
		sda_r = 1'b1;
	end else if(state==I2C_IDLE)begin
		sda_r = 1'b1;
	end else if(state==I2C_START) begin
		sda_r = 1'b0;		
	end else if((state==I2C_ID) && (cnt==7'd0)) begin
		sda_r = id[bit_cnt];
	end else if((state==I2C_REG_ADDR) && (cnt==7'd0)) begin
		sda_r = reg_addr[bit_cnt];
	end else if((state==I2C_WDATA) && (cnt==7'd0)) begin
		sda_r = wdata[bit_cnt];
	end
end

assign sda = en_sda ? 1'bz:sda_r;
endmodule
