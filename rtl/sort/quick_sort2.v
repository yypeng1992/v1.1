module quick_sort2#(
	parameter MM = 256,
	parameter MN = 32,
	parameter MW = 8   //// log(MM)
)(
	input clk,
	input reset_n,

	input [MW:0] num,
	input start,
	output done,

	output MemWr,
	output [MW-1:0] MemWrAddr,
	output [MN-1:0] MemWrData,
	output MemRd,
	output [MW-1:0] MemRdAddr,
	input  [MN-1:0] MemRdData
);

///////////////////////////////////////
// stack parameter
///////////////////////////////////////
localparam SM = 128;
localparam SN = 2*MW;
localparam SW = 7;  //// log(SM)

///////////////////////////////////////
// reg/wire declaration
///////////////////////////////////////
reg [MN-1:0]reg_V;
reg [MN-1:0]reg_R;
reg [MN-1:0]reg_L;
wire right_is_big;
wire left_is_small;
wire [MW:0]num_minus_one;

reg [MW-1:0] cnt0;
reg [MW-1:0] cnt1;
reg [MW-1:0] C0;
reg [MW-1:0] C1;
wire[MW-1:0] pos;
wire[MW-1:0] sub_left_length;
wire[MW-1:0] sub_right_length;
wire sub_left_valid;
wire sub_right_valid;
wire[MW-1:0] sub_left_cnt0; 
wire[MW-1:0] sub_left_cnt1;
wire[MW-1:0] sub_right_cnt0;
wire[MW-1:0] sub_right_cnt1;

wire push;
wire pop;
wire [SN-1:0] push_data;
wire [SN-1:0] pop_data;
wire [MW-1:0] stack_cnt0;
wire [MW-1:0] stack_cnt1;

wire full;
wire empty;
wire valid;

///////////////////////////////////////
//(QS) FSM
///////////////////////////////////////
parameter [4:0] QS_IDLE      		= 5'd0 ; //5'b00000;
parameter [4:0] QS_INIT 		= 5'd1 ; //5'b00001;
parameter [4:0] QS_RD_VALUE 		= 5'd2 ; //5'b00010;
parameter [4:0] QS_GET_VALUE 		= 5'd3 ; //5'b00011;
parameter [4:0] QS_RD_RIGHT		= 5'd4 ; //5'b00100;
parameter [4:0] QS_GET_RIGHT		= 5'd5 ; //5'b00101;
parameter [4:0] QS_COMPARE_RIGHT	= 5'd6 ; //5'b00110;
parameter [4:0] QS_SWAP_RIGHT_GAP1 	= 5'd7 ; //5'b00111;
parameter [4:0] QS_SWAP_RIGHT_GAP2 	= 5'd8 ; //5'b01000;
parameter [4:0] QS_RD_LEFT 		= 5'd9 ; //5'b01001;
parameter [4:0] QS_GET_LEFT 		= 5'd10; //5'b01010;
parameter [4:0] QS_COMPARE_LEFT 	= 5'd11; //5'b01011;
parameter [4:0] QS_SWAP_LEFT_GAP1 	= 5'd12; //5'b01100;
parameter [4:0] QS_SWAP_LEFT_GAP2 	= 5'd13; //5'b01101;
parameter [4:0] QS_GET_POSITION 	= 5'd14; //5'b01110;
parameter [4:0] QS_BOTH_VALID		= 5'd15; //5'b01111;
parameter [4:0] QS_LEFT_VALID 		= 5'd16; //5'b10000;
parameter [4:0] QS_RIGHT_VALID 		= 5'd17; //5'b10001;
parameter [4:0] QS_NON_VALID 		= 5'd18; //5'b10010;
parameter [4:0] QS_GET_STACK 		= 5'd19; //5'b10101;
parameter [4:0] QS_DONE 		= 5'd20; //5'b10110;

reg [4:0]state;
reg [4:0]next_state;

always @ (posedge clk or reset_n) begin
	if(!reset_n) begin
		state[4:0] <= QS_IDLE;
	end else begin
		state[4:0] <= next_state[4:0];
	end
end

always @ (*) begin
	next_state[4:0] = state[4:0];
	case(state)
	//--------------------------------------
		QS_IDLE:begin
			if(start) begin
				next_state[4:0] = QS_INIT;
			end
		end
		QS_INIT:begin
				next_state[4:0] = QS_RD_VALUE;	
		end
		QS_RD_VALUE:begin
				next_state[4:0] = QS_GET_VALUE;	
		end
		QS_GET_VALUE:begin
				next_state[4:0] = QS_RD_RIGHT;	
		end

		/// right-man move to left
		QS_RD_RIGHT:begin
				next_state[4:0] = QS_GET_RIGHT;	
		end
		QS_GET_RIGHT:begin
				next_state[4:0] = QS_COMPARE_RIGHT;	
		end
		QS_COMPARE_RIGHT:begin
			if(right_is_big) begin
				if(cnt1-cnt0==1)begin
					next_state[4:0] = QS_GET_POSITION;
				end else begin
					next_state[4:0] = QS_RD_RIGHT;
				end
			end else begin
				next_state[4:0] = QS_SWAP_RIGHT_GAP1;
			end
		end
		QS_SWAP_RIGHT_GAP1:begin
			next_state[4:0] = QS_SWAP_RIGHT_GAP2;
		end
		QS_SWAP_RIGHT_GAP2:begin
			if(cnt1-cnt0==1)begin
				next_state[4:0] = QS_GET_POSITION;
			end else begin
				next_state[4:0] = QS_RD_LEFT;
			end
		end

		/// left-man move to right
		QS_RD_LEFT:begin	
			next_state[4:0] = QS_GET_LEFT;	
		end
		QS_GET_LEFT:begin
			next_state[4:0] = QS_COMPARE_LEFT;	
		end
		QS_COMPARE_LEFT:begin
			if(left_is_small)begin
				if(cnt1-cnt0==1)begin
					next_state[4:0] = QS_GET_POSITION;
				end else begin
					next_state[4:0] = QS_RD_LEFT;
				end
			end else begin
				next_state[4:0] = QS_SWAP_LEFT_GAP1;
			end 
		end
		QS_SWAP_LEFT_GAP1:begin
			next_state[4:0] = QS_SWAP_LEFT_GAP2;
		end
		QS_SWAP_LEFT_GAP2:begin
			if(cnt1-cnt0==1)begin
				next_state[4:0] = QS_GET_POSITION;
			end else begin
				next_state[4:0] = QS_RD_RIGHT;
			end
		end

		/// get position nand check it
		QS_GET_POSITION:begin
			case({sub_left_valid, sub_right_valid})
			  2'b11: next_state[4:0] = QS_BOTH_VALID;
			  2'b10: next_state[4:0] = QS_LEFT_VALID;
			  2'b01: next_state[4:0] = QS_RIGHT_VALID;
			  2'b00: next_state[4:0] = QS_NON_VALID;
			endcase
		end

		/// next split
		QS_BOTH_VALID: begin
			next_state[4:0] = QS_RD_VALUE;
		end
		QS_LEFT_VALID:begin
			next_state[4:0] = QS_RD_VALUE;
		end
		QS_RIGHT_VALID:begin
			next_state[4:0] = QS_RD_VALUE;
		end
		QS_NON_VALID:begin
			if(empty) begin
				next_state[4:0] = QS_DONE;
			end else begin
				next_state[4:0] = QS_GET_STACK;
			end
		end
		QS_GET_STACK:begin
			if(valid)begin
				next_state[4:0] = QS_RD_VALUE;
			end
		end

		/// done and exit
		QS_DONE: next_state[4:0] = QS_IDLE;
		default: next_state[4:0] = QS_IDLE;
	//--------------------------------------
	endcase
end

assign done = (state[4:0]==QS_DONE);

///////////////////////////////////////////////////////
// memory access
///////////////////////////////////////////////////////
// read memory
assign MemRd   	         = (state[4:0]==QS_RD_VALUE) || (state[4:0]==QS_RD_RIGHT) || (state[4:0]==QS_RD_LEFT);
assign MemRdAddr[MW-1:0] = (state[4:0]==QS_RD_RIGHT) ? cnt1[MW-1:0] : cnt0[MW-1:0];

// write memory
assign MemWr             = (state[4:0]==QS_SWAP_RIGHT_GAP1) || (state[4:0]==QS_SWAP_LEFT_GAP1) ||
                           (state[4:0]==QS_SWAP_RIGHT_GAP2) || (state[4:0]==QS_SWAP_LEFT_GAP2); 
assign MemWrAddr[MW-1:0] = ((state[4:0]==QS_SWAP_RIGHT_GAP1) || (state[4:0]==QS_SWAP_LEFT_GAP2)) ? cnt0[MW-1:0] : cnt1[MW-1:0]; 
assign MemWrData[MN-1:0] = ((state[4:0]==QS_SWAP_RIGHT_GAP2) || (state[4:0]==QS_SWAP_LEFT_GAP2)) ? reg_V[MN-1:0] : 
                           ((state[4:0]==QS_SWAP_RIGHT_GAP1)                                   ) ? reg_R[MN-1:0] :
			                                                                           reg_L[MN-1:0];

///////////////////////////////////////////////////////
// reg_V, reg_R, reg_L
///////////////////////////////////////////////////////
always @ (posedge clk or reset_n) begin
	if(!reset_n) begin
		reg_V[MN-1:0] <= {MN{1'b0}};
		reg_R[MN-1:0] <= {MN{1'b0}};
		reg_L[MN-1:0] <= {MN{1'b0}};
	end else begin
		if(state[4:0]==QS_GET_VALUE) begin reg_V[MN-1:0] <= MemRdData[MN-1:0]; end
		if(state[4:0]==QS_GET_RIGHT) begin reg_R[MN-1:0] <= MemRdData[MN-1:0]; end
		if(state[4:0]==QS_GET_LEFT ) begin reg_L[MN-1:0] <= MemRdData[MN-1:0]; end
	end
end

assign left_is_small = (state[4:0]==QS_COMPARE_LEFT ) && (reg_L[MN-1:0] < reg_V[MN-1:0]);
assign right_is_big  = (state[4:0]==QS_COMPARE_RIGHT) && (reg_R[MN-1:0] > reg_V[MN-1:0]);

///////////////////////////////////////////////////////
// cnt0, cnt1
///////////////////////////////////////////////////////
assign num_minus_one[MW:0] = num[MW:0]-1;
always @ (posedge clk or reset_n)begin
	if(!reset_n)begin
		cnt0[MW-1:0] <= {MW{1'b0}};
		cnt1[MW-1:0] <= {MW{1'b0}};
	end else if(state[4:0]==QS_INIT) begin
		cnt0[MW-1:0]<= {MW{1'b0}};
		cnt1[MW-1:0]<= num_minus_one[MW-1:0];
	end else if(state[4:0]==QS_BOTH_VALID || state[4:0]==QS_LEFT_VALID)begin
		cnt0[MW-1:0] <= sub_left_cnt0[MW-1:0];
		cnt1[MW-1:0] <= sub_left_cnt1[MW-1:0];
	end else if(state[4:0]==QS_RIGHT_VALID)begin
		cnt0[MW-1:0] <= sub_right_cnt0[MW-1:0];
		cnt1[MW-1:0] <= sub_right_cnt1[MW-1:0];
	end else if(state[4:0]==QS_GET_STACK && valid)begin
		cnt0[MW-1:0] <= stack_cnt0[MW-1:0];
		cnt1[MW-1:0] <= stack_cnt1[MW-1:0];
	end else begin
		if(left_is_small || (state[4:0]==QS_SWAP_RIGHT_GAP2)) begin cnt0[MW-1:0] <= cnt0[MW-1:0] + 1'b1;end
		if(right_is_big  || (state[4:0]==QS_SWAP_LEFT_GAP2 )) begin cnt1[MW-1:0] <= cnt1[MW-1:0] - 1'b1;end
	end
end

///////////////////////////////////////////////////////
// C0, C1
///////////////////////////////////////////////////////
always @ (posedge clk or reset_n) begin
	if(!reset_n) begin
		C0[MW-1:0] <= {MW{1'b0}}; 
		C1[MW-1:0] <= {MW{1'b0}};
	end else if(state[4:0]==QS_RD_VALUE)begin
		C0[MW-1:0] <= cnt0[MW-1:0]; 
		C1[MW-1:0] <= cnt1[MW-1:0];
	end
end

///////////////////////////////////////////////////////
// position and check
///////////////////////////////////////////////////////
assign pos[MW-1:0] = cnt0[MW-1:0];
assign sub_left_length [MW-1:0] = pos[MW-1:0] - C0[MW-1:0];
assign sub_right_length[MW-1:0] = C1[MW-1:0]  - pos[MW-1:0];
assign sub_left_valid  = sub_left_length[MW-1:0] > 1;
assign sub_right_valid = sub_right_length[MW-1:0] > 1;

assign sub_left_cnt0 [MW-1:0] = C0[MW-1:0];
assign sub_left_cnt1 [MW-1:0] = pos[MW-1:0]-1;
assign sub_right_cnt0[MW-1:0] = pos[MW-1:0]+1;
assign sub_right_cnt1[MW-1:0] = C1[MW-1:0];


///////////////////////////////////////////////////////
// stack access
///////////////////////////////////////////////////////
assign push              = (state[4:0]==QS_BOTH_VALID);
assign push_data[SN-1:0] = {sub_right_cnt0[MW-1:0],sub_right_cnt1[MW-1:0]};
assign pop               = (state[4:0]==QS_NON_VALID) && (!empty);
assign stack_cnt0[MW-1:0]= pop_data[MW +: MW];
assign stack_cnt1[MW-1:0]= pop_data[0  +: MW];

stack_MxN#(SM, SN, SW) stack_128x16(
        .clk      (clk              ),
        .reset_n  (reset_n          ),
        .push     (push             ),
        .push_data(push_data[SN-1:0]),
        .full     (full             ),
        .pop      (pop              ),
        .pop_data (pop_data[SN-1:0] ),
        .empty    (empty            ),
        .valid    (valid            )
);
endmodule
