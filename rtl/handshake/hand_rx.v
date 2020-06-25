module hand_rx(rx_clk,reset_n,req,rx_data_in,rx_data_out,ack);
input           rx_clk;
input           reset_n;
input           req;
input      [7:0]rx_data_in;
output reg      ack;
output reg [7:0]rx_data_out;

reg req1;
reg req2;
wire req1_up;
wire req2_up;

assign req1_up = req && (~req1);


always @ (posedge rx_clk or negedge reset_n) begin
	if(!reset_n) begin
		req1 <= 1'b0;
		req2 <= 1'b0;
	end else begin
		req1 <= req;
		req2 <= req1;
	end
end


always @ (posedge rx_clk or negedge reset_n) begin
	if(!reset_n) begin
		rx_data_out[7:0] <= {8{1'b0}};
	end else if(req1_up) begin
		rx_data_out[7:0] <= rx_data_in[7:0];
	end
end


always @ (posedge rx_clk or negedge reset_n) begin
	if(!reset_n) begin
		ack <= 1'b0;
	end else if(req2) begin
		ack <= 1'b1;
	end else if(!req1)begin
		ack <= 1'b0;
	end
end

endmodule
