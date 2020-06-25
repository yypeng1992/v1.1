module pc_id(clk,reset_n,pc_id_stall,pc_pc,pc_inst,id_pc,id_inst);
input  		 clk;
input  		 reset_n;
input      [5:0] pc_id_stall;
input  	   [31:0]pc_pc;
input  	   [31:0]pc_inst;
output reg [31:0]id_pc;
output reg [31:0]id_inst;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		id_pc  [31:0] <= {32{1'b0}}; 
		id_inst[31:0] <= {32{1'b0}}; 
	end else if(!pc_id_stall[1]) begin
		id_pc  [31:0] <= pc_pc  [31:0] ;
		id_inst[31:0] <= pc_inst[31:0] ;
	end
end

endmodule
