verdiWindowResize -win $_Verdi_1 "67" "27" "1847" "829"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/cpu/arith_muldiv.fsdb}
srcHBSelect "arith_muldiv_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "arith_muldiv_tb.sopc.openmips0.id_ex0" -delim "."
srcHBSelect "arith_muldiv_tb.sopc.openmips0.pc_id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "arith_muldiv_tb.sopc.openmips0.pc_id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {2 7 5 1 1 1}
wvAddSignal -win $_nWave2 "/arith_muldiv_tb/sopc/openmips0/pc_id0/clk" \
           "/arith_muldiv_tb/sopc/openmips0/pc_id0/reset_n" \
           "/arith_muldiv_tb/sopc/openmips0/pc_id0/pc_id_stall\[5:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/pc_id0/pc_pc\[31:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/pc_id0/pc_inst\[31:0\]"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_pc" -win $_nTrace1
srcSelect -signal "id_inst" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 "/arith_muldiv_tb/sopc/openmips0/pc_id0/id_pc\[31:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/pc_id0/id_inst\[31:0\]"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 2)}
srcHBSelect "arith_muldiv_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "arith_muldiv_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {54 58 4 1 9 1}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvAddSignal -win $_nWave2 "/arith_muldiv_tb/sopc/openmips0/id0/reg1_read_o" \
           "/arith_muldiv_tb/sopc/openmips0/id0/reg1_addr_o\[4:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/id0/reg2_read_o" \
           "/arith_muldiv_tb/sopc/openmips0/id0/reg2_addr_o\[4:0\]"
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 6)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {43 50 1 1 19 1}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvAddSignal -win $_nWave2 "/arith_muldiv_tb/sopc/openmips0/id0/alusel_o\[2:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/id0/aluop_o\[7:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/id0/reg1_data_o\[31:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/id0/reg2_data_o\[31:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/id0/wreg_o" \
           "/arith_muldiv_tb/sopc/openmips0/id0/waddr_o\[4:0\]"
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 12)}
srcHBSelect "arith_muldiv_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "arith_muldiv_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data_mux" -win $_nTrace1
srcSelect -signal "reg2_data_mux" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 \
           "/arith_muldiv_tb/sopc/openmips0/ex0/reg1_data_mux\[31:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/ex0/reg2_data_mux\[31:0\]"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "m" -win $_nTrace1
srcSelect -signal "n" -win $_nTrace1
srcSelect -signal "sub_tempt" -win $_nTrace1
srcSelect -signal "s_tempt" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvAddSignal -win $_nWave2 "/arith_muldiv_tb/sopc/openmips0/ex0/m\[31:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/ex0/n\[31:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/ex0/sub_tempt\[31:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/ex0/s_tempt\[31:0\]"
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_cnt" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "minuend" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvAddSignal -win $_nWave2 "/arith_muldiv_tb/sopc/openmips0/ex0/minuend\[63:0\]"
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_cnt" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvAddSignal -win $_nWave2 "/arith_muldiv_tb/sopc/openmips0/ex0/ex_cnt\[5:0\]"
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_cnt" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {43 49 4 1 6 1}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvAddSignal -win $_nWave2 "/arith_muldiv_tb/sopc/openmips0/ex0/ex_we" \
           "/arith_muldiv_tb/sopc/openmips0/ex0/ex_waddr\[4:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/ex0/ex_wdata\[31:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/ex0/ex_whilo" \
           "/arith_muldiv_tb/sopc/openmips0/ex0/ex_hi\[31:0\]" \
           "/arith_muldiv_tb/sopc/openmips0/ex0/ex_lo\[31:0\]"
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 14)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_cnt" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/arith_muldiv_tb/sopc/openmips0/ex0/mem_cnt\[5:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_minuend" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvAddSignal -win $_nWave2 \
           "/arith_muldiv_tb/sopc/openmips0/ex0/mem_minuend\[63:0\]"
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 827
wvZoom -win $_nWave2 229371.634422 1181456.128141
wvZoom -win $_nWave2 249705.097228 1028955.157099
wvSetCursor -win $_nWave2 2238837.200305 -snap {("G3" 6)}
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 1629490.237138 -snap {("G3" 8)}
wvSetCursor -win $_nWave2 1649314.123711 -snap {("G3" 13)}
srcActiveTrace "arith_muldiv_tb.sopc.openmips0.ex0.ex_hi\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1010000 -TraceValue \
           00000000000000000000000000000000
nsMsgSwitchTab -tab trace
srcHBSelect "arith_muldiv_tb.sopc.openmips0.ex0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetCursor -win $_nWave2 1629734.976479 -snap {("G3" 6)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetCursor -win $_nWave2 1629245.497798 -snap {("G3" 6)}
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSetCursor -win $_nWave2 1649803.602392 -snap {("G3" 13)}
srcActiveTrace "arith_muldiv_tb.sopc.openmips0.ex0.ex_hi\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1010000 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "arith_muldiv_tb.sopc.openmips0.ex0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
verdiWindowBeDocked -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_cnt" -win $_nTrace1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/arith_muldiv_tb/sopc/openmips0/ex0/mem_cnt\[5:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_minuend" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvAddSignal -win $_nWave2 \
           "/arith_muldiv_tb/sopc/openmips0/ex0/mem_minuend\[63:0\]"
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
debReload
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 827
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 1649558.863052 -snap {("G3" 13)}
srcActiveTrace "arith_muldiv_tb.sopc.openmips0.ex0.ex_hi\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1010000 -TraceValue \
           00000000000000000000000000000000
nsMsgSwitchTab -tab trace
debReload
wvSetCursor -win $_nWave2 1649314.123711 -snap {("G3" 13)}
srcActiveTrace "arith_muldiv_tb.sopc.openmips0.ex0.ex_hi\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1010000 -TraceValue \
           00000000000000000000000000000000
nsMsgSwitchTab -tab trace
srcHBSelect "arith_muldiv_tb.sopc.openmips0.ex0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvScrollUp -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvScrollDown -win $_nWave2 4
wvSetCursor -win $_nWave2 1629245.497798 -snap {("G3" 3)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 1609421.611224 -snap {("G3" 14)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetCursor -win $_nWave2 1629000.758457 -snap {("G3" 8)}
wvSetCursor -win $_nWave2 1629490.237138 -snap {("G3" 7)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 1649314.123711 -snap {("G3" 13)}
srcActiveTrace "arith_muldiv_tb.sopc.openmips0.ex0.ex_hi\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1010000 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "arith_muldiv_tb.sopc.openmips0.ex0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetCursor -win $_nWave2 1649803.602392 -snap {("G3" 1)}
srcActiveTrace "arith_muldiv_tb.sopc.openmips0.ex0.reg1_data_mux\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 330000 -TraceValue \
           00000000000000000000000000001111
srcHBSelect "arith_muldiv_tb.sopc.openmips0.ex0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 989824.141589 -snap {("G3" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 74400.759485 2952535.402731
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvZoom -win $_nWave2 748737.582306 1853348.302798
wvZoom -win $_nWave2 932608.085403 1469648.724637
wvSetCursor -win $_nWave2 988943.378589 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 988943.378589 -snap {("G3" 5)}
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvZoom -win $_nWave2 962968.423048 1211923.191738
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetCursor -win $_nWave2 1009412.874242 -snap {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetCursor -win $_nWave2 1029898.473927 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 1069775.022932 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1620871.380675 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 1649237.787890 -snap {("G3" 6)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSetCursor -win $_nWave2 1649333.977906 -snap {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetCursor -win $_nWave2 2189602.998303 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 2210088.597988 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 2230261.440426 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 2249339.632499 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 2269825.232184 -snap {("G3" 5)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSetCursor -win $_nWave2 2269825.232184 -snap {("G3" 11)}
srcActiveTrace "arith_muldiv_tb.sopc.openmips0.ex0.s_tempt\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2250000 -TraceValue \
           10000000000000000000000000000000
srcHBSelect "arith_muldiv_tb.sopc.openmips0.ex0" -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvZoom -win $_nWave2 1524837.469597 2483125.674706
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSetCursor -win $_nWave2 2268835.096176 -snap {("G3" 11)}
srcActiveTrace "arith_muldiv_tb.sopc.openmips0.ex0.s_tempt\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2250000 -TraceValue \
           10000000000000000000000000000000
srcHBSelect "arith_muldiv_tb.sopc.openmips0.ex0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 2268835.096177 -snap {("G3" 11)}
srcActiveTrace "arith_muldiv_tb.sopc.openmips0.ex0.s_tempt\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2250000 -TraceValue \
           10000000000000000000000000000000
srcHBSelect "arith_muldiv_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetOptions -win $_nTrace1 -annotate on
schSetOptions -win $_nSchema1 -annotate on
debReload
wvZoom -win $_nWave2 1868545.111002 2356718.310967
wvZoom -win $_nWave2 1941219.136374 2320534.619009
wvSetCursor -win $_nWave2 2269546.231267 -snap {("G3" 11)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetCursor -win $_nWave2 2269784.494762 -snap {("G3" 6)}
srcActiveTrace "arith_muldiv_tb.sopc.openmips0.ex0.minuend\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2250000 -TraceValue \
           0000000000000000000000000000100010000000000000000000000000000000
nsMsgSwitchTab -tab trace
srcHBSelect "arith_muldiv_tb.sopc.openmips0.ex0" -win $_nTrace1
wvSetCursor -win $_nWave2 2269546.231267 -snap {("G3" 11)}
srcActiveTrace "arith_muldiv_tb.sopc.openmips0.ex0.s_tempt\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2250000 -TraceValue \
           10000000000000000000000000000000
srcHBSelect "arith_muldiv_tb.sopc.openmips0.ex0" -win $_nTrace1
wvSetCursor -win $_nWave2 2269546.231267 -snap {("G3" 11)}
srcActiveTrace "arith_muldiv_tb.sopc.openmips0.ex0.s_tempt\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2250000 -TraceValue \
           10000000000000000000000000000000
srcHBSelect "arith_muldiv_tb.sopc.openmips0.ex0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 880470.060563 1027240.372939
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1298069.094384 1737642.492255
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
verdiWindowResize -win $_Verdi_1 "67" "27" "1853" "1025"
verdiWindowResize -win $_Verdi_1 "1" "27" "1919" "1025"
verdiWindowResize -win $_Verdi_1 "67" "27" "1853" "1025"
verdiWindowResize -win $_Verdi_1 "67" "27" "1847" "829"
verdiWindowResize -win $_Verdi_1 "1" "27" "1913" "829"
verdiWindowResize -win $_Verdi_1 "67" "27" "1847" "829"
