module uart_top(clk,reset_n,rx_pin,tx_pin);
input clk;
input reset_n;
input  rx_pin;
output tx_pin;

wire      rx_ready;
wire [7:0]rx_data;
wire      rx_done;
reg       tx_start;
reg  [7:0]tx_data;
wire      tx_done;

parameter WAITTIME_IS_MAX = 50_000_000;
parameter [1:0]S_IDLE = 2'd0;
parameter [1:0]S_SEND = 2'd1;
parameter [1:0]S_WAIT = 2'd2;
reg [1:0]state;
reg [1:0]next_state;
reg [29:0]wait_cnt;
reg [4:0]tx_cnt;
reg [7:0]tx_str;

assign rx_ready = 1'b1;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		wait_cnt[29:0] <= {30{1'b0}};
	end else if(wait_cnt==WAITTIME_IS_MAX) begin
		wait_cnt[29:0] <= {30{1'b0}};
	end else if(state==S_WAIT)begin
		wait_cnt[29:0] <= wait_cnt[29:0] + 30'd1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		tx_cnt[4:0] <= 5'd0;
	end else if(tx_cnt==5'd13) begin
		tx_cnt[4:0] <= 5'd0;
	end else if((state==S_SEND) &&tx_done)begin
		tx_cnt[4:0] <= tx_cnt[4:0] + 5'd1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	case(tx_cnt)
		5'd0 :tx_str[7:0] <= "H";
		5'd1 :tx_str[7:0] <= "E";
		5'd2 :tx_str[7:0] <= "L";
		5'd3 :tx_str[7:0] <= "L";
		5'd4 :tx_str[7:0] <= "O";
		5'd5 :tx_str[7:0] <= " ";
		5'd6 :tx_str[7:0] <= "A";
		5'd7 :tx_str[7:0] <= "L";
		5'd8 :tx_str[7:0] <= "I";
		5'd9 :tx_str[7:0] <= "N";
		5'd10:tx_str[7:0] <= "X";
		5'd11:tx_str[7:0] <= "\r";
		5'd12:tx_str[7:0] <= "\n";
		default:tx_str[7:0] <= {8{1'b0}};
	endcase
end

always @ (*) begin
	if(!reset_n) begin
		tx_start <= 1'b0;
	end else if(state==S_SEND)begin
		tx_start <= 1'b1;
	end else if((state==S_WAIT)&&(rx_done)) begin
		tx_start <= 1'b1;
	end else begin
		tx_start <= 1'b0;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		tx_data[7:0] <= {8{1'b0}};
	end else if((state==S_WAIT) && rx_done)begin
		tx_data[7:0] <= rx_data[7:0];
	end else if(state==S_SEND)begin
		tx_data[7:0] <= tx_str[7:0];
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[1:0] <= S_IDLE[1:0];
	end else begin
		state[1:0] <= next_state[1:0];
	end
end


always @ (*) begin
	case(state)
		S_IDLE[1:0]:next_state[1:0] = S_SEND[1:0];
		S_SEND[1:0]:next_state[1:0] = ((tx_cnt==5'd12) && tx_done) ? S_WAIT[1:0] : S_SEND[1:0];
		S_WAIT[1:0]:next_state[1:0] = (wait_cnt==WAITTIME_IS_MAX)  ? S_IDLE[1:0] : S_WAIT[1:0];
		default:next_state[1:0] = S_IDLE[1:0];
	endcase
end


uart_rx rx0(
 .clk      (clk         ),
 .reset_n  (reset_n     ),
 .rx_pin   (rx_pin      ),
 .rx_ready (rx_ready    ),
 .rx_data  (rx_data[7:0]),
 .rx_done  (rx_done     )
);

uart_tx tx0(
 .clk      (clk          ),
 .reset_n  (reset_n      ),
 .tx_data  (tx_data[7:0] ),
 .tx_start (tx_start     ),
 .tx_pin   (tx_pin       ),
 .tx_done  (tx_done      )
);



endmodule
