module openmips_min_sopc(clk,reset_n);
input wire     clk;
input wire reset_n;

wire       ce;
wire [31:0]pc;
wire [31:0]inst;

wire      mem_ram_ce;
wire      mem_ram_we;
wire[3:0] mem_ram_sel;
wire[31:0]mem_ram_addr;
wire[31:0]mem_ram_data;
wire[31:0]ram_mem_data;


openmips openmips0(
 .clk       (clk           ),
 .reset_n   (reset_n       ),
 .inst      (inst          ),
 .ce        (ce            ),
 .addr      (pc            ),
 .ram_data_i(ram_mem_data  ),
 .ram_ce_o  (mem_ram_ce    ),
 .ram_we_o  (mem_ram_we    ),
 .ram_sel_o (mem_ram_sel   ),
 .ram_addr_o(mem_ram_addr  ),
 .ram_data_o(mem_ram_data  )
);

inst_rom rom0(
 .clk    (clk    ),
 .reset_n(reset_n),
 .ce     (ce     ),
 .pc     (pc     ),
 .inst   (inst   )
);

data_ram ram0(
 .clk      (clk           ),
 .ce       (mem_ram_ce    ),
 .we       (mem_ram_we    ),
 .sel      (mem_ram_sel   ),
 .addr     (mem_ram_addr  ),
 .data_i   (mem_ram_data  ),
 .data_o   (ram_mem_data  )
);
endmodule
