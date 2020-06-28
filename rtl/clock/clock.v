module clock(clk,reset_n,time_clock_key,sec_time,min_time,hour_time,sec_clock,min_clock,hour_clock,led);
input       clk;
input       reset_n;
input  [1:0]time_clock_key;
input  [7:0]sec_time;
input  [7:0]min_time;
input  [7:0]hour_time;
input  [7:0]sec_clock ;
input  [7:0]min_clock ;
input  [7:0]hour_clock;
output reg[3:0]led;

parameter KEEP_TIME = 50;
reg [29:0]cnt;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		cnt[29:0] <= {30{1'b0}};
	end else if(cnt==KEEP_TIME-1)begin
		cnt[29:0] <= {30{1'b0}};
	end else if(led[3:0]==4'b1111) begin
		cnt[29:0] <= cnt[29:0] + 1'b1;	
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		led[3:0] <= 4'd0;
	end else if((sec_time==sec_clock)&&(min_time==min_clock)&&(hour_time==hour_clock)) begin
		led[3:0] <= 4'b1111;
	end else if(cnt==KEEP_TIME-1) begin
		led[3:0] <= 4'd0;
	end
end

endmodule
