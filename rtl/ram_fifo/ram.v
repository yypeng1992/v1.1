module ram(reset_n,wclk,wren,waddr,wdata,
	   rclk,rden,raddr,rdata,valid);
input           reset_n;
input           wclk;
input           wren;
input      [3:0]waddr;
input      [3:0]wdata;
input           rclk;
input           rden;
input      [3:0]raddr;
output reg [3:0]rdata;
input           valid;

reg [3:0]mem[0:15];
integer t;
wire [3:0]addr;
wire [3:0]mem0;
wire [3:0]mem1;
wire [3:0]mem2;
wire [3:0]mem3;
wire [3:0]mem4;
wire [3:0]mem5;
wire [3:0]mem6;
wire [3:0]mem7;
wire [3:0]mem8;
wire [3:0]mem9;
wire [3:0]mem10;
wire [3:0]mem11;
wire [3:0]mem12;
wire [3:0]mem13;
wire [3:0]mem14;
wire [3:0]mem15;
assign addr[3:0] = wren ? waddr : raddr;
assign mem0 = mem[0];
assign mem1 = mem[1];
assign mem2 = mem[2];
assign mem3 = mem[3];
assign mem4 = mem[4];
assign mem5 = mem[5];
assign mem6 = mem[6];
assign mem7 = mem[7];
assign mem8 = mem[8];
assign mem9 = mem[9];
assign mem10 = mem[10];
assign mem11 = mem[11];
assign mem12 = mem[12];
assign mem13 = mem[13];
assign mem14 = mem[14];
assign mem15 = mem[15];




///////////////////////////////////////////////
/////write
///////////////////////////////////////////////
always @ (posedge wclk or negedge reset_n) begin
	if(!reset_n) begin
		for(t=0; t<16; t=t+1)begin
			mem[t][3:0] <= {4{1'b0}};
		end
	 end else if( valid) begin
	 	if(wren)begin
			mem[addr][3:0] <= wdata[3:0];
		end
	end
end


////////////////////////////////////////////////
///////read
////////////////////////////////////////////////
always @ (*) begin
	if(!reset_n) begin
		rdata[3:0] = 4'd0;	
	end else if(rden && valid) begin
		rdata[3:0] = mem[addr][3:0];
	end
end

endmodule
