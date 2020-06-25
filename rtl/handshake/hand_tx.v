module hand_tx(tx_clk,reset_n,tx_data_in,ack,tx_data_out,req);
input       tx_clk;
input       reset_n;
input  [7:0]tx_data_in;
input       ack;
output [7:0]tx_data_out;
output reg  req;

reg tx_ack;
assign tx_data_out[7:0] = tx_data_in[7:0];


always @ (posedge tx_clk or negedge reset_n) begin
	if(!reset_n) begin
		tx_ack <= 1'b0;
	end else begin
		tx_ack <= ack;
	end
end

always @ (posedge tx_clk or negedge reset_n) begin
	if(!reset_n) begin
		req <= 1'b0;
	end else if(tx_data_out[7:0] != 8'd0) begin
		req <= 1'b1;
	end else if(tx_ack)begin
		req <= 1'b0;
	end
end




endmodule
