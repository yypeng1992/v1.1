module addr_arbit(
input           clk,
input           reset_n,
input [17:0]    last_addr,
input           data0_valid,
input           data1_valid,
input           data2_valid,
input           data3_valid,
input [127:0]   wdata,

input [17:0]    miss_addr,
input           miss,
input           done,
output reg[31:0]rdata,
output reg      arbit_done,
output reg      arbit_flag
);

always @ (posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		arbit_flag <= 1'b0;
	end else if(done)begin
		arbit_flag <= 1'b0;
	end else if((miss&&(last_addr[17:2]==miss_addr[17:2]))) begin
		arbit_flag <= 1'b1;
	end
end

always @ (*)begin
	if(!reset_n)begin
		rdata[31:0] = 32'h0;
		arbit_done  = 1'b0;
	end else if (arbit_flag&&last_addr[17:2]==miss_addr[17:2]) begin
		case(miss_addr[1:0])
			2'd0:begin
				if(data0_valid)begin
					rdata[31:0] = wdata[127:96];
					arbit_done  = 1'b1;
				end
			end
			2'd1:begin
				if(data1_valid)begin
					rdata[31:0] = wdata[95:64];
					arbit_done  = 1'b1;
				end
			end
			2'd2:begin
				if(data2_valid)begin
					rdata[31:0] = wdata[63:32];
					arbit_done  = 1'b1;
				end
			end
			2'd3:begin
				if(data3_valid)begin
					rdata[31:0] = wdata[31:0];
					arbit_done  = 1'b1;
				end
			end
		endcase
	end else begin
		rdata[31:0] = 32'h0;
		arbit_done  = 1'b0;
	end
end


endmodule
