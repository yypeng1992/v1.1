module seg_for_clock(clk,reset_n,time_clock_key,sec_reg,min_reg,hour_reg,sec_clock,min_clock,hour_clock,sel,seg_out);
input           clk;
input           reset_n;
input      [1:0]time_clock_key;
input      [7:0]sec_reg;
input      [7:0]min_reg;
input      [7:0]hour_reg;
input      [7:0]sec_clock;
input      [7:0]min_clock;
input      [7:0]hour_clock;
output reg [5:0]sel;
output reg [7:0]seg_out;

parameter CNT_IS_MAX = 20;
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
	end else if(time_clock_key[0]) begin
		case(sel[5:0])
			6'b111110:begin
				case(sec_reg[7:0])
					8'd0,8'd10,8'd20,8'd30,8'd40,8'd50:seg_out[7:0] = 8'b1100_0000;
					8'd1,8'd11,8'd21,8'd31,8'd41,8'd51:seg_out[7:0] = 8'b1111_1001;
					8'd2,8'd12,8'd22,8'd32,8'd42,8'd52:seg_out[7:0] = 8'b1010_0100;
					8'd3,8'd13,8'd23,8'd33,8'd43,8'd53:seg_out[7:0] = 8'b1011_0000;
					8'd4,8'd14,8'd24,8'd34,8'd44,8'd54:seg_out[7:0] = 8'b1001_1001;
					8'd5,8'd15,8'd25,8'd35,8'd45,8'd55:seg_out[7:0] = 8'b1001_0010;
					8'd6,8'd16,8'd26,8'd36,8'd46,8'd56:seg_out[7:0] = 8'b1000_0010;
					8'd7,8'd17,8'd27,8'd37,8'd47,8'd57:seg_out[7:0] = 8'b1111_1000;
					8'd8,8'd18,8'd28,8'd38,8'd48,8'd58:seg_out[7:0] = 8'b1000_0000;
					8'd9,8'd19,8'd29,8'd39,8'd49,8'd59:seg_out[7:0] = 8'b1001_0000;
					default:seg_out[7:0] = 8'hff;
				endcase
			end
			6'b111101:begin
				case(sec_reg[7:0])
					8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8,8'd9:seg_out[7:0] = 8'b1100_0000;
					8'd10,8'd11,8'd12,8'd13,8'd14,8'd15,8'd16,8'd17,8'd18,8'd19:seg_out[7:0] = 8'b1111_1001;
					8'd20,8'd21,8'd22,8'd23,8'd24,8'd25,8'd26,8'd27,8'd28,8'd29:seg_out[7:0] = 8'b1010_0100;
					8'd30,8'd31,8'd32,8'd33,8'd34,8'd35,8'd36,8'd37,8'd38,8'd39:seg_out[7:0] = 8'b1011_0000;
					8'd40,8'd41,8'd42,8'd43,8'd44,8'd45,8'd46,8'd47,8'd48,8'd49:seg_out[7:0] = 8'b1001_1001;
					8'd50,8'd51,8'd52,8'd53,8'd54,8'd55,8'd56,8'd57,8'd58,8'd59:seg_out[7:0] = 8'b1001_0010;
					default:seg_out[7:0] = 8'hff;
				endcase
			end
			6'b111011:begin
				case(min_reg[7:0])
					8'd0,8'd10,8'd20,8'd30,8'd40,8'd50:seg_out[7:0] = 8'b1100_0000;
					8'd1,8'd11,8'd21,8'd31,8'd41,8'd51:seg_out[7:0] = 8'b1111_1001;
					8'd2,8'd12,8'd22,8'd32,8'd42,8'd52:seg_out[7:0] = 8'b1010_0100;
					8'd3,8'd13,8'd23,8'd33,8'd43,8'd53:seg_out[7:0] = 8'b1011_0000;
					8'd4,8'd14,8'd24,8'd34,8'd44,8'd54:seg_out[7:0] = 8'b1001_1001;
					8'd5,8'd15,8'd25,8'd35,8'd45,8'd55:seg_out[7:0] = 8'b1001_0010;
					8'd6,8'd16,8'd26,8'd36,8'd46,8'd56:seg_out[7:0] = 8'b1000_0010;
					8'd7,8'd17,8'd27,8'd37,8'd47,8'd57:seg_out[7:0] = 8'b1111_1000;
					8'd8,8'd18,8'd28,8'd38,8'd48,8'd58:seg_out[7:0] = 8'b1000_0000;
					8'd9,8'd19,8'd29,8'd39,8'd49,8'd59:seg_out[7:0] = 8'b1001_0000;
					default:seg_out[7:0] = 8'hff;
				endcase
			end
			6'b110111:begin
				case(min_reg[7:0])
					8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8,8'd9:seg_out[7:0] = 8'b1100_0000;
					8'd10,8'd11,8'd12,8'd13,8'd14,8'd15,8'd16,8'd17,8'd18,8'd19:seg_out[7:0] = 8'b1111_1001;
					8'd20,8'd21,8'd22,8'd23,8'd24,8'd25,8'd26,8'd27,8'd28,8'd29:seg_out[7:0] = 8'b1010_0100;
					8'd30,8'd31,8'd32,8'd33,8'd34,8'd35,8'd36,8'd37,8'd38,8'd39:seg_out[7:0] = 8'b1011_0000;
					8'd40,8'd41,8'd42,8'd43,8'd44,8'd45,8'd46,8'd47,8'd48,8'd49:seg_out[7:0] = 8'b1001_1001;
					8'd50,8'd51,8'd52,8'd53,8'd54,8'd55,8'd56,8'd57,8'd58,8'd59:seg_out[7:0] = 8'b1001_0010;
					default:seg_out[7:0] = 8'hff;
				endcase
			end
			6'b101111:begin
				case(hour_reg[7:0])
					8'd0,8'd10,8'd20:seg_out[7:0] = 8'b1100_0000;
					8'd1,8'd11,8'd21:seg_out[7:0] = 8'b1111_1001;
					8'd2,8'd12,8'd22:seg_out[7:0] = 8'b1010_0100;
					8'd3,8'd13,8'd23:seg_out[7:0] = 8'b1011_0000;
					8'd4,8'd14:seg_out[7:0] = 8'b1001_1001;
					8'd5,8'd15:seg_out[7:0] = 8'b1001_0010;
					8'd6,8'd16:seg_out[7:0] = 8'b1000_0010;
					8'd7,8'd17:seg_out[7:0] = 8'b1111_1000;
					8'd8,8'd18:seg_out[7:0] = 8'b1000_0000;
					8'd9,8'd19:seg_out[7:0] = 8'b1001_0000;
					default:seg_out[7:0] = 8'hff;
				endcase
			end
			6'b011111:begin
				case(hour_reg[7:0])
					8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8,8'd9:seg_out[7:0] = 8'b1100_0000;
					8'd10,8'd11,8'd12,8'd13,8'd14,8'd15,8'd16,8'd17,8'd18,8'd19:seg_out[7:0] = 8'b1111_1001;
					8'd20,8'd21,8'd22,8'd23:seg_out[7:0] = 8'b1010_0100;
					default:seg_out[7:0] = 8'hff;
				endcase
			end
			default:seg_out[7:0] = 8'hff;
		endcase
	end else if(time_clock_key[1])begin
		case(sel[5:0])
			6'b111110:begin
				case(sec_clock[7:0])
					8'd0,8'd10,8'd20,8'd30,8'd40,8'd50:seg_out[7:0] = 8'b1100_0000;
					8'd1,8'd11,8'd21,8'd31,8'd41,8'd51:seg_out[7:0] = 8'b1111_1001;
					8'd2,8'd12,8'd22,8'd32,8'd42,8'd52:seg_out[7:0] = 8'b1010_0100;
					8'd3,8'd13,8'd23,8'd33,8'd43,8'd53:seg_out[7:0] = 8'b1011_0000;
					8'd4,8'd14,8'd24,8'd34,8'd44,8'd54:seg_out[7:0] = 8'b1001_1001;
					8'd5,8'd15,8'd25,8'd35,8'd45,8'd55:seg_out[7:0] = 8'b1001_0010;
					8'd6,8'd16,8'd26,8'd36,8'd46,8'd56:seg_out[7:0] = 8'b1000_0010;
					8'd7,8'd17,8'd27,8'd37,8'd47,8'd57:seg_out[7:0] = 8'b1111_1000;
					8'd8,8'd18,8'd28,8'd38,8'd48,8'd58:seg_out[7:0] = 8'b1000_0000;
					8'd9,8'd19,8'd29,8'd39,8'd49,8'd59:seg_out[7:0] = 8'b1001_0000;
					default:seg_out[7:0] = 8'hff;
				endcase
			end
			6'b111101:begin
				case(sec_clock[7:0])
					8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8,8'd9:seg_out[7:0] = 8'b1100_0000;
					8'd10,8'd11,8'd12,8'd13,8'd14,8'd15,8'd16,8'd17,8'd18,8'd19:seg_out[7:0] = 8'b1111_1001;
					8'd20,8'd21,8'd22,8'd23,8'd24,8'd25,8'd26,8'd27,8'd28,8'd29:seg_out[7:0] = 8'b1010_0100;
					8'd30,8'd31,8'd32,8'd33,8'd34,8'd35,8'd36,8'd37,8'd38,8'd39:seg_out[7:0] = 8'b1011_0000;
					8'd40,8'd41,8'd42,8'd43,8'd44,8'd45,8'd46,8'd47,8'd48,8'd49:seg_out[7:0] = 8'b1001_1001;
					8'd50,8'd51,8'd52,8'd53,8'd54,8'd55,8'd56,8'd57,8'd58,8'd59:seg_out[7:0] = 8'b1001_0010;
					default:seg_out[7:0] = 8'hff;
				endcase
			end
			6'b111011:begin
				case(min_clock[7:0])
					8'd0,8'd10,8'd20,8'd30,8'd40,8'd50:seg_out[7:0] = 8'b1100_0000;
					8'd1,8'd11,8'd21,8'd31,8'd41,8'd51:seg_out[7:0] = 8'b1111_1001;
					8'd2,8'd12,8'd22,8'd32,8'd42,8'd52:seg_out[7:0] = 8'b1010_0100;
					8'd3,8'd13,8'd23,8'd33,8'd43,8'd53:seg_out[7:0] = 8'b1011_0000;
					8'd4,8'd14,8'd24,8'd34,8'd44,8'd54:seg_out[7:0] = 8'b1001_1001;
					8'd5,8'd15,8'd25,8'd35,8'd45,8'd55:seg_out[7:0] = 8'b1001_0010;
					8'd6,8'd16,8'd26,8'd36,8'd46,8'd56:seg_out[7:0] = 8'b1000_0010;
					8'd7,8'd17,8'd27,8'd37,8'd47,8'd57:seg_out[7:0] = 8'b1111_1000;
					8'd8,8'd18,8'd28,8'd38,8'd48,8'd58:seg_out[7:0] = 8'b1000_0000;
					8'd9,8'd19,8'd29,8'd39,8'd49,8'd59:seg_out[7:0] = 8'b1001_0000;
					default:seg_out[7:0] = 8'hff;
				endcase
			end
			6'b110111:begin
				case(min_clock[7:0])
					8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8,8'd9:seg_out[7:0] = 8'b1100_0000;
					8'd10,8'd11,8'd12,8'd13,8'd14,8'd15,8'd16,8'd17,8'd18,8'd19:seg_out[7:0] = 8'b1111_1001;
					8'd20,8'd21,8'd22,8'd23,8'd24,8'd25,8'd26,8'd27,8'd28,8'd29:seg_out[7:0] = 8'b1010_0100;
					8'd30,8'd31,8'd32,8'd33,8'd34,8'd35,8'd36,8'd37,8'd38,8'd39:seg_out[7:0] = 8'b1011_0000;
					8'd40,8'd41,8'd42,8'd43,8'd44,8'd45,8'd46,8'd47,8'd48,8'd49:seg_out[7:0] = 8'b1001_1001;
					8'd50,8'd51,8'd52,8'd53,8'd54,8'd55,8'd56,8'd57,8'd58,8'd59:seg_out[7:0] = 8'b1001_0010;
					default:seg_out[7:0] = 8'hff;
				endcase
			end
			6'b101111:begin
				case(hour_clock[7:0])
					8'd0,8'd10,8'd20:seg_out[7:0] = 8'b1100_0000;
					8'd1,8'd11,8'd21:seg_out[7:0] = 8'b1111_1001;
					8'd2,8'd12,8'd22:seg_out[7:0] = 8'b1010_0100;
					8'd3,8'd13,8'd23:seg_out[7:0] = 8'b1011_0000;
					8'd4,8'd14:seg_out[7:0] = 8'b1001_1001;
					8'd5,8'd15:seg_out[7:0] = 8'b1001_0010;
					8'd6,8'd16:seg_out[7:0] = 8'b1000_0010;
					8'd7,8'd17:seg_out[7:0] = 8'b1111_1000;
					8'd8,8'd18:seg_out[7:0] = 8'b1000_0000;
					8'd9,8'd19:seg_out[7:0] = 8'b1001_0000;
					default:seg_out[7:0] = 8'hff;
				endcase
			end
			6'b011111:begin
				case(hour_clock[7:0])
					8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8,8'd9:seg_out[7:0] = 8'b1100_0000;
					8'd10,8'd11,8'd12,8'd13,8'd14,8'd15,8'd16,8'd17,8'd18,8'd19:seg_out[7:0] = 8'b1111_1001;
					8'd20,8'd21,8'd22,8'd23:seg_out[7:0] = 8'b1010_0100;
					default:seg_out[7:0] = 8'hff;
				endcase
			end
			default:seg_out[7:0] = 8'hff;
		endcase
	end
end


endmodule


