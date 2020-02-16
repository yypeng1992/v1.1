module mem(clk,reset_n,ex_we,ex_waddr,ex_wdata,mem_we,mem_waddr,mem_wdata);
input            clk;
input            reset_n;
input            ex_we;
input      [4:0] ex_waddr;
input      [31:0]ex_wdata;

output reg       mem_we;
output reg [4:0] mem_waddr;
output reg [31:0]mem_wdata;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		mem_we          <= 1'b0;
		mem_waddr[4:0]  <= {5{1'b0}};
		mem_wdata[31:0] <= {32{1'b0}};
	end else begin
		mem_we          <= ex_we;
		mem_waddr[4:0]  <= ex_waddr[4:0];
		mem_wdata[31:0] <= ex_wdata[31:0];
	end
end

endmodule
