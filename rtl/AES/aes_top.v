module aes_top(clk,reset_n,En,Wr,Addr,WrData,Data);
input            clk;
input            reset_n;
input            En;
input            Wr;
input      [31:0]Addr;
input      [31:0]WrData;
output reg [31:0]Data;

parameter [31:0] AES_BASE           = 32'h0000;
parameter [31:0] AES_KEY_0_REG      = AES_BASE + 32'h0000;  /// R/W
parameter [31:0] AES_KEY_1_REG      = AES_BASE + 32'h0004;  /// R/W
parameter [31:0] AES_KEY_2_REG      = AES_BASE + 32'h0008;  /// R/W
parameter [31:0] AES_KEY_3_REG      = AES_BASE + 32'h000c;  /// R/W
parameter [31:0] AES_KEY_4_REG      = AES_BASE + 32'h0010;  /// R/W
parameter [31:0] AES_KEY_5_REG      = AES_BASE + 32'h0014;  /// R/W
parameter [31:0] AES_KEY_6_REG      = AES_BASE + 32'h0018;  /// R/W
parameter [31:0] AES_KEY_7_REG      = AES_BASE + 32'h001c;  /// R/W
parameter [31:0] AES_TEXT_IN_0_REG  = AES_BASE + 32'h0020;  /// R/W
parameter [31:0] AES_TEXT_IN_1_REG  = AES_BASE + 32'h0024;  /// R/W
parameter [31:0] AES_TEXT_IN_2_REG  = AES_BASE + 32'h0028;  /// R/W
parameter [31:0] AES_TEXT_IN_3_REG  = AES_BASE + 32'h002c;  /// R/W
parameter [31:0] AES_TEXT_OUT_0_REG = AES_BASE + 32'h0030;  /// RO
parameter [31:0] AES_TEXT_OUT_1_REG = AES_BASE + 32'h0034;  /// RO
parameter [31:0] AES_TEXT_OUT_2_REG = AES_BASE + 32'h0038;  /// RO
parameter [31:0] AES_TEXT_OUT_3_REG = AES_BASE + 32'h003c;  /// RO
parameter [31:0] AES_MODE_REG       = AES_BASE + 32'h0040;  /// R/W
parameter [31:0] AES_START_REG      = AES_BASE + 32'h0048;  /// WO
parameter [31:0] AES_STATUS_REG     = AES_BASE + 32'h004C;  /// RO
parameter ST_IDLE = 1'b0;
parameter ST_WORK = 1'b1;

wire [2:0]core_mode;
wire [127:0]core_text_in;
wire [127:0]core_text_out;
wire [255:0]core_key;

reg state;
reg next_state;
wire core_trigger;
wire core_done;
wire status_reg;
wire [1:0]text_index;
wire [2:0]key_index;
wire rd_status;
wire wr_mode;
wire rd_mode;
wire wr_text_in;
wire rd_text_in;
wire rd_text_out;
wire wr_key;
wire rd_key;
wire wr_text_out;

reg [2:0]mode;
reg [127:0]text;
reg [255:0]key;

assign text_index[1:0] = Addr[3:2];
assign key_index [2:0] = Addr[4:2];

assign core_mode[2:0]      = mode[2:0];
assign core_text_in[127:0] = text[127:0]; 
assign core_key    [255:0] = key[255:0];
assign core_trigger = (Addr[31:0]==AES_START_REG[31:0]);
assign status_reg   = (state==ST_WORK);

assign wr_mode      = (state==ST_IDLE)&& En &&  Wr && (Addr[31:2]==AES_MODE_REG[31:2]);
assign wr_text_in   = (state==ST_IDLE)&& En &&  Wr && (Addr[31:4]==AES_TEXT_IN_0_REG[31:4]);
assign wr_key       = (state==ST_IDLE)&& En &&  Wr && (Addr[31:5]==AES_KEY_0_REG[31:5]);
assign wr_text_out  = (state==ST_IDLE)&& En &&  Wr && (Addr[31:4]==AES_TEXT_OUT_0_REG[31:4]);
assign rd_status    = En && (!Wr) && (Addr[31:2]==AES_STATUS_REG[31:2]);
assign rd_mode      = En && (!Wr) && (Addr[31:2]==AES_MODE_REG[31:2]);
assign rd_text_in   = En && (!Wr) && (Addr[31:4]==AES_TEXT_IN_0_REG[31:4]);
assign rd_key       = En && (!Wr) && (Addr[31:5]==AES_KEY_0_REG[31:5]);


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		mode[2:0] <= 3'd0;
	end else if(wr_mode) begin
		mode[2:0] <= WrData[2:0];
	end
end 


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		text[127:0] <= {4{32'h0}};
	end else if(wr_text_in) begin
		text[32*text_index[1:0] +: 32] <= WrData[31:0];
	end else if(wr_text_out)begin
		text[127:0] <= core_text_out[127:0]; 
	end
end 


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		key[255:0] <= {8{32'h0}};
	end else if(wr_key) begin
		key[32*key_index[2:0] +: 32] <= WrData[31:0];
	end
end 


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		Data[31:0] <= {32'h0};
	end else begin
		Data[31:0] <= (({32{rd_status}}&{31'h0,status_reg}) |
			       ({32{rd_mode  }}&{29'h0,mode[2:0]}) |
			       ({32{rd_key   }}&{key[32*key_index[2:0] +: 32]}) |
			       ({32{rd_text_in || rd_text_out}} & {text[32*text_index[1:0] +: 32]}) |
			       0);
	end
end 

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		state <= ST_IDLE;
	end else begin
		state <= next_state;
	end
end 


always @ (*) begin
	next_state = state;
	case(state)
		ST_IDLE:begin
			if(core_trigger)begin
				next_state = ST_WORK;
			end
		end
		ST_WORK:begin
			if(core_done)begin
				next_state = ST_IDLE;
			end 
		end
	endcase
end 




aes aes0(
 .clk      (clk          ),
 .reset_n  (reset_n      ),
 .start    (core_trigger ),
 .mode_in  (core_mode[2:0]    ),
 .text_in  (core_text_in ),
 .key_in   (core_key_in  ),
 .done     (core_done    ),
 .text_out (core_text_out)
);



endmodule
