module hilo(clk,reset_n,whilo,hi_i,lo_i,hi_o,lo_o);
input            clk;
input            reset_n;
input            whilo;
input      [31:0]hi_i;
input      [31:0]lo_i;

output reg [31:0]hi_o;
output reg [31:0]lo_o;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		hi_o[31:0] <= {32{1'b0}};
		lo_o[31:0] <= {32{1'b0}};
	end else if(whilo) begin
		hi_o[31:0] <= hi_i[31:0];
		lo_o[31:0] <= hi_i[31:0];
	end
end
endmodule
