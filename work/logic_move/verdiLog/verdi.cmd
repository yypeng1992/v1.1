verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "833"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/logic_move/logic_move.fsdb}
srcHBSelect "logic_move_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "logic_move_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {10 15 2 1 14 1}
wvSetCursor -win $_nWave2 121.113054
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {9 15 1 1 19 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {9 15 1 1 17 1}
wvAddSignal -win $_nWave2 "/logic_move_tb/sopc/openmips0/id0/clk" \
           "/logic_move_tb/sopc/openmips0/id0/reset_n" \
           "/logic_move_tb/sopc/openmips0/id0/pc_i\[31:0\]" \
           "/logic_move_tb/sopc/openmips0/id0/inst_i\[31:0\]"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {49 52 4 13 8 1}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 "/logic_move_tb/sopc/openmips0/id0/reg1_read_o" \
           "/logic_move_tb/sopc/openmips0/id0/reg1_addr_o\[4:0\]" \
           "/logic_move_tb/sopc/openmips0/id0/reg2_read_o" \
           "/logic_move_tb/sopc/openmips0/id0/reg2_addr_o\[4:0\]"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 4)}
srcHBSelect "logic_move_tb.sopc.openmips0.regfile0" -win $_nTrace1
srcSetScope -win $_nTrace1 "logic_move_tb.sopc.openmips0.regfile0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {9 12 9 1 1 1}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvAddSignal -win $_nWave2 \
           "/logic_move_tb/sopc/openmips0/regfile0/reg1_data\[31:0\]" \
           "/logic_move_tb/sopc/openmips0/regfile0/reg2_data\[31:0\]"
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 6)}
srcHBSelect "logic_move_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "logic_move_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {39 45 10 1 2 1}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 "/logic_move_tb/sopc/openmips0/id0/alusel_o\[2:0\]" \
           "/logic_move_tb/sopc/openmips0/id0/aluop_o\[7:0\]" \
           "/logic_move_tb/sopc/openmips0/id0/reg1_data_o\[31:0\]" \
           "/logic_move_tb/sopc/openmips0/id0/reg2_data_o\[31:0\]" \
           "/logic_move_tb/sopc/openmips0/id0/wreg_o" \
           "/logic_move_tb/sopc/openmips0/id0/waddr_o\[4:0\]"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
srcHBSelect "logic_move_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "logic_move_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {11 15 5 1 1 1}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/logic_move_tb/sopc/openmips0/ex0/ex_we" \
           "/logic_move_tb/sopc/openmips0/ex0/ex_waddr\[4:0\]" \
           "/logic_move_tb/sopc/openmips0/ex0/ex_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 3)}
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 831
wvZoom -win $_nWave2 175.361609 621.965995
wvSetCursor -win $_nWave2 529.165084 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 548.498607 -snap {("G2" 2)}
verdiWindowBeDocked -win $_nWave2
srcDeselectAll -win $_nTrace1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 831
wvSetCursor -win $_nWave2 529.430887 -snap {("G3" 3)}
verdiWindowBeDocked -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 529.707080 -snap {("G3" 3)}
srcActiveTrace "logic_move_tb.sopc.openmips0.id0.reg1_data_o\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 510 -TraceValue \
           00000000000000000000000000000001
nsMsgSwitchTab -tab trace
srcHBSelect "logic_move_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "imm\[31:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvAddSignal -win $_nWave2 "/logic_move_tb/sopc/openmips0/id0/imm\[31:0\]"
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetCursor -win $_nWave2 529.430887 -snap {("G5" 1)}
srcActiveTrace "logic_move_tb.sopc.openmips0.id0.imm\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 510 -TraceValue \
           00000000000000000000000000000001
srcHBSelect "logic_move_tb.sopc.openmips0.id0" -win $_nTrace1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 831
verdiWindowBeDocked -win $_nWave2
srcSetOptions -win $_nTrace1 -annotate on
schSetOptions -win $_nSchema1 -annotate on
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_i\[10:6\]" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 831
wvSetCursor -win $_nWave2 549.592989 -snap {("G3" 2)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 529.430887 -snap {("G3" 3)}
srcActiveTrace "logic_move_tb.sopc.openmips0.id0.reg1_data_o\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 510 -TraceValue \
           00000000000000000000000000000001
srcHBSelect "logic_move_tb.sopc.openmips0.id0" -win $_nTrace1
wvSetCursor -win $_nWave2 529.430887 -snap {("G5" 1)}
srcActiveTrace "logic_move_tb.sopc.openmips0.id0.imm\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 510 -TraceValue \
           00000000000000000000000000000001
srcHBSelect "logic_move_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 529.707080 -snap {("G4" 3)}
srcActiveTrace "logic_move_tb.sopc.openmips0.ex0.ex_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 510 -TraceValue \
           10000000100000000000000000000000
srcHBSelect "logic_move_tb.sopc.openmips0.ex0" -win $_nTrace1
verdiWindowBeDocked -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "moveout\[31:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvAddSignal -win $_nWave2 "/logic_move_tb/sopc/openmips0/ex0/moveout\[31:0\]"
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 510.373557 -snap {("G5" 2)}
wvSetCursor -win $_nWave2 510.649750 -snap {("G5" 2)}
srcActiveTrace "logic_move_tb.sopc.openmips0.ex0.moveout\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 510 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "logic_move_tb.sopc.openmips0.ex0" -win $_nTrace1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 831
wvSetCursor -win $_nWave2 528.878501 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 535.230944 -snap {("G6" 0)}
wvSetCursor -win $_nWave2 529.707080 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 549.316796 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 529.707080 -snap {("G5" 1)}
wvSetCursor -win $_nWave2 547.935831 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 529.430887 -snap {("G3" 3)}
srcActiveTrace "logic_move_tb.sopc.openmips0.id0.reg1_data_o\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 510 -TraceValue \
           00000000000000000000000000000001
srcHBSelect "logic_move_tb.sopc.openmips0.id0" -win $_nTrace1
verdiWindowBeDocked -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcHBSelect "logic_move_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "logic_move_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcSetOptions -win $_nTrace1 -annotate off
schSetOptions -win $_nSchema1 -annotate off
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {33 35 9 1 1 1}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvAddSignal -win $_nWave2 "/logic_move_tb/sopc/openmips0/id0/reg1_data_i\[31:0\]" \
           "/logic_move_tb/sopc/openmips0/id0/reg2_data_i\[31:0\]"
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 4)}
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 529.707080 -snap {("G3" 3)}
srcActiveTrace "logic_move_tb.sopc.openmips0.id0.reg1_data_o\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 510 -TraceValue \
           00000000000000000000000000000001
srcHBSelect "logic_move_tb.sopc.openmips0.id0" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 529.707080 -snap {("G5" 1)}
wvSetCursor -win $_nWave2 529.707080 -snap {("G5" 1)}
wvSetCursor -win $_nWave2 528.878501 -snap {("G5" 1)}
srcActiveTrace "logic_move_tb.sopc.openmips0.id0.imm\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 510 -TraceValue \
           00000000000000000000000000000001
srcHBSelect "logic_move_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSetOptions -win $_nTrace1 -annotate on
schSetOptions -win $_nSchema1 -annotate on
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetOptions -win $_nWave2 -fixedDelta on
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 831
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
verdiWindowBeDocked -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 529.430887 -snap {("G5" 2)}
srcActiveTrace "logic_move_tb.sopc.openmips0.ex0.moveout\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 510 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "logic_move_tb.sopc.openmips0.ex0" -win $_nTrace1
wvSetCursor -win $_nWave2 530.811853 -snap {("G5" 1)}
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 546.831058 -snap {("G4" 1)}
srcDeselectAll -win $_nTrace1
debReload
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
debExit
