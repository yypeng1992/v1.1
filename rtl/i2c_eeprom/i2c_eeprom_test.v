module i2c_eeprom_test(clk,reset_n,i2c_eeprom_scl,i2c_eeprom_sda,key_in,sel,seg);
input       clk;
input       reset_n;
output      i2c_eeprom_scl;
inout       i2c_eeprom_sda;
input       key_in;
output [5:0]sel;
output [7:0]seg;

wire       key;
reg   [7:0]wdata_in;
wire  [7:0]rdata;
wire       i2c_write_req;
wire       i2c_read_req ;
wire       i2c_write_ack;
wire       i2c_read_ack ;
reg  [7:0]read_data;
wire [7:0]wr_dev_addr;
wire [7:0]wr_reg_addr;
wire [7:0]rd_dev_addr;
wire [7:0]rd_reg_addr;

assign wr_dev_addr[7:0] = 8'b10100000;
assign wr_reg_addr[7:0] = 8'd1;
assign rd_dev_addr[7:0] = 8'b10100001;
assign rd_reg_addr[7:0] = 8'd1;

parameter DELAY_TIME   = 3;
parameter [1:0]T_IDLE  = 2'd0;
parameter [1:0]T_READ  = 2'd1;
parameter [1:0]T_WAIT  = 2'd2;
parameter [1:0]T_WRITE = 2'd3;
reg [1:0]state;
reg [1:0]next_state;
reg [19:0]delay_cnt;


assign i2c_write_req = (state==T_WRITE);
assign i2c_read_req  = (state==T_READ );




always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		read_data[7:0] <= 8'hff; 
	end else if(state==T_READ)begin
		read_data[7:0] <=rdata[7:0];
	end else if((state==T_WAIT)&&key) begin
		read_data[7:0] <=read_data[7:0] + 8'd1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		wdata_in[7:0] <= {8{1'b0}};
	end else if(state==T_WRITE)begin
		wdata_in[7:0] <= read_data[7:0];
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		delay_cnt[19:0] <= {20{1'b0}};
	end else if(delay_cnt==DELAY_TIME)begin
		delay_cnt[19:0] <= {20{1'b0}};
	end else if(state==T_IDLE)begin
		delay_cnt[19:0] <= delay_cnt[19:0] + 20'd1;
	end
end


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state[1:0] <= T_IDLE[1:0];
	end else begin
		state[1:0] <= next_state[1:0];
	end
end


always @ (*) begin
	case(state[1:0])
		T_IDLE[1:0]:begin
			if(delay_cnt==DELAY_TIME)begin
				next_state[1:0] = T_READ[1:0];
			end else begin
				next_state[1:0] = T_IDLE[1:0];
			end
		end
		T_READ[1:0]:next_state[1:0] = i2c_read_ack ? T_WAIT[1:0] : T_READ[1:0];
		T_WAIT[1:0]:next_state[1:0] = key     ? T_WRITE[1:0]: T_WAIT[1:0];
		T_WRITE[1:0]:next_state[1:0]= i2c_write_ack ? T_READ[1:0] : T_WRITE[1:0];
		default:next_state[1:0] = T_IDLE[1:0];
	endcase
end

debounce_for_i2c debounce(
 .clk    (clk     ),
 .reset_n(reset_n ),
 .key_in (key_in  ),
 .key    (key     )
);

master master0(
 .clk           (clk          ),
 .reset_n       (reset_n      ),
 .wr_data       (wdata_in[7:0]),
 .rd_data       (rdata[7:0]   ),
 .scl           (i2c_eeprom_scl),
 .sda           (i2c_eeprom_sda),
 .wd_req        (i2c_write_req),
 .rd_req        (i2c_read_req ),
 .wr_ack        (i2c_write_ack),
 .rd_ack        (i2c_read_ack ),
 .wr_reg_addr   (wr_reg_addr[7:0]),
 .rd_reg_addr   (rd_reg_addr[7:0])
);

seg_for_i2c seg1(
 .clk          (clk      ),
 .reset_n      (reset_n  ),
 .data         (rdata[7:0]),
 .sel          (sel[5:0] ),
 .seg_out      (seg[7:0] )
);






endmodule
