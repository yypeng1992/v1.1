module ctrl(reset_n,stallreg_from_id,stallreg_from_ex,stall);
input		reset_n;
input		stallreg_from_id;
input           stallreg_from_ex;
output reg [5:0]stall;

always @ (*) begin
	if(!reset_n) begin
		stall[5:0] = 6'd0;
	end else if(stallreg_from_ex) begin
		stall[5:0] = 6'b001111;
	end else if(stallreg_from_id) begin
		stall[5:0] = 6'b000111;
	end else begin
		stall[5:0] = 6'b000000;
	end
end

endmodule
