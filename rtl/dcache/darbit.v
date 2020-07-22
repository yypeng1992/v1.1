module darbit (
input        clk,
input        reset_n,
output reg      arbit_done,
output reg[31:0]arbit_rdata,

input 	    data0_valid,
input 	    data1_valid,
input 	    data2_valid,
input 	    data3_valid,
input [127:0]miss_wdata,
input       done,
input       hwrite_d,
input       miss,
input [19:0]miss_addr,
output reg  arbit_flag
);

wire [1:0]block_set;
reg [19:0]last_addr;

assign block_set[1:0] = miss_addr[3:2];

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		arbit_flag <= 1'b0;
	end else if(arbit_done)begin
		arbit_flag <= 1'b0;
	end else if(miss && (last_addr[19:4]==miss_addr[19:4])) begin
		arbit_flag <= 1'b1;
	end
end

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		last_addr[19:0] <= 20'd0;
	end else if(done ) begin
		last_addr[19:0] <= miss_addr[19:0];
	end
end



always @ (*)begin
	if(!reset_n)begin
		arbit_done        = 1'b0;
	end else if(arbit_flag ) begin
		case(block_set[1:0])
			2'd0:begin
				if(data0_valid)begin
					arbit_done        = 1'b1;
				end
			end
			2'd1:begin
				if(data1_valid)begin
					arbit_done        = 1'b1;
				end
			end
			2'd2:begin
				if(data2_valid)begin
					arbit_done        = 1'b1;
				end
			end
			2'd3:begin
				if(data3_valid)begin
					arbit_done        = 1'b1;
				end
			end
		endcase
	end else begin
		arbit_done        = 1'b0;
	end
end

always @ (*)begin
	if(!reset_n)begin
		arbit_rdata[31:0] = 32'h0;
	end else if(arbit_flag && (!hwrite_d)) begin
		case(block_set[1:0])
			2'd0:begin
				if(data0_valid)begin
					arbit_rdata[31:0] = miss_wdata[31:0];
				end
			end
			2'd1:begin
				if(data1_valid)begin
					arbit_rdata[31:0] = miss_wdata[63:32];
				end
			end
			2'd2:begin
				if(data2_valid)begin
					arbit_rdata[31:0] = miss_wdata[95:64];
				end
			end
			2'd3:begin
				if(data3_valid)begin
					arbit_rdata[31:0] = miss_wdata[127:96];
				end
			end
		endcase
	end else begin
		arbit_rdata[31:0] = 32'h0;
	end
end

endmodule
