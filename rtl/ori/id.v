module id(clk,reset_n,pc_i,data_i,
          reg1_data_i,reg2_data_i,
	  aluop_o,alusel_o,reg1_data_o,reg2_data_o,wreg_o,waddr_o,
	  reg1_read_o,reg1_addr_o,reg2_read_o,reg2_addr_o);
input              clk;
input              reset_n;
input       [31:0] pc_i;
input       [31:0] data_i;

input       [31:0] reg1_data_i;
input       [31:0] reg2_data_i;

output reg  [2:0]  alusel_o;
output reg  [7:0]  aluop_o;
output reg  [31:0] reg1_data_o;
output reg  [31:0] reg2_data_o;
output reg         wreg_o;
output reg  [4:0]  waddr_o;

output reg         reg1_read_o;
output reg  [4:0]  reg1_addr_o;
output reg         reg2_read_o;
output reg  [4:0]  reg2_addr_o;
 
reg [31:0] imm;

always @ (posedge clk or negedge reset_n) begin
	if(reset_n) begin
		alusel_o[2:0]     <= {3{1'b0}};
		aluop_o [7:0]     <= {8{1'b0}};
		wreg_o            <= 1'b0;
		waddr_o           <= {5{1'b0}};
		reg1_read_o       <= 1'b0;
		reg1_addr_o[4:0]  <= {5{1'b0}};  
		reg2_read_o       <= 1'b0;
		reg2_addr_o[4:0]  <= {5{1'b0}};
		imm               <= {32{1'b0}};
	end else begin
		case(data_i[31:26])
			6'b001101:begin
                       		alusel_o[2:0]     <= 3'b000;
				aluop_o [7:0]     <= 8'b00001101;
                       	 	wreg_o            <= 1'b1;
                       		waddr_o           <= data_i[20:16];
                        	reg1_read_o       <= 1'b1;
                        	reg1_addr_o[4:0]  <= data_i[25:21];
                        	reg2_read_o       <= 1'b0;
				reg2_addr_o[4:0]  <= data_i[20:16];
				imm[31:0]         <= {16'd0,data_i[15:0]};
			end
		endcase
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(reset_n) begin
		reg1_data_o[31:0] <= {32{1'b0}};
	end else if(reg1_read_o) begin
		reg1_data_o[31:0] <= reg1_data_i[31:0];
	end else if(!reg1_read_o)begin
		reg1_data_o[31:0] <= imm[31:0];
	end else begin
		reg1_data_o[31:0] <= {32{1'b0}};
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(reset_n) begin
		reg2_data_o[31:0] <= {32{1'b0}};
	end else if(reg2_read_o) begin
		reg2_data_o[31:0] <= reg2_data_i[31:0];
	end else if(!reg2_read_o)begin
		reg2_data_o[31:0] <= imm[31:0];
	end else begin
		reg2_data_o[31:0] <= {32{1'b0}};
	end
end

endmodule
