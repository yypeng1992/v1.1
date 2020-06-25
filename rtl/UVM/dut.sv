module dut(clk,reset_n,rxd.rx_dv,txd,tx_en)
input           clk;
input           reset_n;
input      [7:0]rxd;
input           rx_dv;
output reg [7:0]txd;
output reg      tx_en;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		txd[7:0] <= 8'h0;
		tx_en    <= 1'b0;
	end else begin
		txd[7:0] <= rxd[7:0];
                tx_en    <= rx_dv;
	end
end 

endmodule
