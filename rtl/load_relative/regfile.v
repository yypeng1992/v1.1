module regfile(clk,reset_n,reg1_addr,reg2_addr,re1,re2,reg1_data,reg2_data,wb_we,wb_waddr,wb_wdata);
input           clk;
input           reset_n;
input      [4:0]reg1_addr;
input      [4:0]reg2_addr;
input           re1;
input           re2;

output reg [31:0]reg1_data;
output reg [31:0]reg2_data;

/////////////////////////
//data from wb
/////////////////////////
input            wb_we;
input      [4:0] wb_waddr;
input      [31:0]wb_wdata;

reg [31:0]regs [0:31];

/////////////////////////
//read1
/////////////////////////
always @ (*) begin
	if(!reset_n) begin
		reg1_data[31:0] = {32{1'b0}};
	end else if(reg1_addr[4:0]==5'd0)begin
		reg1_data[31:0] = {32{1'b0}};
	end else if((reg1_addr[4:0]==wb_waddr[4:0]) && (wb_we) && (re1))begin
		reg1_data[31:0] = wb_wdata[31:0];
	end else if(re1) begin
		reg1_data[31:0] = regs[reg1_addr];
	end else begin
		reg1_data[31:0] = {32{1'b0}};
	end 
end

/////////////////////////
//read2
/////////////////////////
always @ (*) begin
	if(!reset_n) begin
		reg2_data[31:0] = {32{1'b0}};
	end else if(reg2_addr[4:0]==5'd0)begin
		reg2_data[31:0] = {32{1'b0}};
	end else if((reg2_addr[4:0]==wb_waddr[4:0]) && (wb_we) && (re2))begin
		reg2_data[31:0] = wb_wdata[31:0];
	end else if(re2) begin
		reg2_data[31:0] = regs[reg2_addr];
	end else begin
		reg2_data[31:0] = {32{1'b0}};
	end 
end

/////////////////////////
//write
/////////////////////////
always @ (posedge clk or posedge reset_n) begin
	if(reset_n) begin
		if((wb_we) && (wb_waddr != 0)) begin
			regs[wb_waddr] <=   wb_wdata[31:0];
		end
	end
end

endmodule
