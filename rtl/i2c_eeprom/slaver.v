module slaver(clk,reset_n,eeprom_scl_i,eeprom_sda,i2c_sda_en,
		i2c_write_req,i2c_read_req);
input           clk;
input           reset_n;
input           eeprom_scl_i;
inout           eeprom_sda;
input           i2c_sda_en;

input           i2c_write_req;
input           i2c_read_req;


parameter SCL_FRE = 10;
parameter WR_DEV_ADDR         = 8'b10100000;
parameter RD_DEV_ADDR         = 8'b10100001;
parameter M                   = 256;
parameter N                   = 8;
parameter WIDTH               = 8;
parameter [3:0]E_IDLE         = 4'd0;
parameter [3:0]E_START        = 4'd1;
parameter [3:0]E_WR_DEV_ADDR  = 4'd2;
parameter [3:0]E_WR_DEV_ACK   = 4'd3;
parameter [3:0]E_WR_REG_ADDR  = 4'd4;
parameter [3:0]E_WR_REG_ACK   = 4'd5;
parameter [3:0]E_WR_DATA      = 4'd6;
parameter [3:0]E_WR_DATA_ACK  = 4'd7;
parameter [3:0]E_RD_REG_ADDR  = 4'd8;
parameter [3:0]E_RD_REG_ACK   = 4'd9;
parameter [3:0]E_RD_START     = 4'd10;
parameter [3:0]E_RD_DEV_ADDR  = 4'd11;
parameter [3:0]E_RD_DEV_ACK   = 4'd12;
parameter [3:0]E_RD_DATA      = 4'd13;
parameter [3:0]E_RD_DATA_ACK  = 4'd14;
parameter [3:0]E_STOP         = 5'd15;
reg  [3:0]  state;
reg  [3:0]  next_state;
reg  [19:0] scl_cnt;
reg  [2:0]  bit_cnt;
wire        flag;
reg         eeprom_sda_d;
wire        sda_nege_egde;
wire        eeprom_sda_i;
reg         eeprom_sda_o;



reg  [7:0] wr_dev_addr;
reg  [7:0] wr_reg_addr;
reg  [7:0] wr_data;
reg  [7:0] rd_dev_addr;
reg  [7:0] rd_reg_addr;



assign flag          = (scl_cnt==SCL_FRE);
assign eeprom_sda_i  = eeprom_sda;
assign eeprom_sda    = (~i2c_sda_en) ? 1'bz : eeprom_sda_o;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		wr_dev_addr[7:0] <= {8{1'b0}};
	end else if((state==E_WR_DEV_ADDR) && (scl_cnt==SCL_FRE/2)) begin
		wr_dev_addr[7-bit_cnt] <= eeprom_sda;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		wr_reg_addr[7:0] <= {8{1'b0}};
	end else if((state==E_WR_REG_ADDR) && (scl_cnt==SCL_FRE/2)) begin
		wr_reg_addr[7-bit_cnt] <= eeprom_sda;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		wr_data[7:0] <= {8{1'b0}};
	end else if((state==E_WR_DATA) && (scl_cnt==SCL_FRE/2) ) begin
		wr_data[7-bit_cnt] <= eeprom_sda;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		rd_dev_addr[7:0] <= {8{1'b0}};
	end else if((state==E_RD_DEV_ADDR) && (scl_cnt==SCL_FRE/2)) begin
		rd_dev_addr[7-bit_cnt] <= eeprom_sda;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		rd_reg_addr[7:0] <= {8{1'b0}};
	end else if((state==E_RD_REG_ADDR) && (scl_cnt==SCL_FRE/2)) begin
		rd_reg_addr[7-bit_cnt] <= eeprom_sda;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		eeprom_sda_o <= 1'b1;
	end else if(state==E_WR_DEV_ACK) begin
		eeprom_sda_o <= !(wr_dev_addr==WR_DEV_ADDR);
	end else if((state==E_WR_REG_ACK)) begin
		eeprom_sda_o <= 1'b0;
	end else if(state==E_WR_DATA_ACK)begin
		eeprom_sda_o <= 1'b0;
	end else if(state==E_RD_DEV_ADDR) begin
		eeprom_sda_o <= !(rd_dev_addr==RD_DEV_ADDR);
	end else if(state==E_RD_REG_ACK) begin
		eeprom_sda_o <= 1'b0;
	end else if(state==E_RD_DATA)begin
		eeprom_sda_o <= eeprom_sda;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		eeprom_sda_d <= 1'b1;
	end else begin
		eeprom_sda_d <= eeprom_sda;
	end
end
assign sda_nege_egde = eeprom_sda_d && (~eeprom_sda);

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		scl_cnt[19:0] <= {20{1'b0}};
	end else if(flag)begin
		scl_cnt[19:0] <= {20{1'b0}};
	end else if(state != next_state) begin
		scl_cnt[19:0] <= {20{1'b0}};
	end else if((state==E_IDLE) || (state==E_STOP))begin
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
	end else if((bit_cnt==3'b111) && flag)begin
		bit_cnt[2:0] <= {3{1'b0}};
	end else if(flag) begin
		bit_cnt[2:0] <= bit_cnt[2:0] + 3'd1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[3:0] <= E_IDLE[3:0];
	end else begin
		state[3:0] <= next_state[3:0];
	end
end


always @ (*) begin
	case(state)
		E_IDLE[3:0]:begin
			if(sda_nege_egde)begin
				next_state[3:0] =E_START[3:0];
			end else begin	
				next_state[3:0] = E_IDLE[3:0];
			end
		end
		E_START       [3:0]:next_state[3:0] = (scl_cnt==SCL_FRE/2)        ? E_WR_DEV_ADDR[3:0] : E_START[3:0];
		E_WR_DEV_ADDR [3:0]:next_state[3:0] = ((bit_cnt==3'd7) && flag)   ? E_WR_DEV_ACK [3:0] : E_WR_DEV_ADDR[3:0];
		E_WR_DEV_ACK  [3:0]:begin
			if(flag &&  i2c_write_req)begin
				next_state[3:0] = E_WR_REG_ADDR[3:0];
			end else if(flag && i2c_read_req)begin
				next_state[3:0] = E_RD_REG_ADDR[3:0];
			end else begin
				next_state[3:0] = E_WR_DEV_ACK[3:0];
			end
		end
		E_WR_REG_ADDR [3:0]:next_state[3:0] = ((bit_cnt==3'd7) && flag)    ? E_WR_REG_ACK [3:0] : E_WR_REG_ADDR[3:0];
		E_WR_REG_ACK  [3:0]:next_state[3:0] = (flag )                      ? E_WR_DATA    [3:0] : E_WR_REG_ACK[3:0];
		E_WR_DATA     [3:0]:next_state[3:0] = ((bit_cnt==3'd7) && flag)    ? E_WR_DATA_ACK[3:0] : E_WR_DATA[3:0];
		E_WR_DATA_ACK [3:0]:next_state[3:0] = E_STOP[3:0];
		E_RD_REG_ADDR [3:0]:next_state[3:0] = ((bit_cnt==3'd7) && flag)    ? E_RD_REG_ACK [3:0] : E_RD_REG_ADDR[3:0];
		E_RD_REG_ACK  [3:0]:next_state[3:0] = (flag )                      ? E_RD_START   [3:0] : E_RD_REG_ACK [3:0];
		E_RD_START    [3:0]:next_state[3:0] = (scl_cnt==SCL_FRE/2)         ? E_RD_DEV_ADDR[3:0] : E_RD_START[3:0];
		E_RD_DEV_ADDR [3:0]:next_state[3:0] = ((bit_cnt==3'd7) && flag)    ? E_RD_DEV_ACK [3:0] : E_RD_DEV_ADDR[3:0];
		E_RD_DEV_ACK  [3:0]:next_state[3:0] = flag                         ? E_RD_DATA    [3:0] : E_RD_DEV_ACK[3:0];
		E_RD_DATA     [3:0]:next_state[3:0] = ((bit_cnt==3'd7) && flag)    ? E_RD_DATA_ACK[3:0] : E_RD_DATA[3:0];
		E_RD_DATA_ACK [3:0]:next_state[3:0] = E_STOP[3:0];
		E_STOP        [3:0]:next_state[3:0] = E_IDLE[3:0];
		
		default:next_state[3:0] = E_IDLE[3:0];
	endcase
end


endmodule
