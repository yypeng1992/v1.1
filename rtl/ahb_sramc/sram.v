module sram(clk,cs_n,wen,oen,Addr,Wdata,Data);
input            clk;
input            cs_n;
input            wen;
input            oen;
input      [12:0]Addr;
input      [7 :0]Wdata;
output reg [7 :0]Data;

reg [7:0] sram_data [0:8191];
reg [7:0] Data_temp;


/////////////////////////////////
///write
/////////////////////////////////
always @ (posedge clk)begin
	if((!cs_n)&&(!wen)) begin
		sram_data[Addr[12:0]] <= Wdata[7:0];
	end
end 

/////////////////////////////////
////read
/////////////////////////////////
always @ (posedge clk ) begin
	if((!cs_n)&& (wen)&&(!oen)) begin
		Data[7:0] <= sram_data[Addr[12:0]];
	end
end 
endmodule
