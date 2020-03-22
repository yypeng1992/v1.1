module openmips(clk,reset_n,inst,ce,addr,
		ram_data_i,ram_ce_o,ram_we_o,ram_sel_o,ram_addr_o,ram_data_o,
		int_i,timer_int_o);
input   wire          clk;
input   wire          reset_n;
input   wire [31:0]   inst;
output  wire          ce;
output  wire [31:0]   addr;
input        [5:0]    int_i;
output                timer_int_o;


//////////////////////////////////////////
//////input output for load_store
//////////////////////////////////////////
input       [31:0]ram_data_i;
output wire       ram_ce_o;
output wire       ram_we_o;
output wire [3:0] ram_sel_o;
output wire [31:0]ram_addr_o;
output wire [31:0]ram_data_o;



//////////////////////////////////////
/////pc_reg-pc_id pc_id-id
//////////////////////////////////////
wire [31:0]pc;
wire [31:0]pc_id_id_pc;
wire [31:0]pc_id_id_inst;


//////////////////////////////////////
/////regfile-id
//////////////////////////////////////
wire [4:0]  id_reg_reg1_addr;
wire [4:0]  id_reg_reg2_addr;
wire        id_reg_re1;
wire        id_reg_re2;
wire [31:0] reg_id_reg1_data;
wire [31:0] reg_id_reg2_data;


//////////////////////////////////////
/////id-id_ex
//////////////////////////////////////
wire [2:0 ]id_id_ex_alusel;
wire [7:0 ]id_id_ex_aluop;
wire [31:0]id_id_ex_data1;
wire [31:0]id_id_ex_data2;
wire       id_id_ex_we;
wire [4:0 ]id_id_ex_waddr;

//////////////////////////////////////
/////id_ex-ex
//////////////////////////////////////
wire [2:0 ]id_ex_ex_alusel;
wire [7:0 ]id_ex_ex_aluop;
wire [31:0]id_ex_ex_data1;
wire [31:0]id_ex_ex_data2;
wire       id_ex_ex_we;
wire [4:0 ]id_ex_ex_waddr;


//////////////////////////////////////
/////ex-ex_mem
//////////////////////////////////////
wire      ex_ex_mem_we;
wire[4:0 ]ex_ex_mem_waddr;
wire[31:0]ex_ex_mem_wdata;
wire      ex_ex_mem_whilo;
wire[31:0]ex_ex_mem_hi;
wire[31:0]ex_ex_mem_lo;
wire[5:0 ]ex_ex_mem_cnt;
wire[63:0]ex_ex_mem_hilo_tempt;
wire[63:0]ex_ex_mem_minuend;

//////////////////////////////////////
/////ex_mem-mem
//////////////////////////////////////
wire      ex_mem_mem_we;
wire[4:0 ]ex_mem_mem_waddr;
wire[31:0]ex_mem_mem_wdata;
wire      ex_mem_mem_whilo;
wire[31:0]ex_mem_mem_hi;
wire[31:0]ex_mem_mem_lo;
wire[5:0 ]ex_mem_mem_cnt;
wire[63:0]ex_mem_mem_tempt;
wire[63:0]ex_mem_mem_minuend;

//////////////////////////////////////
/////mem-wb
//////////////////////////////////////
wire      mem_wb_we;
wire[4:0 ]mem_wb_waddr;
wire[31:0]mem_wb_wdata;
wire      mem_wb_whilo;
wire[31:0]mem_wb_hi;
wire[31:0]mem_wb_lo;


//////////////////////////////////////
/////wb-regfile
//////////////////////////////////////
wire      wb_regfile_we;
wire[4:0 ]wb_regfile_waddr;
wire[31:0]wb_regfile_wdata;


//////////////////////////////////////
/////wb-hilo
//////////////////////////////////////
wire      wb_hilo_whilo;
wire[31:0]wb_hilo_hi;
wire[31:0]wb_hilo_lo;

//////////////////////////////////////
/////hilo-ex
//////////////////////////////////////
wire[31:0] hilo_hi;
wire[31:0] hilo_lo;

assign addr = pc;

//////////////////////////////////////
/////ctrl
//////////////////////////////////////
wire [5:0] stall;
wire       stallreg_from_id;
wire       stallreg_from_ex;
wire [5:0] ex_cnt;
wire [63:0]ex_hilo_tempt;
wire [5:0] mem_cnt;
wire [63:0]mem_hilo_tempt;
wire [63:0]mem_ex_minuend;

//////////////////////////////////////
/////jump_branch
//////////////////////////////////////
wire       id_pc_branch_flag;
wire [31:0]id_pc_branch_target;
wire       id_id_ex_next_in_delayslt;
wire       id_id_ex_is_in_delayslot;
wire [31:0]id_id_ex_link_addr;
wire       id_ex_id_is_in_delayslot;
wire       id_ex_ex_is_in_delayslot;
wire [31:0]id_ex_ex_link_addr;

//////////////////////////////////////
/////load_store
//////////////////////////////////////
wire [31:0]id_id_ex_inst;
wire [31:0]id_ex_ex_inst;
wire [2 :0]ex_ex_mem_alusel;
wire [7 :0]ex_ex_mem_aluop;
wire [31:0]ex_ex_mem_addr;
wire [31:0]ex_ex_mem_reg2;
wire [2 :0]ex_mem_mem_alusel;
wire [7 :0]ex_mem_mem_aluop;
wire [31:0]ex_mem_mem_addr;
wire [31:0]ex_mem_mem_reg2;

//////////////////////////////////////
/////load_store  ll sc
//////////////////////////////////////
wire      mem_wb_LLbit_we;
wire      mem_wb_LLbit_value;
wire      wb_LLbit_LLbit_we;
wire      wb_LLbit_LLbit_value;
wire      LLbit_mem_value;

//////////////////////////////////////
/////load_relative
//////////////////////////////////////
wire [1:0] id_id_ex_cnt;
wire [1:0] id_ex_id_cnt;

//////////////////////////////////////
/////for cp0
//////////////////////////////////////
wire [4 :0]ex_cp0_read_addr;
wire [31:0]cp0_ex_read_data;
wire       ex_ex_mem_cp0_we;
wire [4 :0]ex_ex_mem_cp0_write_addr;
wire [31:0]ex_ex_mem_cp0_data;
wire       ex_mem_mem_cp0_we;
wire [4 :0]ex_mem_mem_cp0_write_addr;
wire [31:0]ex_mem_mem_cp0_data;
wire       mem_wb_cp0_we;
wire [4 :0]mem_wb_cp0_write_addr;
wire [31:0]mem_wb_cp0_data;
wire       wb_cp0_we;
wire [4 :0]wb_cp0_write_addr;
wire [31:0]wb_cp0_data;
wire [31:0] count_o;
wire [31:0] compare_o;
wire [31:0] prid_o  ;
wire [31:0] config_o;


//////////////////////////////////////
/////for excepttype
//////////////////////////////////////
wire        ctrl_all_flush;
wire [31:0] ctrl_pc_reg_new_pc;
wire [31:0] id_id_ex_excepttype;
wire [31:0] id_id_ex_current_inst_addr;
wire [31:0] id_ex_ex_excepttype;
wire [31:0] id_ex_ex_current_inst_addr;
wire [31:0] ex_ex_mem_excepttype;
wire [31:0] ex_ex_mem_current_inst_addr;
wire        ex_ex_mem_is_in_delayslot;
wire [31:0] ex_mem_mem_excepttype;
wire [31:0] ex_mem_mem_current_inst_addr;
wire        ex_mem_mem_is_in_delayslot;
wire [31:0] mem_ctrl_epc;
wire [31:0] mem_cp0_excepttype;
wire [31:0] mem_cp0_current_inst_addr;
wire        mem_cp0_is_in_delayslot;
wire [31:0] cp0_mem_status;
wire [31:0] cp0_mem_cause;
wire [31:0] cp0_mem_epc;





//////////////////////////////////////
/////pc_reg
//////////////////////////////////////
pc_reg pc_reg0(
 .clk        (clk                ),
 .reset_n    (reset_n            ),
 .pc         (pc                 ),
 .ce         (ce                 ),
 .pc_stall   (stall              ),
 .branch_flag_i(id_pc_branch_flag),
 .branch_target_address_i(id_pc_branch_target),
 .flush      (ctrl_all_flush     ),
 .new_pc     (ctrl_pc_reg_new_pc )
);

//////////////////////////////////////
/////pc_id
//////////////////////////////////////
pc_id pc_id0(
 .clk        (clk                ),
 .reset_n    (reset_n            ),
 .pc_id_stall(stall              ),
 .pc_pc      (pc                 ),
 .pc_inst    (inst               ),
 .id_pc      (pc_id_id_pc        ),
 .id_inst    (pc_id_id_inst      ),
 .flush      (ctrl_all_flush     )
);


//////////////////////////////////////
/////id
//////////////////////////////////////
id id0(
 .reset_n     (reset_n           ),
 .pc_i        (pc_id_id_pc       ),
 .inst_i      (pc_id_id_inst     ),
 .stallreg_from_id(stallreg_from_id),
 .reg1_data_i (reg_id_reg1_data  ),
 .reg2_data_i (reg_id_reg2_data  ),
 .alusel_o    (id_id_ex_alusel   ),
 .aluop_o     (id_id_ex_aluop    ),
 .reg1_data_o (id_id_ex_data1    ),
 .reg2_data_o (id_id_ex_data2    ),
 .wreg_o      (id_id_ex_we       ),
 .waddr_o     (id_id_ex_waddr    ),
 .reg1_read_o (id_reg_re1        ),
 .reg1_addr_o (id_reg_reg1_addr  ),
 .reg2_read_o (id_reg_re2        ),
 .reg2_addr_o (id_reg_reg2_addr  ),

 .ex_we       (ex_ex_mem_we       ),
 .ex_waddr    (ex_ex_mem_waddr    ),
 .ex_wdata    (ex_ex_mem_wdata    ),
 .mem_we      (mem_wb_we          ),
 .mem_waddr   (mem_wb_waddr       ),
 .mem_wdata   (mem_wb_wdata       ),
 .branch_flag_o           (id_pc_branch_flag         ),
 .branch_target_address_o (id_pc_branch_target       ),
 .next_inst_in_delayslot_o(id_id_ex_next_in_delayslt ),
 .is_in_delayslot_o       (id_id_ex_is_in_delayslot  ),
 .link_addr_o             (id_id_ex_link_addr        ),
 .is_in_delayslot_i       (id_ex_id_is_in_delayslot  ),
 .inst_o       (id_id_ex_inst    ),
 .ex_aluop_i   (ex_ex_mem_aluop  ),
 .id_cnt_i     (id_ex_id_cnt     ),
 .id_cnt_o     (id_id_ex_cnt     ),

 .excepttype_o       (id_id_ex_excepttype       ),
 .current_inst_addr_o(id_id_ex_current_inst_addr)
);

//////////////////////////////////////
/////regfile
//////////////////////////////////////
regfile regfile0(
 .clk         (clk               ),
 .reset_n     (reset_n           ),
 .reg1_addr   (id_reg_reg1_addr  ),
 .reg2_addr   (id_reg_reg2_addr  ),
 .re1         (id_reg_re1        ),
 .re2         (id_reg_re2        ),
 .reg1_data   (reg_id_reg1_data  ),
 .reg2_data   (reg_id_reg2_data  ),
 .wb_we       (wb_regfile_we     ),
 .wb_waddr    (wb_regfile_waddr  ),
 .wb_wdata    (wb_regfile_wdata  )
);

//////////////////////////////////////
/////id_ex
//////////////////////////////////////
id_ex id_ex0(
 .clk         (clk               ),
 .reset_n     (reset_n           ),
 .id_ex_stall (stall             ),
 .id_alusel   (id_id_ex_alusel   ),
 .id_aluop    (id_id_ex_aluop    ),
 .id_reg1_data(id_id_ex_data1    ),
 .id_reg2_data(id_id_ex_data2    ),
 .id_we       (id_id_ex_we       ),
 .id_waddr    (id_id_ex_waddr    ),
 .ex_alusel   (id_ex_ex_alusel   ),
 .ex_aluop    (id_ex_ex_aluop    ),
 .ex_reg1_data(id_ex_ex_data1    ),
 .ex_reg2_data(id_ex_ex_data2    ),
 .ex_we       (id_ex_ex_we       ),
 .ex_waddr    (id_ex_ex_waddr    ),
 .id_is_in_delaylot       (id_id_ex_is_in_delayslot ),
 .id_link_address         (id_id_ex_link_addr       ),
 .next_inst_in_delayslot_i(id_id_ex_next_in_delayslt),
 .ex_is_in_delayslot      (id_ex_ex_is_in_delayslot ),
 .ex_link_address         (id_ex_ex_link_addr       ),
 .is_in_delayslot_o       (id_ex_id_is_in_delayslot ),

 .id_inst(id_id_ex_inst   ),
 .ex_inst(id_ex_ex_inst   ),
 .id_cnt (id_id_ex_cnt    ),
 .ex_cnt (id_ex_id_cnt    ),

 .flush               (ctrl_all_flush            ),
 .id_excepttype       (id_id_ex_excepttype       ),
 .id_current_inst_addr(id_id_ex_current_inst_addr),
 .ex_excepttype       (id_ex_ex_excepttype       ),
 .ex_current_inst_addr(id_ex_ex_current_inst_addr)
);

//////////////////////////////////////
/////ex
//////////////////////////////////////
ex ex0( 
 .reset_n     (reset_n           ),
 .alusel      (id_ex_ex_alusel   ),
 .aluop       (id_ex_ex_aluop    ),
 .reg1_data   (id_ex_ex_data1    ),
 .reg2_data   (id_ex_ex_data2    ),
 .id_we       (id_ex_ex_we       ),
 .id_waddr    (id_ex_ex_waddr    ),

 .ex_we       (ex_ex_mem_we           ),
 .ex_waddr    (ex_ex_mem_waddr         ),
 .ex_wdata    (ex_ex_mem_wdata        ),
 .ex_whilo    (ex_ex_mem_whilo        ),
 .ex_hi       (ex_ex_mem_hi            ),
 .ex_lo       (ex_ex_mem_lo            ),
 
 .hilo_hi     (hilo_hi          ),
 .hilo_lo     (hilo_lo          ),

 .mem_whilo   (mem_wb_whilo        ),
 .mem_hi      (mem_wb_hi           ),
 .mem_lo      (mem_wb_lo           ),
 .wb_whilo   (wb_hilo_whilo          ),
 .wb_hi      (wb_hilo_hi             ),
 .wb_lo      (wb_hilo_lo             ),
 
 .stallreg_from_ex(stallreg_from_ex     ),
 .mem_cnt         (mem_cnt              ),
 .mem_hilo_tempt  (mem_hilo_tempt       ),
 .mem_minuend     (mem_ex_minuend       ),
 .ex_cnt          (ex_ex_mem_cnt        ),
 .ex_hilo_tempt   (ex_ex_mem_hilo_tempt ),
 .minuend         (ex_ex_mem_minuend    ),
 .is_in_delayslot_i(id_ex_ex_is_in_delayslot),
 .link_address_i  (id_ex_ex_link_addr   ),

 .inst_i          (id_ex_ex_inst        ),
 .alusel_o        (ex_ex_mem_alusel     ),
 .aluop_o         (ex_ex_mem_aluop      ),
 .ram_addr_o      (ex_ex_mem_addr       ),
 .reg2_o          (ex_ex_mem_reg2       ),

 .cp0_reg_data_i        (cp0_ex_read_data        ),
 .cp0_reg_read_addr_o   (ex_cp0_read_addr        ),
 .cp0_reg_we_o          (ex_ex_mem_cp0_we        ),
 .cp0_reg_write_addr_o  (ex_ex_mem_cp0_write_addr),
 .cp0_reg_data_o        (ex_ex_mem_cp0_data      ),
 .mem_cp0_reg_we        (mem_wb_cp0_we           ),
 .mem_cp0_reg_write_addr(mem_wb_cp0_write_addr   ),
 .mem_cp0_reg_data      (mem_wb_cp0_data         ),
 .wb_cp0_reg_we         (wb_cp0_we               ),
 .wb_cp0_reg_write_addr (wb_cp0_write_addr       ),
 .wb_cp0_reg_data       (wb_cp0_data             ),

 .excepttype_i          (id_ex_ex_excepttype        ),
 .current_inst_addr_i   (id_ex_ex_current_inst_addr ),
 .excepttype_o          (ex_ex_mem_excepttype       ),
 .current_inst_addr_o   (ex_ex_mem_current_inst_addr),
 .is_in_delayslot_o     (ex_ex_mem_is_in_delayslot  )
);

//////////////////////////////////////
/////ex_mem
//////////////////////////////////////
ex_mem ex_mem0(
 .clk         (clk               ),
 .reset_n     (reset_n           ),
 .ex_mem_stall(stall             ),
 .ex_we       (ex_ex_mem_we      ),
 .ex_waddr    (ex_ex_mem_waddr   ),
 .ex_wdata    (ex_ex_mem_wdata   ),
 .ex_whilo    (ex_ex_mem_whilo   ),
 .ex_hi       (ex_ex_mem_hi      ),
 .ex_lo       (ex_ex_mem_lo      ),
 .ex_cnt      (ex_ex_mem_cnt      ),
 .ex_hilo_tempt(ex_ex_mem_hilo_tempt),
 .ex_minuend  (ex_ex_mem_minuend),
 .mem_we      (ex_mem_mem_we     ),
 .mem_waddr   (ex_mem_mem_waddr  ),
 .mem_wdata   (ex_mem_mem_wdata  ),
 .mem_whilo   (ex_mem_mem_whilo  ),
 .mem_hi      (ex_mem_mem_hi     ),
 .mem_lo      (ex_mem_mem_lo     ),
 .mem_cnt     (ex_mem_mem_cnt    ),
 .mem_hilo_tempt   (ex_mem_mem_tempt),
 .mem_minuend (ex_mem_mem_minuend),

 .ex_alusel   (ex_ex_mem_alusel  ),
 .ex_aluop    (ex_ex_mem_aluop   ),
 .ex_ram_addr (ex_ex_mem_addr    ),
 .ex_reg2     (ex_ex_mem_reg2    ),
 .mem_alusel  (ex_mem_mem_alusel ),
 .mem_aluop   (ex_mem_mem_aluop  ),
 .mem_ram_addr(ex_mem_mem_addr   ),
 .mem_reg2    (ex_mem_mem_reg2   ),

 .ex_cp0_reg_we         (ex_ex_mem_cp0_we         ),
 .ex_cp0_reg_write_addr (ex_ex_mem_cp0_write_addr ),
 .ex_cp0_reg_data       (ex_ex_mem_cp0_data       ),
 .mem_cp0_reg_we        (ex_mem_mem_cp0_we        ),
 .mem_cp0_reg_write_addr(ex_mem_mem_cp0_write_addr),
 .mem_cp0_reg_data      (ex_mem_mem_cp0_data      ),

 .flush                 (ctrl_all_flush              ),
 .ex_excepttype         (ex_ex_mem_excepttype        ),
 .ex_current_inst_addr  (ex_ex_mem_current_inst_addr ),
 .ex_is_in_delayslot    (ex_ex_mem_is_in_delayslot   ),
 .mem_excepttype        (ex_mem_mem_excepttype       ),
 .mem_current_inst_addr (ex_mem_mem_current_inst_addr),
 .mem_is_in_delayslot   (ex_mem_mem_is_in_delayslot  )
);

//////////////////////////////////////
/////mem
//////////////////////////////////////
mem mem0(
 .reset_n     (reset_n          ),
 .ex_we       (ex_mem_mem_we    ),
 .ex_waddr    (ex_mem_mem_waddr ),
 .ex_wdata    (ex_mem_mem_wdata ),
 .ex_whilo    (ex_mem_mem_whilo ),
 .ex_hi       (ex_mem_mem_hi    ),
 .ex_lo       (ex_mem_mem_lo    ),
 .mem_we      (mem_wb_we        ),
 .mem_waddr   (mem_wb_waddr     ),
 .mem_wdata   (mem_wb_wdata     ),
 .mem_whilo   (mem_wb_whilo     ),
 .mem_hi      (mem_wb_hi        ),
 .mem_lo      (mem_wb_lo        ),

 .mem_cnt       (mem_cnt           ),
 .mem_hilo_tempt(mem_hilo_tempt    ),
 .mem_minuend   (mem_ex_minuend    ),
 .ex_cnt        ( ex_mem_mem_cnt   ),
 .ex_hilo_tempt (ex_mem_mem_tempt  ),
 .ex_minuend    (ex_mem_mem_minuend),

 .alusel_i      (ex_mem_mem_alusel ),
 .aluop_i       (ex_mem_mem_aluop  ),
 .ram_addr_i    (ex_mem_mem_addr   ),
 .reg2_i        (ex_mem_mem_reg2   ),
 .ram_data_i    (ram_data_i        ),
 .ram_addr_o    (ram_addr_o        ),
 .ram_ce_o      (ram_ce_o          ),
 .ram_we_o      (ram_we_o          ),
 .ram_sel_o     (ram_sel_o         ),
 .ram_data_o    (ram_data_o        ),

 .LLbit_we_o    (mem_wb_LLbit_we   ),
 .LLbit_value_o (mem_wb_LLbit_value),
 .LLbit_i       (LLbit_mem_value   ),
 .wb_LLbit_we_i (wb_LLbit_LLbit_we ),
 .wb_LLbit_value_i(wb_LLbit_LLbit_value),

 .cp0_reg_we_i        (ex_mem_mem_cp0_we        ),
 .cp0_reg_write_addr_i(ex_mem_mem_cp0_write_addr),
 .cp0_reg_data_i      (ex_mem_mem_cp0_data      ),
 .cp0_reg_we_o        (mem_wb_cp0_we            ),
 .cp0_reg_write_addr_o(mem_wb_cp0_write_addr    ),
 .cp0_reg_data_o      (mem_wb_cp0_data          ),

 .excepttype_i        (ex_mem_mem_excepttype        ),
 .current_inst_addr_i (ex_mem_mem_current_inst_addr ),
 .is_in_delayslot_i   (ex_mem_mem_is_in_delayslot   ),
 .cp0_status_i        (cp0_mem_status               ),
 .cp0_cause_i         (cp0_mem_cause		    ),
 .cp0_epc_i           (cp0_mem_epc		    ),
 .wb_cp0_reg_we        (wb_cp0_we		    ),
 .wb_cp0_reg_write_addr(wb_cp0_write_addr	    ),
 .wb_cp0_reg_write_data(wb_cp0_data		    ),
 .excepttype_o        (mem_cp0_excepttype	    ),
 .current_inst_addr_o (mem_cp0_current_inst_addr    ),
 .is_in_delayslot_o   (mem_cp0_is_in_delayslot      ),
 .cp0_epc_o           (mem_ctrl_epc		    )
);

wb wb0(
 .clk         (clk              ),
 .reset_n     (reset_n          ),
 .mem_we      (mem_wb_we        ),
 .mem_waddr   (mem_wb_waddr     ),
 .mem_wdata   (mem_wb_wdata     ),
 .mem_whilo   (mem_wb_whilo     ),
 .mem_hi      (mem_wb_hi        ),
 .mem_lo      (mem_wb_lo        ),
 .wb_we       (wb_regfile_we    ),
 .wb_waddr    (wb_regfile_waddr ),
 .wb_wdata    (wb_regfile_wdata ),
 .wb_whilo    (wb_hilo_whilo    ),
 .wb_hi       (wb_hilo_hi       ),
 .wb_lo       (wb_hilo_lo       ),
 .wb_stall    (stall            ),

 .mem_LLbit_we (mem_wb_LLbit_we      ),
 .mem_LLbit_value(mem_wb_LLbit_value ),
 .wb_LLbit_we  (wb_LLbit_LLbit_we    ),
 .wb_LLbit_value(wb_LLbit_LLbit_value),

 .mem_cp0_reg_we        (mem_wb_cp0_we        ),
 .mem_cp0_reg_write_addr(mem_wb_cp0_write_addr),
 .mem_cp0_reg_data      (mem_wb_cp0_data      ),
 .wb_cp0_reg_we         (wb_cp0_we            ),
 .wb_cp0_reg_write_addr (wb_cp0_write_addr    ),
 .wb_cp0_reg_data       (wb_cp0_data          ),

 .flush                 (ctrl_all_flush       )
);

hilo hilo0(
 .clk         (clk              ),
 .reset_n     (reset_n          ),
 .whilo       (wb_hilo_whilo    ),
 .hi_i        (wb_hilo_hi       ),
 .lo_i        (wb_hilo_lo       ),
 .hi_o        (hilo_hi            ),
 .lo_o        (hilo_lo            )
);

ctrl ctrl0(
 .reset_n     (reset_n          ),
 .stall       (stall            ),
 .stallreg_from_id(stallreg_from_id),
 .stallreg_from_ex(stallreg_from_ex),

 .cp0_epc_i    (mem_ctrl_epc      ),
 .excepttype_i (mem_cp0_excepttype),
 .flush        (ctrl_all_flush    ),
 .new_pc       (ctrl_pc_reg_new_pc)
);

LLbit_reg LLbit0(
 .clk         (clk              ),
 .reset_n     (reset_n          ),
 .flush       (ctrl_all_flush   ),
 .we          (wb_LLbit_LLbit_we ),
 .LLbit_i     (wb_LLbit_LLbit_value),
 .LLbit_o     (LLbit_mem_value   )

);

cp0_reg cp0(
 .clk         (clk              ),
 .reset_n     (reset_n          ),
 .int_i       (int_i            ),
 .raddr_i     (ex_cp0_read_addr ),
 .we_i        (wb_cp0_we        ),
 .waddr_i     (wb_cp0_write_addr),
 .data_i      (wb_cp0_data      ),
 .count_o     (count_o          ),
 .compare_o   (compare_o        ),
 .status_o    (cp0_mem_status   ),
 .cause_o     (cp0_mem_cause    ),
 .epc_o       (cp0_mem_epc      ),
 .prid_o      (prid_o           ),
 .config_o    (config_o         ),
 .timer_int_o (timer_int_o      ),
 .data_o      (cp0_ex_read_data ),

 .excepttype_i       (mem_cp0_excepttype       ),
 .current_inst_addr_i(mem_cp0_current_inst_addr),
 .is_in_delayslot_i  (mem_cp0_is_in_delayslot  )
);
endmodule
