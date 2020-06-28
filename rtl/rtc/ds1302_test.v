module ds1302_test(clk,reset_n,io,dclk,dce,data_for_seg);
input           clk;
input           reset_n;
inout           io;
output          dclk;
output          dce;
output    [23:0]data_for_seg;


reg [7:0]write_second;
reg [7:0]write_min;
reg [7:0]write_hour;
reg [7:0]write_day;
reg [7:0]write_week;
reg [7:0]write_month;
reg [7:0]write_year;
wire     write_time_req;
wire     read_time_req;

wire CH;
wire [7:0] read_second;
wire [7:0] read_min   ; 
wire [7:0] read_hour  ; 
wire [7:0] read_day   ; 
wire [7:0] read_week  ; 
wire [7:0] read_month ; 
wire [7:0] read_year  ; 
wire [7:0] waddr;
wire [7:0] raddr;
wire [7:0] wdata;
wire cmd_write_ack;
wire cmd_read_ack;
wire read_time_ack;
wire write_time_ack;


assign data_for_seg = {read_hour[7:0],read_min[7:0],read_second[7:0]};
parameter [2:0]T_IDLE     = 3'd0;
parameter [2:0]T_READ_CH  = 3'd1;
parameter [2:0]T_WRITE_CH = 3'd2;
parameter [2:0]T_WAIT     = 3'd3;
parameter [2:0]T_READ     = 3'd4;
reg [2:0]state;
reg [2:0]next_state;

assign write_time_req = (state==T_WRITE_CH);
assign read_time_req  = ((state==T_READ) || (state==T_READ_CH));
assign CH = read_second[7];



always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		write_second[7:0] <= {8{1'b0}};
                write_min   [7:0] <= {8{1'b0}};
                write_hour  [7:0] <= {8{1'b0}};
                write_day   [7:0] <= {8{1'b0}};
                write_week  [7:0] <= {8{1'b0}};
                write_month [7:0] <= {8{1'b0}};
                write_year  [7:0] <= {8{1'b0}};
	end else if(state==T_WRITE_CH)  begin
		write_second[7:0] <= 8'h55;
          	write_min   [7:0] <= 8'h08;
          	write_hour  [7:0] <= 8'h17;
         	write_day   [7:0] <= 8'h15;
         	write_week  [7:0] <= 8'h07;
        	write_month [7:0] <= 8'h03;
         	write_year  [7:0] <= 8'h20;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[2:0] <= T_IDLE[2:0];
	end else begin
		state[2:0] <= next_state[2:0];
	end
end



always @ (*) begin
	case(state)
		T_IDLE[2:0]:next_state[2:0] = T_READ_CH[2:0];
		T_READ_CH[2:0]:begin
			if(read_time_ack)begin
				next_state[2:0] = CH ? T_WRITE_CH[2:0] : T_READ[2:0];
			end else begin
				next_state[2:0] = T_READ_CH[2:0];
			end
		end
		T_WRITE_CH[2:0]:begin
			if(write_time_ack)begin
				next_state[2:0] = T_WAIT[2:0];
			end else begin
				next_state[2:0] = T_WRITE_CH[2:0];
			end
		end
		T_WAIT[2:0]:next_state[2:0] = T_READ[2:0];
		T_READ[2:0]:begin
			if(read_time_ack)begin
				next_state[2:0] = T_IDLE[2:0];
			end else begin
				next_state[2:0] = T_READ[2:0];
			end
		end
		default:next_state[2:0] = T_IDLE[2:0];
	endcase
end

ds1302 ds0(
 .clk              (clk             ),
 .reset_n          (reset_n         ),
 .write_time_ack   (write_time_ack  ),
 .read_time_ack    (read_time_ack   ),
 
 .write_time_req   (write_time_req  ),
 .read_time_req    (read_time_req   ),
 .write_second     (write_second    ),
 .write_min        (write_min       ),
 .write_hour       (write_hour      ),
 .write_day        (write_day       ),
 .write_week       (write_week      ),
 .write_month      (write_month     ),
 .write_year       (write_year      ),
 .dce              (dce             ),
 .dclk             (dclk            ),
 .ds1302_io          (io              ),
 .waddr            (waddr[7:0]      ),
 .raddr            (raddr[7:0]      ),
 .wdata            (wdata[7:0]      ),

 .read_second      (read_second     ),
 .read_min         (read_min  [7:0] ),
 .read_hour        (read_hour [7:0] ),
 .read_day         (read_day  [7:0] ),
 .read_week        (read_week [7:0] ),
 .read_month       (read_month[7:0] ),
 .read_year        (read_year [7:0] )
);





endmodule
