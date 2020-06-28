module ahb_slave_if(h_clk,h_reset_n,hsel,haddr,hwen,htrans,hsize,hburst,hwdata,hready_in,
		   hready_out,hresp,
		   ByteEna,wen,addr,wdata);
input       h_clk;
input       h_reset_n;
input       hsel;
input [15:0]haddr; /// map range 64KB
input       hwen;
input [1 :0]htrans;
input [2 :0]hsize;
input [2 :0]hburst;
input [31:0]hwdata;
input       hready_in;

output       hready_out;
output [1 :0]hresp;

output reg [3:0] ByteEna;
output           wen;
output     [13:0]addr;
output     [31:0]wdata;

parameter [1:0]IDLE   = 2'b00;
parameter [1:0]BUSY   = 2'b01;
parameter [1:0]NONSEQ = 2'b10;
parameter [1:0]SEQ    = 2'b11;

wire csn_en;
wire write;
wire read;

reg [1 :0]htrans_d;
reg       hwrite_d;
reg [2 :0]hsize_d;
reg [31:0]haddr_d;

assign addr [13:0] = haddr_d[15:2];
assign wdata[31:0] = hwdata[31:0];
assign write = ((htrans_d[1:0]==NONSEQ)||(htrans_d[1:0]==SEQ))&&(hwrite_d);
assign read  = ((htrans_d[1:0]==NONSEQ)||(htrans_d[1:0]==SEQ))&&(!hwrite_d);
assign wen = !write;
assign csn_en = write || read;

assign hready_out   = 1'b1;
assign hresp[1:0]   = 2'b00;


always @ (*) begin
	if(csn_en)begin
		if(hsize_d[2:0]==3'b010)begin
			ByteEna[3:0] = 4'b0000;
		end else if(hsize_d[2:0]==3'b001) begin
			if(haddr_d[1])begin
				ByteEna[3:0] = 4'b0011;
			end else begin
				ByteEna[3:0] = 4'b1100;
			end
		end else if(hsize_d[2:0]==3'b000)begin
			case(haddr_d[1:0])
				2'b00:ByteEna[3:0] = 4'b1110;
				2'b01:ByteEna[3:0] = 4'b1101;
				2'b10:ByteEna[3:0] = 4'b1011;
				2'b11:ByteEna[3:0] = 4'b0111;
			endcase
		end else begin
			ByteEna[3:0] = 4'b1111;
		end
	end else begin
		ByteEna[3:0] = 4'b1111;
	end
end 

always @ (posedge h_clk or negedge h_reset_n) begin
	if(!h_reset_n)begin
		htrans_d[1 :0] <= 2'b00;
		hwrite_d       <= 1'b0;
		hsize_d [2 :0] <= 3'd0;
		haddr_d [31:0] <= {4{8'h0}};
	end else if(hsel && (!hready_in)) begin
		htrans_d[1 :0] <= htrans[1:0];
		hwrite_d       <= hwen;
		hsize_d [2 :0] <= hsize [2:0];
		haddr_d [31:0] <= haddr [31:0];
	end
end 




endmodule
