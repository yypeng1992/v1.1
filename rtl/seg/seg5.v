module seg5(clk,reset_n,en_from_4,seg5_dig);
input           clk;
input           reset_n;
input           en_from_4;
output reg [5:0]seg5_dig;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		seg5_dig[5:0] <= 5'd0;
	end else if((seg5_dig==5'd9) && en_from_4)begin
		seg5_dig[5:0] <= 5'd0;
	end else if(en_from_4) begin
		seg5_dig[5:0] <= seg5_dig[5:0] + 1'b1;
	end
end


endmodule
