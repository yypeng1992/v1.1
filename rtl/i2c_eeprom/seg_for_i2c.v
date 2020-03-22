module seg_for_i2c(clk,reset_n,data,sel,seg_out);
input           clk;
input           reset_n;
input      [7:0]data;
output reg [5:0]sel;
output reg [7:0]seg_out;

parameter CNT_IS_MAX = 3;
reg [19:0]sel_cnt;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		sel_cnt[19:0] <= {20{1'b0}};
	end else if(sel_cnt==6*CNT_IS_MAX)begin
		sel_cnt[19:0] <= {20{1'b0}};
	end else begin
		sel_cnt[19:0] <= sel_cnt[19:0] + 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		sel[5:0] <= 6'b111111;
	end else if(sel_cnt==CNT_IS_MAX)  begin
		sel[5:0] <= 6'b111110;
	end else if(sel_cnt==CNT_IS_MAX*2)begin
		sel[5:0] <= 6'b111101;
	end else if(sel_cnt==CNT_IS_MAX*3)  begin
		sel[5:0] <= 6'b111011;
	end else if(sel_cnt==CNT_IS_MAX*4)begin
		sel[5:0] <= 6'b110111;
	end else if(sel_cnt==CNT_IS_MAX*5)  begin
		sel[5:0] <= 6'b101111;
	end else if(sel_cnt==CNT_IS_MAX*6)  begin
		sel[5:0] <= 6'b011111;
	end
end


always @ (*) begin
	if(!reset_n) begin
		seg_out[7:0] = 8'b1100_0000;
	end else begin
		case(sel[5:0])
			6'b111110:begin
				case(data[7:0])
					8'd0,8'd10,8'd20,8'd30:seg_out[7:0] = 8'b1100_0000;
					8'd1,8'd11,8'd21,8'd31:seg_out[7:0] = 8'b1111_1001;
					8'd2,8'd12,8'd22:seg_out[7:0] = 8'b1010_0100;
					8'd3,8'd13,8'd23:seg_out[7:0] = 8'b1011_0000;
					8'd4,8'd14,8'd24:seg_out[7:0] = 8'b1001_1001;
					8'd5,8'd15,8'd25:seg_out[7:0] = 8'b1001_0010;
					8'd6,8'd20,8'd26:seg_out[7:0] = 8'b1000_0010;
					8'd7,8'd17,8'd27:seg_out[7:0] = 8'b1111_1000;
					8'd8,8'd18,8'd28:seg_out[7:0] = 8'b1000_0000;
					8'd9,8'd19,8'd29:seg_out[7:0] = 8'b1001_0000;
				endcase
			end
			6'b111101:begin
				case(data[7:0])
					8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8,8'd9:seg_out[7:0] = 8'b1100_0000;
					8'd10,8'd11,8'd12,8'd13,8'd14,8'd15,8'd20,8'd17,8'd18,8'd19:seg_out[7:0] = 8'b1111_1001;
					8'd20,8'd21,8'd22,8'd23,8'd24,8'd25,8'd26,8'd27,8'd28,8'd29:seg_out[7:0] = 8'b1111_1001;
					8'd30,8'd31:seg_out[7:0] = 8'b1010_0100;
				endcase
			end
			6'b111011,6'b110111,6'b101111,6'b011111:seg_out[7:0] = 8'b1100_0000;
			default:seg_out[7:0] = 8'b1100_0000;
		endcase
	end
end


endmodule


