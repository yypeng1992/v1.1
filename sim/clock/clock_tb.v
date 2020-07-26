module clock_tb();
reg clk;
reg reset_n;
reg key1;
reg key2;
reg key3;

wire [3:0]led;
wire [5:0]sel;
wire [7:0]seg;

`ifdef SIM_CLOCK
initial begin
	clk = 1'b0;
	forever #10 clk = ~clk;
end

initial begin
	reset_n = 1'b0;
	#38 reset_n = 1'b1;
	$display("%t @@@ start!",$realtime);
	#200000;
	$display("%t @@@ finish!",$realtime);
	$finish;
end

initial begin
	    key1 = 1'b1;
	    key2 = 1'b1;
	    
	    key3 = 1'b1;
	    #457 key2 =1'b0;
	    #70 key2 = 1'b1;
	    #1000 key2 = 1'b0;
	    #70 key2 = 1'b1;
	    #70 key2 = 1'b0;
	    #80 key2 = 1'b1;
	    #600 key2 = 1'b0;
	    #530 key2 = 1'b1;

	
end 




initial begin
	$fsdbDumpfile("clock.fsdb");
	$fsdbDumpvars(0,clock_tb);
end

`endif

clock_top top0(
 .clk            (clk         ),
 .reset_n        (reset_n     ),
 .key1           (key1        ),
 .key2           (key2        ),
 .key3           (key3        ),
 .led            (led[3:0]    ),
 .sel            (sel[5:0]    ),
 .seg            (seg[7:0]    )
);




endmodule
