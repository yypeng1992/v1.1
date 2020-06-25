module ds1302_io(clk,reset_n,cmd_write,cmd_read,ds1302_io,
		waddr,raddr,wdata,dce,dclk,cmd_write_ack,cmd_read_ack,rdata);
input           clk;
input           reset_n;

input           cmd_read;
input           cmd_write;
inout           ds1302_io;
input      [7:0]waddr;
input      [7:0]raddr;
input      [7:0]wdata;
output reg      dce;
output          dclk;
output          cmd_write_ack;
output          cmd_read_ack;
output reg [7:0]rdata;


reg       wr_req;
wire [7:0]rdata_rec;
reg  [7:0]send_data;
wire wr_ack;
wire D_in;
wire r_pin;
wire ds1302_io_oe;
assign D_in = ds1302_io;
assign ds1302_io = (~ds1302_io_oe) ? r_pin : 1'bz;


parameter DELAY_CNT_IS_MAX   = 3;
parameter [3:0]IO_IDLE       = 4'd0;
parameter [3:0]IO_CE_HIGH    = 4'd1;
parameter [3:0]IO_READ       = 4'd2;
parameter [3:0]IO_READ_ADDR  = 4'd3;
parameter [3:0]IO_READ_DATA  = 4'd4;
parameter [3:0]IO_WRITE      = 4'd5;
parameter [3:0]IO_WRITE_ADDR = 4'd6;
parameter [3:0]IO_WRITE_DATA = 4'd7;
parameter [3:0]IO_ACK        = 4'd8;
parameter [3:0]IO_CE_LOW     = 4'd9;
reg [3:0]state;
reg [3:0]next_state;
reg [14:0]delay_cnt;

assign cmd_write_ack = ((state==IO_WRITE_DATA) && (next_state==IO_ACK));
assign cmd_read_ack  = ((state==IO_READ_DATA) && (next_state==IO_ACK));
assign ds1302_io_oe = (state==IO_READ_DATA);


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		rdata[7:0] <= {8{1'b0}};
	end else if((state==IO_READ_DATA) && wr_ack)begin
		rdata[7:0] <= {rdata_rec[0],rdata_rec[1],rdata_rec[2],rdata_rec[3],rdata_rec[4],rdata_rec[5],rdata_rec[6],rdata_rec[7]};
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		send_data[7:0] <= {8{1'b0}};
	end else if(state==IO_READ_ADDR) begin
		send_data[7:0] <= {1'b1,raddr[1],raddr[2],raddr[3],raddr[4],raddr[5],raddr[6],1'b1};
	end else if(state==IO_WRITE_ADDR)begin
		send_data[7:0] <= {1'b0,waddr[1],waddr[2],waddr[3],waddr[4],waddr[5],waddr[6],1'b1};
	end else if(state==IO_WRITE_DATA)begin
		send_data[7:0] <= {wdata[0],wdata[1],wdata[2],wdata[3],wdata[4],wdata[5],wdata[6],wdata[7]};
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		wr_req <= 1'b0;
	end else if(wr_ack)begin
		wr_req <= 1'b0;
	end else if((state==IO_READ_DATA)||(state==IO_READ_ADDR)||(state==IO_WRITE_ADDR)||(state==IO_WRITE_DATA)) begin
		wr_req <= 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		dce <= 1'b0;
	end else if(state==IO_CE_HIGH)begin
		dce <= 1'b1;
	end else if(state==IO_CE_LOW)begin
		dce <= 1'b0;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		delay_cnt[14:0] <= {15{1'b0}};
	end else if(delay_cnt==DELAY_CNT_IS_MAX)begin
		delay_cnt[14:0] <= {15{1'b0}};
	end else if((state==IO_IDLE)||(state==IO_CE_LOW))begin
		delay_cnt[14:0] <= delay_cnt[14:0] + 1'b1;
	end else begin
		delay_cnt[14:0] <= {15{1'b0}};
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[3:0] <= IO_IDLE[3:0];
	end else begin
		state[3:0] <= next_state[3:0];
	end
end


always @ (*) begin
	case(state)
		IO_IDLE[3:0]:begin
			if(delay_cnt==DELAY_CNT_IS_MAX) begin
				next_state[3:0] = (cmd_read || cmd_write) ? IO_CE_HIGH[3:0] : IO_IDLE[3:0];
			end else begin
				next_state[3:0] = IO_IDLE[3:0];
			end
		end
		IO_CE_HIGH[3:0]:begin
			if(cmd_read)begin
				next_state[3:0] = IO_READ[3:0];
			end else if(cmd_write) begin
				next_state[3:0] = IO_WRITE[3:0];
			end else begin
				next_state[3:0] = IO_CE_HIGH[3:0];
			end
		end
		IO_READ[3:0]:next_state[3:0] =  IO_READ_ADDR[3:0] ;
		IO_READ_ADDR[3:0]:next_state[3:0] = wr_ack ? IO_READ_DATA[3:0] : IO_READ_ADDR[3:0];
		IO_READ_DATA[3:0]:next_state[3:0] = wr_ack ? IO_ACK[3:0] : IO_READ_DATA[3:0];
		IO_WRITE[3:0]:next_state[3:0] = IO_WRITE_ADDR[3:0] ;
		IO_WRITE_ADDR[3:0]:next_state[3:0] = wr_ack ? IO_WRITE_DATA[3:0] : IO_WRITE_ADDR[3:0];
		IO_WRITE_DATA[3:0]:next_state[3:0] = wr_ack ? IO_ACK[3:0] : IO_WRITE_DATA[3:0];
		IO_ACK[3:0]:next_state[3:0] = IO_CE_LOW[3:0];
		IO_CE_LOW[3:0]:begin
			if(delay_cnt==DELAY_CNT_IS_MAX)begin
				next_state[3:0] = IO_IDLE[3:0];
			end else begin
				next_state[3:0] = IO_CE_LOW[3:0];
			end
		end 
		default:next_state[3:0] = IO_IDLE[3:0];
	endcase
end

spi_master_for_rtc spi_mastet0(
 .clk            (clk                ),
 .reset_n        (reset_n            ),
 .wr_req         (wr_req             ),
 .data_in        (send_data[7:0]     ),
 .dclk           (dclk               ),
 .wr_ack         (wr_ack             ),
 .data_for_read  (rdata_rec[7:0]     ),
 .D_in           (D_in               ),
 .r_pin          (r_pin              ),
 .clk_div        (16'd50             )
);

endmodule
