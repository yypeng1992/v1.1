module seg1(clk,reset_n,en_from_0,seg1_dig,en1);
input           clk;
input           reset_n;
input           en_from_0;
output reg [3:0]seg1_dig;
output          en1;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		seg1_dig[3:0] <= 4'd0;
	end else if((seg1_dig==4'd9) && en_from_0)begin
		seg1_dig[3:0] <= 4'd0;
	end else if(en_from_0) begin
		seg1_dig[3:0] <= seg1_dig[3:0] + 1'b1;
	end
end

assign en1 = (seg1_dig==4'd9) && en_from_0;

endmodule
