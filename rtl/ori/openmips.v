module openmips(clk,reset_n,inst,ce,addr);
input   wire          clk;
input   wire          reset_n;
input   wire [31:0]   inst;
output  wire          ce;
output  wire [31:0]   addr;

wire [31:0] pc;
wire [4:0]  id_reg_reg1_addr;
wire [4:0]  id_reg_reg2_addr;
wire        id_reg_re1;
wire        id_reg_re2;
wire [31:0] reg_id_reg1_data;
wire [31:0] reg_id_reg2_data;

wire [2:0]  alusel;
wire [7:0]  aluop;
wire [31:0] id_ex_reg1_data;
wire [31:0] id_ex_reg2_data;
wire        id_ex_wreg;
wire [4:0]  id_ex_waddr;

wire        ex_we;
wire  [4:0] ex_waddr;
wire  [31:0]ex_wdata;

wire        mem_we;
wire[4:0]   mem_waddr;
wire[31:0]  mem_wdata;

assign addr = pc;
pc_reg pc_reg0(
 .clk        (clk                ),
 .reset_n    (reset_n            ),
 .pc         (pc                 ),
 .ce         (ce                 )
);

id id0(
 .clk         (clk               ),
 .reset_n     (reset_n           ),
 .pc_i        (pc                ),
 .inst_i      (inst              ),
 .reg1_data_i (reg_id_reg1_data  ),
 .reg2_data_i (reg_id_reg2_data  ),
 .alusel_o    (alusel            ),
 .aluop_o     (aluop             ),
 .reg1_data_o (id_ex_reg1_data   ),
 .reg2_data_o (id_ex_reg2_data   ),
 .wreg_o      (id_ex_wreg        ),
 .waddr_o     (id_ex_waddr       ),
 .reg1_read_o (id_reg_re1        ),
 .reg1_addr_o (id_reg_reg1_addr  ),
 .reg2_read_o (id_reg_re2        ),
 .reg2_addr_o (id_reg_reg2_addr  ),
 .ex_we       (ex_we             ),
 .ex_waddr    (ex_waddr          ),
 .ex_wdata     (ex_wdata           ),
 .mem_we      (mem_we            ),
 .mem_waddr   (mem_waddr          ),
 .mem_wdata   (mem_wdata          )
);

regfile regfile0(
 .clk         (clk               ),
 .reset_n     (reset_n           ),
 .reg1_addr   (id_reg_reg1_addr  ),
 .reg2_addr   (id_reg_reg2_addr  ),
 .re1         (id_reg_re1        ),
 .re2         (id_reg_re2        ),
 .reg1_data   (reg_id_reg1_data  ),
 .reg2_data   (reg_id_reg2_data  ),
 .wb_we       (wb_we             ),
 .wb_waddr    (wb_waddr           ),
 .wb_wdata    (wb_wdata           )
);

ex ex0( 
 .clk         (clk              ),
 .reset_n     (reset_n          ),
 .alusel      (alusel           ),
 .aluop       (aluop            ),
 .reg1_data   (id_ex_reg1_data  ),
 .reg2_data   (id_ex_reg2_data  ),
 .id_we       (id_ex_wreg       ),
 .id_waddr    (id_ex_waddr      ),
 .ex_we       (ex_we            ),
 .ex_waddr    (ex_waddr         ),
 .ex_wdata    (ex_wdata          )
);

mem mem0(
 .clk         (clk              ),
 .reset_n     (reset_n          ),
 .ex_we       (ex_we            ),
 .ex_waddr     (ex_waddr         ),
 .ex_wdata     (ex_wdata          ),
 .mem_we      (mem_we           ),
 .mem_waddr    (mem_waddr         ),
 .mem_wdata    (mem_wdata         )
);

wb wb0(
 .clk         (clk              ),
 .reset_n     (reset_n          ),
 .mem_we      (mem_we           ),
 .mem_waddr   (mem_waddr        ),
 .mem_wdata   (mem_wdata        ),
 .wb_we       (wb_we            ),
 .wb_waddr    (wb_waddr         ),
 .wb_wdata    (wb_wdata         )
);


endmodule
