module div_t7(
input clk,
input reset_n,
output clk_out
);

reg [2:0]count;
reg div1;
reg div2;

assign clk_out = div1 ^ div2;

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		count[2:0] <=3'd0;
	end else if(count[2:0]==3'd6)begin
		count[2:0] <=3'd0;
	end else begin
		count[2:0] <= count[2:0] + 1'b1;
	end
end


always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		div1 <= 1'b0;
	end else if(count[2:0]==3'd0) begin
		div1 <= ~div1;
	end
end


always @ (negedge clk or negedge reset_n)begin
	if(!reset_n)begin
		div2 <= 1'b0;
	end else if(count[2:0]==3'd4) begin
		div2 <= ~div2;
	end
end

endmodule
