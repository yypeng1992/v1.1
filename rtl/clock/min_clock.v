module min_clock(clk,reset_n,time_clock_key,mode_key,add_key,min_en,min_reg,min_clock,hour_en);
input           clk;
input           reset_n;
input      [1:0]time_clock_key;
input      [2:0]mode_key;
input      [2:0]add_key;
input           min_en;
output reg [7:0]min_reg;
output reg [7:0]min_clock; 
output          hour_en;

parameter MIN_IS_MAX = 6;
assign hour_en = (min_reg==MIN_IS_MAX-1)&&(min_en) && (time_clock_key[0]);


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		min_reg[7:0] <= {8{1'b0}};
	end else  begin
		if((min_reg>=MIN_IS_MAX-1) && (min_en))begin
			min_reg[7:0] <= {8{1'b0}};
		end else if(mode_key[1]&&add_key[0])begin
			if(min_reg>=MIN_IS_MAX-1)begin
				min_reg[7:0] <= {8{1'b0}};
			end else begin				
				min_reg[7:0] <= min_reg[7:0] + 1'b1;
			end
		end else if(mode_key[1]&&add_key[1])begin
			if(min_reg==8'd0)begin
				min_reg[7:0] <= MIN_IS_MAX-1;
			end else begin
				min_reg[7:0] <= min_reg[7:0] - 1'b1;
			end
		end else if(mode_key[1]&&add_key[2])begin
			if(min_reg>=MIN_IS_MAX-1)begin
				min_reg[7:0] <= {8{1'b0}};
			end else begin
				min_reg[7:0] <= min_reg[7:0] + 1'b1;
			end 

		end else if(min_en)begin
			min_reg[7:0] <= min_reg[7:0] + 1'b1;
		end
	end

end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		min_clock[7:0] <= {8{1'b0}};
	end else if(time_clock_key[1]) begin
		if(mode_key[1] && add_key[0])begin
			if(min_clock >= MIN_IS_MAX-1)begin
				min_clock[7:0] <= {8{1'b0}};
			end else begin
				min_clock[7:0] <=min_clock[7:0] + 1'b1;
			end
		end else if(mode_key[1] && add_key[1])begin
			if(min_clock == 8'd0)begin
				min_clock[7:0] <= MIN_IS_MAX-1;
			end else begin
				min_clock[7:0] <=min_clock[7:0] - 1'b1;
			end
		end else if(mode_key[1] && add_key[2])begin
			if(min_clock >= MIN_IS_MAX-1)begin
				min_clock[7:0] <= {8{1'b0}};
			end else begin
				min_clock[7:0] <=min_clock[7:0] + 1'b1;
			end
		end 
	end
end

endmodule
