module i2c_eeprom_tb();
reg clk;
reg reset_n;
reg key;
wire scl;


wire [5:0]sel;
wire [7:0]seg;
wire sda;

`ifdef SIM_I2C_EEPROM
initial begin
	clk = 1'b0;
	forever #10 clk = ~clk;
end

initial begin
	reset_n = 1'b0;
	#138 reset_n = 1'b1;
	$display("%t @@@ start!",$realtime);
	#2000000;
	$display("%t @@@ finish!",$realtime);
	$finish;
end

initial begin
	    key = 1'b1;
	#500000 key = 1'b0;
	#15 key = 1'b1;
	#1025 key = 1'b0;
	#2300 key = 1'b1;
	
end 




initial begin
	$fsdbDumpfile("i2c_eeprom.fsdb");
	$fsdbDumpvars(0,i2c_eeprom_tb);
end

`endif

i2c_eeprom_test test0(
 .clk            (clk       ),
 .reset_n        (reset_n       ),
 .key_in         (key           ),
 .sel            (sel[5:0]      ),
 .seg            (seg[7:0]      ),
 .i2c_eeprom_scl (scl           ),
 .i2c_eeprom_sda (sda           )
);

EEPROM_AT24C64 model0(
.scl (scl),
.sda (sda)
);

endmodule
