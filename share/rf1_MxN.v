module rf1_MxN#(
	parameter M = 128,
	parameter N = 8,
	parameter WIDTH = 7,
	parameter INIT = 0
)(
	clk, reset_n,
	En, Wr, Addr, WrData, Data
);

//localparam WIDTH = $clog(M);

////////////////////////////////////////
// I/O defination
////////////////////////////////////////
input clk;
input reset_n;
input En;
input Wr;
input [WIDTH-1:0] Addr;
input [N-1:0] WrData;
output[N-1:0] Data;

////////////////////////////////////////
// register/wire defination
////////////////////////////////////////
reg [N-1:0] mem [0:M-1];
reg [N-1:0] RdData;
integer i;

////////////////////////////////////////
// Main code
////////////////////////////////////////
assign Data[N-1:0] = RdData[N-1:0];
always@(posedge clk or negedge reset_n)
begin
	if(!reset_n)
		RdData[N-1:0] <= {N{1'b0}};
	else if(En && !Wr)
		RdData[N-1:0] <= mem[Addr[WIDTH-1:0]][N-1:0];
end

always@(posedge clk or negedge reset_n)
begin
	if(!reset_n) begin
		for(i=0; i<M; i=i+1) begin
			mem[i][N-1:0] <= INIT ? (i << 2)
			                      : {N{1'b0}};
		end
	end
	else if(En) begin
		if(Wr) begin
			mem[Addr[WIDTH-1:0]][N-1:0] <= WrData[N-1:0];;
		end
	end
end

endmodule
