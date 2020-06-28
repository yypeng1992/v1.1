module seg_for_rtc(sys_clk,reset_n,data,sel,seg_out);
input           sys_clk;
input           reset_n;
input      [23:0]data;
output reg [5:0]sel;
output reg [7:0]seg_out;

parameter CNT_IS_MAX = 3;
reg [18:0]sel_cnt;


always @ (posedge sys_clk or negedge reset_n) begin
	if(!reset_n) begin
		sel_cnt[18:0] <= {19{1'b0}};
	end else if(sel_cnt==6*CNT_IS_MAX)begin
		sel_cnt[18:0] <= {19{1'b0}};
	end else begin
		sel_cnt[18:0] <= sel_cnt[18:0] + 1'b1;
	end
end


always @ (posedge sys_clk or negedge reset_n) begin
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
				case(data[3:0])
					8'd0:seg_out[7:0] = 8'b1100_0000;
					8'd1:seg_out[7:0] = 8'b1111_1001;
					8'd2:seg_out[7:0] = 8'b1010_0100;
					8'd3:seg_out[7:0] = 8'b1011_0000;
					8'd4:seg_out[7:0] = 8'b1001_1001;
					8'd5:seg_out[7:0] = 8'b1001_0010;
					8'd6:seg_out[7:0] = 8'b1000_0010;
					8'd7:seg_out[7:0] = 8'b1111_1000;
					8'd8:seg_out[7:0] = 8'b1000_0000;
					8'd9:seg_out[7:0] = 8'b1001_0000;
					default:seg_out[7:0] = 8'b1100_0000;
				endcase
			end
			6'b111101:begin
				case(data[7:4])
					8'd0:seg_out[7:0] = 8'b1100_0000;
					8'd1:seg_out[7:0] = 8'b1111_1001;
					8'd2:seg_out[7:0] = 8'b1010_0100;
					8'd3:seg_out[7:0] = 8'b1011_0000;
					8'd4:seg_out[7:0] = 8'b1001_1001;
					8'd5:seg_out[7:0] = 8'b1001_0010;
					8'd6:seg_out[7:0] = 8'b1000_0010;
					8'd7:seg_out[7:0] = 8'b1111_1000;
					8'd8:seg_out[7:0] = 8'b1000_0000;
					8'd9:seg_out[7:0] = 8'b1001_0000;
					default:seg_out[7:0] = 8'b1100_0000;
				endcase
			end
			6'b111011:begin
				case(data[11:8])
					8'd0:seg_out[7:0] = 8'b1100_0000;
					8'd1:seg_out[7:0] = 8'b1111_1001;
					8'd2:seg_out[7:0] = 8'b1010_0100;
					8'd3:seg_out[7:0] = 8'b1011_0000;
					8'd4:seg_out[7:0] = 8'b1001_1001;
					8'd5:seg_out[7:0] = 8'b1001_0010;
					8'd6:seg_out[7:0] = 8'b1000_0010;
					8'd7:seg_out[7:0] = 8'b1111_1000;
					8'd8:seg_out[7:0] = 8'b1000_0000;
					8'd9:seg_out[7:0] = 8'b1001_0000;
					default:seg_out[7:0] = 8'b1100_0000;
				endcase
			end
			6'b110111:begin
				case(data[15:12])
					8'd0:seg_out[7:0] = 8'b1100_0000;
					8'd1:seg_out[7:0] = 8'b1111_1001;
					8'd2:seg_out[7:0] = 8'b1010_0100;
					8'd3:seg_out[7:0] = 8'b1011_0000;
					8'd4:seg_out[7:0] = 8'b1001_1001;
					8'd5:seg_out[7:0] = 8'b1001_0010;
					8'd6:seg_out[7:0] = 8'b1000_0010;
					8'd7:seg_out[7:0] = 8'b1111_1000;
					8'd8:seg_out[7:0] = 8'b1000_0000;
					8'd9:seg_out[7:0] = 8'b1001_0000;
					default:seg_out[7:0] = 8'b1100_0000;
				endcase
			end
			6'b101111:begin
				case(data[19:16])
					8'd0:seg_out[7:0] = 8'b1100_0000;
					8'd1:seg_out[7:0] = 8'b1111_1001;
					8'd2:seg_out[7:0] = 8'b1010_0100;
					8'd3:seg_out[7:0] = 8'b1011_0000;
					8'd4:seg_out[7:0] = 8'b1001_1001;
					8'd5:seg_out[7:0] = 8'b1001_0010;
					8'd6:seg_out[7:0] = 8'b1000_0010;
					8'd7:seg_out[7:0] = 8'b1111_1000;
					8'd8:seg_out[7:0] = 8'b1000_0000;
					8'd9:seg_out[7:0] = 8'b1001_0000;
					default:seg_out[7:0] = 8'b1100_0000;
				endcase
			end
			6'b011111:begin
				case(data[23:20])
					8'd0:seg_out[7:0] = 8'b1100_0000;
					8'd1:seg_out[7:0] = 8'b1111_1001;
					8'd2:seg_out[7:0] = 8'b1010_0100;
					8'd3:seg_out[7:0] = 8'b1011_0000;
					8'd4:seg_out[7:0] = 8'b1001_1001;
					8'd5:seg_out[7:0] = 8'b1001_0010;
					8'd6:seg_out[7:0] = 8'b1000_0010;
					8'd7:seg_out[7:0] = 8'b1111_1000;
					8'd8:seg_out[7:0] = 8'b1000_0000;
					8'd9:seg_out[7:0] = 8'b1001_0000;
					default:seg_out[7:0] = 8'b1100_0000;
				endcase
			end
			default:seg_out[7:0] = 8'b1100_0000;
		endcase
	end
end


endmodule


