module quick_sort_top#(
	parameter MM     = 256,
	parameter MN     = 32,
	parameter MW     = 8 /// log(MM)
)(
	input clk,
	input reset_n,
	input En,
	input [31:0] Addr,
	input Wr,
	input [31:0] WrData,
	output [31:0] Data
);

///////////////////////////////////////
// Address parameters
///////////////////////////////////////
//localparam [31:0] QUICK_MODULE_BASE   = 32'h0000_0000;
//localparam [31:0] QUICK_ADDR_MEM_BASE = QUICK_MODULE_BASE[31:0] + {1'b0, 10'h000};
//localparam [31:0] QUICK_ADDR_NUM      = QUICK_MODULE_BASE[31:0] + {1'b1, 10'h000};
//localparam [31:0] QUICK_ADDR_START    = QUICK_MODULE_BASE[31:0] + {1'b1, 10'h004};
//localparam [31:0] QUICK_ADDR_STATUS   = QUICK_MODULE_BASE[31:0] + {1'b1, 10'h008};

localparam [31:0] QUICK_MODULE_BASE   = `QUICK_MODULE_BASE  ;
localparam [31:0] QUICK_ADDR_MEM_BASE = `QUICK_ADDR_MEM_BASE;
localparam [31:0] QUICK_ADDR_NUM      = `QUICK_ADDR_NUM     ;
localparam [31:0] QUICK_ADDR_START    = `QUICK_ADDR_START   ;
localparam [31:0] QUICK_ADDR_STATUS   = `QUICK_ADDR_STATUS  ;

///////////////////////////////////////
// FSM parameters
///////////////////////////////////////
localparam [1:0] ST_IDLE  = 2'd0;
localparam [1:0] ST_CHECK = 2'd1;
localparam [1:0] ST_WORK  = 2'd2;
localparam [1:0] ST_DONE  = 2'd3;

///////////////////////////////////////
// register/wire declaration
///////////////////////////////////////
wire rd;
wire wr;
wire acs_mem;
wire acs_num;
wire acs_start;
wire acs_status;
wire host_wr_mem;
wire host_wr_num;
wire host_set_start;
wire host_rd_mem;
wire host_rd_num;
wire host_query_status;
wire [MW-1:0] host_acs_mem_addr;
reg host_rd_mem_d;
reg host_rd_num_d;
reg host_query_status_d;

reg [1:0] state_last;
reg [1:0] state;
reg [1:0] state_next;
reg exit_done;
reg exit_err;
reg exit_type;
wire busy;
wire idle;
wire [1:0] status;
reg [MN:0] num;
reg num_is_illegal;

wire mem_En;
wire mem_Wr;
wire [MW-1:0] mem_Addr;
wire [MN-1:0] mem_WrData;
wire [MN-1:0] mem_Data;
wire [MN-1:0] Mem_Data;

wire start;
wire done;
wire MemWr;
wire [MW-1:0] MemWrAddr;
wire [MN-1:0] MemWrData;
wire MemRd;
wire [MW-1:0] MemRdAddr;
wire [MN-1:0] MemRdData;

///////////////////////////////////////
// address decoder
///////////////////////////////////////

assign rd = En & !Wr;
assign wr = En &  Wr;

assign acs_mem    = (Addr[31:10]==QUICK_ADDR_MEM_BASE[31:10]);
assign acs_num    = (Addr[31: 2]==QUICK_ADDR_NUM     [31: 2]);
assign acs_start  = (Addr[31: 2]==QUICK_ADDR_START   [31: 2]);
assign acs_status = (Addr[31: 2]==QUICK_ADDR_STATUS  [31: 2]);

assign host_wr_mem       = (wr && acs_mem   ) && idle;
assign host_wr_num       = (wr && acs_num   ) && idle;
assign host_set_start    = (wr && acs_start ) && idle;

assign host_rd_mem       = (rd && acs_mem   ) && idle;
assign host_rd_num       = (rd && acs_num   );
assign host_query_status = (rd && acs_status);

assign host_acs_mem_addr[MW-1:0] = Addr[2+:MW];

/////////////////////////////////////////////////
always@(posedge clk or negedge reset_n)
begin
	if(!reset_n) begin
		host_rd_mem_d       <= 1'b0;
		host_rd_num_d       <= 1'b0;
		host_query_status_d <= 1'b0;
	end else begin
		host_rd_mem_d       <= host_rd_mem      ;
		host_rd_num_d       <= host_rd_num      ;
		host_query_status_d <= host_query_status;
	end
end

assign Data[31:0] = host_rd_mem_d       ? { {(32-MN){1'b0}}, mem_Data[MN-1:0] } :
                    host_rd_num_d       ? { {(31-MW){1'b0}}, num[MW:0]        } :
                    host_query_status_d ? { {(32-2 ){1'b0}}, status[1:0]      } : 32'h0;

///////////////////////////////////////
// FSM
///////////////////////////////////////
always@(posedge clk or negedge reset_n)
begin
	if(!reset_n) begin
		state[1:0]      <= ST_IDLE[1:0];
		state_last[1:0] <= ST_IDLE[1:0];
	end else begin
		state[1:0]      <= state_next[1:0];
		state_last[1:0] <= state[1:0];
	end
end

always@(*) begin
	exit_done = 1'b0;
	exit_err  = 1'b0;
	state_next[1:0] = state[1:0];
	case(state[1:0])
	//--------------------------
	  ST_IDLE: begin
	  	if( host_set_start ) begin
	  		state_next[1:0] = ST_CHECK;
		end
	  end
	  ST_CHECK: begin
	  	if( num_is_illegal ) begin
	  		exit_err = 1'b1;
	  		state_next[1:0] = ST_IDLE;
		end else begin
	  		state_next[1:0] = ST_WORK;
		end
	  end
	  ST_WORK: begin
	  	if( done ) begin
			state_next[1:0] = ST_DONE;
		end
	  end
	  ST_DONE: begin
	  	exit_done = 1'b1;
	  	state_next[1:0] = ST_IDLE;
	  end
	//--------------------------
	endcase
end

always@(posedge clk or negedge reset_n) begin
	if( !reset_n )
		exit_type <= 1'b0;
	else if( start || exit_done )
		exit_type <= 1'b0;
	else if( exit_err )
		exit_type <= 1'b1;
end

assign busy        = !(state[1:0]==ST_IDLE[1:0]);
assign idle        =  (state[1:0]==ST_IDLE[1:0]);
assign status[1:0] = {exit_type, busy};

always@(posedge clk or negedge reset_n) begin
	if( !reset_n )
		num[MW:0] <= 'h0;
	else if( host_wr_num )
		num[MW:0] <= WrData[MW:0];
end

always@(posedge clk or negedge reset_n) begin
	if( !reset_n ) begin
		num_is_illegal <= 1'b0;
	end else begin
		num_is_illegal <= (num[MW:0]==0) || (num[MW:0]>MM);
	end
end


///mem_MMxMN
rf1_MxN#(MM,MN,MW) mem_256x32
(
	.clk     (clk                ),
	.reset_n (reset_n            ),
	.En      (mem_En             ),
	.Wr      (mem_Wr             ),
	.Addr    (mem_Addr[MW-1:0]   ),
	.WrData  (mem_WrData[MN-1:0] ),
	.Data    (mem_Data[MN-1:0]   )
);

assign mem_En             = host_wr_mem || host_rd_mem || MemWr || MemRd;
assign mem_Wr             = idle ? host_wr_mem               : MemWr;
assign mem_Addr[MW-1:0]   = idle ? host_acs_mem_addr[MW-1:0] : (MemWr ? MemWrAddr[MW-1:0] : MemRdAddr[MW-1:0]);
assign mem_WrData[MN-1:0] = idle ? WrData[MN-1:0]            : MemWrData[MN-1:0];

assign MemRdData[MN-1:0]  = mem_Data[MN-1:0];

assign start = (state[1:0]==ST_CHECK) && (state_next[1:0]==ST_WORK);

quick_sort#(MM,MN,MW) quick_sort_core
(
	.clk            (clk               ), //I
	.reset_n        (reset_n           ), //I

	.num            (num[MW:0]         ), //I
	.start          (start             ), //I
	.done           (done              ), //O

	.MemWr          (MemWr             ), //O
	.MemWrAddr      (MemWrAddr[MW-1:0] ), //O
	.MemWrData      (MemWrData[MN-1:0] ), //O
	.MemRd          (MemRd             ), //O
	.MemRdAddr      (MemRdAddr[MW-1:0] ), //O
	.MemRdData      (MemRdData[MN-1:0] )  //I
);

endmodule
