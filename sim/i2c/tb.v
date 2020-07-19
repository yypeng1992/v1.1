module tb();
reg clk;
reg rst_n;
wire sda;

wire      A0;
wire      A1;
wire      A2;

`ifdef SIM_I2C
initial begin
	clk=1'b0;
	forever #10 clk = ~clk;
end

initial begin
	rst_n = 1'b0;
	#55 rst_n = 1'b1;
	#100000 $stop;
end

initial begin
	$fsdbDumpfile("i2c.fsdb");
	$fsdbDumpvars(0,tb);
end
`endif

i2c_top top0(
 .clk(clk),
 .rst_n(rst_n),
 .sda(sda)
);



endmodule
