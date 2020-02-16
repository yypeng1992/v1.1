module ex(clk,reset_n,alusel,aluop,reg1_data,reg2_data,id_we,id_waddr,ex_we,ex_waddr,ex_wdata);
input            clk;
input            reset_n;
input      [2:0] alusel;
input      [7:0] aluop;
input      [31:0]reg1_data;
input      [31:0]reg2_data;
input            id_we;
input      [4:0] id_waddr;

output reg       ex_we;
output reg [4:0] ex_waddr;
output reg [31:0]ex_wdata;

reg        [31:0]logicout;

always @ (*) begin
	if(!reset_n) begin
		logicout[31:0] = {32{1'b0}};
	end else begin
		case(aluop[7:0])
			8'b00001101:begin
				logicout[31:0] = reg1_data | reg2_data;
			end
		endcase
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		ex_we         <= 1'b0;
		ex_waddr[4:0] <= {5{1'b0}};
		ex_wdata[31:0] <= {32{1'b0}};
	end else begin
		ex_we         <= id_we;
		ex_waddr[4:0] <= id_waddr[4:0];
		case(alusel[2:0])
			3'b000:begin
              			  ex_wdata[31:0] <= logicout[31:0];
			 end
		endcase
	end
end
endmodule
