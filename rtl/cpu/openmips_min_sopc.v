module openmips_min_sopc(clk,reset_n,
			data,ce,we,sel,addr,wdata);
input wire     clk;
input wire reset_n;
input wire [31:0]data;
output wire      ce;
output wire      we;
output wire [3:0]sel;
output wire [31:0]addr;
output wire[31:0]wdata

wire       cpu_ce;
wire [31:0]pc;
wire [31:0]inst;
wire [5 :0]int_i;
wire       timer_int_o;

wire [5:0]int_for_timer;
assign int_for_timer[5:0] = {5'd0,timer_int_o};



openmips openmips0(
 .clk       (clk           ),
 .reset_n   (reset_n       ),
 .inst      (inst          ),
 .ce        (cpu_ce        ),
 .addr      (pc            ),
 .ram_data_i(data  ),
 .ram_ce_o  (ce    ),
 .ram_we_o  (we    ),
 .ram_sel_o (sel   ),
 .ram_addr_o(addr  ),
 .ram_data_o(wdata  ),
 .int_i     (int_for_timer         ),
 .timer_int_o (timer_int_o      )
);

inst_rom rom0(
 .clk    (clk    ),
 .reset_n(reset_n),
 .ce     (cpu_ce     ),
 .pc     (pc     ),
 .inst   (inst   )
);

endmodule
