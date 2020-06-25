module pwm(clk,reset_n,key,period,duty,pwm_out);
parameter N = 9;
input 	     clk;
input 	     reset_n;
input [N-1:0]period;
input [N-1:0]duty;
input        key;
output       pwm_out;

parameter CLK_FRE = 50_000_000;
parameter BUZZER_FRE = 100;

reg [N-1:0]count;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		count[N-1:0] <= {N{1'b0}};
	end else if(key) begin
		count[N-1:0] <= {N{1'b0}};
	end else begin
		count[N-1:0] <= count[N-1:0] + period[N-1:0];
	end
end

assign pwm_out = (count[N-1:0]>=duty) ? 1'b1 : 1'b0;

endmodule
