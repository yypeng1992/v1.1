module data_ram(clk,ce,we,sel,addr,data_i,data_o);
input 	         clk;
input 	         ce;
input 	         we;
input      [3 :0]sel;
input      [31:0]addr;
input      [31:0]data_i;
output reg [31:0]data_o;

reg [7:0] data_mem0 [0:1023];
reg [7:0] data_mem1 [0:1023];
reg [7:0] data_mem2 [0:1023];
reg [7:0] data_mem3 [0:1023];


wire [7:0]mem3;
wire [7:0]mem2;
wire [7:0]mem1;
wire [7:0]mem0;
wire [31:0]data;

////////////////////////////////////
/////read
////////////////////////////////////
always @ (* ) begin
	if(!ce) begin
		data_o[31:0] = {32{1'b0}};
	end else if(!we) begin
		data_o[31:0] = data[31:0];	
	end else begin
		data_o[31:0] = {32{1'b0}};
	end
end

assign mem3[7:0] = data_mem3[addr[10:2]];
assign mem2[7:0] = data_mem2[addr[10:2]];
assign mem1[7:0] = data_mem1[addr[10:2]];
assign mem0[7:0] = data_mem0[addr[10:2]];
assign data[31:0] = {mem3,mem2,mem1,mem0};


////////////////////////////////////
/////write
////////////////////////////////////
always @ (posedge clk ) begin
	if(!ce) begin
		data_o[31:0] <= {32{1'b0}};
	end else if(we) begin
		case(sel[3:0])
			4'b0001:data_mem0[addr[10:2]] <= data_i[7:0];
			4'b0010:data_mem1[addr[10:2]] <= data_i[15:8];
			4'b0011:begin
				data_mem0[addr[10:2]] <= data_i[7:0];
				data_mem1[addr[10:2]] <= data_i[15:8];
			end
			4'b0111:begin
				data_mem2[addr[10:2]] <= data_i[23:16];
				data_mem1[addr[10:2]] <= data_i[15:8];
				data_mem0[addr[10:2]] <= data_i[7:0];
			end
			4'b0100:data_mem2[addr[10:2]] <= data_i[23:16];
			4'b1000:data_mem3[addr[10:2]] <= data_i[31:24];
			4'b1100:begin
				data_mem3[addr[10:2]] <= data_i[31:24];
				data_mem2[addr[10:2]] <= data_i[23:16];
			end
			4'b1110:begin
				data_mem3[addr[10:2]] <= data_i[31:24];
				data_mem2[addr[10:2]] <= data_i[23:16];
				data_mem1[addr[10:2]] <= data_i[15:8];
			end
			4'b1111:begin
				data_mem3[addr[10:2]] <= data_i[31:24];
				data_mem2[addr[10:2]] <= data_i[23:16];
				data_mem1[addr[10:2]] <= data_i[15:8];
				data_mem0[addr[10:2]] <= data_i[7:0];
			end
		endcase
	end
end

endmodule

