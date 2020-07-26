module rtc_tb();
reg clk;
reg reset_n;


wire [5:0]sel;
wire [7:0]seg;
wire      dclk;
wire      dce;
wire     inout_pin;

`ifdef SIM_RTC
initial begin
	clk = 1'b0;
	forever #10 clk = ~clk;
end

initial begin
	reset_n = 1'b0;
	#38 reset_n = 1'b1;
	$display("%t @@@ start!",$realtime);
	#200000000;
	$display("%t @@@ finish!",$realtime);
	$finish;
end

initial begin
	$fsdbDumpfile("rtc.fsdb");
	$fsdbDumpvars(0,rtc_tb);
end

`endif

rtc_top rtc0(
 .clk            (clk           ),
 .reset_n        (reset_n       ),
 .sel            (sel[5:0]      ),
 .seg            (seg[7:0]      ),
 .inout_pin      (inout_pin    ),
 .dclk           (dclk          ),
 .dce            (dce           )
);

endmodule
