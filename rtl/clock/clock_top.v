module clock_top(clk,reset_n,key1,key2,key3,led,sel,seg);
input       clk;
input       reset_n;
input       key1;
input       key2;
input       key3;
output [3:0]led;
output [5:0]sel;
output [7:0]seg;

wire mode_key_in;
wire add_key_in;
wire time_clock;
wire [2:0]mode_key;
wire [2:0]add_key;
wire [1:0]time_clock_key;
wire [7:0]sec_reg;
wire [7:0]min_reg;
wire [7:0]hour_reg;
wire      min_en;
wire      hour_en;
wire [7:0]sec_clock;
wire [7:0]min_clock;
wire [7:0]hour_clock;



debounce_for_clock debounce_1(
 .clk        (clk           ),
 .reset_n    (reset_n       ),
 .key_in     (key1          ),
 .key        (mode_key_in   )
);

mode_anaysis mode0(
 .clk         (clk          ),
 .reset_n     (reset_n      ),
 .mode_key    (mode_key_in     ),
 .mode_select (mode_key[2:0])
);


debounce_for_clock debounce_2(
 .clk        (clk         ),
 .reset_n    (reset_n     ),
 .key_in     (key2        ),
 .key        (add_key_in     )
);

add_anaysis add0(
 .clk        (clk         ),
 .reset_n    (reset_n     ),
 .add_key    (add_key_in     ),
 .add_select (add_key[2:0])
);


debounce_for_clock debounce_3(
 .clk        (clk         ),
 .reset_n    (reset_n     ),
 .key_in     (key3        ),
 .key        (time_clock  )
);

time_clock_select time_clock0(
 .clk           (clk                ),
 .reset_n       (reset_n            ),
 .key_in        (time_clock         ),
 .time_clock_key(time_clock_key[1:0])
);

second_clock second_clock0(
 .clk           (clk                ),
 .reset_n       (reset_n            ),
 .time_clock_key(time_clock_key[1:0]),
 .mode_key      (mode_key [2:0]     ),
 .add_key       (add_key [2:0]      ),
 .sec_reg       (sec_reg [7:0]      ),
 .min_en        (min_en             ),
 .sec_clock     (sec_clock[7:0]     )
);

min_clock min_clock0(
 .clk            (clk                ),
 .reset_n        (reset_n            ),
 .time_clock_key (time_clock_key[1:0]),
 .mode_key       (mode_key [2:0]     ),
 .add_key        (add_key [2:0]      ),
 .min_en         (min_en             ),
 .min_reg        (min_reg [7:0]      ),
 .hour_en        (hour_en            ),
 .min_clock     (min_clock [7:0])
 );

hour_clock hour_clock0(
 .clk            (clk                ),
 .reset_n        (reset_n            ),
 .time_clock_key (time_clock_key[1:0]),
 .mode_key       (mode_key [2:0]     ),
 .add_key        (add_key [2:0]      ),
 .hour_en        (hour_en            ),
 .hour_reg       (hour_reg[7:0]      ),
 .hour_clock     (hour_clock[7:0])
);

clock clock0(
 .clk           (clk                ),
 .reset_n       (reset_n            ),
 .time_clock_key(time_clock_key[1:0]),
 .sec_time      (sec_reg [7:0]     ),
 .min_time      (min_reg [7:0]     ),
 .hour_time     (hour_reg[7:0]     ),
 .led           (led[3:0]           ),
 .sec_clock     (sec_clock [7:0]),
 .min_clock     (min_clock [7:0]),
 .hour_clock    (hour_clock[7:0])
);

seg_for_clock seg0(
 .clk           (clk           ),
 .reset_n       (reset_n       ),
 .sec_reg       (sec_reg [7:0] ),
 .min_reg       (min_reg [7:0] ),
 .hour_reg      (hour_reg[7:0] ),
 .sel           (sel[5:0]      ),
 .seg_out       (seg[7:0]      ),
 .time_clock_key(time_clock_key[1:0]),
 .sec_clock     (sec_clock [7:0]),
 .min_clock     (min_clock [7:0]),
 .hour_clock    (hour_clock[7:0])
);


endmodule
