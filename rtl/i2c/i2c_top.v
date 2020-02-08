module i2c_top(
inout wire sda,
input wire rst_n,
input wire clk
);


wire scl;
i2c i2c0(
 .clk(clk),
 .rst_n(rst_n),
 .sda(sda),
 .scl(scl)
);

eepram eepram0(
 .clk(clk),
 .rst_n(rst_n),
 .sda(sda),
 .scl(scl)

);

endmodule
