module aes(clk,reset_n,start,mode_in,text_in,key_in,done,text_out);
input         clk;
input         reset_n;
input         start;
input  [2  :0]mode_in; ///[2]:192; [1]: H=256, L=128. [0]: H=decryption, L=encryption.
input  [127:0]text_in;
input  [255:0]key_in;
output reg    done;
output [127:0]text_out;

reg [4:0]cnt;
reg [4:0]count;
reg [127:0]state;
reg [127:0]after_subbytes;
reg [127:0]after_shiftrows;
reg [127:0]after_mixcolumns;

reg [255:0]key;
reg [31:0]tempt_w3_move;
wire [31:0]tempt_w3;
reg [31:0]down_w3_new;
reg [31:0]up_w3_new;
reg [191:0]key_d;
reg [31:0]new_key_w0;

localparam [2:0] AES_128_EN_MODE = 3'b000;
localparam [2:0] AES_128_DE_MODE = 3'b001;
localparam [2:0] AES_256_EN_MODE = 3'b010;
localparam [2:0] AES_256_DE_MODE = 3'b011;
localparam [2:0] AES_192_EN_MODE = 3'b100;
localparam [2:0] AES_192_DE_MODE = 3'b101;

parameter [3:0]ST_IDLE       = 4'd0;
parameter [3:0]ST_128_EN     = 4'd1;
parameter [3:0]ST_128_DE_PRE = 4'd2;
parameter [3:0]ST_128_DE     = 4'd3;
parameter [3:0]ST_256_EN     = 4'd4;
parameter [3:0]ST_256_DE_PRE = 4'd5;
parameter [3:0]ST_256_DE     = 4'd6;
parameter [3:0]ST_192_EN     = 4'd7;
parameter [3:0]ST_192_DE_PRE = 4'd8;
parameter [3:0]ST_192_DE     = 4'd9;
reg [3:0]fsm_cs;
reg [3:0]fsm_ns;

//TODO : key_d should not exist.
always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		key_d[191:0] <= {192{1'b0}};
	end else if((fsm_cs==ST_192_EN)||(fsm_cs==ST_192_DE)) begin
		key_d[191:0] <= key[191:0];
	end else begin
		key_d[191:0] <= {192{1'b0}};
	end
end 

///////////////////////////////////////
/// fsm
///////////////////////////////////////
always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		fsm_cs[3:0] <= ST_IDLE[3:0];
	end else begin
		fsm_cs[3:0] <= fsm_ns[3:0];
	end
end 
always @ (*) begin
	fsm_ns[3:0] = fsm_cs[3:0];
	case(fsm_cs[3:0])
		ST_IDLE[3:0]:begin
			if(start )begin
				case(mode_in)
					AES_128_EN_MODE : fsm_ns[3:0] = ST_128_EN[3:0];
					AES_128_DE_MODE : fsm_ns[3:0] = ST_128_DE_PRE[3:0];
					AES_256_EN_MODE : fsm_ns[3:0] = ST_256_EN[3:0];
					AES_256_DE_MODE : fsm_ns[3:0] = ST_256_DE_PRE[3:0];
					AES_192_EN_MODE : fsm_ns[3:0] = ST_192_EN[3:0];
					AES_192_DE_MODE : fsm_ns[3:0] = ST_192_DE_PRE[3:0];
					default:fsm_ns[3:0] = ST_IDLE[3:0];
				endcase
			end
		end
		ST_128_EN[3:0]:begin
			if(cnt==10)begin
				fsm_ns[3:0] = ST_IDLE[3:0];
			end
		end
		ST_128_DE_PRE[3:0]:begin
			if(cnt==9)begin
				fsm_ns[3:0] = ST_128_DE[3:0];
			end
		end
		ST_256_EN[3:0]:begin
			if(cnt==14)begin
				fsm_ns[3:0] = ST_IDLE[3:0];
			end
		end
		ST_256_DE_PRE[3:0]:begin
			if(cnt==7)begin
				fsm_ns[3:0] = ST_256_DE[3:0];
			end
		end
		ST_128_DE[3:0]:begin
			if(cnt==10)begin
				fsm_ns[3:0] = ST_IDLE[3:0];
			end
		end
		ST_256_DE[3:0]:begin
			if(cnt==14)begin
				fsm_ns[3:0] = ST_IDLE[3:0];
			end
		end
		ST_192_EN[3:0]:begin
			if(cnt==12)begin
				fsm_ns[3:0] = ST_IDLE[3:0];
			end
		end
		ST_192_DE_PRE[3:0]:begin
			if(cnt==7)begin
				fsm_ns[3:0] = ST_192_DE[3:0];
			end
		end
		ST_192_DE[3:0]:begin
			if(cnt==12)begin
				fsm_ns[3:0] = ST_IDLE[3:0];
			end
		end
	endcase
end 

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		done <= 1'b0;
	end else if((fsm_cs!=ST_IDLE)&&(fsm_ns==ST_IDLE)) begin
		done <= 1'b1;
	end else begin
		done <= 1'b0;
	end
end 
assign text_out[127:0] = done ? state[127:0] : 128'd0;

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n)begin
		count[4:0] <= {5{1'b0}};
	end else if(fsm_cs!=fsm_ns)begin
		count[4:0] <= {5{1'b0}};
	end else if(count==8)begin
		count[4:0] <= {5{1'b0}};
	end else if(((fsm_cs==ST_192_EN)&&(((cnt==0)||(cnt==2)||(cnt==3)||(cnt==5)||(cnt==6)||(cnt==8)||(cnt==9)||(cnt==11))))) begin
		count[4:0] <= count[4:0] + 1'b1;
	end else if((fsm_cs==ST_192_DE) && ((cnt==0)||(cnt==2)||(cnt==3)||(cnt==5)||(cnt==6)||(cnt==8)||(cnt==9)||(cnt==11))) begin
		count[4:0] <= count[4:0] + 1'b1;
	end
end 

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		cnt[4:0] <= 4'd0;
	end else if((fsm_cs==ST_IDLE[3:0]) || (fsm_ns!=fsm_cs))begin
		cnt[4:0] <= 4'd0;
	end else begin
		cnt[4:0] <= cnt[4:0] + 4'd1;
	end
end

always @ (*) begin
	if((fsm_cs==ST_128_DE)||(fsm_cs==ST_256_DE)) begin
		down_w3_new[31:0] = key[63 :32] ^ key[31 :0 ] ;
	end else if(fsm_cs==ST_192_DE)begin
		down_w3_new[31:0] = key[31 :0  ] ^ key[63 :32 ];
	end else begin
		down_w3_new[31:0] = {32{1'b0}};
	end
end 

always @ (*) begin
	if(fsm_cs==ST_256_EN) begin
		up_w3_new[31:0] = key[159:128] ^ (key[191:160] ^ (key[223:192] ^ (new_key_w0[31:0])));
	end else if(fsm_cs==ST_256_DE_PRE)begin
		up_w3_new[31:0] = key[159:128] ^ (key[191:160] ^ (key[223:192] ^ (new_key_w0[31:0])));
	end else if(fsm_cs==ST_256_DE)begin
		up_w3_new[31:0] = key[159:128];
	end else begin
		up_w3_new[31:0] = {32{1'b0}};
	end
end 

always @ (*)begin
	if((fsm_cs==ST_128_EN)||(fsm_cs==ST_128_DE_PRE)||(fsm_cs==ST_256_EN)||(fsm_cs==ST_256_DE_PRE)||(fsm_cs==ST_192_EN)||(fsm_cs==ST_192_DE_PRE)) begin
		tempt_w3_move[31:0] = {key[23:0],key[31:24]};
	end else if((fsm_cs==ST_128_DE)||(fsm_cs==ST_256_DE) ||(fsm_cs==ST_192_DE)) begin
		tempt_w3_move[31:0] = {down_w3_new[23:0],down_w3_new[31:24]};
	end else begin
		tempt_w3_move[31:0] = {32{1'b0}};
	end
end
assign tempt_w3[31:0] = {SBOX(tempt_w3_move[31:24]),SBOX(tempt_w3_move[23:16]),SBOX(tempt_w3_move[15:8]),SBOX(tempt_w3_move[7:0])};


always @ (*) begin
	if((fsm_cs==ST_128_EN)||(fsm_cs==ST_128_DE_PRE))begin
		new_key_w0[31:0] = key[127:96] ^  RCON(cnt) ^ tempt_w3[31:0];
	end else if((fsm_cs==ST_256_EN ) && (cnt[0])) begin
		new_key_w0[31:0] = key[255:224] ^  RCON(cnt>>1) ^ tempt_w3[31:0];
	end else if((fsm_cs==ST_256_DE_PRE) && (fsm_ns!=ST_256_DE))begin
		new_key_w0[31:0] = key[255:224] ^  RCON(cnt) ^ tempt_w3[31:0];
	end else if((fsm_cs==ST_192_EN) && ((cnt==0)||(cnt==2)||(cnt==3)||(cnt==5)||(cnt==6)||(cnt==8)||(cnt==9)||(cnt==11)))begin
		new_key_w0[31:0] = key[191:160] ^ tempt_w3[31:0] ^ RCON(count);
	end else if(fsm_cs==ST_192_DE_PRE)begin
		new_key_w0[31:0] = key[191:160] ^ tempt_w3[31:0] ^ RCON(cnt);
	
	end else begin
		new_key_w0[31:0] = {32{1'b0}};
	end
end 

always @ (posedge clk or reset_n) begin
	if(!reset_n) begin
		key[255:0] <= {256{1'b0}};
	end else if(start )begin
		key[255:0] <= key_in[255:0];
	end else if ((fsm_cs==ST_128_EN)||(fsm_cs==ST_128_DE_PRE)) begin
		key[127:96] <= new_key_w0[31:0]; 
		key[95 :64] <= key[95 :64] ^  (new_key_w0[31:0]);
		key[63 :32] <= key[63 :32] ^  (key[95 :64] ^  (new_key_w0[31:0]));
		key[31 :0 ] <= key[31 :0 ] ^  (key[63 :32] ^  (key[95 :64] ^  (new_key_w0[31:0])));
	end else if(fsm_cs==ST_128_DE)begin
		key[127:96] <= key[127:96] ^ RCON(9-cnt) ^ tempt_w3[31:0];
		key[95 :64] <= key[95 :64] ^ key[127:96];
		key[63 :32] <= key[63 :32] ^ key[95 :64];
		key[31 :0 ] <= key[31 :0 ] ^ key[63 :32];
	end else if ((fsm_cs==ST_256_EN ) && (cnt[0])) begin
		key[255:224] <= new_key_w0[31:0];
		key[223:192] <= key[223:192] ^ (new_key_w0[31:0]);
		key[191:160] <= key[191:160] ^ (key[223:192] ^ (new_key_w0[31:0]));
		key[159:128] <= key[159:128] ^ (key[191:160] ^ (key[223:192] ^ (new_key_w0[31:0])));
		key[127:96 ] <= key[127:96] ^ {SBOX(up_w3_new[31:24]),SBOX(up_w3_new[23:16]),SBOX(up_w3_new[15:8]),SBOX(up_w3_new[7:0])};
		key[95 :64 ] <= key[95 :64] ^ (key[127:96] ^ {SBOX(up_w3_new[31:24]),SBOX(up_w3_new[23:16]),SBOX(up_w3_new[15:8]),SBOX(up_w3_new[7:0])}); 
		key[63 :32 ] <= key[63 :32] ^ (key[95 :64] ^ (key[127:96] ^ {SBOX(up_w3_new[31:24]),SBOX(up_w3_new[23:16]),SBOX(up_w3_new[15:8]),SBOX(up_w3_new[7:0])}));
		key[31 :0  ] <= key[31 :0 ] ^ (key[63 :32] ^ (key[95 :64] ^ (key[127:96] ^ {SBOX(up_w3_new[31:24]),SBOX(up_w3_new[23:16]),SBOX(up_w3_new[15:8]),SBOX(up_w3_new[7:0])})));
	end else if((fsm_cs==ST_256_DE_PRE) && (fsm_ns!=ST_256_DE))begin
		key[255:224] <= new_key_w0[31:0];
		key[223:192] <= key[223:192] ^ (new_key_w0[31:0]);
		key[191:160] <= key[191:160] ^ (key[223:192] ^ (new_key_w0[31:0]));
		key[159:128] <= key[159:128] ^ (key[191:160] ^ (key[223:192] ^ (new_key_w0[31:0])));
		key[127:96 ] <= key[127:96] ^ {SBOX(up_w3_new[31:24]),SBOX(up_w3_new[23:16]),SBOX(up_w3_new[15:8]),SBOX(up_w3_new[7:0])};
		key[95 :64 ] <= key[95 :64] ^ (key[127:96] ^ {SBOX(up_w3_new[31:24]),SBOX(up_w3_new[23:16]),SBOX(up_w3_new[15:8]),SBOX(up_w3_new[7:0])}); 
		key[63 :32 ] <= key[63 :32] ^ (key[95 :64] ^ (key[127:96] ^ {SBOX(up_w3_new[31:24]),SBOX(up_w3_new[23:16]),SBOX(up_w3_new[15:8]),SBOX(up_w3_new[7:0])}));
		key[31 :0  ] <= key[31 :0 ] ^ (key[63 :32] ^ (key[95 :64] ^ (key[127:96] ^ {SBOX(up_w3_new[31:24]),SBOX(up_w3_new[23:16]),SBOX(up_w3_new[15:8]),SBOX(up_w3_new[7:0])})));
	end else if((fsm_cs==ST_256_DE)&&(!cnt[0]))begin
		key[31 :0  ] <= key[31 :0  ] ^ key[63 :32 ];
		key[63 :32 ] <= key[63 :32 ] ^ key[95 :64 ];
		key[95 :64 ] <= key[95 :64 ] ^ key[127:96 ];
		key[127:96 ] <= key[127:96 ] ^ {SBOX(up_w3_new[31:24]),SBOX(up_w3_new[23:16]),SBOX(up_w3_new[15:8]),SBOX(up_w3_new[7:0])};
		key[159:128] <= key[159:128] ^ key[191:160]; 
		key[191:160] <= key[191:160] ^ key[223:192];
		key[223:192] <= key[223:192] ^ key[255:224];
		key[255:224] <= key[255:224] ^  RCON(5-(cnt-1)/2) ^ tempt_w3[31:0];
	end else if((fsm_cs==ST_192_EN) && (((cnt==0)||(cnt==2)||(cnt==3)||(cnt==5)||(cnt==6)||(cnt==8)||(cnt==9)||(cnt==11))))begin
		key[191:160] <= new_key_w0[31:0];
		key[159:128] <= key[159:128] ^ (new_key_w0[31:0]);
		key[127:96 ] <= key[127:96 ] ^ (key[159:128] ^ (new_key_w0[31:0]));
                key[95 :64 ] <= key[95 :64 ] ^ (key[127:96 ] ^ (key[159:128] ^ (new_key_w0[31:0])));
                key[63 :32 ] <= key[63 :32 ] ^ (key[95 :64 ] ^ (key[127:96 ] ^ (key[159:128] ^ (new_key_w0[31:0]))));
                key[31 :0  ] <= key[31 :0  ] ^ (key[63 :32 ] ^ (key[95 :64 ] ^ (key[127:96 ] ^ (key[159:128] ^ (new_key_w0[31:0])))));
	end else if(fsm_cs==ST_192_DE_PRE)begin
		key[191:160] <= new_key_w0[31:0];
		key[159:128] <= key[159:128] ^ (new_key_w0[31:0]);
		key[127:96 ] <= key[127:96 ] ^ (key[159:128] ^ (new_key_w0[31:0]));
                key[95 :64 ] <= key[95 :64 ] ^ (key[127:96 ] ^ (key[159:128] ^ (new_key_w0[31:0])));
                key[63 :32 ] <= key[63 :32 ] ^ (key[95 :64 ] ^ (key[127:96 ] ^ (key[159:128] ^ (new_key_w0[31:0]))));
                key[31 :0  ] <= key[31 :0  ] ^ (key[63 :32 ] ^ (key[95 :64 ] ^ (key[127:96 ] ^ (key[159:128] ^ (new_key_w0[31:0])))));
	end else if((fsm_cs==ST_192_DE) && ((cnt==0)||(cnt==1)||(cnt==3)||(cnt==4)||(cnt==6)||(cnt==7)||(cnt==9)||(cnt==10)))begin
		key[31 :0  ] <= key[31 :0  ] ^ key[63 :32 ];
                key[63 :32 ] <= key[63 :32 ] ^ key[95 :64 ];
                key[95 :64 ] <= key[95 :64 ] ^ key[127:96 ];
                key[127:96 ] <= key[127:96 ] ^ key[159:128];
                key[159:128] <= key[159:128] ^ key[191:160];
                key[191:160] <= key[191:160] ^ RCON(7-count) ^ tempt_w3[31:0];
	end
end

always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state [127:0] <= {128{1'b0}}; 
	end else if(start ) begin
		state [127:0] <= text_in[127:0];
	end else if(fsm_cs==ST_128_EN)begin
		if (cnt==0 )begin
			state[127:96] <= state[127:96] ^ key[127:96];
			state[95 :64] <= state[95 :64] ^ key[95 :64];
			state[63 :32] <= state[63 :32] ^ key[63 :32];
			state[31 :0 ] <= state[31 :0 ] ^ key[31 :0 ];
		end else if(cnt==10)begin
			state[127:96] <= after_shiftrows[127:96] ^ key[127:96];
			state[95 :64] <= after_shiftrows[95 :64] ^ key[95 :64];
			state[63 :32] <= after_shiftrows[63 :32] ^ key[63 :32];
			state[31 :0 ] <= after_shiftrows[31 :0 ] ^ key[31 :0 ];
		end else  begin
			state[127:96] <= after_mixcolumns[127:96] ^ key[127:96];;
			state[95 :64] <= after_mixcolumns[95 :64] ^ key[95 :64];;
			state[63 :32] <= after_mixcolumns[63 :32] ^ key[63 :32];
			state[31 :0 ] <= after_mixcolumns[31 :0 ] ^ key[31 :0 ];
		end
	end else if(fsm_cs==ST_128_DE)begin
		if (cnt==0 )begin
			state[127:96] <= state[127:96] ^ key[127:96];
			state[95 :64] <= state[95 :64] ^ key[95 :64];
			state[63 :32] <= state[63 :32] ^ key[63 :32];
			state[31 :0 ] <= state[31 :0 ] ^ key[31 :0 ];
		end else begin
			state[127:96] <= after_subbytes[127:96] ^ key[127:96];
			state[95 :64] <= after_subbytes[95 :64] ^ key[95 :64];
			state[63 :32] <= after_subbytes[63 :32] ^ key[63 :32];
			state[31 :0 ] <= after_subbytes[31 :0 ] ^ key[31 :0 ];
		end
	end else if(fsm_cs==ST_256_EN)begin
		if(cnt==0)begin
			state[127:96] <= state[127:96] ^ key[255:224];
			state[95 :64] <= state[95 :64] ^ key[223:192];
			state[63 :32] <= state[63 :32] ^ key[191:160];
			state[31 :0 ] <= state[31 :0 ] ^ key[159:128];
		end else if(cnt==14) begin
			state[127:96] <= after_shiftrows[127:96] ^ key[255:224];
			state[95 :64] <= after_shiftrows[95 :64] ^ key[223:192];
			state[63 :32] <= after_shiftrows[63 :32] ^ key[191:160];
			state[31 :0 ] <= after_shiftrows[31 :0 ] ^ key[159:128];
		end else if(cnt[0]) begin
			state[127:96] <= after_mixcolumns[127:96] ^ key[127:96];
			state[95 :64] <= after_mixcolumns[95 :64] ^ key[95 :64];
			state[63 :32] <= after_mixcolumns[63 :32] ^ key[63 :32];
			state[31 :0 ] <= after_mixcolumns[31 :0 ] ^ key[31 :0 ];
		end else begin
			state[127:96] <= after_mixcolumns[127:96] ^ key[255:224];
			state[95 :64] <= after_mixcolumns[95 :64] ^ key[223:192];
			state[63 :32] <= after_mixcolumns[63 :32] ^ key[191:160];
			state[31 :0 ] <= after_mixcolumns[31 :0 ] ^ key[159:128];
		end
	end else if(fsm_cs==ST_256_DE)begin
		if(cnt==0 )begin
			state[127:96] <= state[127:96] ^ key[255:224];
			state[95 :64] <= state[95 :64] ^ key[223:192];
			state[63 :32] <= state[63 :32] ^ key[191:160];
			state[31 :0 ] <= state[31 :0 ] ^ key[159:128];
		end else if(!cnt[0]) begin
			state[127:96] <= after_subbytes[127:96] ^ key[255:224];
			state[95 :64] <= after_subbytes[95 :64] ^ key[223:192];
			state[63 :32] <= after_subbytes[63 :32] ^ key[191:160];
			state[31 :0 ] <= after_subbytes[31 :0 ] ^ key[159:128];
		end else begin
			state[127:96] <= after_subbytes[127:96] ^ key[127:96];
			state[95 :64] <= after_subbytes[95 :64] ^ key[95 :64];
			state[63 :32] <= after_subbytes[63 :32] ^ key[63 :32];
			state[31 :0 ] <= after_subbytes[31 :0 ] ^ key[31 :0 ];
		end
	end else if(fsm_cs==ST_192_EN)begin
		if(cnt==0)begin
			state[127:96] <= state[127:96] ^ key[191:160];
                        state[95 :64] <= state[95 :64] ^ key[159:128];
                        state[63 :32] <= state[63 :32] ^ key[127:96 ];
                        state[31 :0 ] <= state[31 :0 ] ^ key[95 :64 ];
		end else if(cnt==12)begin
			state[127:96] <= after_shiftrows[127:96] ^ key[191:160];
                        state[95 :64] <= after_shiftrows[95 :64] ^ key[159:128];
                        state[63 :32] <= after_shiftrows[63 :32] ^ key[127:96 ];
                        state[31 :0 ] <= after_shiftrows[31 :0 ] ^ key[95 :64 ];
		end else if((cnt==1)||(cnt==4)||(cnt==7)||(cnt==10))begin
			state[127:96] <= after_mixcolumns[127:96] ^ key_d[63 :32];
                        state[95 :64] <= after_mixcolumns[95 :64] ^ key_d[31 :0 ];
                        state[63 :32] <= after_mixcolumns[63 :32] ^ key[191:160];
                        state[31 :0 ] <= after_mixcolumns[31 :0 ] ^ key[159:128];
		end else if((cnt==2)||(cnt==5)||(cnt==8)||(cnt==11))begin
			state[127:96] <= after_mixcolumns[127:96] ^ key[127:96];
                        state[95 :64] <= after_mixcolumns[95 :64] ^ key[95 :64];
                        state[63 :32] <= after_mixcolumns[63 :32] ^ key[63 :32];
                        state[31 :0 ] <= after_mixcolumns[31 :0 ] ^ key[31 :0 ];
		end else begin
			state[127:96] <= after_mixcolumns[127:96] ^ key[191:160];
                        state[95 :64] <= after_mixcolumns[95 :64] ^ key[159:128];
                        state[63 :32] <= after_mixcolumns[63 :32] ^ key[127:96 ];
                        state[31 :0 ] <= after_mixcolumns[31 :0 ] ^ key[95 :64 ];
		end
	end else if(fsm_cs==ST_192_DE)begin
		if(cnt==0)begin
			state[127:96] <= state[127:96] ^ key[191:160];
                        state[95 :64] <= state[95 :64] ^ key[159:128];
                        state[63 :32] <= state[63 :32] ^ key[127:96 ];
                        state[31 :0 ] <= state[31 :0 ] ^ key[95 :64 ];
		end else if((cnt==1)||(cnt==4)||(cnt==7)||(cnt==10)) begin
			state[127:96] <= after_subbytes[127:96] ^ key[127:96];
                        state[95 :64] <= after_subbytes[95 :64] ^ key[95 :64];
                        state[63 :32] <= after_subbytes[63 :32] ^ key[63 :32];
                        state[31 :0 ] <= after_subbytes[31 :0 ] ^ key[31 :0 ];
		end else if((cnt==2)||(cnt==5)||(cnt==8)||(cnt==11)) begin
			state[127:96] <= after_subbytes[127:96] ^ key[63 :32];
                        state[95 :64] <= after_subbytes[95 :64] ^ key[31 :0 ];
                        state[63 :32] <= after_subbytes[63 :32] ^ key_d[191:160];
                        state[31 :0 ] <= after_subbytes[31 :0 ] ^ key_d[159:128];
		end else begin
			state[127:96] <= after_subbytes[127:96] ^ key[191:160];
                        state[95 :64] <= after_subbytes[95 :64] ^ key[159:128];
                        state[63 :32] <= after_subbytes[63 :32] ^ key[127:96 ];
                        state[31 :0 ] <= after_subbytes[31 :0 ] ^ key[95 :64 ];
		end
	end else if(fsm_ns==ST_IDLE) begin
		state [127:0] <= {128{1'b0}}; 
	end
end

always @ (*) begin
	if((cnt!=0) && ((fsm_cs==ST_128_EN)||(fsm_cs==ST_256_EN)||(fsm_cs==ST_192_EN)))begin
		after_subbytes[127:120] = SBOX (state[127:120]); 
		after_subbytes[119:112] = SBOX (state[119:112]); 
		after_subbytes[111:104] = SBOX (state[111:104]); 
		after_subbytes[103:96 ] = SBOX (state[103:96 ]); 
		after_subbytes[95 :88 ] = SBOX (state[95 :88 ]); 
		after_subbytes[87 :80 ] = SBOX (state[87 :80 ]); 
		after_subbytes[79 :72 ] = SBOX (state[79 :72 ]); 
		after_subbytes[71 :64 ] = SBOX (state[71 :64 ]); 
		after_subbytes[63 :56 ] = SBOX (state[63 :56 ]); 
		after_subbytes[55 :48 ] = SBOX (state[55 :48 ]); 
		after_subbytes[47 :40 ] = SBOX (state[47 :40 ]); 
		after_subbytes[39 :32 ] = SBOX (state[39 :32 ]); 
		after_subbytes[31 :24 ] = SBOX (state[31 :24 ]); 
		after_subbytes[23 :16 ] = SBOX (state[23 :16 ]); 
		after_subbytes[15 :8  ] = SBOX (state[15 :8  ]); 
		after_subbytes[7  :0  ] = SBOX (state[7  :0  ]); 
	end else if((cnt!=0)&&((fsm_cs==ST_128_DE)||(fsm_cs==ST_256_DE)||(fsm_cs==ST_192_DE)))begin
		after_subbytes[127:120] = INV_SBOX (after_shiftrows[127:120]); 
		after_subbytes[119:112] = INV_SBOX (after_shiftrows[119:112]); 
		after_subbytes[111:104] = INV_SBOX (after_shiftrows[111:104]); 
		after_subbytes[103:96 ] = INV_SBOX (after_shiftrows[103:96 ]); 
		after_subbytes[95 :88 ] = INV_SBOX (after_shiftrows[95 :88 ]); 
		after_subbytes[87 :80 ] = INV_SBOX (after_shiftrows[87 :80 ]); 
		after_subbytes[79 :72 ] = INV_SBOX (after_shiftrows[79 :72 ]); 
		after_subbytes[71 :64 ] = INV_SBOX (after_shiftrows[71 :64 ]); 
		after_subbytes[63 :56 ] = INV_SBOX (after_shiftrows[63 :56 ]); 
		after_subbytes[55 :48 ] = INV_SBOX (after_shiftrows[55 :48 ]); 
		after_subbytes[47 :40 ] = INV_SBOX (after_shiftrows[47 :40 ]); 
		after_subbytes[39 :32 ] = INV_SBOX (after_shiftrows[39 :32 ]); 
		after_subbytes[31 :24 ] = INV_SBOX (after_shiftrows[31 :24 ]); 
		after_subbytes[23 :16 ] = INV_SBOX (after_shiftrows[23 :16 ]); 
		after_subbytes[15 :8  ] = INV_SBOX (after_shiftrows[15 :8  ]); 
		after_subbytes[7  :0  ] = INV_SBOX (after_shiftrows[7  :0  ]); 
	end else begin
		after_subbytes [127:0] = {128{1'b0}};  
	end
end


always @ (*) begin
	if((cnt!=0) && ((fsm_cs==ST_128_EN)||(fsm_cs==ST_256_EN)||(fsm_cs==ST_192_EN)))begin
		after_shiftrows[127:120] = after_subbytes[127:120];
		after_shiftrows[119:112] = after_subbytes[87 :80 ];
                after_shiftrows[111:104] = after_subbytes[47 :40 ];
                after_shiftrows[103:96 ] = after_subbytes[7  :0  ];
                after_shiftrows[95 :88 ] = after_subbytes[95 :88 ];
                after_shiftrows[87 :80 ] = after_subbytes[55 :48 ];
                after_shiftrows[79 :72 ] = after_subbytes[15 :8  ];
                after_shiftrows[71 :64 ] = after_subbytes[103:96 ];
                after_shiftrows[63 :56 ] = after_subbytes[63 :56 ];
                after_shiftrows[55 :48 ] = after_subbytes[23 :16 ];
                after_shiftrows[47 :40 ] = after_subbytes[111:104];
                after_shiftrows[39 :32 ] = after_subbytes[71 :64 ];
                after_shiftrows[31 :24 ] = after_subbytes[31 :24 ];
                after_shiftrows[23 :16 ] = after_subbytes[119:112];
                after_shiftrows[15 :8  ] = after_subbytes[79 :72 ];
                after_shiftrows[7  :0  ] = after_subbytes[39 :32 ];
	end else if(((fsm_cs==ST_128_DE)||(fsm_cs==ST_256_DE)||(fsm_cs==ST_192_DE))&&(cnt!=0) )begin
		if(cnt==1)begin
			after_shiftrows[127:120] = state[127:120];
			after_shiftrows[119:112] = state[23 :16 ];
                	after_shiftrows[111:104] = state[47 :40 ];
                	after_shiftrows[103:96 ] = state[71 :64 ];
                	after_shiftrows[95 :88 ] = state[95 :88 ];
                	after_shiftrows[87 :80 ] = state[119:112];
                	after_shiftrows[79 :72 ] = state[15 :8  ];
                	after_shiftrows[71 :64 ] = state[39 :32 ];
                	after_shiftrows[63 :56 ] = state[63 :56 ];
                	after_shiftrows[55 :48 ] = state[87 :80 ];
                	after_shiftrows[47 :40 ] = state[111:104];
                	after_shiftrows[39 :32 ] = state[7  :0  ];
                	after_shiftrows[31 :24 ] = state[31 :24 ];
                	after_shiftrows[23 :16 ] = state[55 :48 ];
                	after_shiftrows[15 :8  ] = state[79 :72 ];
                	after_shiftrows[7  :0  ] = state[103:96 ];
		end else begin
			after_shiftrows[127:120] = after_mixcolumns[127:120];
			after_shiftrows[119:112] = after_mixcolumns[23 :16 ];
                	after_shiftrows[111:104] = after_mixcolumns[47 :40 ];
                	after_shiftrows[103:96 ] = after_mixcolumns[71 :64 ];
                	after_shiftrows[95 :88 ] = after_mixcolumns[95 :88 ];
                	after_shiftrows[87 :80 ] = after_mixcolumns[119:112];
                	after_shiftrows[79 :72 ] = after_mixcolumns[15 :8  ];
                	after_shiftrows[71 :64 ] = after_mixcolumns[39 :32 ];
                	after_shiftrows[63 :56 ] = after_mixcolumns[63 :56 ];
                	after_shiftrows[55 :48 ] = after_mixcolumns[87 :80 ];
                	after_shiftrows[47 :40 ] = after_mixcolumns[111:104];
                	after_shiftrows[39 :32 ] = after_mixcolumns[7  :0  ];
                	after_shiftrows[31 :24 ] = after_mixcolumns[31 :24 ];
                	after_shiftrows[23 :16 ] = after_mixcolumns[55 :48 ];
                	after_shiftrows[15 :8  ] = after_mixcolumns[79 :72 ];
                	after_shiftrows[7  :0  ] = after_mixcolumns[103:96 ];
		end
	end else begin
		after_shiftrows [127:0] = {128{1'b0}}; 
	end
end

always @ (*) begin
	if(((fsm_cs==ST_128_EN)&&(cnt!=0)&&(cnt!=10))||((fsm_cs==ST_256_EN)&&(cnt!=0)&&(cnt!=14)||((fsm_cs==ST_192_EN)&&(cnt!=0)&&(cnt!=12)))) begin
		after_mixcolumns[127:120] = DATA_MUL_02(after_shiftrows[127:120]) ^
		                            DATA_MUL_02(after_shiftrows[119:112]) ^ 
					                                            after_shiftrows[119:112] ^ 
					                                            after_shiftrows[111:104] ^ 
					                                            after_shiftrows[103:96 ];
		after_mixcolumns[119:112] = DATA_MUL_02(after_shiftrows[119:112]) ^
		                            DATA_MUL_02(after_shiftrows[111:104]) ^
					                                            after_shiftrows[127:120] ^
										    after_shiftrows[111:104] ^
										    after_shiftrows[103:96 ];
		after_mixcolumns[111:104] = DATA_MUL_02(after_shiftrows[111:104]) ^ DATA_MUL_02(after_shiftrows[103:96 ]) ^
					    after_shiftrows[103:96 ] ^ after_shiftrows[127:120] ^ after_shiftrows[119:112] ;
		after_mixcolumns[103:96 ] = DATA_MUL_02(after_shiftrows[103:96 ]) ^ DATA_MUL_02(after_shiftrows[127:120]) ^
					    after_shiftrows[127:120] ^ after_shiftrows[119:112] ^ after_shiftrows [111:104];
		after_mixcolumns[95 :88 ] = DATA_MUL_02(after_shiftrows[95 :88 ]) ^ DATA_MUL_02(after_shiftrows[87 :80 ]) ^ 
					    after_shiftrows[87 :80 ] ^ after_shiftrows[79 :72 ] ^ after_shiftrows[71 :64 ];
		after_mixcolumns[87 :80 ] = DATA_MUL_02(after_shiftrows[87 :80 ]) ^ DATA_MUL_02(after_shiftrows [79 :72 ]) ^ 
					    after_shiftrows[95 :88 ] ^ after_shiftrows[79 :72 ] ^ after_shiftrows[71 :64 ];
		after_mixcolumns[79 :72 ] = DATA_MUL_02(after_shiftrows[79 :72 ]) ^ DATA_MUL_02(after_shiftrows[71 :64 ]) ^
					    after_shiftrows[95 :88 ] ^ after_shiftrows[87 :80 ] ^ after_shiftrows [71 :64 ];
		after_mixcolumns[71 :64 ] = DATA_MUL_02(after_shiftrows[71 :64 ]) ^ DATA_MUL_02(after_shiftrows[95 :88 ]) ^
					    after_shiftrows[95 :88 ] ^ after_shiftrows[87 :80 ] ^ after_shiftrows[79 :72 ];
		after_mixcolumns[63 :56 ] = DATA_MUL_02(after_shiftrows[63 :56 ]) ^ DATA_MUL_02(after_shiftrows[55 :48 ]) ^ 
					    after_shiftrows[55 :48 ] ^ after_shiftrows[47 :40 ] ^ after_shiftrows[39 :32 ];
		after_mixcolumns[55 :48 ] = DATA_MUL_02(after_shiftrows[55 :48 ]) ^ DATA_MUL_02(after_shiftrows[47 :40 ]) ^ 
				            after_shiftrows[63 :56 ] ^ after_shiftrows[47 :40 ] ^ after_shiftrows[39 :32 ];
		after_mixcolumns[47 :40 ] = DATA_MUL_02(after_shiftrows[47 :40 ]) ^ DATA_MUL_02(after_shiftrows[39 :32 ]) ^ 
					    after_shiftrows[63 :56 ] ^ after_shiftrows[55 :48 ] ^ after_shiftrows[39 :32 ];
		after_mixcolumns[39 :32 ] = DATA_MUL_02(after_shiftrows[39 :32 ]) ^ DATA_MUL_02(after_shiftrows[63 :56 ]) ^
					    after_shiftrows[63 :56 ] ^ after_shiftrows[55 :48 ] ^ after_shiftrows[47 :40 ];
		after_mixcolumns[31 :24 ] = DATA_MUL_02(after_shiftrows[31 :24 ]) ^ DATA_MUL_02(after_shiftrows[23 :16 ]) ^
					    after_shiftrows[23 :16 ] ^ after_shiftrows[15 :8  ] ^ after_shiftrows[7  :0  ];
		after_mixcolumns[23 :16 ] = DATA_MUL_02(after_shiftrows[23 :16 ]) ^ DATA_MUL_02(after_shiftrows[15 :8  ]) ^ 
					   after_shiftrows[31 :24 ] ^ after_shiftrows[15 :8  ] ^ after_shiftrows[7  :0  ];
		after_mixcolumns[15 :8  ] = DATA_MUL_02(after_shiftrows[15 :8  ]) ^ DATA_MUL_02(after_shiftrows[7  :0  ]) ^ 
					    after_shiftrows[31 :24 ] ^ after_shiftrows[23 :16 ] ^ after_shiftrows [7  :0  ];
		after_mixcolumns[7  :0  ] = DATA_MUL_02(after_shiftrows[7  :0  ]) ^ DATA_MUL_02(after_shiftrows[31 :24 ]) ^ 
					    after_shiftrows[31 :24 ] ^ after_shiftrows[23 :16 ] ^ after_shiftrows[15 :8  ];
	end else if(((fsm_cs==ST_128_DE)||(fsm_cs==ST_256_DE)||(fsm_cs==ST_192_DE))&&(cnt!=0)&&(cnt!=1)) begin
		after_mixcolumns[127:120] = DATA_MUL_0E(state[127:120]) ^ DATA_MUL_0B(state[119:112]) ^ DATA_MUL_0D(state[111:104]) ^ DATA_MUL_09(state[103:96]);
                after_mixcolumns[119:112] = DATA_MUL_09(state[127:120]) ^ DATA_MUL_0E(state[119:112]) ^ DATA_MUL_0B(state[111:104]) ^ DATA_MUL_0D(state[103:96]);
                after_mixcolumns[111:104] = DATA_MUL_0D(state[127:120]) ^ DATA_MUL_09(state[119:112]) ^ DATA_MUL_0E(state[111:104]) ^ DATA_MUL_0B(state[103:96]);
                after_mixcolumns[103:96 ] = DATA_MUL_0B(state[127:120]) ^ DATA_MUL_0D(state[119:112]) ^ DATA_MUL_09(state[111:104]) ^ DATA_MUL_0E(state[103:96]);
                after_mixcolumns[95 :88 ] = DATA_MUL_0E(state[95 :88 ]) ^ DATA_MUL_0B(state[87 :80 ]) ^ DATA_MUL_0D(state[79 :72 ]) ^ DATA_MUL_09(state[71 :64]); 
                after_mixcolumns[87 :80 ] = DATA_MUL_09(state[95 :88 ]) ^ DATA_MUL_0E(state[87 :80 ]) ^ DATA_MUL_0B(state[79 :72 ]) ^ DATA_MUL_0D(state[71 :64]); 
                after_mixcolumns[79 :72 ] = DATA_MUL_0D(state[95 :88 ]) ^ DATA_MUL_09(state[87 :80 ]) ^ DATA_MUL_0E(state[79 :72 ]) ^ DATA_MUL_0B(state[71 :64]); 
                after_mixcolumns[71 :64 ] = DATA_MUL_0B(state[95 :88 ]) ^ DATA_MUL_0D(state[87 :80 ]) ^ DATA_MUL_09(state[79 :72 ]) ^ DATA_MUL_0E(state[71 :64]); 
                after_mixcolumns[63 :56 ] = DATA_MUL_0E(state[63 :56 ]) ^ DATA_MUL_0B(state[55 :48 ]) ^ DATA_MUL_0D(state[47 :40 ]) ^ DATA_MUL_09(state[39 :32]); 
                after_mixcolumns[55 :48 ] = DATA_MUL_09(state[63 :56 ]) ^ DATA_MUL_0E(state[55 :48 ]) ^ DATA_MUL_0B(state[47 :40 ]) ^ DATA_MUL_0D(state[39 :32]); 
                after_mixcolumns[47 :40 ] = DATA_MUL_0D(state[63 :56 ]) ^ DATA_MUL_09(state[55 :48 ]) ^ DATA_MUL_0E(state[47 :40 ]) ^ DATA_MUL_0B(state[39 :32]); 
                after_mixcolumns[39 :32 ] = DATA_MUL_0B(state[63 :56 ]) ^ DATA_MUL_0D(state[55 :48 ]) ^ DATA_MUL_09(state[47 :40 ]) ^ DATA_MUL_0E(state[39 :32]); 
                after_mixcolumns[31 :24 ] = DATA_MUL_0E(state[31 :24 ]) ^ DATA_MUL_0B(state[23 :16 ]) ^ DATA_MUL_0D(state[15 :8  ]) ^ DATA_MUL_09(state[7  :0 ]); 
                after_mixcolumns[23 :16 ] = DATA_MUL_09(state[31 :24 ]) ^ DATA_MUL_0E(state[23 :16 ]) ^ DATA_MUL_0B(state[15 :8  ]) ^ DATA_MUL_0D(state[7  :0 ]); 
                after_mixcolumns[15 :8  ] = DATA_MUL_0D(state[31 :24 ]) ^ DATA_MUL_09(state[23 :16 ]) ^ DATA_MUL_0E(state[15 :8  ]) ^ DATA_MUL_0B(state[7  :0 ]); 
                after_mixcolumns[7  :0  ] = DATA_MUL_0B(state[31 :24 ]) ^ DATA_MUL_0D(state[23 :16 ]) ^ DATA_MUL_09(state[15 :8  ]) ^ DATA_MUL_0E(state[7  :0 ]); 
	end else begin
		after_mixcolumns [127:0] = {128{1'b0}};
	end
end



///////////////////////////////////////////////
///subbyte sbox
///////////////////////////////////////////////
function [7:0]SBOX;
	input [7:0]data;
	reg [3:0] byte_index;
	reg [127:0]SV0 ;
	reg [127:0]SV1 ;
	reg [127:0]SV2 ;
	reg [127:0]SV3 ;
	reg [127:0]SV4 ;
	reg [127:0]SV5 ;
	reg [127:0]SV6 ;
	reg [127:0]SV7 ;
	reg [127:0]SV8 ;
	reg [127:0]SV9 ;
	reg [127:0]SV10;
	reg [127:0]SV11;
	reg [127:0]SV12;
	reg [127:0]SV13;
	reg [127:0]SV14;
	reg [127:0]SV15;
	begin
		 byte_index[3:0] = ~data[3:0];
		 SV0  = {8'h63,8'h7c,8'h77,8'h7b,8'hf2,8'h6b,8'h6f,8'hc5,8'h30,8'h01,8'h67,8'h2b,8'hfe,8'hd7,8'hab,8'h76};
		 SV1  = {8'hca,8'h82,8'hc9,8'h7d,8'hfa,8'h59,8'h47,8'hf0,8'had,8'hd4,8'ha2,8'haf,8'h9c,8'ha4,8'h72,8'hc0};
		 SV2  = {8'hb7,8'hfd,8'h93,8'h26,8'h36,8'h3f,8'hf7,8'hcc,8'h34,8'ha5,8'he5,8'hf1,8'h71,8'hd8,8'h31,8'h15};
		 SV3  = {8'h04,8'hc7,8'h23,8'hc3,8'h18,8'h96,8'h05,8'h9a,8'h07,8'h12,8'h80,8'he2,8'heb,8'h27,8'hb2,8'h75};
		 SV4  = {8'h09,8'h83,8'h2c,8'h1a,8'h1b,8'h6e,8'h5a,8'ha0,8'h52,8'h3b,8'hd6,8'hb3,8'h29,8'he3,8'h2f,8'h84};
		 SV5  = {8'h53,8'hd1,8'h00,8'hed,8'h20,8'hfc,8'hb1,8'h5b,8'h6a,8'hcb,8'hbe,8'h39,8'h4a,8'h4c,8'h58,8'hcf};
		 SV6  = {8'hd0,8'hef,8'haa,8'hfb,8'h43,8'h4d,8'h33,8'h85,8'h45,8'hf9,8'h02,8'h7f,8'h50,8'h3c,8'h9f,8'ha8};
		 SV7  = {8'h51,8'ha3,8'h40,8'h8f,8'h92,8'h9d,8'h38,8'hf5,8'hbc,8'hb6,8'hda,8'h21,8'h10,8'hff,8'hf3,8'hd2};
		 SV8  = {8'hcd,8'h0c,8'h13,8'hec,8'h5f,8'h97,8'h44,8'h17,8'hc4,8'ha7,8'h7e,8'h3d,8'h64,8'h5d,8'h19,8'h73};
		 SV9  = {8'h60,8'h81,8'h4f,8'hdc,8'h22,8'h2a,8'h90,8'h88,8'h46,8'hee,8'hb8,8'h14,8'hde,8'h5e,8'h0b,8'hdb};
		 SV10 = {8'he0,8'h32,8'h3a,8'h0a,8'h49,8'h06,8'h24,8'h5c,8'hc2,8'hd3,8'hac,8'h62,8'h91,8'h95,8'he4,8'h79};
		 SV11 = {8'he7,8'hc8,8'h37,8'h6d,8'h8d,8'hd5,8'h4e,8'ha9,8'h6c,8'h56,8'hf4,8'hea,8'h65,8'h7a,8'hae,8'h08};
		 SV12 = {8'hba,8'h78,8'h25,8'h2e,8'h1c,8'ha6,8'hb4,8'hc6,8'he8,8'hdd,8'h74,8'h1f,8'h4b,8'hbd,8'h8b,8'h8a};
		 SV13 = {8'h70,8'h3e,8'hb5,8'h66,8'h48,8'h03,8'hf6,8'h0e,8'h61,8'h35,8'h57,8'hb9,8'h86,8'hc1,8'h1d,8'h9e};
		 SV14 = {8'he1,8'hf8,8'h98,8'h11,8'h69,8'hd9,8'h8e,8'h94,8'h9b,8'h1e,8'h87,8'he9,8'hce,8'h55,8'h28,8'hdf};
		 SV15 = {8'h8c,8'ha1,8'h89,8'h0d,8'hbf,8'he6,8'h42,8'h68,8'h41,8'h99,8'h2d,8'h0f,8'hb0,8'h54,8'hbb,8'h16};
		case(data[7:4])
			4'h0:SBOX[7:0] = SV0 [8*byte_index[3:0] +:8];
			4'h1:SBOX[7:0] = SV1 [8*byte_index[3:0] +:8];
			4'h2:SBOX[7:0] = SV2 [8*byte_index[3:0] +:8];
			4'h3:SBOX[7:0] = SV3 [8*byte_index[3:0] +:8];
			4'h4:SBOX[7:0] = SV4 [8*byte_index[3:0] +:8];
			4'h5:SBOX[7:0] = SV5 [8*byte_index[3:0] +:8];
			4'h6:SBOX[7:0] = SV6 [8*byte_index[3:0] +:8];
			4'h7:SBOX[7:0] = SV7 [8*byte_index[3:0] +:8];
			4'h8:SBOX[7:0] = SV8 [8*byte_index[3:0] +:8];
			4'h9:SBOX[7:0] = SV9 [8*byte_index[3:0] +:8];
			4'ha:SBOX[7:0] = SV10[8*byte_index[3:0] +:8];
			4'hb:SBOX[7:0] = SV11[8*byte_index[3:0] +:8];
			4'hc:SBOX[7:0] = SV12[8*byte_index[3:0] +:8];
			4'hd:SBOX[7:0] = SV13[8*byte_index[3:0] +:8];
			4'he:SBOX[7:0] = SV14[8*byte_index[3:0] +:8];
			4'hf:SBOX[7:0] = SV15[8*byte_index[3:0] +:8];
		endcase
	end
endfunction

function [7:0]INV_SBOX;
	input [7:0]data;
	reg [3:0] byte_index;
	reg [127:0]INV_SV0 ;
	reg [127:0]INV_SV1 ;
	reg [127:0]INV_SV2 ;
	reg [127:0]INV_SV3 ;
	reg [127:0]INV_SV4 ;
	reg [127:0]INV_SV5 ;
	reg [127:0]INV_SV6 ;
	reg [127:0]INV_SV7 ;
	reg [127:0]INV_SV8 ;
	reg [127:0]INV_SV9 ;
	reg [127:0]INV_SV10;
	reg [127:0]INV_SV11;
	reg [127:0]INV_SV12;
	reg [127:0]INV_SV13;
	reg [127:0]INV_SV14;
	reg [127:0]INV_SV15;
	begin
		 byte_index[3:0] = ~data[3:0];
		 INV_SV0  = {8'h52,8'h09,8'h6a,8'hd5,8'h30,8'h36,8'ha5,8'h38,8'hbf,8'h40,8'ha3,8'h9e,8'h81,8'hf3,8'hd7,8'hfb};
		 INV_SV1  = {8'h7c,8'he3,8'h39,8'h82,8'h9b,8'h2f,8'hff,8'h87,8'h34,8'h8e,8'h43,8'h44,8'hc4,8'hde,8'he9,8'hcb};
		 INV_SV2  = {8'h54,8'h7b,8'h94,8'h32,8'ha6,8'hc2,8'h23,8'h3d,8'hee,8'h4c,8'h95,8'h0b,8'h42,8'hfa,8'hc3,8'h4e};
		 INV_SV3  = {8'h08,8'h2e,8'ha1,8'h66,8'h28,8'hd9,8'h24,8'hb2,8'h76,8'h5b,8'ha2,8'h49,8'h6d,8'h8b,8'hd1,8'h25};
		 INV_SV4  = {8'h72,8'hf8,8'hf6,8'h64,8'h86,8'h68,8'h98,8'h16,8'hd4,8'ha4,8'h5c,8'hcc,8'h5d,8'h65,8'hb6,8'h92};
		 INV_SV5  = {8'h6c,8'h70,8'h48,8'h50,8'hfd,8'hed,8'hb9,8'hda,8'h5e,8'h15,8'h46,8'h57,8'ha7,8'h8d,8'h9d,8'h84};
		 INV_SV6  = {8'h90,8'hd8,8'hab,8'h00,8'h8c,8'hbc,8'hd3,8'h0a,8'hf7,8'he4,8'h58,8'h05,8'hb8,8'hb3,8'h45,8'h06};
		 INV_SV7  = {8'hd0,8'h2c,8'h1e,8'h8f,8'hca,8'h3f,8'h0f,8'h02,8'hc1,8'haf,8'hbd,8'h03,8'h01,8'h13,8'h8a,8'h6b};
		 INV_SV8  = {8'h3a,8'h91,8'h11,8'h41,8'h4f,8'h67,8'hdc,8'hea,8'h97,8'hf2,8'hcf,8'hce,8'hf0,8'hb4,8'he6,8'h73};
		 INV_SV9  = {8'h96,8'hac,8'h74,8'h22,8'he7,8'had,8'h35,8'h85,8'he2,8'hf9,8'h37,8'he8,8'h1c,8'h75,8'hdf,8'h6e};
		 INV_SV10 = {8'h47,8'hf1,8'h1a,8'h71,8'h1d,8'h29,8'hc5,8'h89,8'h6f,8'hb7,8'h62,8'h0e,8'haa,8'h18,8'hbe,8'h1b};
		 INV_SV11 = {8'hfc,8'h56,8'h3e,8'h4b,8'hc6,8'hd2,8'h79,8'h20,8'h9a,8'hdb,8'hc0,8'hfe,8'h78,8'hcd,8'h5a,8'hf4};
		 INV_SV12 = {8'h1f,8'hdd,8'ha8,8'h33,8'h88,8'h07,8'hc7,8'h31,8'hb1,8'h12,8'h10,8'h59,8'h27,8'h80,8'hec,8'h5f};
		 INV_SV13 = {8'h60,8'h51,8'h7f,8'ha9,8'h19,8'hb5,8'h4a,8'h0d,8'h2d,8'he5,8'h7a,8'h9f,8'h93,8'hc9,8'h9c,8'hef};
		 INV_SV14 = {8'ha0,8'he0,8'h3b,8'h4d,8'hae,8'h2a,8'hf5,8'hb0,8'hc8,8'heb,8'hbb,8'h3c,8'h83,8'h53,8'h99,8'h61};
		 INV_SV15 = {8'h17,8'h2b,8'h04,8'h7e,8'hba,8'h77,8'hd6,8'h26,8'he1,8'h69,8'h14,8'h63,8'h55,8'h21,8'h0c,8'h7d};
		case(data[7:4])
			4'h0:INV_SBOX[7:0] = INV_SV0 [8*byte_index[3:0] +:8];
			4'h1:INV_SBOX[7:0] = INV_SV1 [8*byte_index[3:0] +:8];
			4'h2:INV_SBOX[7:0] = INV_SV2 [8*byte_index[3:0] +:8];
			4'h3:INV_SBOX[7:0] = INV_SV3 [8*byte_index[3:0] +:8];
			4'h4:INV_SBOX[7:0] = INV_SV4 [8*byte_index[3:0] +:8];
			4'h5:INV_SBOX[7:0] = INV_SV5 [8*byte_index[3:0] +:8];
			4'h6:INV_SBOX[7:0] = INV_SV6 [8*byte_index[3:0] +:8];
			4'h7:INV_SBOX[7:0] = INV_SV7 [8*byte_index[3:0] +:8];
			4'h8:INV_SBOX[7:0] = INV_SV8 [8*byte_index[3:0] +:8];
			4'h9:INV_SBOX[7:0] = INV_SV9 [8*byte_index[3:0] +:8];
			4'ha:INV_SBOX[7:0] = INV_SV10[8*byte_index[3:0] +:8];
			4'hb:INV_SBOX[7:0] = INV_SV11[8*byte_index[3:0] +:8];
			4'hc:INV_SBOX[7:0] = INV_SV12[8*byte_index[3:0] +:8];
			4'hd:INV_SBOX[7:0] = INV_SV13[8*byte_index[3:0] +:8];
			4'he:INV_SBOX[7:0] = INV_SV14[8*byte_index[3:0] +:8];
			4'hf:INV_SBOX[7:0] = INV_SV15[8*byte_index[3:0] +:8];
		endcase
	end
endfunction

function [31:0]RCON;
	input [4:0]Num;
	begin
		case(Num)
			5'd0:RCON[31:0] = 32'h0100_0000;
			5'd1:RCON[31:0] = 32'h0200_0000;
			5'd2:RCON[31:0] = 32'h0400_0000;
			5'd3:RCON[31:0] = 32'h0800_0000;
			5'd4:RCON[31:0] = 32'h1000_0000;
			5'd5:RCON[31:0] = 32'h2000_0000;
			5'd6:RCON[31:0] = 32'h4000_0000;
			5'd7:RCON[31:0] = 32'h8000_0000;
			5'd8:RCON[31:0] = 32'h1b00_0000;
			5'd9:RCON[31:0] = 32'h3600_0000;
		endcase
	end
endfunction


function [7:0]DATA_MUL_02;
	input [7:0]data_in;
	begin
		DATA_MUL_02[7:0] = data_in[7] ? (data_in[7:0]<<1 ^ 8'h1b) : data_in[7:0]<<1 ;
	end
endfunction

function [7:0]DATA_MUL_04;
	input [7:0]data_in;
	reg [7:0]data;
	begin
		data[7:0] = DATA_MUL_02(data_in);
		DATA_MUL_04[7:0] = data[7] ? (data[7:0]<<1 ^ 8'h1b) : (data[7:0]<<1) ;
	end
endfunction

function [7:0]DATA_MUL_08;
	input [7:0]data_in;
	reg [7:0]data;
	begin
		 data[7:0] = DATA_MUL_04(data_in);
		DATA_MUL_08[7:0] = data[7] ? (data[7:0]<<1 ^ 8'h1b) : (data[7:0]<<1) ;
	end
endfunction


function [7:0]DATA_MUL_0E;
	input [7:0]data_in;
	begin
		DATA_MUL_0E[7:0] = DATA_MUL_08(data_in) ^ DATA_MUL_04(data_in) ^ DATA_MUL_02(data_in);
	end
endfunction

function [7:0]DATA_MUL_0B;
	input [7:0]data_in;
	begin
		DATA_MUL_0B[7:0] = DATA_MUL_08(data_in) ^ DATA_MUL_02(data_in) ^ data_in[7:0];
	end
endfunction


function [7:0]DATA_MUL_0D;
	input [7:0]data_in;
	begin
		DATA_MUL_0D[7:0] = DATA_MUL_08(data_in) ^ DATA_MUL_04(data_in) ^ data_in[7:0];
	end
endfunction



function [7:0]DATA_MUL_09;
	input [7:0]data_in;
	begin
		DATA_MUL_09[7:0] = DATA_MUL_08(data_in) ^ data_in[7:0];
	end
endfunction




endmodule
