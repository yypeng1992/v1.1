////////////////////////////////////////////////////
// File        : quick_sort3.v
// Description : What differs with quick_sort.v is 
//               quick_sort3 contains a pipeline.
////////////////////////////////////////////////////
module quick_sort3#(
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
wire read_V;
wire read_R;
wire read_L;
reg [MN-1:0] reg_V;
reg [MN-1:0] reg_R;
reg [MN-1:0] reg_L;
wire right_compare;
wire left_compare;
wire right_is_small;
wire right_is_big;
wire left_is_small;
wire left_is_big;

wire swap_right_gap1;
wire swap_right_gap2;
wire swap_left_gap1 ;
wire swap_left_gap2 ;

wire cnt_init;
wire cnt_reload_left;
wire cnt_reload_right;
wire cnt_reload_stack;
wire right_move;
wire left_move;
wire cnt0_inc;
wire cnt1_dec;
wire cnt0_recover_with_swap;
wire cnt1_recover_with_swap;
wire cnt0_recover_without_swap;
wire cnt1_recover_without_swap;
wire [MW:0] num_minus_one;
reg [MW:0] cnt0;
reg [MW:0] cnt1;

wire cnt_backup;
reg [MW-1:0] C0;
reg [MW-1:0] C1;

wire [MW:0] cnt0_minus_cnt1;
wire ready_to_meet;
wire swap_to_meet;
wire swap_exit_meet;
reg  meet_pending;

wire get_position;
wire [MW-1:0] position;
wire [MW-1:0] sub_left_cnt0;
wire [MW-1:0] sub_left_cnt1;
wire [MW-1:0] sub_right_cnt0;
wire [MW-1:0] sub_right_cnt1;
wire [MW-1:0] sub_left_depth;
wire [MW-1:0] sub_right_depth;
wire sub_left_valid;
wire sub_right_valid;

wire push;
wire [SN-1:0] push_data;
wire full;
wire pop;
wire [SN-1:0] pop_data;
wire empty;
wire valid;
wire [MW-1:0] stack_cnt0;
wire [MW-1:0] stack_cnt1;

// only for debug
reg [63:0] debug_cnt;

///////////////////////////////////////
// quick_sort(QS) FSM
///////////////////////////////////////
localparam [3:0] QS_IDLE            = 4'd0;
localparam [3:0] QS_INIT            = 4'd1;
localparam [3:0] QS_SET_VALUE       = 4'd2;
localparam [3:0] QS_RIGHT_MOVE      = 4'd3;
localparam [3:0] QS_SWAP_RIGHT_GAP1 = 4'd4;
localparam [3:0] QS_SWAP_RIGHT_GAP2 = 4'd5;
localparam [3:0] QS_LEFT_MOVE       = 4'd6;
localparam [3:0] QS_SWAP_LEFT_GAP1  = 4'd7;
localparam [3:0] QS_SWAP_LEFT_GAP2  = 4'd8;
localparam [3:0] QS_GET_POSITION    = 4'd9;
localparam [3:0] QS_BOTH_VALID      = 4'd10;
localparam [3:0] QS_LEFT_VALID      = 4'd11;
localparam [3:0] QS_RIGHT_VALID     = 4'd12;
localparam [3:0] QS_NONE_VALID      = 4'd13;
localparam [3:0] QS_GET_STACK       = 4'd14;
localparam [3:0] QS_DONE            = 4'd15;

reg [3:0] state_next;
reg [3:0] state;
reg [3:0] state_last1;
reg [3:0] state_last2;

///////////////////////////////////////
// FSM
///////////////////////////////////////
always@(posedge clk or negedge reset_n)
begin
	if(!reset_n) begin
		state[3:0]       <= QS_IDLE[3:0];
		state_last1[3:0] <= QS_IDLE[3:0];
		state_last2[3:0] <= QS_IDLE[3:0];
	end else begin
		state[3:0]       <= state_next[3:0];
		state_last1[3:0] <= state[3:0];
		state_last2[3:0] <= state_last1[3:0];
	end
end

always@(*) begin
	state_next[3:0] = state[3:0];
	case(state[3:0])
	//--------------------------
	  QS_IDLE: begin
	  	if( start ) begin
			state_next[3:0] = QS_INIT;
		end
	  end
	  QS_INIT: begin
	  	state_next[3:0] = QS_SET_VALUE;
	  end

	  /// get the first value in array.
	  QS_SET_VALUE: begin
	  	state_next[3:0] = QS_RIGHT_MOVE;
	  end

	  /// right-man move to left.
	  QS_RIGHT_MOVE: begin
	  	if( right_compare ) begin
	  		if( right_is_small ) begin
	  			state_next[3:0] = QS_SWAP_RIGHT_GAP1;
			end else if( ready_to_meet ) begin
	  			state_next[3:0] = QS_GET_POSITION;
			end
		end
	  end
	  QS_SWAP_RIGHT_GAP1: begin
	  	state_next[3:0] = QS_SWAP_RIGHT_GAP2;
	  end
	  QS_SWAP_RIGHT_GAP2: begin
		if( meet_pending ) begin
	  		state_next[3:0] = QS_GET_POSITION;
		end else begin
	  		state_next[3:0] = QS_LEFT_MOVE;
		end
	  end

	  /// left-man move to right.
	  QS_LEFT_MOVE: begin
	  	if( left_compare ) begin
	  		if( left_is_big ) begin
	  			state_next[3:0] = QS_SWAP_LEFT_GAP1;
			end else if( ready_to_meet ) begin
	  			state_next[3:0] = QS_GET_POSITION;
			end
		end
	  end
	  QS_SWAP_LEFT_GAP1: begin
	  	state_next[3:0] = QS_SWAP_LEFT_GAP2;
	  end
	  QS_SWAP_LEFT_GAP2: begin
		if( meet_pending ) begin
	  		state_next[3:0] = QS_GET_POSITION;
		end else begin
	  		state_next[3:0] = QS_RIGHT_MOVE;
		end
	  end

	  /// get position and check it.
	  QS_GET_POSITION: begin
	  	case({sub_left_valid, sub_right_valid})
		//------------------------
		  2'b11: state_next[3:0] = QS_BOTH_VALID;
		  2'b10: state_next[3:0] = QS_LEFT_VALID;
		  2'b01: state_next[3:0] = QS_RIGHT_VALID;
		  2'b00: state_next[3:0] = QS_NONE_VALID;
		//------------------------
		endcase
	  end

	  QS_BOTH_VALID: begin
	  	state_next[3:0] = QS_SET_VALUE;
	  end
	  QS_LEFT_VALID: begin
	  	state_next[3:0] = QS_SET_VALUE;
	  end
	  QS_RIGHT_VALID: begin
	  	state_next[3:0] = QS_SET_VALUE;
	  end
	  QS_NONE_VALID: begin
	  	if( empty ) begin
	  		state_next[3:0] = QS_DONE;
		end else begin
	  		state_next[3:0] = QS_GET_STACK;
		end
	  end
	  QS_GET_STACK: begin
	  	if( valid ) begin
	  		state_next[3:0] = QS_SET_VALUE;
		end
	  end
	  QS_DONE: begin
	  	state_next[3:0] = QS_IDLE;
	  end

	  default: state_next[3:0] = QS_IDLE;
	//--------------------------
	endcase
end

assign done = (state[3:0]==QS_DONE);

///////////////////////////////////
// reg_V, reg_R, reg_L
///////////////////////////////////
assign read_V = (state[3:0]==QS_SET_VALUE);
assign read_R = (state[3:0]==QS_RIGHT_MOVE);
assign read_L = (state[3:0]==QS_LEFT_MOVE);

always@(posedge clk or negedge reset_n)
begin
	if(!reset_n) begin
		reg_V[MN-1:0] <= {MN{1'b0}};
		reg_R[MN-1:0] <= {MN{1'b0}};
		reg_L[MN-1:0] <= {MN{1'b0}};
	end else begin
		if(state_last1[3:0]==QS_SET_VALUE                                   ) begin reg_V[MN-1:0] <= MemRdData[MN-1:0]; end
		if(state_last1[3:0]==QS_RIGHT_MOVE && state_next[3:0]==QS_RIGHT_MOVE) begin reg_R[MN-1:0] <= MemRdData[MN-1:0]; end
		if(state_last1[3:0]==QS_LEFT_MOVE  && state_next[3:0]==QS_LEFT_MOVE ) begin reg_L[MN-1:0] <= MemRdData[MN-1:0]; end
	end
end

assign right_compare  = (state[3:0]==QS_RIGHT_MOVE) && (state_last2[3:0]==QS_RIGHT_MOVE);
assign left_compare   = (state[3:0]==QS_LEFT_MOVE ) && (state_last2[3:0]==QS_LEFT_MOVE );
assign right_is_small = right_compare && (reg_R[MN-1:0]<reg_V[MN-1:0]);
assign right_is_big   = right_compare && (reg_R[MN-1:0]>reg_V[MN-1:0]);
assign left_is_small  = left_compare  && (reg_L[MN-1:0]<reg_V[MN-1:0]);
assign left_is_big    = left_compare  && (reg_L[MN-1:0]>reg_V[MN-1:0]);

///////////////////////////////////
// swap
///////////////////////////////////
assign swap_right_gap1 = (state[3:0]==QS_SWAP_RIGHT_GAP1);
assign swap_right_gap2 = (state[3:0]==QS_SWAP_RIGHT_GAP2);
assign swap_left_gap1  = (state[3:0]==QS_SWAP_LEFT_GAP1);
assign swap_left_gap2  = (state[3:0]==QS_SWAP_LEFT_GAP2);

///////////////////////////////////
// cnt0, cnt1
///////////////////////////////////
assign cnt_init         = (state[3:0]==QS_INIT);

assign cnt_reload_left  = (state[3:0]==QS_BOTH_VALID) || (state[3:0]==QS_LEFT_VALID);
assign cnt_reload_right = (state[3:0]==QS_RIGHT_VALID);
assign cnt_reload_stack = (state[3:0]==QS_GET_STACK) && valid;

assign right_move       = (state[3:0]==QS_RIGHT_MOVE);
assign left_move        = (state[3:0]==QS_LEFT_MOVE);
assign cnt0_inc         = left_move  || swap_right_gap2;
assign cnt1_dec         = right_move || swap_left_gap2;

assign cnt0_recover_with_swap    = left_is_big;
assign cnt1_recover_with_swap    = right_is_small;
assign cnt0_recover_without_swap = ready_to_meet && left_is_small;
assign cnt1_recover_without_swap = ready_to_meet && right_is_big;

assign num_minus_one[MW:0] = num[MW:0] - 1;

always@(posedge clk or negedge reset_n)
begin
	if(!reset_n) begin
		cnt0[MW:0] <= {MW+1{1'b0}};
		cnt1[MW:0] <= {MW+1{1'b0}};
	end else if( cnt_init ) begin
		cnt0[MW:0] <= {MW+1{1'b0}};
		cnt1[MW:0] <= {1'b0,num_minus_one[MW-1:0]};
	end else if( cnt_reload_left ) begin
		cnt0[MW:0] <= {1'b0,sub_left_cnt0[MW-1:0]};
		cnt1[MW:0] <= {1'b0,sub_left_cnt1[MW-1:0]};
	end else if( cnt_reload_right ) begin
		cnt0[MW:0] <= {1'b0,sub_right_cnt0[MW-1:0]};
		cnt1[MW:0] <= {1'b0,sub_right_cnt1[MW-1:0]};
	end else if( cnt_reload_stack ) begin
		cnt0[MW:0] <= {1'b0,stack_cnt0[MW-1:0]};
		cnt1[MW:0] <= {1'b0,stack_cnt1[MW-1:0]};
	end else begin
		if( cnt0_recover_with_swap ) begin
			cnt0[MW:0] <= cnt0[MW:0] - 2;
		end else if( cnt0_recover_without_swap ) begin
			cnt0[MW:0] <= cnt0[MW:0] - 1;
		end else if( cnt0_inc ) begin 
			cnt0[MW:0] <= cnt0[MW:0] + 1;
		end
		if( cnt1_recover_with_swap ) begin
			cnt1[MW:0] <= cnt1[MW:0] + 2;
		end else if( cnt1_recover_without_swap ) begin
			cnt1[MW:0] <= cnt1[MW:0] + 1;
		end else if( cnt1_dec ) begin
			cnt1[MW:0] <= cnt1[MW:0] - 1;
		end
	end
end

///////////////////////////////////
// meet detection
///////////////////////////////////
assign cnt0_minus_cnt1[MW:0] = cnt0[MW:0]-cnt1[MW:0];
assign ready_to_meet  = (left_compare||right_compare) && (cnt0_minus_cnt1[MW:0]==1);
assign swap_to_meet   = ready_to_meet && (right_is_small||left_is_big);
assign swap_exit_meet = meet_pending && (swap_right_gap2 || swap_left_gap2);
always@(posedge clk or negedge reset_n)
begin
	if(!reset_n) begin
		meet_pending <= 1'b0;
	end else if( swap_to_meet ) begin
		meet_pending <= 1'b1;
	end else if( swap_exit_meet ) begin
		meet_pending <= 1'b0;
	end
end

///////////////////////////////////
// C0, C1
///////////////////////////////////
assign cnt_backup = (state[3:0]==QS_SET_VALUE);
always@(posedge clk or negedge reset_n)
begin
	if(!reset_n) begin
		C0[MW-1:0] <= {MW{1'b0}};
		C1[MW-1:0] <= {MW{1'b0}};
	end else if( cnt_backup ) begin
		C0[MW-1:0] <= cnt0[MW-1:0];
		C1[MW-1:0] <= cnt1[MW-1:0];
	end
end

///////////////////////////////////
// position
///////////////////////////////////
assign get_position = (state[3:0]==QS_GET_POSITION);
assign position[MW-1:0] = cnt0[MW-1:0];

assign sub_left_cnt0[MW-1:0]   = C0[MW-1:0];
assign sub_left_cnt1[MW-1:0]   = position[MW-1:0]-1;
assign sub_right_cnt0[MW-1:0]  = position[MW-1:0]+1;
assign sub_right_cnt1[MW-1:0]  = C1[MW-1:0];

assign sub_left_depth[MW-1:0]  = position[MW-1:0] - C0[MW-1:0];
assign sub_right_depth[MW-1:0] = C1[MW-1:0] - position[MW-1:0];

assign sub_left_valid  = get_position && (sub_left_depth[MW-1:0] > 1);
assign sub_right_valid = get_position && (sub_right_depth[MW-1:0]> 1);

///////////////////////////////////
// access memory
///////////////////////////////////
assign MemWr             = (swap_right_gap1 || swap_right_gap2 || swap_left_gap1 || swap_left_gap2);
assign MemWrAddr[MW-1:0] = (swap_right_gap1 || swap_left_gap2) ? cnt0[MW-1:0] :
                           (swap_right_gap2 || swap_left_gap1) ? cnt1[MW-1:0] : {MW{1'b0}};
assign MemWrData[MN-1:0] = (swap_right_gap2 || swap_left_gap2) ? reg_V[MN-1:0] :
                           (swap_right_gap1                  ) ? reg_R[MN-1:0] :
                           (                   swap_left_gap1) ? reg_L[MN-1:0] : {MN{1'b0}};

assign MemRd             = (read_V || read_R || read_L);
assign MemRdAddr[MW-1:0] = (read_V || read_L) ? cnt0[MW-1:0] : 
                           (read_R          ) ? cnt1[MW-1:0] : {MW{1'b0}};

///////////////////////////////////
// access stack
///////////////////////////////////
assign push               = (state[3:0]==QS_BOTH_VALID);
assign push_data[SN-1:0]  = {sub_right_cnt1[MW-1:0], sub_right_cnt0[MW-1:0]};

assign pop                = (state[3:0]==QS_NONE_VALID) && !empty;
assign stack_cnt0[MW-1:0] = pop_data[0  +: MW];
assign stack_cnt1[MW-1:0] = pop_data[MW +: MW];

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

///////////////////////////////////
// debug
///////////////////////////////////
always@(posedge clk or negedge reset_n)
begin
	if(!reset_n) begin
		debug_cnt[63:0] <= 64'h0;
	end else if( state[3:0]==QS_IDLE && state_next[3:0]!=QS_IDLE ) begin
		debug_cnt[63:0] <= 64'h0;
	end else if( state[3:0]!=QS_IDLE ) begin
		debug_cnt[63:0] <= debug_cnt[63:0] + 1;
	end
end

endmodule
