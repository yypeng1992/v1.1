module dsync(
input      clk,
input      reset_n,
input      sync_done,
output reg busy
);

wire up_reset_n;
reg re_d;
assign up_reset_n = reset_n && (!re_d);
always @ (posedge clk )begin
	re_d <= reset_n;
end


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		busy <= 1'b0;
	end else if(up_reset_n)begin
		busy <= 1'b1;
	end else if(sync_done) begin
		busy <= 1'b0;
	end
end


endmodule
