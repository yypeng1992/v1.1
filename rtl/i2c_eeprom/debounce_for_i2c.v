module debounce_for_i2c(clk,reset_n,key_in,key);
input      clk;
input      reset_n;
input      key_in;
output     key;

parameter KEEP_TIME = 3;
reg [14:0]cnt0;
reg [14:0]cnt1;
wire       flag0;
wire       flag1;
reg        out;
reg        out_d;
assign flag0 = (cnt0[14:0]==KEEP_TIME);
assign flag1 = (cnt1[14:0]==KEEP_TIME);


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		cnt0[14:0] <= {15{1'b0}};
	end else if(key_in) begin
		cnt0[14:0] <= {15{1'b0}};
	end else if(flag1)begin
		cnt0[14:0] <= {15{1'b0}};
	end else if(!key_in) begin
		cnt0[14:0] <= cnt0[14:0] + 1'b1;
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		cnt1[14:0] <= {15{1'b0}};
	end else if(!key_in) begin
		cnt1[14:0] <= {15{1'b0}};
	end else if(flag0)begin
		cnt1[14:0] <= {15{1'b0}};
	end else if(key_in) begin
		cnt1[14:0] <= cnt1[14:0] + 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		out <= 1'b1;
	end else if(flag0) begin
		out <= 1'b0;
	end else if(flag1) begin
		out <= 1'b1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		out_d <= 1'b1;
	end else begin
		out_d <= out;
	end
end

assign key = (~out) && out_d;

endmodule
