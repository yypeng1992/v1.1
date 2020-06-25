module pc_reg(clk,reset_n,pc,ce,pc_stall);
input             clk;
input             reset_n;
input      [5:0 ] pc_stall;
output reg [31:0] pc;
output reg        ce;

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		ce <=  1'b0;
	end else begin
		ce <=  1'b1;
	end
end

always @ (posedge clk or negedge reset_n ) begin
	if(!reset_n )begin
		pc[31:0] <=  {32{1'b0}};
	end else if( ce && (!pc_stall[0]))begin
		pc[31:0] <=  pc[31:0] + 32'd4;
	end
end

endmodule
