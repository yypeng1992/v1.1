module fifo(reset_n,wclk,wren,wdata,
	    rclk,rden,rdata,full,empty);
input       reset_n;
input       wclk;
input       wren;
input  [3:0]wdata;

input       rclk;
input       rden;
output [3:0]rdata;
output      full;
output      empty;

wire [3:0]ram_waddr;
wire [3:0]ram_raddr;
reg  [4:0]waddr;
reg  [4:0]raddr;
wire [4:0]g_waddr;
wire [4:0]g_raddr;
reg  [4:0]g_waddr_d;
reg  [4:0]g_raddr_d;
reg  [4:0]waddr_d;
reg  [4:0]raddr_d;
wire      valid;

assign ram_waddr[3:0] = waddr[3:0];
assign ram_raddr[3:0] = raddr[3:0];
assign g_waddr[4:0] = (waddr[4:0]>>1)^(waddr[4:0]);
assign g_raddr[4:0] = (raddr[4:0]>>1)^(raddr[4:0]);
assign full         = (waddr[3:0]==raddr_d[3:0])&&(waddr[4]^raddr_d[4]);
assign empty        = (raddr[4:0]==waddr_d[4:0]);
assign valid        = ((!full) && (!empty));

always @ (posedge wclk or negedge reset_n) begin
	if(!reset_n) begin
		waddr[4:0] <= 5'd0;
	end else if(wren && (!full))begin
		waddr[4:0] <= waddr[4:0] + 1'b1;
	end
end

always @ (posedge rclk or negedge reset_n) begin
	if(!reset_n) begin
		raddr[4:0] <= 5'd0;
	end else if(rden && (!empty))begin
		raddr[4:0] <= raddr[4:0] + 1'b1;
	end
end


always @ (posedge rclk or negedge reset_n) begin
	if(!reset_n) begin
		g_waddr_d[4:0] <= 5'd0;
	end else begin
		g_waddr_d[4:0] <= g_waddr[4:0];
	end
end

always @ (posedge wclk or negedge reset_n) begin
	if(!reset_n) begin
		g_raddr_d[4:0] <= 5'd0;
	end else begin
		g_raddr_d[4:0] <= g_raddr[4:0];
	end
end

integer i;
integer j;
always @ (*) begin
	waddr_d[4] <= g_waddr_d[4];
	for(i=3;i>=0;i=i-1)begin
		waddr_d[i] <= waddr_d[i+1] ^ g_waddr_d[i];
	end
end

always @ (*) begin
	raddr_d[4] <= g_raddr_d[4];
	for(j=3;j>=0;j=j-1)begin
		raddr_d[j] <= raddr_d[j+1] ^ g_raddr_d[j];
	end
end

ram ram0(
 .reset_n   (reset_n   ),
 .valid     (valid     ),
 .wclk      (wclk      ),
 .wren      (wren      ),
 .waddr     (ram_waddr[3:0]),
 .wdata     (wdata[3:0]),
 .rclk      (rclk      ),
 .rden      (rden      ),
 .raddr     (ram_raddr[3:0]),
 .rdata     (rdata[3:0])
);

endmodule
