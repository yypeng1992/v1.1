module cp0_reg(clk,reset_n,int_i,raddr_i,we_i,waddr_i,data_i,
		count_o,compare_o,status_o,cause_o,epc_o,prid_o,config_o,timer_int_o,data_o);
input            clk;
input            reset_n;
input      [4 :0]int_i;
input      [4 :0]raddr_i;
input            we_i;
input      [4 :0]waddr_i;
input      [31:0]data_i;
output reg [31:0]count_o;
output reg [31:0]compare_o;
output reg [31:0]status_o;
output reg [31:0]cause_o;
output reg [31:0]epc_o;
output reg [31:0]prid_o;
output reg [31:0]config_o;
output reg       timer_int_o;
output reg [31:0]data_o;

/////////////////////////////////////////////////////
////////////write
/////////////////////////////////////////////////////
always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		count_o     [31:0] <= {32{1'b0}};
		compare_o   [31:0] <= {32{1'b0}};
		status_o    [31:0] <= 32'h10000000;
		cause_o     [31:0] <= {32{1'b0}};
		epc_o       [31:0] <= {32{1'b0}};
		prid_o      [31:0] <= 32'h004c0102;
		config_o    [31:0] <= 32'h00008000;
		timer_int_o        <= 1'b0;
	end else begin
		count_o     [31:0] <= count_o[31:0] + 1'b1;
		cause_o     [15:10]<= int_i[4:0];
		if((count_o[31:0]==compare_o[31:0]) && (compare_o != 32'd0))begin
			timer_int_o<= 1'b1;
		end
		if(we_i)begin
			case(waddr_i[4:0])
				5'b01001:count_o  [31:0] <= data_i[31:0];
				5'b01011:begin
					compare_o[31:0] <= data_i[31:0];
					timer_int_o     <= 1'b0;
				end
				5'b01100:status_o [31:0] <= data_i[31:0];
				5'b01101:begin
					cause_o   [23]   <= data_i[23];
					cause_o   [22]   <= data_i[22];
					cause_o   [9:8]  <= data_i[9:8];
				end
				5'b01110:prid_o   [31:0] <= data_i[31:0];
			endcase
		end
	end
end

/////////////////////////////////////////////////////
////////////read
/////////////////////////////////////////////////////
always @ (*) begin
	if(!reset_n) begin
		data_o[31:0] = {32{1'b0}};
	end else begin
		case(raddr_i[4:0])
			5'b01001:data_o[31:0] = count_o[31:0];
			5'b01011:data_o[31:0] = compare_o[31:0];
			5'b01100:data_o[31:0] = status_o[31:0];
			5'b01101:data_o[31:0] = cause_o[31:0];
			5'b01110:data_o[31:0] = epc_o[31:0];
			5'b01111:data_o[31:0] = prid_o[31:0];
			5'b10000:data_o[31:0] = config_o[31:0];
		endcase
	end
end


endmodule
