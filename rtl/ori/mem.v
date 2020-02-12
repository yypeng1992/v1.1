module mem(clk,reset_n,ex_we,ex_addr,ex_data,mem_we,mem_addr,mem_data);
input            clk;
input            reset_n;
input            ex_we;
input      [4:0] ex_addr;
input      [31:0]ex_data;

output reg       mem_we;
output reg [4:0] mem_addr;
output reg [31:0]mem_data;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		mem_we         <= 1'b0;
		mem_addr[4:0]  <= {5{1'b0}};
		mem_data[31:0] <= {32{1'b0}};
	end else begin
		mem_we         <= ex_we;
		mem_addr[4:0]  <= ex_addr[4:0];
		mem_data[31:0] <= ex_data[31:0];
	end
end

endmodule
