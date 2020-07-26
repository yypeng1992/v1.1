verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/cp0/cp0.fsdb}
srcHBSelect "cp0_tb.sopc" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc" -delim "."
srcHBSelect "cp0_tb.sopc.openmips0" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc.openmips0" -delim "."
srcHBSelect "cp0_tb.sopc.rom0" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc.rom0" -delim "."
srcHBSelect "cp0_tb.sopc" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc" -delim "."
srcHBSelect "cp0_tb.sopc.openmips0.pc_id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc.openmips0.pc_id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_pc" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_inst" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_inst" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_pc" -win $_nTrace1
srcSelect -signal "pc_inst" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 178.192596 486.650125
wvScrollDown -win $_nWave2 0
srcHBSelect "cp0_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_read_o" -win $_nTrace1
srcSelect -signal "reg2_addr_o" -win $_nTrace1
srcSelect -signal "reg1_addr_o" -win $_nTrace1
srcSelect -signal "reg2_read_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 4)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg2_data_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "cp0_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_we" -win $_nTrace1
srcSelect -win $_nTrace1 -range {45 46 5 11 3 4}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_wdata" -win $_nTrace1
srcSelect -signal "ex_we" -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_waddr_o" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_we_o" -win $_nTrace1
srcSelect -signal "cp0_waddr_o" -win $_nTrace1
srcSelect -signal "cp0_wdata_o" -win $_nTrace1
srcSelect -signal "cp0_raddr_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvScrollDown -win $_nWave2 0
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 20 1851 392
wvResizeWindow -win $_nWave2 57 20 1851 842
verdiWindowBeDocked -win $_nWave2
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
srcHBSelect "cp0_tb.sopc.openmips0.LLbit0" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc.openmips0.LLbit0" -delim "."
srcHBSelect "cp0_tb.sopc.openmips0.cp0" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc.openmips0.cp0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "count_o" -win $_nTrace1
srcSelect -win $_nTrace1 -range {11 17 10 10 3 6}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "count_o" -win $_nTrace1
srcSelect -signal "config_o" -win $_nTrace1
srcSelect -signal "compare_o" -win $_nTrace1
srcSelect -signal "status_o" -win $_nTrace1
srcSelect -toggle -signal "status_o" -win $_nTrace1
srcSelect -signal "status_o" -win $_nTrace1
srcSelect -signal "cause_o" -win $_nTrace1
srcSelect -signal "epc_o" -win $_nTrace1
srcSelect -signal "prid_o" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvAddSignal -win $_nWave2 "/cp0_tb/sopc/openmips0/cp0/count_o\[31:0\]" \
           "/cp0_tb/sopc/openmips0/cp0/config_o\[31:0\]" \
           "/cp0_tb/sopc/openmips0/cp0/compare_o\[31:0\]" \
           "/cp0_tb/sopc/openmips0/cp0/status_o\[31:0\]" \
           "/cp0_tb/sopc/openmips0/cp0/cause_o\[31:0\]" \
           "/cp0_tb/sopc/openmips0/cp0/epc_o\[31:0\]" \
           "/cp0_tb/sopc/openmips0/cp0/prid_o\[31:0\]"
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvScrollDown -win $_nWave2 1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 842
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetCursor -win $_nWave2 228.559269 -snap {("G2" 6)}
wvSetCursor -win $_nWave2 250.304290 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 230.417818 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 250.118436 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 229.860253 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 250.118436 -snap {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetPosition -win $_nWave2 {("G2" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
verdiWindowBeDocked -win $_nWave2
srcHBSelect "cp0_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_we_o" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 7)}
srcHBSelect "cp0_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 6
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_we_o" -win $_nTrace1
srcSelect -signal "cp0_waddr_o" -win $_nTrace1
srcSelect -signal "cp0_wdata_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 3)}
wvScrollDown -win $_nWave2 3
srcHBSelect "cp0_tb.sopc.openmips0.wb0" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc.openmips0.wb0" -delim "."
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 1 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 7)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_mem_we" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_wb_we" -win $_nTrace1
srcSelect -win $_nTrace1 -range {44 45 5 10 7 8}
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_mem_wdata" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_wb_we" -win $_nTrace1
srcSelect -signal "cp0_wb_waddr" -win $_nTrace1
srcSelect -signal "cp0_wb_wdata" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvAddSignal -win $_nWave2 "/cp0_tb/sopc/openmips0/wb0/cp0_wb_we" \
           "/cp0_tb/sopc/openmips0/wb0/cp0_wb_waddr\[4:0\]" \
           "/cp0_tb/sopc/openmips0/wb0/cp0_wb_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 842
wvSetCursor -win $_nWave2 269.819053 -snap {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSetCursor -win $_nWave2 330.264125 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 289.747761 -snap {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvSetCursor -win $_nWave2 308.519104 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 330.635835 -snap {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
verdiWindowBeDocked -win $_nWave2
wvScrollDown -win $_nWave2 7
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
srcDeselectAll -win $_nTrace1
srcHBSelect "cp0_tb.sopc.openmips0.ex0" -win $_nTrace1
srcHBSelect "cp0_tb.sopc.openmips0.ex0" -win $_nTrace1
srcHBSelect "cp0_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_mem_we" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_mem_we" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvAddSignal -win $_nWave2 "/cp0_tb/sopc/openmips0/ex0/cp0_mem_we"
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_wb_we" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 "/cp0_tb/sopc/openmips0/ex0/cp0_wb_we"
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 842
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 289.190196 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 309.262524 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 329.148996 -snap {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetCursor -win $_nWave2 350.150598 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 329.148996 -snap {("G3" 6)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetCursor -win $_nWave2 350.150598 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 349.221323 -snap {("G4" 3)}
srcActiveTrace "cp0_tb.sopc.openmips0.mem0.cp0_wdata_o\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 310 -TraceValue \
           00000000000000000000000000000000
nsMsgSwitchTab -tab trace
srcHBSelect "cp0_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvSetCursor -win $_nWave2 208.900887 -snap {("G6" 5)}
srcActiveTrace "cp0_tb.sopc.openmips0.cp0.cause_o\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "cp0_tb.sopc.openmips0.cp0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 329.706561 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 389.180123 -snap {("G6" 4)}
wvSetCursor -win $_nWave2 309.820088 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 329.520706 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 329.334851 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 329.892415 -snap {("G2" 2)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetCursor -win $_nWave2 349.778888 -snap {("G3" 7)}
srcActiveTrace "cp0_tb.sopc.openmips0.ex0.cp0_raddr_o\[4:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 00000
srcHBSelect "cp0_tb.sopc.openmips0.ex0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 350.150598 -snap {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 349.593033 -snap {("G3" 7)}
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "cp0_tb.sopc.openmips0.ex0" -win $_nTrace1
srcHBSelect "cp0_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_rdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvScrollUp -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetCursor -win $_nWave2 349.407178 -snap {("G3" 8)}
srcActiveTrace "cp0_tb.sopc.openmips0.ex0.cp0_rdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "cp0_tb.sopc.openmips0.cp0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
srcHBSelect "cp0_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetCursor -win $_nWave2 350.150598 -snap {("G3" 7)}
srcActiveTrace "cp0_tb.sopc.openmips0.ex0.cp0_raddr_o\[4:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 00000
srcHBSelect "cp0_tb.sopc.openmips0.ex0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSetCursor -win $_nWave2 349.778888 -snap {("G3" 3)}
srcActiveTrace "cp0_tb.sopc.openmips0.ex0.ex_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 310 -TraceValue \
           00010000000000000000010000000001
srcHBSelect "cp0_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_mem_we" -win $_nTrace1
wvScrollDown -win $_nWave2 10
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_mem_we" -win $_nTrace1
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 4
wvSetCursor -win $_nWave2 349.035468 -snap {("G3" 2)}
wvScrollDown -win $_nWave2 2
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_mem_we" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvAddSignal -win $_nWave2 "/cp0_tb/sopc/openmips0/ex0/cp0_mem_we"
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_mem_waddr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_mem_waddr" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvAddSignal -win $_nWave2 "/cp0_tb/sopc/openmips0/ex0/cp0_mem_waddr\[4:0\]"
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
debReload
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 )} 
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcHBSelect "cp0_tb.sopc.openmips0.cp0" -win $_nTrace1
srcSetScope -win $_nTrace1 "cp0_tb.sopc.openmips0.cp0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "timer_int_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
