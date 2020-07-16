module sync(
input clk,
input reset_n,
input sync_done,
output reg busy
);

wire up_reset;
reg reset_d;

assign up_reset = !reset_d &&(reset_n);

always @ (posedge clk )begin
	reset_d <= reset_n;
end


always @ (posedge clk or reset_n)begin
	if(!reset_n)begin
		busy <= 1'b0;
	end else if(sync_done) begin
		busy <= 1'b0;
	end else if(up_reset)begin
		busy <= 1'b1;
	end
end


endmodule
