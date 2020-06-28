module rtc_top(clk,reset_n,inout_pin,dce,dclk,sel,seg);
input       clk;
input       reset_n;
inout       inout_pin;
output      dce;
output      dclk;
output [5:0]sel;
output [7:0]seg;




wire [23:0]data_for_seg;

seg_for_rtc seg1(
 .sys_clk   (clk        ),
 .reset_n   (reset_n    ),
 .data      (data_for_seg),
 .sel       (sel[5:0]  ),
 .seg_out   (seg[7:0]   )
 );

ds1302_test test0(
 .clk            (clk           ),
 .reset_n        (reset_n       ),
 .io             (inout_pin     ),
 .dclk           (dclk          ),
 .dce            (dce           ),
 .data_for_seg   (data_for_seg  )
);



endmodule
