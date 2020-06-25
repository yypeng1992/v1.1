module hour_clock (clk,reset_n,time_clock_key,mode_key,add_key,hour_en,hour_reg,hour_clock);
input           clk;
input           reset_n;
input      [1:0]time_clock_key;
input      [2:0]mode_key;
input      [2:0]add_key;
input           hour_en;
output reg [7:0]hour_reg;
output reg [7:0]hour_clock;

parameter HOUR_IS_MAX = 5;



always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		hour_reg[7:0] <= {8{1'b0}};
	end else begin
		if((hour_reg>=HOUR_IS_MAX-1) && hour_en) begin
			hour_reg[7:0] <= {8{1'b0}};
		end else if(mode_key[2] && add_key[0])begin
			if(hour_reg>=HOUR_IS_MAX-1)begin
				hour_reg[7:0] <= {8{1'b0}};
			end else begin
				hour_reg[7:0] <= hour_reg[7:0] + 1'b1;
			end
		end else if(mode_key[2] && add_key[1])begin
			if(hour_reg>=HOUR_IS_MAX-1)begin
				hour_reg[7:0] <= {8{1'b0}};
			end else if(hour_reg[7:0]==8'd0)begin
				hour_reg[7:0] <= HOUR_IS_MAX-1;
			end else begin
				hour_reg[7:0] <= hour_reg[7:0] - 1'b1;
			end
		end else if(mode_key[2] && add_key[2])begin
			if(hour_reg>=HOUR_IS_MAX-1)begin
				hour_reg[7:0] <= {8{1'b0}};
			end else begin
				hour_reg[7:0] <= hour_reg[7:0] + 1'b1;
			end
		end else if(hour_en)begin
			hour_reg[7:0] <= hour_reg[7:0] + 1'b1;
		end
	end 
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		hour_clock[7:0] <= {8{1'b0}};
	end else if(time_clock_key[1]) begin
		 if(mode_key[2] && add_key[0])begin
			if(hour_clock>=HOUR_IS_MAX-1)begin
				hour_clock[7:0] <= {8{1'b0}};
			end else begin
				hour_clock[7:0] <=hour_clock[7:0] + 1'b1;
			end
		end else if(mode_key[2] && add_key[1])begin
			if(hour_clock>=HOUR_IS_MAX-1)begin
				hour_clock[7:0] <= {8{1'b0}};
			end else if(hour_clock==8'd0)begin
				hour_clock[7:0] <= HOUR_IS_MAX-1;
			end else begin
				hour_clock[7:0] <=hour_clock[7:0] - 1'b1;
			end
		end else if(mode_key[2] && add_key[2])begin
			if(hour_clock>=HOUR_IS_MAX-1)begin
				hour_clock[7:0] <= {8{1'b0}};
			end else begin
				hour_clock[7:0] <=hour_clock[7:0] + 1'b1;
			end
		end
	end
end



endmodule
