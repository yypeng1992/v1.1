module LLbit_reg(clk,reset_n,flush,we,LLbit_i,LLbit_o);
input clk;
input reset_n;
input flush;
input we;
input LLbit_i;
output reg LLbit_o;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		LLbit_o <= 1'b0;
	end else if(flush) begin
		LLbit_o <= 1'b0;
	end else if(we)begin
		LLbit_o <= LLbit_i;
	end
end

endmodule
