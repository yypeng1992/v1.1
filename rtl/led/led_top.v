module led_top(
input wire clk,
input wire rst,
input wire key_in,

output reg [3:0] led
);

wire speed_key;


led_key led0(
 .clk(clk),
 .rst_n(rst),
 .speed_up(speed_key),
 .led(led)
);

debounce debounce0(
 .clk(clk),
 .rst(rst),
 .key_in(key_in),
 .key_out(speed_key)
);

endmodule
