module top(tx_clk,rx_clk,reset_n,data_in,data_out);
input       tx_clk;
input       rx_clk;
input       reset_n;
input  [7:0]data_in;
output [7:0]data_out;

wire req;
wire ack;
wire [7:0]data;

hand_tx tx0(
 .tx_clk     (tx_clk        ),
 .reset_n    (reset_n       ),
 .tx_data_in (data_in[7:0]  ),
 .ack        (ack           ),
 .tx_data_out(data[7:0]     ),
 .req        (req           )
);

hand_rx rx0(
 .rx_clk     (rx_clk      ),
 .reset_n    (reset_n     ),
 .req        (req         ),
 .rx_data_in (data[7:0]   ),
 .ack        (ack         ),
 .rx_data_out(data_out[7:0])
);


endmodule
