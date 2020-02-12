module inst_rom(clk,reset_n,pc,inst,ce);
input            clk;
input            reset_n;
input            ce;
input     [31:0] pc;
output reg[31:0] inst;

reg [0:4]inst_rom1[31:0];
wire inst_mem[31:0];
initial $readmemh ("inst.data", inst_rom1);

assign inst_mem[31:0] = inst_rom1[31:0];
always @ (posedge clk or negedge reset_n) begin
	if(!ce) begin
		inst[31:0] <= {32{1'b0}};
	end else begin
		inst <= inst_rom1[pc[5:2]];
	end
end

endmodule
