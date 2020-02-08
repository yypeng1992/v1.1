module stack_MxN#(
	parameter M = 128,
	parameter N = 8,
	parameter WIDTH = 7,
	parameter CONFLICT_PROTECT = 1
)(
	clk, reset_n,
	push, push_data, full, 
	pop, pop_data, valid, empty
);

//localparam WIDTH = $clog(M);

////////////////////////////////////////
// I/O defination
////////////////////////////////////////
input clk;
input reset_n;
input push;
input [N-1:0] push_data;
output full;
input pop;
output [N-1:0] pop_data;
output reg valid;
output empty;

////////////////////////////////////////
// register/wire defination
////////////////////////////////////////
wire x_push;
wire x_pop;
wire conflict;
wire En;
wire Wr;
reg [WIDTH:0] pr;
wire [WIDTH:0] pr_plus_one;
wire [WIDTH:0] pr_minus_one;
wire [WIDTH-1:0] Addr;
wire [N-1:0] WrData;
wire [N-1:0] Data;
reg bypass;
reg [N-1:0] push_data_d;

////////////////////////////////////////
// Main code
////////////////////////////////////////
assign full  = (pr[WIDTH:0] > (M-1));
assign empty = (pr[WIDTH:0] == 0);

assign x_push   = !full  && push;
assign x_pop    = !empty && pop;
assign conflict = x_push && x_pop;
assign En       = !conflict && (x_push || x_pop);
assign Wr       = !conflict && x_push;

/******
 pr points to the next address which will be pushed with a new information.
******/

assign pr_plus_one[WIDTH:0]  = pr[WIDTH:0] + 'h1;
assign pr_minus_one[WIDTH:0] = pr[WIDTH:0] - 'h1;
always@(posedge clk or negedge reset_n)
begin
	if(!reset_n)
		pr[WIDTH:0] <= {WIDTH+1{1'b0}};
	else if(En) begin
		if(Wr) begin
			pr[WIDTH:0] <= pr_plus_one[WIDTH:0];
		end else begin
			pr[WIDTH:0] <= pr_minus_one[WIDTH:0];
		end
	end
end

assign WrData[N-1:0]   = push_data[N-1:0];
assign Addr[WIDTH-1:0] = (En && Wr) ? pr[WIDTH-1:0] : pr_minus_one[WIDTH-1:0];

always@(posedge clk or negedge reset_n)
begin
	if(!reset_n) begin
		bypass             <= 1'b0;
		valid              <= 1'b0;
		push_data_d[N-1:0] <= {N{1'b0}};
	end else begin
		bypass             <= (!CONFLICT_PROTECT && conflict);
		valid              <= (!CONFLICT_PROTECT && conflict) ? 1'b1 : (En && !Wr);
		push_data_d[N-1:0] <= push_data[N-1:0];
	end
end

assign pop_data[N-1:0] = bypass ? push_data_d[N-1:0] : Data[N-1:0];

rf1_MxN#(M,N,WIDTH) rf1_MxN
(
	.clk     (clk            ),
	.reset_n (reset_n        ),
	.En      (En             ),
	.Wr      (Wr             ),
	.Addr    (Addr[WIDTH-1:0]),
	.WrData  (WrData[N-1:0]  ),
	.Data    (Data[N-1:0]    )
);

endmodule
