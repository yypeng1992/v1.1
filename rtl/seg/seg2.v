module seg2(clk,reset_n,en_from_1,seg2_dig,en2);
input           clk;
input           reset_n;
input           en_from_1;
output reg [3:0]seg2_dig;
output          en2;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		seg2_dig[3:0] <= 4'd0;
	end else if((seg2_dig==4'd9) && en_from_1)begin
		seg2_dig[3:0] <= 4'd0;
	end else if(en_from_1) begin
		seg2_dig[3:0] <= seg2_dig[3:0] + 1'b1;
	end
end

assign en2 = (seg2_dig==4'd9) && en_from_1;

endmodule
