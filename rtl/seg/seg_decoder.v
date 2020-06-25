module seg_decoder(clk,reset_n,sel,dig);
input           clk;
input           reset_n;
output       [5:0]sel;
output reg [7:0]dig;

wire en0;
wire en1;
wire en2;
wire en3;
wire en4;
wire [3:0]seg0_dig;
wire [3:0]seg1_dig;
wire [3:0]seg2_dig;
wire [3:0]seg3_dig;
wire [3:0]seg4_dig;
wire [3:0]seg5_dig;


always @ (posedge clk or negedge reset_n) begin
	if(!sel[0])begin
		case(seg0_dig)
			4'd0:dig[7:0] <= 8'b1100_0000;
			4'd1:dig[7:0] <= 8'b1111_1001;
			4'd2:dig[7:0] <= 8'b1010_0100;
			4'd3:dig[7:0] <= 8'b1011_0000;
			4'd4:dig[7:0] <= 8'b1001_1001;
			4'd5:dig[7:0] <= 8'b1001_0010;
			4'd6:dig[7:0] <= 8'b1000_0010;
			4'd7:dig[7:0] <= 8'b1111_1000;
			4'd8:dig[7:0] <= 8'b1000_0000;
			4'd9:dig[7:0] <= 8'b1001_0000;
			default:dig[7:0] <= 8'b0000_0000;
		endcase
	end else if(!sel[1])begin
		case(seg1_dig)
			4'd0:dig[7:0] <= 8'b1100_0000;
			4'd1:dig[7:0] <= 8'b1111_1001;
			4'd2:dig[7:0] <= 8'b1010_0100;
			4'd3:dig[7:0] <= 8'b1011_0000;
			4'd4:dig[7:0] <= 8'b1001_1001;
			4'd5:dig[7:0] <= 8'b1001_0010;
			4'd6:dig[7:0] <= 8'b1000_0010;
			4'd7:dig[7:0] <= 8'b1111_1000;
			4'd8:dig[7:0] <= 8'b1000_0000;
			4'd9:dig[7:0] <= 8'b1001_0000;
			default:dig[7:0] <= 8'b0000_0000;
		endcase
	end else if(!sel[2])begin
		case(seg2_dig)
			4'd0:dig[7:0] <= 8'b1100_0000;
			4'd1:dig[7:0] <= 8'b1111_1001;
			4'd2:dig[7:0] <= 8'b1010_0100;
			4'd3:dig[7:0] <= 8'b1011_0000;
			4'd4:dig[7:0] <= 8'b1001_1001;
			4'd5:dig[7:0] <= 8'b1001_0010;
			4'd6:dig[7:0] <= 8'b1000_0010;
			4'd7:dig[7:0] <= 8'b1111_1000;
			4'd8:dig[7:0] <= 8'b1000_0000;
			4'd9:dig[7:0] <= 8'b1001_0000;
			default:dig[7:0] <= 8'b0000_0000;
		endcase
	end else if(!sel[3])begin
		case(seg3_dig)
			4'd0:dig[7:0] <= 8'b1100_0000;
			4'd1:dig[7:0] <= 8'b1111_1001;
			4'd2:dig[7:0] <= 8'b1010_0100;
			4'd3:dig[7:0] <= 8'b1011_0000;
			4'd4:dig[7:0] <= 8'b1001_1001;
			4'd5:dig[7:0] <= 8'b1001_0010;
			4'd6:dig[7:0] <= 8'b1000_0010;
			4'd7:dig[7:0] <= 8'b1111_1000;
			4'd8:dig[7:0] <= 8'b1000_0000;
			4'd9:dig[7:0] <= 8'b1001_0000;
			default:dig[7:0] <= 8'b0000_0000;
		endcase
	end else if(!sel[4])begin
		case(seg4_dig)
			4'd0:dig[7:0] <= 8'b1100_0000;
			4'd1:dig[7:0] <= 8'b1111_1001;
			4'd2:dig[7:0] <= 8'b1010_0100;
			4'd3:dig[7:0] <= 8'b1011_0000;
			4'd4:dig[7:0] <= 8'b1001_1001;
			4'd5:dig[7:0] <= 8'b1001_0010;
			4'd6:dig[7:0] <= 8'b1000_0010;
			4'd7:dig[7:0] <= 8'b1111_1000;
			4'd8:dig[7:0] <= 8'b1000_0000;
			4'd9:dig[7:0] <= 8'b1001_0000;
			default:dig[7:0] <= 8'b0000_0000;
		endcase
	end else if(!sel[5])begin
		case(seg5_dig)
			4'd0:dig[7:0] <= 8'b1100_0000;
			4'd1:dig[7:0] <= 8'b1111_1001;
			4'd2:dig[7:0] <= 8'b1010_0100;
			4'd3:dig[7:0] <= 8'b1011_0000;
			4'd4:dig[7:0] <= 8'b1001_1001;
			4'd5:dig[7:0] <= 8'b1001_0010;
			4'd6:dig[7:0] <= 8'b1000_0010;
			4'd7:dig[7:0] <= 8'b1111_1000;
			4'd8:dig[7:0] <= 8'b1000_0000;
			4'd9:dig[7:0] <= 8'b1001_0000;
			default:dig[7:0] <= 8'b0000_0000;
		endcase
	end else begin
		dig[7:0] <= 8'b0000_0000;
	end
end


seg0 seg0(
 .clk     (clk       ),
 .reset_n (reset_n   ),
 .seg0_dig(seg0_dig      ),
 .en0     (en0       )
);

seg1 seg1(
 .clk       (clk       ),
 .reset_n   (reset_n   ),
 .en_from_0 (en0       ),
 .seg1_dig  (seg1_dig      ),
 .en1       (en1       )
);

seg2 seg2(
 .clk       (clk       ),
 .reset_n   (reset_n   ),
 .en_from_1 (en1       ),
 .seg2_dig      (seg2_dig      ),
 .en2       (en2       )
);

seg3 seg3(
 .clk       (clk       ),
 .reset_n   (reset_n   ),
 .en_from_2 (en2       ),
 .seg3_dig      (seg3_dig      ),
 .en3       (en3       )
);

seg4 seg4(
 .clk       (clk       ),
 .reset_n   (reset_n   ),
 .en_from_3 (en3       ),
 .seg4_dig      (seg4_dig      ),
 .en4       (en4       )
);

seg5 seg5(
 .clk       (clk       ),
 .reset_n   (reset_n   ),
 .en_from_4 (en4       ),
 .seg5_dig      (seg5_dig     )
);

seg_top top(
 .clk       (clk       ),
 .reset_n   (reset_n   ),
 .sel       (sel       )
);

endmodule
