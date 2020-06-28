module seg#(
    parameter W   = 4,
    parameter MAX = 9
)(
    input              clk,
    input              reset_n,
    input              plus,
    output reg [W-1:0] counter,
    output             carry
);

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		counter[W-1:0] <= {W{1'b0}};
	end else if(plus)begin
		counter[W-1:0] <= (counter[W-1:0] == MAX) ? {W{1'b0}} : (counter[W-1:0] + 1'b1);
	end
end

assign carry = (counter[W-1:0] == MAX) && plus;

endmodule
