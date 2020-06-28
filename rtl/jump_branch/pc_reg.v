module pc_reg(clk,reset_n,pc,ce,pc_stall,
		branch_flag_i,branch_target_address_i);
input             clk;
input             reset_n;
input      [5:0 ] pc_stall;
output reg [31:0] pc;
output reg        ce;

/////////////////////////////////////////////////
/////input for jump
/////////////////////////////////////////////////
input            branch_flag_i;
input[31:0]       branch_target_address_i;

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
		if(branch_flag_i) begin
			pc[31:0] <= branch_target_address_i[31:0];
		end else begin
			pc[31:0] <=  pc[31:0] + 32'd4;
		end
	end
end

endmodule
