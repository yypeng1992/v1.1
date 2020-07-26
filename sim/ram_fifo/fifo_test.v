module fifo_test();
reg       rclk;
reg       wclk;
reg       reset_n;
reg       wren ;
reg       rden ;
reg [3:0]wdata;

wire [3:0]rdata;
wire      full;
wire      empty;


`ifdef SIM_FIFO
initial begin
	rclk = 1'b0;
	forever #10 rclk = ~rclk;
end
initial begin
	wclk = 1'b0;
	forever #15 wclk = ~wclk;
end

initial begin
	reset_n = 1'b0;
	#39 reset_n = 1'b1;
	#20000 $finish;
end


initial begin
     wren = 1'b1;
     #10000 wren=1'b0;
end

initial begin
	rden = 1'b0;
	#10020 rden = 1'b1;
end


initial begin
	wdata[3:0] = 4'd0;
	#70 wdata[3:0] = 4'd1;
	#50 wdata[3:0] = 4'd2;
	#50 wdata[3:0] = 4'd3;
	#50 wdata[3:0] = 4'd4;
	#50 wdata[3:0] = 4'd5;
	#50 wdata[3:0] = 4'd6;
	#50 wdata[3:0] = 4'd7;
	#50 wdata[3:0] = 4'd8;
	#50 wdata[3:0] = 4'd9;
	#50 wdata[3:0] = 4'd10;
	#50 wdata[3:0] = 4'd11;
	#50 wdata[3:0] = 4'd12;
	#50 wdata[3:0] = 4'd13;
	#50 wdata[3:0] = 4'd14;
	#50 wdata[3:0] = 4'd15;


end


initial begin
	$fsdbDumpfile("fifo.fsdb");
	$fsdbDumpvars(0,fifo_test);
end


`endif

fifo fifo0(
 .reset_n(reset_n    ),
 .wclk   (wclk       ),
 .wren   (wren       ),
 .wdata  (wdata[3:0] ),
 .rclk   (rclk       ),
 .rden   (rden       ),
 .rdata  (rdata[3:0] ),
 .full   (full       ),
 .empty  (empty      )
);






endmodule
