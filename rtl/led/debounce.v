module debounce(
input clk,
input rst,
input key_in,
output key_out
);

parameter TIME_10MS=50;
reg [27:0] cnt0;
reg [27:0] cnt1;
reg sync_data;
wire cnt0_is_max;
wire cnt1_is_max;
assign cnt0_is_max = (cnt0[27:0] == TIME_10MS);
assign cnt1_is_max = (cnt1[27:0] == TIME_10MS);

always @ (posedge clk or negedge rst) begin
	if (!rst) begin
		cnt0[27:0] <= 28'b0;
	end else if (key_in==1'b1) begin
		cnt0[27:0] <= 28'b0;
	end else if (cnt1_is_max) begin 
		cnt0[27:0] <= 28'b0;
	end else /* if(cnt0[27:0] != TIME_10MS) */ begin /// 这里的else if已经不需要了，只使用else就好！
		cnt0[27:0] <= cnt0[27:0] + 1'b1;
	end
end

always @ (posedge clk or negedge rst) begin
	if (!rst) begin
		cnt1[27:0] <= 28'b0;
	end else if (key_in==1'b0) begin
		cnt1[27:0] <= 28'b0;
	end else if (cnt0_is_max) begin 
		cnt1[27:0] <= 28'b0;
	end else /* if(cnt0[27:0] != TIME_10MS) */ begin /// 这里的else if已经不需要了，只是用else就好！
		cnt1[27:0] <= cnt1[27:0] + 1'b1;
	end
end


/// 你这信号名字起得很是奇怪，与真实意义没有关联！
/// 修改成同步之后的信号 sync_data 就挺好。
always @ (posedge clk or negedge rst) begin
	if (!rst) begin
		sync_data <= 1'b1; /// 这里写法只适用于当按键按下为0的情况，更好的方法是，根据参数选择是什么默认值！
		/// 看看我的消抖模块里面是怎样写的，积累成自己的东西
	end else if (cnt0_is_max) begin
		sync_data <= 1'b0;
	end else if (cnt1_is_max) begin
		sync_data <= 1'b1;
	end 
end

/***
这段代码不属于消抖范畴，从当前模块删除掉，移到另一个模块去做！
reg sync_data_delay;

always @ (posedge clk or negedge rst) begin
	if (!rst) begin
		sync_data_delay <= 1'b1; /// 这里写法只适用于当按键按下为0的情况，更好的方法是，根据参数选择是什么默认值！
	end else begin
		sync_data_delay <= sync_data;
	end
end

assign key_out = ~((~sync_data) && sync_data_delay);
***/

assign key_out = sync_data;

endmodule
