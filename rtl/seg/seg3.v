module seg3(clk,reset_n,en_from_2,seg3_dig,en3);
input           clk;
input           reset_n;
input           en_from_2;
output reg [3:0]seg3_dig;
output          en3;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		seg3_dig[3:0] <= 4'd0;
	end else if((seg3_dig==4'd9) && en_from_2)begin
		seg3_dig[3:0] <= 4'd0;
	end else if(en_from_2) begin
		seg3_dig[3:0] <= seg3_dig[3:0] + 1'b1;
	end
end

assign en3 = (seg3_dig==4'd9) && en_from_2;

endmodule
