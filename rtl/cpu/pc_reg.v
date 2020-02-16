module pc_reg(clk,reset_n,pc,ce);
input             clk;
input             reset_n;
output reg [31:0] pc;
output reg        ce;

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		ce <= 1'b0;
	end else begin
		ce <= 1'b1;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		pc[31:0] <= {32{1'b0}};
	end else if(ce)begin
		pc[31:0] <= pc[31:0] + 32'd4;
	end
end

endmodule
