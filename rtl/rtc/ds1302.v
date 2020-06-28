module ds1302(clk,reset_n,write_time_req,read_time_req,
		write_second,write_min,write_hour,write_day,write_week,write_month,write_year,
		dce,dclk,ds1302_io,waddr,raddr,wdata,write_time_ack,read_time_ack,
		read_second,read_min,read_hour,read_day,read_week,read_month,read_year);
input            clk;
input            reset_n;

input            write_time_req;
input            read_time_req;
input     [7:0]  write_second;
input     [7:0]  write_min;
input     [7:0]  write_hour;
input     [7:0]  write_day;
input     [7:0]  write_week;
input     [7:0]  write_month;
input     [7:0]  write_year;
output           dce;
output           dclk;
inout            ds1302_io;
output reg [7:0] waddr;
output reg [7:0] raddr;
output reg [7:0] wdata;
output           write_time_ack;
output           read_time_ack;
output reg [7:0] read_second;
output reg [7:0] read_min;
output reg [7:0] read_hour;
output reg [7:0] read_day;
output reg [7:0] read_week;
output reg [7:0] read_month;
output reg [7:0] read_year;

wire [7:0]read_data;
wire      wr_ack;
wire cmd_write_ack;
wire cmd_read_ack;
reg cmd_write;
reg cmd_read;

parameter [4:0]S_IDLE    = 5'd0;
parameter [4:0]S_WR_WP   = 5'd1;
parameter [4:0]S_WR_SEC  = 5'd2;
parameter [4:0]S_WR_MIN  = 5'd3;
parameter [4:0]S_WR_HOUR = 5'd4;
parameter [4:0]S_WR_DAY  = 5'd5;
parameter [4:0]S_WR_WEEK = 5'd6;
parameter [4:0]S_WR_MON  = 5'd7;
parameter [4:0]S_WR_YEAR = 5'd8;
parameter [4:0]S_RD_SEC  = 5'd9;
parameter [4:0]S_RD_MIN  = 5'd10;
parameter [4:0]S_RD_HOUR = 5'd11;
parameter [4:0]S_RD_DAY  = 5'd12;
parameter [4:0]S_RD_WEEK = 5'd13;
parameter [4:0]S_RD_MON  = 5'd14;
parameter [4:0]S_RD_YEAR = 5'd15;
parameter [4:0]S_ACK     = 5'd16;
reg [4:0]state;
reg [4:0]next_state;

assign read_time_ack  = ((state==S_RD_YEAR)&&(next_state==S_ACK));
assign write_time_ack = ((state==S_WR_YEAR)&&(next_state==S_ACK));


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		cmd_write <= 1'b0;
	end else if(cmd_write_ack)begin
		cmd_write <= 1'b0;
	end else if((state==S_WR_WP)||(state==S_WR_SEC)||(state==S_WR_MIN)||(state==S_WR_HOUR)||(state==S_WR_DAY)||(state==S_WR_WEEK)||(state==S_WR_MON)||(state==S_WR_YEAR))begin
		cmd_write <= 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		cmd_read <= 1'b0;
	end else if(cmd_read_ack) begin
		cmd_read <= 1'b0;
	end else if ((state==S_RD_SEC)||(state==S_RD_MIN)||(state==S_RD_HOUR)||(state==S_RD_DAY)||(state==S_RD_WEEK)||(state==S_RD_MON)||(state==S_RD_YEAR)) begin
		cmd_read <= 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		read_second[7:0] <= {8{1'b0}};
	end else if(state==S_RD_SEC && cmd_read_ack) begin
		read_second[7:0] <= read_data[7:0];
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		read_min[7:0] <= {8{1'b0}};
	end else if(state==S_RD_MIN && cmd_read_ack) begin
		read_min[7:0] <= read_data[7:0];
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		read_hour[7:0] <= {8{1'b0}};
	end else if(state==S_RD_HOUR && cmd_read_ack) begin
		read_hour[7:0] <= read_data[7:0];
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		read_day[7:0] <= {8{1'b0}};
	end else if(state==S_RD_DAY && cmd_read_ack) begin
		read_day[7:0] <= read_data[7:0];
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		read_week[7:0] <= {8{1'b0}};
	end else if(state==S_RD_WEEK && cmd_read_ack) begin
		read_week[7:0] <= read_data[7:0];
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		read_month[7:0] <= {8{1'b0}};
	end else if(state==S_RD_MON && cmd_read_ack) begin
		read_month[7:0] <= read_data[7:0];
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		read_year[7:0] <= {8{1'b0}};
	end else if(state==S_RD_YEAR && cmd_read_ack) begin
		read_year[7:0] <= read_data[7:0];
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		waddr[7:0] <= {8{1'b0}};
		wdata[7:0] <= {8{1'b0}};
	end else begin
		case(state)
			S_WR_WP:begin
				waddr[7:0] <= 8'h8e;
				wdata[7:0] <= {8{1'b0}};
			end 
			S_WR_SEC:begin
				waddr[7:0] <= 8'h80;
				wdata[7:0] <= write_second[7:0];
			end 
			S_WR_MIN:begin
				waddr[7:0] <= 8'h82;
				wdata[7:0] <= write_min[7:0];
			end 
			S_WR_HOUR:begin
				waddr[7:0] <= 8'h84;
				wdata[7:0] <= write_hour[7:0];
			end 
			S_WR_DAY:begin
				waddr[7:0] <= 8'h86;
				wdata[7:0] <= write_day[7:0];
			end 
			S_WR_WEEK:begin
				waddr[7:0] <= 8'h8a;
				wdata[7:0] <= write_week[7:0];
			end 
			S_WR_MON:begin
				waddr[7:0] <= 8'h88;
				wdata[7:0] <= write_month[7:0];
			end 
			S_WR_YEAR:begin
				waddr[7:0] <= 8'h8c;
				wdata[7:0] <= write_year[7:0];
			end 
			default:begin
				waddr[7:0] <= {8{1'b0}};
				wdata[7:0] <= {8{1'b0}};
			end
		endcase
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		raddr[7:0] <= {8{1'b0}};
	end else begin
		case(state)
			S_RD_SEC:raddr[7:0] <= 8'h81;
			S_RD_MIN:raddr[7:0] <= 8'h83;
			S_RD_HOUR:raddr[7:0] <= 8'h85;
			S_RD_DAY:raddr[7:0] <= 8'h87;
			S_RD_WEEK:raddr[7:0] <= 8'h8b;
			S_RD_MON:raddr[7:0] <= 8'h89;
			S_RD_YEAR:raddr[7:0] <= 8'h8d;
			default:raddr[7:0] <= {8{1'b0}};
		endcase
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[4:0] <= S_IDLE[4:0];
	end else begin
		state[4:0] <= next_state[4:0];
	end
end


always @ (*) begin
	case(state)
		S_IDLE[4:0]:begin
			if(write_time_req)begin
				next_state[4:0] = S_WR_WP[4:0];
			end else if(read_time_req)begin
				next_state[4:0] = S_RD_SEC[4:0];
			end else begin
				next_state[4:0] = S_IDLE[4:0];
			end
		end
		S_WR_WP  [4:0]:next_state[4:0] = cmd_write_ack ? S_WR_SEC [4:0] : S_WR_WP[4:0];
		S_WR_SEC [4:0]:next_state[4:0] = cmd_write_ack ? S_WR_MIN [4:0] : S_WR_SEC[4:0];
		S_WR_MIN [4:0]:next_state[4:0] = cmd_write_ack ? S_WR_HOUR[4:0] : S_WR_MIN[4:0];
		S_WR_HOUR[4:0]:next_state[4:0] = cmd_write_ack ? S_WR_DAY [4:0] : S_WR_HOUR[4:0];
		S_WR_DAY [4:0]:next_state[4:0] = cmd_write_ack ? S_WR_WEEK[4:0] : S_WR_DAY [4:0];
		S_WR_WEEK[4:0]:next_state[4:0] = cmd_write_ack ? S_WR_MON [4:0] : S_WR_WEEK[4:0];
		S_WR_MON [4:0]:next_state[4:0] = cmd_write_ack ? S_WR_YEAR[4:0] : S_WR_MON [4:0];
		S_WR_YEAR[4:0]:next_state[4:0] = cmd_write_ack ? S_ACK    [4:0] : S_WR_YEAR[4:0];
		S_RD_SEC [4:0]:next_state[4:0] = cmd_read_ack ? S_RD_MIN [4:0] : S_RD_SEC[4:0];
		S_RD_MIN [4:0]:next_state[4:0] = cmd_read_ack ? S_RD_HOUR[4:0] : S_RD_MIN[4:0];
		S_RD_HOUR[4:0]:next_state[4:0] = cmd_read_ack ? S_RD_DAY [4:0] : S_RD_HOUR[4:0];
		S_RD_DAY [4:0]:next_state[4:0] = cmd_read_ack ? S_RD_WEEK[4:0] : S_RD_DAY [4:0];
		S_RD_WEEK[4:0]:next_state[4:0] = cmd_read_ack ? S_RD_MON [4:0] : S_RD_WEEK[4:0];
		S_RD_MON [4:0]:next_state[4:0] = cmd_read_ack ? S_RD_YEAR[4:0] : S_RD_MON [4:0];
		S_RD_YEAR[4:0]:next_state[4:0] = cmd_read_ack ? S_ACK    [4:0] : S_RD_YEAR[4:0];
		S_ACK    [4:0]:next_state[4:0] = S_IDLE[4:0];
		default:next_state[4:0] = S_IDLE[4:0];
	endcase
end

ds1302_io io0(
 .clk            (clk             ),
 .reset_n        (reset_n         ),

 .cmd_read       (cmd_read        ),
 .cmd_write      (cmd_write       ),
 .ds1302_io      (ds1302_io       ),
 .waddr          (waddr[7:0]      ),
 .raddr          (raddr[7:0]      ),
 .wdata          (wdata[7:0]      ),
 .dce            (dce             ),
 .dclk           (dclk            ),
 .cmd_write_ack  (cmd_write_ack   ),
 .cmd_read_ack   (cmd_read_ack    ),
 .rdata          (read_data[7:0]  )
);




endmodule
