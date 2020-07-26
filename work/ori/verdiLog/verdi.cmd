verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "833"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/ori/ori.fsdb}
srcHBSelect "ori_tb.sopc.rom0" -win $_nTrace1
srcSetScope -win $_nTrace1 "ori_tb.sopc.rom0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {2 8 2 1 11 1}
wvAddSignal -win $_nWave2 "/ori_tb/sopc/rom0/clk" "/ori_tb/sopc/rom0/reset_n" \
           "/ori_tb/sopc/rom0/ce" "/ori_tb/sopc/rom0/pc\[31:0\]" \
           "/ori_tb/sopc/rom0/inst\[31:0\]"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 232.796606 -snap {("G1" 5)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 219.676566 328.000998
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 249.544384 -snap {("G1" 4)}
srcHBSelect "ori_tb.sopc.openmips0.pc_reg0" -win $_nTrace1
srcHBSelect "ori_tb.sopc.openmips0.id0" -win $_nTrace1
srcHBSelect "ori_tb.sopc.openmips0.id0" -win $_nTrace1
srcHBSelect "ori_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "ori_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {48 53 1 1 19 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {49 54 4 1 9 1}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 "/ori_tb/sopc/openmips0/id0/reg1_read_o" \
           "/ori_tb/sopc/openmips0/id0/reg1_addr_o\[4:0\]" \
           "/ori_tb/sopc/openmips0/id0/reg2_read_o" \
           "/ori_tb/sopc/openmips0/id0/reg2_addr_o\[4:0\]"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 269.980260 -snap {("G1" 5)}
srcDeselectAll -win $_nTrace1
srcHBSelect "ori_tb.sopc.openmips0.regfile0" -win $_nTrace1
srcSetScope -win $_nTrace1 "ori_tb.sopc.openmips0.regfile0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {9 11 1 1 1 1}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvAddSignal -win $_nWave2 "/ori_tb/sopc/openmips0/regfile0/reg1_data\[31:0\]" \
           "/ori_tb/sopc/openmips0/regfile0/reg2_data\[31:0\]"
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvScrollDown -win $_nWave2 1
srcHBSelect "ori_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "ori_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {39 46 11 1 1 1}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 "/ori_tb/sopc/openmips0/id0/alusel_o\[2:0\]" \
           "/ori_tb/sopc/openmips0/id0/aluop_o\[7:0\]" \
           "/ori_tb/sopc/openmips0/id0/reg1_data_o\[31:0\]" \
           "/ori_tb/sopc/openmips0/id0/reg2_data_o\[31:0\]" \
           "/ori_tb/sopc/openmips0/id0/wreg_o" \
           "/ori_tb/sopc/openmips0/id0/waddr_o\[4:0\]"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvScrollDown -win $_nWave2 1
srcHBSelect "ori_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "ori_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {11 15 1 1 1 1}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/ori_tb/sopc/openmips0/ex0/ex_we" \
           "/ori_tb/sopc/openmips0/ex0/ex_waddr\[4:0\]" \
           "/ori_tb/sopc/openmips0/ex0/ex_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetCursor -win $_nWave2 289.844502 -snap {("G4" 3)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "ori_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "ori_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {8 10 1 12 1 1}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvAddSignal -win $_nWave2 "/ori_tb/sopc/openmips0/mem0/mem_we" \
           "/ori_tb/sopc/openmips0/mem0/mem_waddr\[4:0\]" \
           "/ori_tb/sopc/openmips0/mem0/mem_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvScrollDown -win $_nWave2 2
wvSetCursor -win $_nWave2 309.994562 -snap {("G5" 3)}
srcDeselectAll -win $_nTrace1
srcHBSelect "ori_tb.sopc.openmips0.wb0" -win $_nTrace1
srcHBSelect "ori_tb.sopc.openmips0.wb0" -win $_nTrace1
srcHBSelect "ori_tb.sopc.openmips0.wb0" -win $_nTrace1
srcSetScope -win $_nTrace1 "ori_tb.sopc.openmips0.wb0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {8 10 1 12 1 1}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvAddSignal -win $_nWave2 "/ori_tb/sopc/openmips0/wb0/wb_we" \
           "/ori_tb/sopc/openmips0/wb0/wb_waddr\[4:0\]" \
           "/ori_tb/sopc/openmips0/wb0/wb_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvScrollDown -win $_nWave2 2
wvSetCursor -win $_nWave2 329.715896 -snap {("G6" 3)}
srcHBSelect "ori_tb.sopc.rom0" -win $_nTrace1
srcSetScope -win $_nTrace1 "ori_tb.sopc.rom0" -delim "."
srcHBSelect "ori_tb.sopc.openmips0.regfile0" -win $_nTrace1
srcSetScope -win $_nTrace1 "ori_tb.sopc.openmips0.regfile0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_waddr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
debExit
