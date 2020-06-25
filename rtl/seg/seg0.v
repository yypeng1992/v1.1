module seg0(clk,reset_n,seg0_dig,en0);
input           clk;
input           reset_n;
output reg [3:0]seg0_dig;
output          en0;

parameter COUNT_IS_MAX = 10;
reg [29:0]count;
wire      flag;

assign flag = (count==COUNT_IS_MAX);


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		count[29:0] <= {30{1'b0}};
	end else if(flag) begin
		count[29:0] <= {30{1'b0}};
	end else begin
		count[29:0] <= count[29:0] + 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		seg0_dig[3:0] <= 4'd0;
	end else if((seg0_dig==4'd9) && flag) begin
		seg0_dig[3:0] <= 4'd0;
	end else if(flag)begin
		seg0_dig[3:0] <= seg0_dig[3:0] + 1'b1;
	end
end

assign en0 = (seg0_dig==4'd9) && (flag);

endmodule 
