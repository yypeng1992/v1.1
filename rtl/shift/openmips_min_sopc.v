module openmips_min_sopc(clk,reset_n);
input wire     clk;
input wire reset_n;

wire       ce;
wire [31:0]pc;
wire [31:0]inst;


openmips openmips0(
 .clk    (clk    ),
 .reset_n(reset_n),
 .inst   (inst   ),
 .ce     (ce     ),
 .addr (pc     )
);

inst_rom rom0(
 .clk    (clk    ),
 .reset_n(reset_n),
 .ce     (ce     ),
 .pc     (pc     ),
 .inst   (inst   )
);

endmodule
