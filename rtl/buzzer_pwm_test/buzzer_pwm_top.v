module buzzer_pwm_top(clk,reset_n,key_in,buzzer_out);
input  clk;
input  reset_n;
input  key_in;
output buzzer_out;

parameter CLK_FRE = 50_000_000;
parameter BUZZER_FRE = 100;
parameter N = 32;
//parameter TIME_IS_250MS = 12_500_000;
parameter TIME_IS_250MS = 12;

wire        key;
wire        pwm;
wire [N-1:0]period;
reg  [N-1:0]duty;
parameter B_IDLE   = 1'b0;
parameter B_BUZZER = 1'b1;
reg state;
reg next_state;
reg[24:0]count;
wire [N-1:0]duty_step;
assign duty_step[N-1:0] = 32'd20;

assign buzzer_out = ~((state==B_BUZZER)&&(pwm));
//assign period[N-1:0] = 8590;
assign period[N-1:0] = 32'd4;
always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		duty[N-1:0] <= {N{1'b0}};; 
	end else if(key) begin
		duty[N-1:0] <= duty[N-1:0]  + duty_step[N-1:0];
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		count[24:0] <= {25{1'b0}};
	end else if(count[24:0]==TIME_IS_250MS)begin
		count[24:0] <= {25{1'b0}};
	end else if(state==B_BUZZER) begin
		count[24:0] <= count[24:0] + 1'b1;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state <= B_IDLE;
	end else begin
		state <= next_state;
	end
end

always @ (*) begin
	case(state)
		B_IDLE:next_state = key ? B_BUZZER : B_IDLE;
		B_BUZZER:next_state = (count[24:0]==TIME_IS_250MS) ? B_IDLE : B_BUZZER;
	endcase
end


debounce_for_buzzer debounce(
 .clk      (clk       ),
 .reset_n  (reset_n   ),
 .key_in   (key_in    ),
 .key_out  (key       )
);

pwm pwm0(
 .clk      (clk           ),
 .reset_n  (reset_n       ),
 .period   (period[N-1:0] ),
 .key      (key           ),
 .duty     (duty  [N-1:0] ),
 .pwm_out  (pwm           )
);



endmodule
