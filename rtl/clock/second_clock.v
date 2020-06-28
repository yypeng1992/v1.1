module second_clock(clk,reset_n,time_clock_key,mode_key,add_key,sec_reg,sec_clock,min_en);
input          clk;
input          reset_n;
input     [1:0]time_clock_key;
input     [2:0]mode_key;
input     [2:0]add_key;
output    [7:0]sec_reg;
output reg[7:0]sec_clock;
output         min_en;

parameter TIME_IS_1S = 5;
parameter SEC_IS_MAX = 6;
reg [29:0]sec_count;
reg [7:0]sec_reg_temp;


assign min_en = (sec_reg_temp==SEC_IS_MAX-1)&&(sec_count==TIME_IS_1S-1) && (time_clock_key[0]);
assign sec_reg = sec_reg_temp;

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		sec_count[29:0] <= {30{1'b0}};
	end else begin
		 if((sec_count==TIME_IS_1S-1) || add_key[0]) begin
			sec_count[29:0] <= {30{1'b0}};
		end else begin
			sec_count[29:0] <= sec_count[29:0] + 1'b1;
		end
	end
end



always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		sec_reg_temp[7:0] <= {8{1'b0}};
	end else  begin
		if((sec_reg_temp>=SEC_IS_MAX-1)&&(sec_count==TIME_IS_1S-1)) begin
			sec_reg_temp[7:0] <= {8{1'b0}};
		end else if(mode_key[0]&&add_key[0])begin
			if(sec_reg_temp>=SEC_IS_MAX-1)begin
				sec_reg_temp[7:0] <= {8{1'b0}};
			end else begin
				sec_reg_temp[7:0] <= sec_reg_temp[7:0] + 1'b1;
			end
		end else if(mode_key[0]&&add_key[1])begin
			if(sec_reg_temp==8'd0)begin
				sec_reg_temp[7:0] <= SEC_IS_MAX-1;
			end else begin			
				sec_reg_temp[7:0] <= sec_reg_temp[7:0] - 1'b1;
			end
		end else if(mode_key[0]&&add_key[2])begin
			if(sec_reg_temp>=SEC_IS_MAX-1)begin
				sec_reg_temp[7:0] <= {8{1'b0}};
			end else begin
				sec_reg_temp[7:0] <= sec_reg_temp[7:0] + 1'b1;
			end
		 end else if(sec_count==TIME_IS_1S-1) begin
		 	sec_reg_temp[7:0] <= sec_reg_temp[7:0] + 1'b1;
		end
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		sec_clock[7:0] <= {8{1'b0}};
	end else if(time_clock_key[1]) begin
		if(mode_key[0])begin
			case(add_key[2:0])
				3'b001:sec_clock[7:0] <= (sec_clock>=SEC_IS_MAX-1) ? 8'd0 : (sec_clock[7:0] + 1'b1) ;
				3'b010:sec_clock[7:0] <= (sec_clock==8'd0)         ? SEC_IS_MAX-1 : (sec_clock[7:0] - 1'b1) ;
				3'b100:sec_clock[7:0] <= (sec_clock>=SEC_IS_MAX-1) ? 8'd0 : (sec_clock[7:0] + 1'b1) ;
			endcase
		end
	end
end
endmodule
