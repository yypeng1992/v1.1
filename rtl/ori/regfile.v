module regfile(clk,reset_n,reg1_addr,reg2_addr,re1,re2,reg1_data,reg2_data,we,waddr,wdata);
input           clk;
input           reset_n;
input      [4:0]reg1_addr;
input      [4:0]reg2_addr;
input           re1;
input           re2;

output reg [31:0]reg1_data;
output reg [31:0]reg2_data;

input            we;
input      [4:0] waddr;
input      [31:0]wdata;

reg [4:0]regs [31:0];

/////////////////////////
//read1
/////////////////////////
always @ (posedge clk or posedge reset_n) begin
	if(!reset_n) begin
		reg1_data[31:0] <= {32{1'b0}};
	end else if(reg1_addr[4:0]==5'd0)begin
		reg1_data[31:0] <= {32{1'b0}};
	end else if((reg1_addr[4:0]==waddr[4:0]) && (we) && (re1))begin
		reg1_data[31:0] <= wdata[31:0];
	end else if(re1) begin
		reg1_data[31:0] <= regs[reg1_addr[4:0]];
	end else begin
		reg1_data[31:0] <= {32{1'b0}};
	end 
end

/////////////////////////
//read2
/////////////////////////
always @ (posedge clk or posedge reset_n) begin
	if(!reset_n) begin
		reg2_data[31:0] <= {32{1'b0}};
	end else if(reg2_addr[4:0]==5'd0)begin
		reg2_data[31:0] <= {32{1'b0}};
	end else if((reg2_addr[4:0]==waddr[4:0]) && (we) && (re2))begin
		reg2_data[31:0] <= wdata[31:0];
	end else if(re2) begin
		reg2_data[31:0] <= regs[reg2_addr[4:0]];
	end else begin
		reg2_data[31:0] <= {32{1'b0}};
	end 
end

/////////////////////////
//write
/////////////////////////
always @ (posedge clk or posedge reset_n) begin
	if(reset_n) begin
		 if((we) && (waddr != 0)) begin
			regs[waddr] <= wdata[31:0];
		end
	end
end

endmodule
