module eepram(
input wire clk,
input wire rst_n,
input wire scl,
inout wire sda
);

parameter [7:0] EE_ID = 8'b10100000;

localparam [3:0] EE_ST_IDLE       = 4'b0000;
localparam [3:0] EE_ST_START      = 4'b0001;
localparam [3:0] EE_ST_ID         = 4'b0010;
localparam [3:0] EE_ST_ID_ACK     = 4'b0011;
localparam [3:0] EE_ST_REG_ADDR   = 4'b0100;
localparam [3:0] EE_ST_REG_ACK    = 4'b0101;
localparam [3:0] EE_ST_WDATA      = 4'b0110;
localparam [3:0] EE_ST_WDATA_ACK  = 4'b0111;
localparam [3:0] EE_ST_STOP       = 4'b1000;
reg [7:0]id_from_i2c;
reg [7:0]wdata_i2c ;

reg [3:0]state;
reg [3:0]next_state;

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


reg sda_r;
wire en_sda = ((state==EE_ST_ID_ACK)||(state==EE_ST_REG_ACK)||(state==EE_ST_WDATA_ACK));
assign sda = en_sda ? sda_r : 1'bz;
always @ (*)begin
	if(!rst_n) begin
		sda_r = 1'b1;
	end else if((state==EE_ST_ID_ACK)||(state==EE_ST_REG_ACK)||(state==EE_ST_WDATA_ACK)) begin
		sda_r = 1'b0;
	end else begin
		sda_r = 1'b1;
	end
end


always @ (posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		cnt[6:0] <= 7'd0;
	end else if((flag) || (state==EE_ST_IDLE)||(next_state != state)) begin
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
	end else if(state==EE_ST_IDLE)begin
		bit_cnt[2:0]<=3'b000;
	end else if(flag)begin
		if((state==EE_ST_ID) ||(state==EE_ST_REG_ADDR)||(state==EE_ST_WDATA))begin
			bit_cnt[2:0]<=bit_cnt[2:0]+1'b1;
		end
	end
end

always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		state[3:0] <= 	EE_ST_IDLE[3:0];	
	end else begin
		state[3:0] <= next_state[3:0];
	end
end

always @ (*) begin
case(state) 
	EE_ST_IDLE[3:0]:begin
		if(scl && (!sda))begin
			next_state[3:0] = EE_ST_START[3:0];	
		end else begin
			next_state[3:0] = EE_ST_IDLE[3:0];		
		end
	end
	EE_ST_START[3:0]:begin
		if(flag )begin
			next_state[3:0] = EE_ST_ID[3:0];	
		end else begin
			next_state[3:0] = EE_ST_START[3:0];	
		end
	end
	EE_ST_ID[3:0]:begin
		if(flag && b_flag)begin
			if(id_from_i2c==EE_ID)begin
				next_state[3:0] = EE_ST_ID_ACK[3:0];
			end else begin
				next_state[3:0] = EE_ST_IDLE[3:0];	
			end
		end
	end 
	EE_ST_ID_ACK[3:0]:begin
		if(flag)begin
			next_state[3:0] <= EE_ST_REG_ADDR[3:0];
		end else begin
			next_state[3:0] <= EE_ST_ID_ACK[3:0];
		end
	end
	EE_ST_REG_ADDR[3:0]:begin
		if(flag && b_flag )begin
			next_state[3:0] <= EE_ST_REG_ACK[3:0];
		end else begin
			next_state[3:0] <= EE_ST_REG_ADDR[3:0];
		end
	end 
	EE_ST_REG_ACK[3:0]:begin
		if(flag)begin
			next_state[3:0] <= EE_ST_WDATA[3:0];
		end else begin
			next_state[3:0] <= EE_ST_REG_ACK[3:0];
		end	
	end 
	EE_ST_WDATA[3:0]:begin
		if(flag && b_flag )begin
			next_state[3:0] <= EE_ST_WDATA_ACK[3:0];
		end else begin
			next_state[3:0] <= EE_ST_WDATA[3:0];
		end
	end	
	EE_ST_WDATA_ACK[3:0]:begin
		if(flag)begin
			next_state[3:0] <= EE_ST_STOP[3:0];
		end else begin
			next_state[3:0] <= EE_ST_WDATA_ACK[3:0];
		end	
	end
	EE_ST_STOP[3:0]:begin
		if(sda && scl)begin
			next_state[3:0] <= EE_ST_IDLE[3:0];	
		end else begin
			next_state[3:0] <= EE_ST_STOP[3:0];
		end
	end
	default:begin
			next_state[3:0] <= EE_ST_IDLE[3:0];
	end
endcase
end


always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		id_from_i2c[7:0] <= 8'd0;

	end else if((state==EE_ST_ID) && scl)begin
		id_from_i2c[bit_cnt] <= sda;
	end
end

always @ (*) begin
	if(!rst_n) begin
		wdata_i2c[7:0]= 8'd0;
	end else if((state==EE_ST_WDATA) && scl)begin
		wdata_i2c[bit_cnt] = sda;
	end
end

endmodule
