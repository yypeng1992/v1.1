module ctrl(reset_n,stallreg_from_id,stallreg_from_ex,stall,
	    cp0_epc_i,excepttype_i,flush,new_pc);
input		reset_n;
input		stallreg_from_id;
input           stallreg_from_ex;
output reg [5:0]stall;

////////////////////////////////////////////////
////input and output for excepttype
////////////////////////////////////////////////
input      [31:0]cp0_epc_i;
input      [31:0]excepttype_i;
output reg       flush;
output reg [31:0]new_pc;

always @ (*) begin
	if(!reset_n) begin
		stall [5 :0] = 6'd0;
		new_pc[31:0] = {32{1'b0}};
		flush        = 1'b0;
	end else if (excepttype_i != 32'd0)begin
		stall [5 :0] = 6'd0;
		flush        = 1'b1;
		case(excepttype_i)
			32'h00000001:new_pc[31:0] = 32'h00000020;
			32'h00000008,32'h0000000a,32'h0000000d,32'h0000000c:new_pc[31:0] = 32'h00000040;
			32'h0000000e:new_pc[31:0] = cp0_epc_i[31:0];
			default:new_pc[31:0] = {32{1'b0}};
		endcase
	end else if(stallreg_from_ex) begin
		stall[5:0] = 6'b001111;
		new_pc[31:0] = {32{1'b0}};
		flush        = 1'b0;
	end else if(stallreg_from_id) begin
		stall[5:0] = 6'b000111;
		new_pc[31:0] = {32{1'b0}};
		flush        = 1'b0;
	end else begin
		stall[5:0] = 6'b000000;
		new_pc[31:0] = {32{1'b0}};
		flush        = 1'b0;
	end
end

endmodule
