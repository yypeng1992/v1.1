module seg4(clk,reset_n,en_from_3,seg4_dig,en4);
input           clk;
input           reset_n;
input           en_from_3;
output reg [4:0]seg4_dig;
output          en4;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		seg4_dig[4:0] <= 4'd0;
	end else if((seg4_dig==4'd9) && en_from_3)begin
		seg4_dig[4:0] <= 4'd0;
	end else if(en_from_3) begin
		seg4_dig[4:0] <= seg4_dig[4:0] + 1'b1;
	end
end

assign en4 = (seg4_dig==4'd9) && en_from_3;

endmodule
