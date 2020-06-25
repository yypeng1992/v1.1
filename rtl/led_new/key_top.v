module key_top(clk,reset_n,key,led);
input       clk;
input       reset_n;
input       key;

output [3:0]led;

wire key_out;
wire [2:0]key_status;


led led0(
 .clk        (clk             ),
 .reset_n    (reset_n         ),
 .key_status (key_status[2:0] ),
 .led        (led[3:0]        )
);

debounce_new key_1(
 .clk     (clk      ),
 .reset_n (reset_n  ),
 .key_in  (key      ),
 .key_out (key_out  )
);


key_anaysis key_anaysis0(
 .clk       (clk            ),
 .reset_n   (reset_n        ),
 .key       (key_out        ),
 .key_status(key_status[2:0])

);
endmodule
