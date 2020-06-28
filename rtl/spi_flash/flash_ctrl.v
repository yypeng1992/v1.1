module flash_ctrl(clk,reset_n,data_size,Q,rd_req,pp_req,se_req,rd_addr,wr_addr,se_addr,data_into_flash,flash_ack,D,rdata,CLK,CS);
input       clk;
input       reset_n;
input [7:0] data_size;
input       rd_req;
input       pp_req;
input       se_req;
input [23:0]rd_addr;
input [23:0]wr_addr;
input [23:0]se_addr;
input [7 :0]data_into_flash;
output      flash_ack;
output [7:0]rdata;

/// flash inf
output      CLK;
output reg  CS;
output      D;
input       Q;


wire ack;
wire data_flag;
reg req;
reg [7:0]data;


parameter [7:0]INST_READ = 8'h03;
parameter [7:0]INST_WREN = 8'h06;
parameter [7:0]INST_PP   = 8'h02;
parameter [7:0]INST_SE   = 8'hd8;
parameter [7:0]INST_BE   = 8'hc7;
parameter [7:0]INST_RDSR = 8'h05;

parameter [3:0]ST_IDLE      = 4'd0;
parameter [3:0]ST_CS_LOW    = 4'd1;
parameter [3:0]ST_READ      = 4'd2;
parameter [3:0]ST_WRITE     = 4'd3;
parameter [3:0]ST_CS_WRHIGH = 4'd4; 
parameter [3:0]ST_CS_WLOW   = 4'd5;
parameter [3:0]ST_PP        = 4'd6;
parameter [3:0]ST_SE        = 4'd7;
parameter [3:0]ST_CS_STATE_HIGH = 4'd8;
parameter [3:0]ST_CS_STATE_LOW = 4'd9;
parameter [3:0]ST_WRSR       = 4'd10;
parameter [3:0]ST_CS_HIGH    = 4'd11;
reg [3:0]state;
reg [3:0]next_state;
reg [8:0]flash_size;
reg [8:0]size;
reg [2:0]cs_cnt;

assign flash_ack      = (state!=ST_IDLE)&&(next_state==ST_IDLE);
assign data_size[7:0] = 8'd1;
assign data_flag      = ((state==ST_READ)&&(size==flash_size-1)) || ((state==ST_WRSR) && (size !=0));


always @ (*)begin
	if(!reset_n)begin
		flash_size[8:0] = {9'd0};
	end else if((state==ST_READ) || (state==ST_PP)) begin
		flash_size[8:0] = 4 + data_size[7:0];
	end else if(state==ST_SE)begin
		flash_size[8:0] = 4;
	end
end


always @ (*)begin
	if(!reset_n)begin
		data[7:0] = {8{1'b0}};
	end else if(state==ST_READ)begin
		if(size[8:0]==0)begin
			data[7:0] = INST_READ[7:0];
		end else if(size[8:0]==9'd1) begin
			data[7:0] = rd_addr[23:16];
		end else if(size[8:0]==9'd2) begin
			data[7:0] = rd_addr[15:8];
		end else if(size[8:0]==9'd3) begin
			data[7:0] = rd_addr[7:0];
		end
	end else if(state==ST_WRITE)begin
		data[7:0] = INST_WREN[7:0];
	end else if(state==ST_PP)begin
		if(size[8:0]==0)begin
			data[7:0] = INST_PP[7:0];
		end else if(size[8:0]==9'd1) begin
			data[7:0] = wr_addr[23:16];
		end else if(size[8:0]==9'd2) begin
			data[7:0] = wr_addr[15:8];
		end else if(size[8:0]==9'd3) begin
			data[7:0] = wr_addr[7:0];
		end else begin
			data[7:0] = data_into_flash[7:0];
		end
	end else if(state==ST_SE)begin
		if(size[8:0]==0)begin
			data[7:0] = INST_SE[7:0];
		end else if(size[8:0]==9'd1) begin
			data[7:0] = se_addr[23:16];
		end else if(size[8:0]==9'd2) begin
			data[7:0] = se_addr[15:8];
		end else if(size[8:0]==9'd3) begin
			data[7:0] = se_addr[7:0];
		end
	end else if(state==ST_WRSR)begin
		if(size[8:0]==0)begin
			data[7:0] = INST_RDSR[7:0];
		end
	end
end



always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		cs_cnt[2:0] <= {3{1'b0}};
	end else if(state != next_state) begin
		cs_cnt[2:0] <= {3{1'b0}};
	end else if((state==ST_CS_WRHIGH) || (state==ST_CS_STATE_HIGH))begin
		cs_cnt[2:0] <= cs_cnt[2:0] + 1'b1;
	end
end


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		req <= 1'b0;
	end else if((state==ST_WRSR)&&(ack)&&(next_state==state))begin
		req <= 1'b1;
	end else if((state==ST_CS_LOW || (state==ST_CS_WLOW)||(state==ST_CS_STATE_LOW)) && (next_state != state))begin
		req <= 1'b1;
	end else if(((state==ST_READ)||(state==ST_PP)||(state==ST_SE))&&(ack)&&(size!=flash_size-1)) begin
		req <= 1'b1;
	end else begin
		req <= 1'b0;
	end
end


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		size[8:0] <= {9'd0};
	end else if(state != next_state)begin
		size[8:0] <= {9'd0};
	end else if((ack)&&((state==ST_READ)||(state==ST_PP)||(state==ST_SE)||(state==ST_WRSR)))begin
		size[8:0] <= size[8:0] + 1'b1;
	end
end



always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		CS = 1'b1;
	end else if(state==ST_CS_LOW) begin
		CS = 1'b0;
	end else if(state==ST_CS_WRHIGH || state==ST_CS_STATE_HIGH)begin
		CS = 1'b1;
	end else if(state==ST_CS_WLOW || state==ST_CS_STATE_LOW)begin
		CS = 1'b0;
	end else if(state==ST_CS_HIGH)begin
		CS = 1'b1;
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
			if(rd_req || pp_req || se_req)begin
				next_state[3:0] = ST_CS_LOW[3:0];
			end
		end
		ST_CS_LOW[3:0]:begin
			if(rd_req)begin
				next_state[3:0] = ST_READ[3:0];
			end else if(pp_req || se_req)begin
				next_state[3:0] = ST_WRITE[3:0];
			end
		end
		ST_READ[3:0]:begin
			if(ack && (size==flash_size-1))begin
				next_state[3:0] = ST_CS_HIGH[3:0];
			end
		end
		ST_WRITE[3:0]:begin
			if(ack)begin
				next_state[3:0] = ST_CS_WRHIGH[3:0];
			end
		end
		ST_CS_WRHIGH[3:0]:begin
			if(cs_cnt==3'd3)begin
				next_state[3:0] = ST_CS_WLOW[3:0];
			end
		end
		ST_CS_WLOW[3:0]:begin
			if(pp_req)begin
				next_state[3:0] = ST_PP[3:0];
			end else if(se_req)begin
				next_state[3:0] = ST_SE[3:0];
			end
		end
		ST_PP[3:0]:begin
			if(ack && (size==flash_size-1))begin
				next_state[3:0] =ST_CS_STATE_HIGH;
			end
		end
		ST_SE[3:0]:begin
			if(ack && (size==flash_size-1))begin
				next_state[3:0] = ST_CS_STATE_HIGH;
			end
		end
		ST_CS_STATE_HIGH:begin
			if(cs_cnt==3'd3)begin
				next_state[3:0] = ST_CS_STATE_LOW[3:0];
			end
		end
		ST_CS_STATE_LOW:begin
			next_state[3:0] = ST_WRSR;
		end
		ST_WRSR[3:0]:begin
			if(ack && (size!=0) && (!rdata[0]))begin
				next_state[3:0] = ST_CS_HIGH[3:0];
			end
		end
		ST_CS_HIGH[3:0]:begin
			next_state[3:0] = ST_IDLE[3:0];
		end
	endcase
end


spi_master spi0(
 .clk       (clk      ),
 .reset_n   (reset_n  ),
 .req       (req      ),
 .data      (data[7:0]),
 .Q         (Q        ),
 .flag      (data_flag),
 .ack       (ack      ),
 .D         (D        ),
 .CLK       (CLK      ),
 .rdata     (rdata[7:0])
);

endmodule
