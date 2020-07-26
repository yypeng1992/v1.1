verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/ft/tree/v1.1/work/load_store_llsc/load_store_llsc.fsdb}
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.id0" -delim "."
srcHBSelect "load_store_llsc_tb.sopc.openmips0.pc_id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.pc_id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_pc" -win $_nTrace1
srcSelect -win $_nTrace1 -range {5 6 10 10 4 4}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_pc" -win $_nTrace1
srcSelect -toggle -signal "pc_pc" -win $_nTrace1
srcSelect -signal "pc_inst" -win $_nTrace1
srcSelect -signal "pc_pc" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 180886.522167 493669.466749
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.id_ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_read_o" -win $_nTrace1
srcSelect -win $_nTrace1 -range {57 58 5 11 7 6}
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_read_o" -win $_nTrace1
srcSelect -signal "reg1_addr_o" -win $_nTrace1
srcSelect -signal "reg2_read_o" -win $_nTrace1
srcSelect -signal "reg2_addr_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg2_data_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_we" -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcSelect -signal "ex_wdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "LLbit_we_o" -win $_nTrace1
srcSelect -signal "LLbit_value_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ce" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ce" -win $_nTrace1
srcSelect -signal "we" -win $_nTrace1
srcSelect -signal "sel" -win $_nTrace1
srcSelect -signal "mem_addr" -win $_nTrace1
srcSelect -signal "mem_data" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 812
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
verdiWindowBeDocked -win $_nWave2
wvScrollDown -win $_nWave2 5
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_we" -win $_nTrace1
srcSelect -signal "mem_waddr" -win $_nTrace1
srcSelect -signal "mem_wdata" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/load_store_llsc_tb/sopc/openmips0/mem0/mem_we" \
           "/load_store_llsc_tb/sopc/openmips0/mem0/mem_waddr\[4:0\]" \
           "/load_store_llsc_tb/sopc/openmips0/mem0/mem_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 3)}
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 812
wvSetCursor -win $_nWave2 290668.713307 -snap {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSetCursor -win $_nWave2 329573.981045 -snap {("G4" 3)}
verdiWindowBeDocked -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "LLbit_i" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "LLbit_in" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "LLbit_i" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 5
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 812
verdiWindowBeDocked -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_LLbit_we" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_LLbit_value" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_LLbit_we" -win $_nTrace1
srcSelect -signal "wb_LLbit_value" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 812
wvSetCursor -win $_nWave2 349411.815584 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 270253.077762 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 290476.112972 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 310121.347176 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 329381.380709 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 349989.616590 -snap {("G4" 2)}
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSetCursor -win $_nWave2 390050.486339 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 348063.613237 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 368671.849117 -snap {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSetCursor -win $_nWave2 390820.887681 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 409310.519873 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 392169.090028 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 371560.854147 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 349219.215249 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 369442.250459 -snap {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
verdiDockWidgetUndock -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetDock -dock widgetDock_MTB_SOURCE_TAB_1
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetCursor -win $_nWave2 410080.921214 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 428570.553406 -snap {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSetCursor -win $_nWave2 429726.155418 -snap {("G2" 6)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.id0.reg2_data_o\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 350000 -TraceValue \
           00000000000000000000000000000000
nsMsgSwitchTab -tab trace
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
verdiWindowResize -win $_Verdi_1 "288" "19" "1388" "833"
wvSetCursor -win $_nWave2 429533.555083 -snap {("G2" 4)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.id0.reg2_addr_o\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 410000 -TraceValue 00000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
wvSetCursor -win $_nWave2 429918.755753 -snap {("G2" 5)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.id0.reg1_data_o\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSetPosition -win $_nWave2 {("G2" 5)}
wvExpandBus -win $_nWave2 {("G2" 5)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSetPosition -win $_nWave2 {("G2" 5)}
wvCollapseBus -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_addr_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
verdiWindowResize -win $_Verdi_1 "288" "19" "1389" "833"
verdiWindowResize -win $_Verdi_1 "288" "19" "1398" "833"
verdiWindowResize -win $_Verdi_1 "288" "19" "1408" "833"
verdiWindowResize -win $_Verdi_1 "288" "19" "1421" "833"
verdiWindowResize -win $_Verdi_1 "288" "19" "1425" "833"
verdiWindowResize -win $_Verdi_1 "288" "19" "1496" "833"
verdiWindowResize -win $_Verdi_1 "288" "19" "1560" "833"
verdiWindowResize -win $_Verdi_1 "288" "19" "1594" "833"
verdiWindowResize -win $_Verdi_1 "288" "19" "1615" "833"
verdiWindowResize -win $_Verdi_1 "288" "19" "1603" "833"
verdiWindowResize -win $_Verdi_1 "288" "19" "1572" "833"
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_read_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_we" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 )} 
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetCursor -win $_nWave2 409334.720704 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 429172.555243 -snap {("G2" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
srcHBSelect "load_store_llsc_tb.sopc.openmips0.wb0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.wb0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_we" -win $_nTrace1
srcSelect -signal "wb_waddr" -win $_nTrace1
srcSelect -signal "wb_wdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 5 6 7 )} 
wvSetCursor -win $_nWave2 390267.287506 -snap {("G5" 6)}
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSetCursor -win $_nWave2 369466.451290 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 376977.864368 -snap {("G5" 3)}
wvSetCursor -win $_nWave2 369659.051625 -snap {("G5" 3)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.id0.mem_we" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 350000 -TraceValue 0
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetCursor -win $_nWave2 389882.086835 -snap {("G5" 7)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
verdiWindowBeDocked -win $_nWave2
verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
srcHBSelect "load_store_llsc_tb.sopc.openmips0.regfile0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.regfile0" -delim \
           "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_we" -win $_nTrace1
srcSelect -win $_nTrace1 -range {15 16 3 9 5 5}
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_we" -win $_nTrace1
srcSelect -signal "wb_waddr" -win $_nTrace1
srcSelect -signal "wb_wdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 10)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 10)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 429557.755914 -snap {("G5" 11)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.regfile0.reg1_data\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.regfile0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 9 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_addr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "re1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 390267.287506 -snap {("G5" 8)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.regfile0.wb_we" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 370000 -TraceValue 0
srcHBSelect "load_store_llsc_tb.sopc.openmips0.wb0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_we" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_we" -win $_nTrace1
srcAction -pos 58 6 3 -win $_nTrace1 -name "mem_we" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_we" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvGoToGroup -win $_nWave2 "G2"
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
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvScrollUp -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvScrollDown -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_we" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_we" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.wb0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.wb0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_we" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 369851.651961 -snap {("G5" 3)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.wb0.mem_we" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 350000 -TraceValue 0
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "load_store_llsc_tb.sopc.openmips0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0" -delim "."
wvSetCursor -win $_nWave2 369851.651961 -snap {("G5" 3)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.wb0.mem_we" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 350000 -TraceValue 0
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSetOptions -win $_nTrace1 -annotate on
schSetOptions -win $_nSchema1 -annotate on
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "load_store_llsc_tb.sopc.openmips0.wb0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.wb0" -delim "."
srcHBSelect "load_store_llsc_tb.sopc.openmips0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0" -delim "."
srcDeselectAll -win $_nTrace1
srcSetOptions -win $_nTrace1 -annotate off
schSetOptions -win $_nSchema1 -annotate off
debReload
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSetCursor -win $_nWave2 430135.556920 -snap {("G2" 6)}
wvSetCursor -win $_nWave2 409719.921375 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 428787.354573 -snap {("G2" 2)}
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
srcHBSelect "load_store_llsc_tb.sopc.openmips0.regfile0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.regfile0" -delim \
           "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "re1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_addr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_we" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.wb0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.wb0" -delim "."
srcDeselectAll -win $_nTrace1
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
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_we" -win $_nTrace1
srcSelect -win $_nTrace1 -range {12 14 3 8 4 5}
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_we" -win $_nTrace1
srcSelect -signal "mem_wdata" -win $_nTrace1
srcSelect -signal "mem_waddr" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvAddSignal -win $_nWave2 "/load_store_llsc_tb/sopc/openmips0/wb0/mem_we" \
           "/load_store_llsc_tb/sopc/openmips0/wb0/mem_wdata\[31:0\]" \
           "/load_store_llsc_tb/sopc/openmips0/wb0/mem_waddr\[4:0\]"
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 3)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_we" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_we" -win $_nTrace1
srcSelect -win $_nTrace1 -range {22 23 5 11 4 4}
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_we" -win $_nTrace1
srcSelect -signal "wb_waddr" -win $_nTrace1
srcSelect -signal "wb_wdata" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvAddSignal -win $_nWave2 "/load_store_llsc_tb/sopc/openmips0/wb0/wb_we" \
           "/load_store_llsc_tb/sopc/openmips0/wb0/wb_waddr\[4:0\]" \
           "/load_store_llsc_tb/sopc/openmips0/wb0/wb_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetCursor -win $_nWave2 389689.486500 -snap {("G6" 5)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "load_store_llsc_tb.sopc.openmips0.regfile0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.regfile0" -delim \
           "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_we" -win $_nTrace1
srcSelect -win $_nTrace1 -range {15 16 3 9 3 6}
srcSelect -signal "wb_we" -win $_nTrace1
srcSelect -signal "wb_waddr" -win $_nTrace1
srcSelect -signal "wb_wdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_addr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 9 )} 
wvSelectSignal -win $_nWave2 {( "G6" 8 )} 
wvSetCursor -win $_nWave2 429557.755914 -snap {("G6" 8)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.regfile0.wb_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 410000 -TraceValue 00000
nsMsgSwitchTab -tab trace
srcHBSelect "load_store_llsc_tb.sopc.openmips0.wb0" -win $_nTrace1
wvSetCursor -win $_nWave2 429750.356250 -snap {("G6" 11)}
srcDeselectAll -win $_nTrace1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.regfile0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.regfile0" -delim \
           "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 429365.155579 -snap {("G6" 12)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.regfile0.reg1_data\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.regfile0" -win $_nTrace1
wvSetCursor -win $_nWave2 429365.155579 -snap {("G6" 12)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.regfile0.reg1_data\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.regfile0" -win $_nTrace1
wvSetCursor -win $_nWave2 409719.921375 -snap {("G6" 9)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.regfile0.wb_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390000 -TraceValue \
           00000000000000000001001000110100
srcHBSelect "load_store_llsc_tb.sopc.openmips0.wb0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 389689.486500 -snap {("G6" 13)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.wb0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 370000 -TraceValue \
           00000000000000000001001000110100
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 329983.382547 -snap {("G6" 14)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.ex_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 310000 -TraceValue \
           00000000000000000101011001111000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
wvSetCursor -win $_nWave2 329405.581541 -snap {("G6" 14)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.ex_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 310000 -TraceValue \
           00000000000000000101011001111000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
wvSetCursor -win $_nWave2 329405.581541 -snap {("G6" 14)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.ex_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 310000 -TraceValue \
           00000000000000000101011001111000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
wvSetCursor -win $_nWave2 329405.581541 -snap {("G6" 14)}
wvSetCursor -win $_nWave2 329405.581541 -snap {("G6" 14)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.ex_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 310000 -TraceValue \
           00000000000000000101011001111000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G6" 14 )} 
wvSetCursor -win $_nWave2 389882.086836 -snap {("G6" 13)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.wb0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 370000 -TraceValue \
           00000000000000000001001000110100
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 329790.782212 -snap {("G6" 15)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.ex_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 310000 -TraceValue \
           00000000000000000101011001111000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
wvSetCursor -win $_nWave2 389689.486500 -snap {("G6" 13)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.wb0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 370000 -TraceValue \
           00000000000000000001001000110100
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
wvSetCursor -win $_nWave2 329212.981206 -snap {("G6" 15)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.ex_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 310000 -TraceValue \
           00000000000000000101011001111000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
wvSetCursor -win $_nWave2 389496.886165 -snap {("G6" 13)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.wb0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 370000 -TraceValue \
           00000000000000000001001000110100
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
wvSetCursor -win $_nWave2 329405.581541 -snap {("G6" 15)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.ex_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 310000 -TraceValue \
           00000000000000000101011001111000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
wvSetCursor -win $_nWave2 389496.886165 -snap {("G6" 13)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.wb0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 370000 -TraceValue \
           00000000000000000001001000110100
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G6" 13 )} 
wvSetCursor -win $_nWave2 471929.829687 -snap {("G6" 10)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 389304.285830 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 409334.720704 -snap {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 431868.959938 -snap {("G3" 2)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 450551.192465 -snap {("G4" 2)}
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 15 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSelectSignal -win $_nWave2 {( "G6" 14 )} 
wvSetCursor -win $_nWave2 329212.981206 -snap {("G6" 13)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.wb0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 310000 -TraceValue \
           00000000000000000101011001111000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 812
wvScrollUp -win $_nWave2 16
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvScrollDown -win $_nWave2 14
wvSelectSignal -win $_nWave2 {( "G6" 14 )} 
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 13 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSelectSignal -win $_nWave2 {( "G6" 13 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSelectSignal -win $_nWave2 {( "G6" 9 )} 
srcHBSelect "load_store_llsc_tb.sopc.openmips0.regfile0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.regfile0" -delim \
           "."
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 429172.555244 -snap {("G6" 5)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 812
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 410682.923052 -snap {("G4" 2)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 367347.847602 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 409334.720704 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 430370.532736 -snap {("G2" 4)}
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 409762.296856 -snap {("G1" 1)}
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
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 430370.532736 -snap {("G2" 4)}
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
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 )} 
wvSetCursor -win $_nWave2 389887.132066 -snap {("G6" 5)}
wvSelectSignal -win $_nWave2 {( "G6" 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 7 8 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSelectSignal -win $_nWave2 {( "G6" 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 8 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 429370.200810 -snap {("G2" 3)}
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSetCursor -win $_nWave2 430911.003492 -snap {("G2" 5)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.id0.reg1_data_o\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data_i\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 433800.008522 -snap {("G6" 10)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.id0.reg1_data_i\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.regfile0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "regs\[reg1_addr\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 9)}
srcHBSelect "load_store_llsc_tb.sopc.openmips0.regfile0" -win $_nTrace1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.regfile0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_we" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 11 )} 
wvSelectSignal -win $_nWave2 {( "G6" 12 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSetCursor -win $_nWave2 409532.366270 -snap {("G6" 6)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 430718.403157 -snap {("G2" 4)}
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
wvSetCursor -win $_nWave2 409532.366270 -snap {("G6" 6)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.wb0.wb_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390000 -TraceValue \
           00000000000000000001001000110100
srcHBSelect "load_store_llsc_tb.sopc.openmips0.wb0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 389116.730725 -snap {("G6" 13)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.wb0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 370000 -TraceValue \
           00000000000000000001001000110100
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_wdata\[31:0\]" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 408954.565265 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 428214.598798 -snap {("G2" 3)}
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
wvSetCursor -win $_nWave2 409147.165600 -snap {("G6" 12)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.regfile0.wb_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390000 -TraceValue \
           00000000000000000001001000110100
srcHBSelect "load_store_llsc_tb.sopc.openmips0.wb0" -win $_nTrace1
wvSetCursor -win $_nWave2 389501.931396 -snap {("G6" 13)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.wb0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 370000 -TraceValue \
           00000000000000000001001000110100
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 309338.948571 -snap {("G6" 14)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.ex_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 290000 -TraceValue \
           00000000000000000101011001111000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
debReload
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 309146.348236 -snap {("G6" 14)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.ex_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 290000 -TraceValue \
           00000000000000000101011001111000
nsMsgSwitchTab -tab trace
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "logicout\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "alusel\[2:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
verdiWindowBeDocked -win $_nWave2
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "alusel_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 812
wvSelectSignal -win $_nWave2 {( "G6" 17 )} 
wvSetPosition -win $_nWave2 {("G6" 16)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetCursor -win $_nWave2 408913.321938 -snap {("G2" 1)}
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.ex0" -delim "."
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 16 )} 
wvSelectSignal -win $_nWave2 {( "G6" 15 )} 
wvSelectSignal -win $_nWave2 {( "G6" 14 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 16)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 16)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 16)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 16)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetCursor -win $_nWave2 389845.888740 -snap {("G6" 17)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.ex0.ex_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 370000 -TraceValue 00000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_waddr\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 389460.688069 -snap {("G6" 18)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.ex0.id_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 370000 -TraceValue 00000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_waddr    \[4:0 \]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 369430.253195 -snap {("G6" 19)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.id_ex0.id_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 350000 -TraceValue 00000
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_i\[31:26\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 389460.688069 -snap {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 368659.851854 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 348051.615973 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 370008.054201 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 389460.688069 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 408913.321938 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 370894.750542 -snap {("G1" 2)}
wvScrollDown -win $_nWave2 19
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 389384.382734 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 349708.713656 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 369353.947860 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 388806.581728 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 410185.218950 -snap {("G2" 6)}
wvSetCursor -win $_nWave2 408837.016603 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 369161.347524 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 389962.183740 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 410185.218950 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 429252.652148 -snap {("G4" 2)}
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSetCursor -win $_nWave2 429565.696862 -snap {("G4" 11)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.sel\[3:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 390000 -TraceValue 1111
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 368896.591232 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 389312.226777 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 409727.862323 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 430913.899209 -snap {("G2" 2)}
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSetCursor -win $_nWave2 429758.297197 -snap {("G4" 2)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.mem_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390000 -TraceValue 00001
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_store_addr\[31:0\]" -win $_nTrace1
verdiDockWidgetUndock -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetDock -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.id0" -delim "."
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSetCursor -win $_nWave2 429180.496191 -snap {("G4" 2)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.mem_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390000 -TraceValue 00001
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 429373.096527 -snap {("G6" 1)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.ex_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390000 -TraceValue 00001
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_waddr\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 429758.297197 -snap {("G6" 2)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.ex0.id_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390000 -TraceValue 00001
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_waddr    \[4:0 \]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 409535.261987 -snap {("G6" 3)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.id_ex0.id_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 370000 -TraceValue 00001
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_i\[20:16\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 370052.193244 -snap {("G1" 2)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetCursor -win $_nWave2 389119.626442 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 409342.661652 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 429758.297197 -snap {("G4" 2)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.mem_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390000 -TraceValue 00001
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
verdiWindowResize -win $_Verdi_1 "253" "19" "1655" "871"
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvScrollDown -win $_nWave2 0
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
verdiWindowBeDocked -win $_nWave2
verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
srcHBSelect "load_store_llsc_tb.sopc.openmips0.pc_id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.pc_id0" -delim "."
srcHBSelect "load_store_llsc_tb.sopc.openmips0.pc_reg0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.pc_reg0" -delim "."
srcHBSelect "load_store_llsc_tb.sopc.openmips0.pc_id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.pc_id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_pc" -win $_nTrace1
srcSelect -win $_nTrace1 -range {5 6 10 10 5 5}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_pc" -win $_nTrace1
srcSelect -signal "pc_inst" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 2)}
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_read_o" -win $_nTrace1
srcSelect -signal "reg1_addr_o" -win $_nTrace1
srcSelect -signal "reg2_read_o" -win $_nTrace1
srcSelect -signal "reg2_addr_o" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 "/load_store_llsc_tb/sopc/openmips0/id0/reg1_read_o" \
           "/load_store_llsc_tb/sopc/openmips0/id0/reg1_addr_o\[4:0\]" \
           "/load_store_llsc_tb/sopc/openmips0/id0/reg2_read_o" \
           "/load_store_llsc_tb/sopc/openmips0/id0/reg2_addr_o\[4:0\]"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg2_data_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_we" -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcSelect -signal "ex_wdata" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 "/load_store_llsc_tb/sopc/openmips0/ex0/ex_we" \
           "/load_store_llsc_tb/sopc/openmips0/ex0/ex_waddr\[4:0\]" \
           "/load_store_llsc_tb/sopc/openmips0/ex0/ex_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_we" -win $_nTrace1
srcSelect -signal "mem_waddr" -win $_nTrace1
srcSelect -signal "mem_wdata" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/load_store_llsc_tb/sopc/openmips0/mem0/mem_we" \
           "/load_store_llsc_tb/sopc/openmips0/mem0/mem_waddr\[4:0\]" \
           "/load_store_llsc_tb/sopc/openmips0/mem0/mem_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 429498.747793 -snap {("G4" 2)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 369407.443169 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 389437.878044 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 409083.112248 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 428728.346452 -snap {("G2" 6)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 429113.547122 -snap {("G4" 2)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.mem_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390000 -TraceValue 00001
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 1)}
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 429113.547122 -snap {("G5" 2)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.ex_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390000 -TraceValue 00001
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_waddr\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_waddr\[4:0\]" -win $_nTrace1
srcAction -pos 488 6 8 -win $_nTrace1 -name "id_waddr\[4:0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_waddr    \[4:0 \]" -win $_nTrace1
srcAction -pos 62 6 5 -win $_nTrace1 -name "id_waddr    \[4:0 \]" -ctrlKey off
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_we" -win $_nTrace1
srcSelect -win $_nTrace1 -range {25 26 3 9 3 3}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_i" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 212245.569537 508850.085950
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
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 389587.309338 -snap {("G5" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSetCursor -win $_nWave2 429585.085874 -snap {("G4" 2)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.mem_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390000 -TraceValue 00001
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 429402.447625 -snap {("G5" 3)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.mem0.ex_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390000 -TraceValue 00001
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_waddr\[4:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr\[4:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_waddr\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 429585.085874 -snap {("G5" 4)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.ex0.id_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390000 -TraceValue 00001
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_waddr    \[4:0 \]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 409860.154980 -snap {("G5" 5)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.id_ex0.id_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 370000 -TraceValue 00001
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcShowCalling -win $_nTrace1
srcSelect -win $_nTrace1 -range {194 194 3 4 1 1}
srcHBSelect "load_store_llsc_tb.sopc.openmips0" -win $_nTrace1
srcShowDefine -win $_nTrace1
srcSelect -win $_nTrace1 -range {1 1 3 4 1 1}
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcShowDefine -win $_nTrace1
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
wvSetCursor -win $_nWave2 409494.878482 -snap {("G5" 5)}
srcActiveTrace "load_store_llsc_tb.sopc.openmips0.id_ex0.id_waddr\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 370000 -TraceValue 00001
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcNextTraced
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcPrevTraced
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcNextTraced
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcPrevTraced
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcNextTraced
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcPrevTraced
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_i\[20:16\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 4 5 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_i" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 390683.138832 -snap {("G5" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.id_ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.id_ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 409494.878482 -snap {("G5" 3)}
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "load_store_llsc_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.ex_mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_wdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 429037.171127 -snap {("G5" 6)}
srcHBSelect "load_store_llsc_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_llsc_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 7)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 812
wvSetCursor -win $_nWave2 470496.053656 -snap {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 4 5 6 7 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
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
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "LLbit_i" -win $_nTrace1
srcSelect -win $_nTrace1 -range {57 61 3 5 5 8}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "LLbit_i" -win $_nTrace1
srcSelect -signal "wb_LLbit_we" -win $_nTrace1
srcSelect -signal "wb_LLbit_value" -win $_nTrace1
srcSelect -signal "LLbit_we_o" -win $_nTrace1
srcSelect -signal "LLbit_value_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 812
wvSetCursor -win $_nWave2 490951.537546 -snap {("G4" 3)}
verdiWindowBeDocked -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "ce" -win $_nTrace1
srcSelect -signal "we" -win $_nTrace1
srcSelect -signal "sel" -win $_nTrace1
srcSelect -signal "mem_addr" -win $_nTrace1
srcSelect -signal "mem_data" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 812
wvSetCursor -win $_nWave2 469217.585913 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 489855.708052 -snap {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvSelectSignal -win $_nWave2 {( "G5" 9 )} 
wvSelectSignal -win $_nWave2 {( "G5" 10 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
