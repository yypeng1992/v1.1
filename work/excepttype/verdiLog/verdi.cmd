verdiWindowResize -win $_Verdi_1 "67" "27" "1847" "869"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/excepttype/except.fsdb}
srcDeselectAll -win $_nTrace1
srcHBSelect "except_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb" -delim "."
srcHBSelect "except_tb.sopc.openmips0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.id_ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.pc_id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.pc_id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_pc" -win $_nTrace1
srcSelect -signal "pc_inst" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 144.597559 1223.217192
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 159.795501 1997.443763
wvZoom -win $_nWave2 202.040289 1303.925166
wvZoom -win $_nWave2 211.187481 802.236841
wvZoom -win $_nWave2 199.661692 497.828355
srcHBSelect "except_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_read_o" -win $_nTrace1
srcSelect -win $_nTrace1 -range {58 59 5 11 8 9}
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_read_o" -win $_nTrace1
srcSelect -signal "reg1_addr_o" -win $_nTrace1
srcSelect -signal "reg2_read_o" -win $_nTrace1
srcSelect -toggle -signal "reg2_read_o" -win $_nTrace1
srcSelect -signal "reg2_addr_o" -win $_nTrace1
srcSelect -signal "reg2_read_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data_o" -win $_nTrace1
srcSelect -signal "reg2_data_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 2
wvSetPosition -win $_nWave2 {("G2" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 6)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_o" -win $_nTrace1
srcSelect -signal "current_inst_addr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
debReload
wvScrollDown -win $_nWave2 0
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_delayslot" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_i" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_o" -win $_nTrace1
srcSelect -signal "current_addr_o" -win $_nTrace1
srcSelect -signal "is_in_delayslot_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_epc_o" -win $_nTrace1
srcSelect -signal "cp0_excepttype" -win $_nTrace1
srcSelect -signal "cp0_current_inst_o" -win $_nTrace1
srcSelect -signal "cp0_is_in_delayslot_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 4)}
srcHBSelect "except_tb.sopc.openmips0.cp0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.cp0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.LLbit0" -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.LLbit0" -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.LLbit0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.LLbit0" -delim "."
srcDeselectAll -win $_nTrace1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 67 27 1847 869
wvSetCursor -win $_nWave2 229.554518 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 249.927336 -snap {("G2" 3)}
verdiWindowBeDocked -win $_nWave2
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvScrollDown -win $_nWave2 2
wvSelectGroup -win $_nWave2 {G4}
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
srcHBSelect "except_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_in_delayslot_i" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_we" -win $_nTrace1
srcSelect -signal "mem_waddr" -win $_nTrace1
srcSelect -signal "mem_wdata" -win $_nTrace1
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
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/except_tb/sopc/openmips0/mem0/mem_we" \
           "/except_tb/sopc/openmips0/mem0/mem_waddr\[4:0\]" \
           "/except_tb/sopc/openmips0/mem0/mem_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 3)}
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
wvSetCursor -win $_nWave2 208.229700 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 229.744919 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 230.506519 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 269.919354 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 228.412117 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 250.308137 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 269.348153 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 288.959371 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 269.919354 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 290.101772 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 308.760988 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 329.705007 -snap {("G2" 8)}
wvSetCursor -win $_nWave2 288.578570 -snap {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
verdiWindowBeDocked -win $_nWave2
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_we" -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcSelect -signal "ex_wdata" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 "/except_tb/sopc/openmips0/ex0/ex_we" \
           "/except_tb/sopc/openmips0/ex0/ex_waddr\[4:0\]" \
           "/except_tb/sopc/openmips0/ex0/ex_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 3)}
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
wvSetCursor -win $_nWave2 268.586553 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 289.340171 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 309.712989 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 309.712989 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 309.903389 -snap {("G3" 1)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.ex_we" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 290 -TraceValue 1
nsMsgSwitchTab -tab trace
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
verdiDockWidgetUndock -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetDock -dock widgetDock_MTB_SOURCE_TAB_1
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSetCursor -win $_nWave2 288.388170 -snap {("G2" 3)}
verdiWindowBeDocked -win $_nWave2
verdiWindowResize -win $_Verdi_1 "297" "29" "1385" "833"
verdiDockWidgetUndock -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetDock -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "57" "17" "1847" "869"
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvScrollDown -win $_nWave2 6
wvScrollDown -win $_nWave2 2
wvScrollUp -win $_nWave2 5
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 3
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 3
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 270.116645 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 289.158524 -snap {("G2" 3)}
srcHBSelect "except_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "alusel_o" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 "/except_tb/sopc/openmips0/id0/alusel_o\[2:0\]"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "aluop_o" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvAddSignal -win $_nWave2 "/except_tb/sopc/openmips0/id0/aluop_o\[7:0\]"
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr_o" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wreg_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 309.342916 -snap {("G2" 11)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 188.133766 413.589615
wvSetCursor -win $_nWave2 270.117711 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 290.322974 -snap {("G2" 8)}
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
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ex0" -delim "."
wvSetCursor -win $_nWave2 309.656068 -snap {("G3" 1)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.ex_we" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 290 -TraceValue 1
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_we" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 5)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 309.801429 -snap {("G2" 5)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.id_we" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 290 -TraceValue 1
srcHBSelect "except_tb.sopc.openmips0.id_ex0" -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 5
wvScrollUp -win $_nWave2 5
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 5
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 5
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 2
wvScrollUp -win $_nWave2 2
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
verdiWindowBeDocked -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "flush" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 290.032251 -snap {("G2" 6)}
srcActiveTrace "except_tb.sopc.openmips0.ctrl0.flush" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvScrollDown -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSetCursor -win $_nWave2 289.596166 -snap {("G4" 5)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.cp0_excepttype\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_i\[9\]" -win $_nTrace1
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
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_i" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSetCursor -win $_nWave2 289.450804 -snap {("G4" 5)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.cp0_excepttype\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_i\[9\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetCursor -win $_nWave2 310.265525 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 290.060262 -snap {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
verdiWindowBeDocked -win $_nWave2
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 2
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 7
wvScrollDown -win $_nWave2 8
srcDeselectAll -win $_nTrace1
srcSelect -signal "ce" -win $_nTrace1
srcSelect -signal "we" -win $_nTrace1
srcSelect -signal "sel" -win $_nTrace1
srcSelect -signal "mem_addr" -win $_nTrace1
srcSelect -signal "mem_data" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/except_tb/sopc/openmips0/mem0/ce" \
           "/except_tb/sopc/openmips0/mem0/we" \
           "/except_tb/sopc/openmips0/mem0/sel\[3:0\]" \
           "/except_tb/sopc/openmips0/mem0/mem_addr\[31:0\]" \
           "/except_tb/sopc/openmips0/mem0/mem_data\[31:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 5)}
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_whilo" -win $_nTrace1
srcSelect -signal "mem_hi" -win $_nTrace1
srcSelect -signal "mem_lo" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvAddSignal -win $_nWave2 "/except_tb/sopc/openmips0/mem0/mem_whilo" \
           "/except_tb/sopc/openmips0/mem0/mem_hi\[31:0\]" \
           "/except_tb/sopc/openmips0/mem0/mem_lo\[31:0\]"
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 11)}
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
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
wvSetCursor -win $_nWave2 269.854999 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 288.897370 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 310.410887 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 329.162534 -snap {("G1" 4)}
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 350.094605 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 369.863783 -snap {("G3" 4)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 389.923685 -snap {("G3" 5)}
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
wvScrollDown -win $_nWave2 0
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 410.346990 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 430.406892 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 449.449262 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 469.727206 -snap {("G2" 2)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetCursor -win $_nWave2 489.496384 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 490.077831 -snap {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 2 3 4 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetCursor -win $_nWave2 449.085858 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 470.163291 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 490.077831 -snap {("G2" 8)}
wvSetCursor -win $_nWave2 509.701647 -snap {("G4" 3)}
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_epc_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 11)}
wvScrollDown -win $_nWave2 1
srcHBSelect "except_tb.sopc.openmips0.cp0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.cp0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "epc_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "epc_o" -win $_nTrace1
srcAction -pos 14 9 2 -win $_nTrace1 -name "epc_o" -ctrlKey off
wvSetCursor -win $_nWave2 589.650530 -snap {("G4" 12)}
srcActiveTrace "except_tb.sopc.openmips0.cp0.epc_o\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.cp0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 669.526732 -snap {("G3" 3)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.ex_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 650 -TraceValue \
           00000000000000001001000000000000
nsMsgSwitchTab -tab trace
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_rdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 669.962817 -snap {("G4" 13)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.cp0_rdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.cp0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "epc_o\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 589.723211 -snap {("G4" 14)}
srcActiveTrace "except_tb.sopc.openmips0.cp0.epc_o\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
nsMsgSwitchTab -tab trace
srcHBSelect "except_tb.sopc.openmips0.cp0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 590.450019 -snap {("G4" 15)}
srcActiveTrace "except_tb.sopc.openmips0.cp0.excepttype\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue \
           zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvSetCursor -win $_nWave2 226.764103 -snap {("G3" 0)}
wvZoom -win $_nWave2 310.492388 818.676558
wvSetCursor -win $_nWave2 490.699540 -snap {("G3" 3)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.ex_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 490 -TraceValue \
           00000000000000000000000000000000
nsMsgSwitchTab -tab trace
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetCursor -win $_nWave2 509.047905 -snap {("G4" 3)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.mem_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 490 -TraceValue \
           00000000000000001001000000000000
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
wvScrollDown -win $_nWave2 3
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
wvZoom -win $_nWave2 399.285367 743.644853
wvSetCursor -win $_nWave2 449.684853 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 469.000956 -snap {("G2" 5)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 2 )} 
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSetCursor -win $_nWave2 510.075427 -snap {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetCursor -win $_nWave2 509.853403 -snap {("G3" 3)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.ex_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 490 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
wvSetCursor -win $_nWave2 509.631379 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 509.631379 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 509.631379 -snap {("G3" 3)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.ex_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 490 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
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
wvSetCursor -win $_nWave2 509.631379 -snap {("G3" 3)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.ex_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 490 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "alusel\[2:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 509.409354 -snap {("G2" 9)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.alusel\[2:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 490 -TraceValue 111
srcHBSelect "except_tb.sopc.openmips0.id_ex0" -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvScrollUp -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
srcHBSelect "except_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "alusel_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSetPosition -win $_nWave2 {("G2" 7)}
wvScrollDown -win $_nWave2 0
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "aluop_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 489.205155 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 508.743282 -snap {("G2" 1)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 451.239022 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 469.445004 -snap {("G2" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 488.983131 -snap {("G2" 12)}
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
wvSetCursor -win $_nWave2 489.649203 -snap {("G3" 3)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.ex_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 470 -TraceValue \
           00000000000000001001000000000000
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "alusel\[2:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 "/except_tb/sopc/openmips0/ex0/alusel\[2:0\]"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 489.649203 -snap {("G3" 4)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.ex_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 470 -TraceValue \
           00000000000000001001000000000000
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_rdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcTraceLoad "except_tb.sopc.openmips0.ex0.cp0_rdata\[31:0\]" -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
wvSetCursor -win $_nWave2 489.427179 -snap {("G3" 2)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.cp0_rdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_rdata\[31:0\]" -win $_nTrace1
srcAction -pos 589 10 4 -win $_nTrace1 -name "cp0_rdata\[31:0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_o\[31:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "epc_o\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "epc_o\[31:0\]" -win $_nTrace1
srcAction -pos 146 9 3 -win $_nTrace1 -name "epc_o\[31:0\]" -ctrlKey off
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 390.096465 -snap {("G3" 5)}
srcActiveTrace "except_tb.sopc.openmips0.cp0.excepttype\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_epc_o\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_epc_i\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 569.047945 -snap {("G3" 6)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.cp0_epc_o\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_wb_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_wb_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_wb_we" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 570.158066 -snap {("G3" 8)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.cp0_wb_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.wb0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_mem_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 549.953867 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 549.953867 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 549.953867 -snap {("G3" 11)}
srcActiveTrace "except_tb.sopc.openmips0.wb0.cp0_mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_wdata_i\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 549.509818 -snap {("G3" 12)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.cp0_wdata_i\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_ex_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 529.749667 -snap {("G3" 13)}
srcActiveTrace "except_tb.sopc.openmips0.ex_mem0.cp0_ex_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 529.305619 -snap {("G3" 14)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.reg1_data\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 510 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_reg1_data\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 509.767492 -snap {("G3" 15)}
srcActiveTrace "except_tb.sopc.openmips0.id_ex0.id_reg1_data\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 490 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 509.545468 -snap {("G3" 16)}
srcActiveTrace "except_tb.sopc.openmips0.id0.ex_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 490 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
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
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 11 12 13 14 15 16 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 9)}
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 446.934652 -snap {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetCursor -win $_nWave2 469.137069 -snap {("G2" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
wvSetCursor -win $_nWave2 489.341268 -snap {("G2" 12)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetCursor -win $_nWave2 250.776299 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 330.705000 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 349.112364 -snap {("G2" 12)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 6 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSetCursor -win $_nWave2 330.240310 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 349.778437 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 369.538588 -snap {("G3" 4)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 369.538588 -snap {("G3" 4)}
wvSetCursor -win $_nWave2 369.538588 -snap {("G3" 4)}
wvSetCursor -win $_nWave2 369.538588 -snap {("G3" 4)}
wvSetCursor -win $_nWave2 369.538588 -snap {("G3" 4)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.excepttype_o\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
verdiDockWidgetUndock -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetDock -dock widgetDock_MTB_SOURCE_TAB_1
wvSetCursor -win $_nWave2 349.334389 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 369.316564 -snap {("G3" 4)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.excepttype_o\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
verdiWindowResize -win $_Verdi_1 "287" "19" "1385" "833"
verdiWindowBeDocked -win $_nWave2
verdiWindowResize -win $_Verdi_1 "67" "27" "1847" "869"
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
srcDeselectAll -win $_nTrace1
srcSelect -signal "transpassert" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 369.982636 -snap {("G3" 1)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.transpassert" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "aluop" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
debReload
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvScrollDown -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSetCursor -win $_nWave2 391.074932 -snap {("G4" 8)}
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
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
srcHBSelect "except_tb.sopc.openmips0.cp0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.cp0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype" -win $_nTrace1
srcSelect -signal "current_inst" -win $_nTrace1
srcSelect -signal "is_in_delayslot" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvScrollUp -win $_nWave2 7
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetCursor -win $_nWave2 370.426684 -snap {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSetCursor -win $_nWave2 328.908165 -snap {("G4" 9)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.cp0_current_inst_o\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 310 -TraceValue \
           00000000000000000000000000000001
nsMsgSwitchTab -tab trace
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 530.062062 -snap {("G4" 3)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 67 27 1847 869
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
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
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
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
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
wvSetCursor -win $_nWave2 570.137424 -snap {("G1" 2)}
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 408.947877 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 431.150294 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 449.800325 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 470.892621 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 489.098602 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 509.968874 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 528.840929 -snap {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSetCursor -win $_nWave2 549.267152 -snap {("G3" 7)}
wvSetCursor -win $_nWave2 568.361231 -snap {("G3" 7)}
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 5 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvScrollDown -win $_nWave2 3
wvScrollUp -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSetCursor -win $_nWave2 569.915400 -snap {("G4" 5)}
wvSetCursor -win $_nWave2 569.915400 -snap {("G4" 5)}
wvSetCursor -win $_nWave2 569.471352 -snap {("G4" 5)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.cp0_excepttype\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 410 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 589.897575 -snap {("G1" 3)}
srcActiveTrace "except_tb.sopc.openmips0.pc_id0.pc_pc\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 570 -TraceValue \
           00000000000000000000000001100000
srcHBSelect "except_tb.sopc.openmips0.pc_reg0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "new_pc\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 569.915400 -snap {("G5" 4)}
srcActiveTrace "except_tb.sopc.openmips0.pc_reg0.new_pc\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 410 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
wvSetCursor -win $_nWave2 569.249327 -snap {("G5" 4)}
srcActiveTrace "except_tb.sopc.openmips0.pc_reg0.new_pc\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 410 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_i" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 569.915400 -snap {("G5" 5)}
srcActiveTrace "except_tb.sopc.openmips0.ctrl0.excepttype_i\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 410 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_i\[9\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "current_inst_i" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_excepttype\[31:0\]" -win $_nTrace1
wvSetCursor -win $_nWave2 569.693376 -snap {("G4" 5)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.cp0_excepttype\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 410 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_i\[9\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 569.915400 -snap {("G5" 6)}
wvSetCursor -win $_nWave2 569.915400 -snap {("G5" 6)}
wvSetCursor -win $_nWave2 569.915400 -snap {("G5" 6)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.excepttype_i\[9\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "except_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_excepttype\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 549.933225 -snap {("G5" 7)}
srcActiveTrace "except_tb.sopc.openmips0.ex_mem0.ex_excepttype\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 390 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 529.951050 -snap {("G2" 11)}
srcActiveTrace "except_tb.sopc.openmips0.id0.excepttype_o\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 370 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_is_erect" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_is_syscall" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "instvalid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 529.729025 -snap {("G5" 10)}
srcActiveTrace "except_tb.sopc.openmips0.id0.instvalid" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 198 -TraceValue 1
srcHBSelect "except_tb.sopc.openmips0.id0" -win $_nTrace1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 589.897575 -snap {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 609.213678 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 629.861926 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 652.508391 -snap {("G4" 2)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
verdiWindowResize -win $_Verdi_1 "67" "27" "1123" "785"
wvResizeWindow -win $_nWave2 67 27 1123 785
verdiWindowResize -win $_Verdi_1 "1" "25" "1189" "787"
verdiWindowResize -win $_Verdi_1 "67" "27" "1123" "785"
wvResizeWindow -win $_nWave2 67 27 1123 785
verdiWindowResize -win $_Verdi_1 "67" "27" "1847" "869"
wvResizeWindow -win $_nWave2 67 27 1847 869
verdiWindowResize -win $_Verdi_1 "1" "27" "1913" "869"
verdiWindowResize -win $_Verdi_1 "67" "27" "1847" "869"
wvResizeWindow -win $_nWave2 1 27 1913 869
wvResizeWindow -win $_nWave2 67 27 1847 869
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 228.926843 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 250.241163 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 270.667387 -snap {("G2" 6)}
wvSetCursor -win $_nWave2 267.559048 -snap {("G2" 7)}
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetCursor -win $_nWave2 229.370891 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 270.445363 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 288.873369 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 308.855544 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 328.837719 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 348.375846 -snap {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 388.562220 -snap {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 510.009441 -snap {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSetCursor -win $_nWave2 589.383081 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 610.141060 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 628.791090 -snap {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSetCursor -win $_nWave2 889.447464 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 909.108690 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 927.980745 -snap {("G2" 7)}
wvSetCursor -win $_nWave2 1150.004913 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 1189.081167 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 1229.933614 -snap {("G2" 8)}
wvSetCursor -win $_nWave2 1489.923916 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 1509.779130 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 1528.873208 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 1789.751607 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 2088.962189 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 2370.824151 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 2388.919121 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 2670.694234 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 2749.959396 -snap {("G2" 7)}
wvSetCursor -win $_nWave2 2769.941571 -snap {("G2" 7)}
wvSetCursor -win $_nWave2 2810.349970 -snap {("G2" 7)}
wvSetCursor -win $_nWave2 2848.094079 -snap {("G2" 7)}
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
verdiWindowResize -win $_Verdi_1 "67" "27" "1123" "785"
wvResizeWindow -win $_nWave2 67 27 1123 785
verdiWindowResize -win $_Verdi_1 "1" "27" "1189" "785"
verdiWindowResize -win $_Verdi_1 "67" "27" "1123" "785"
wvResizeWindow -win $_nWave2 67 27 1123 785
verdiWindowResize -win $_Verdi_1 "67" "27" "1847" "869"
wvResizeWindow -win $_nWave2 67 27 1847 869
verdiWindowResize -win $_Verdi_1 "2" "30" "1912" "866"
verdiWindowResize -win $_Verdi_1 "67" "27" "1847" "869"
wvResizeWindow -win $_nWave2 67 27 1847 869
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 105.222334 1131.140090
wvZoom -win $_nWave2 157.477333 609.913016
wvZoom -win $_nWave2 191.023499 505.482343
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
wvSelectSignal -win $_nWave2 {( "G5" 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 6 7 8 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 4)}
verdiWindowBeDocked -win $_nWave2
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ctrl0" -delim "."
srcHBSelect "except_tb.sopc.openmips0.cp0" -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.cp0" -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.cp0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.cp0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "compare_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
verdiWindowBeDocked -win $_nWave2
debReload
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvScrollDown -win $_nWave2 0
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
wvScrollUp -win $_nWave2 1
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
srcDeselectAll -win $_nTrace1
srcSelect -signal "status_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvScrollDown -win $_nWave2 8
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
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 5
srcDeselectAll -win $_nTrace1
srcSelect -signal "count_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 7)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 5309.898080 -snap {("G5" 6)}
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "timer_int_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "int_i\[5:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 5322.388729 -snap {("G5" 9)}
srcActiveTrace "except_tb.sopc.openmips0.cp0.int_i\[5:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 00000z
nsMsgSwitchTab -tab trace
srcDeselectAll -win $_nTrace1
srcSelect -signal "int_i\[5:0\]" -win $_nTrace1
srcAction -pos 38 5 2 -win $_nTrace1 -name "int_i\[5:0\]" -ctrlKey off
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 55.552368 -snap {("G5" 9)}
srcActiveTrace "except_tb.sopc.openmips0.cp0.int_i\[5:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 00000z
srcDeselectAll -win $_nTrace1
srcSelect -signal "time_int_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 55.552368 -snap {("G5" 10)}
srcActiveTrace "except_tb.sopc.time_int_o" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue z
wvSetCursor -win $_nWave2 258.298238 -snap {("G5" 10)}
srcActiveTrace "except_tb.sopc.time_int_o" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue z
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 5329.478210 -snap {("G5" 9)}
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
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
wvSetCursor -win $_nWave2 5400.439264 -snap {("G4" 5)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.cp0_excepttype\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_status_o\[15:8\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_cause_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_status_o\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_status_o\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 10 )} 
wvSelectSignal -win $_nWave2 {( "G5" 12 )} 
wvSelectSignal -win $_nWave2 {( "G5" 11 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_status_o\[15:8\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_status_o\[15:8\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_excepttype\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "current_inst_i" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 15)}
wvSelectSignal -win $_nWave2 {( "G5" 14 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 14 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 14)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 5427.680312 -snap {("G4" 2)}
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
wvSetCursor -win $_nWave2 5531.080706 -snap {("G1" 3)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
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
wvZoom -win $_nWave2 5363.026263 5824.070370
wvSetCursor -win $_nWave2 5369.863151 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 5466.174106 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 5489.062821 -snap {("G4" 2)}
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 14)}
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 14)}
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 14)}
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 14)}
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 14)}
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectGroup -win $_nWave2 {G5}
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 14)}
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 14)}
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
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 14)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 14)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 14)}
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_we_o" -win $_nTrace1
srcSelect -signal "cp0_waddr_o" -win $_nTrace1
srcSelect -signal "cp0_wdata_o" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvAddSignal -win $_nWave2 "/except_tb/sopc/openmips0/ex0/cp0_we_o" \
           "/except_tb/sopc/openmips0/ex0/cp0_waddr_o\[4:0\]" \
           "/except_tb/sopc/openmips0/ex0/cp0_wdata_o\[31:0\]"
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 6)}
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_we_o" -win $_nTrace1
srcSelect -signal "cp0_waddr_o" -win $_nTrace1
srcSelect -signal "cp0_wdata_o" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvAddSignal -win $_nWave2 "/except_tb/sopc/openmips0/mem0/cp0_we_o" \
           "/except_tb/sopc/openmips0/mem0/cp0_waddr_o\[4:0\]" \
           "/except_tb/sopc/openmips0/mem0/cp0_wdata_o\[31:0\]"
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcHBSelect "except_tb.sopc.openmips0.wb0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.wb0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_wb_we" -win $_nTrace1
srcSelect -signal "cp0_wb_waddr" -win $_nTrace1
srcSelect -signal "cp0_wb_wdata" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvAddSignal -win $_nWave2 "/except_tb/sopc/openmips0/wb0/cp0_wb_we" \
           "/except_tb/sopc/openmips0/wb0/cp0_wb_waddr\[4:0\]" \
           "/except_tb/sopc/openmips0/wb0/cp0_wb_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcHBSelect "except_tb.sopc.openmips0.cp0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.cp0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "compare_o" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "compare_o\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 10)}
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
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvZoom -win $_nWave2 5361.391355 5669.943117
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
wvScrollDown -win $_nWave2 24
wvSelectSignal -win $_nWave2 {( "G5" 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSelectSignal -win $_nWave2 {( "G5" 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
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
wvSetCursor -win $_nWave2 5309.347839 -snap {("G5" 4)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 5369.227968 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 5431.097471 -snap {("G1" 3)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetCursor -win $_nWave2 5429.704909 -snap {("G1" 1)}
srcActiveTrace "except_tb.sopc.openmips0.ctrl0.flush" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5370 -TraceValue 0
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_i" -win $_nTrace1
wvScrollDown -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSetCursor -win $_nWave2 5429.505972 -snap {("G5" 1)}
srcActiveTrace "except_tb.sopc.openmips0.cp0.excepttype\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5370 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0" -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 5429.704909 -snap {("G1" 1)}
srcActiveTrace "except_tb.sopc.openmips0.ctrl0.flush" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5370 -TraceValue 0
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_i" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 5429.704909 -snap {("G4" 11)}
srcActiveTrace "except_tb.sopc.openmips0.ctrl0.excepttype_i\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 5370 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0" -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSetCursor -win $_nWave2 5429.307035 -snap {("G5" 1)}
srcActiveTrace "except_tb.sopc.openmips0.cp0.excepttype\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5370 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_ctrl_epc\[31:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_cp0_excepttype\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 5429.704909 -snap {("G4" 11)}
srcActiveTrace "except_tb.sopc.openmips0.mem_cp0_excepttype\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 5370 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_excepttype" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 5429.704909 -snap {("G4" 12)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.cp0_excepttype\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 5370 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvScrollDown -win $_nWave2 0
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 10)}
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
wvSetCursor -win $_nWave2 5349.334238 -snap {("G1" 1)}
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 5429.704909 -snap {("G1" 1)}
srcActiveTrace "except_tb.sopc.openmips0.ctrl0.flush" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5370 -TraceValue 0
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_i" -win $_nTrace1
srcAction -pos 16 7 7 -win $_nTrace1 -name "excepttype_i" -ctrlKey off
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 5429.505972 -snap {("G4" 11)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.cp0_excepttype\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 5370 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0" -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.mem0" -delim "."
wvSetCursor -win $_nWave2 5430.699596 -snap {("G1" 0)}
wvSetCursor -win $_nWave2 5429.704909 -snap {("G1" 1)}
srcActiveTrace "except_tb.sopc.openmips0.ctrl0.flush" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5370 -TraceValue 0
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "flush" -win $_nTrace1
srcAction -pos 17 2 3 -win $_nTrace1 -name "flush" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_i" -win $_nTrace1
srcAction -pos 16 7 5 -win $_nTrace1 -name "excepttype_i" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_excepttype\[31:0\]" -win $_nTrace1
srcAction -pos 132 2 10 -win $_nTrace1 -name "cp0_excepttype\[31:0\]" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_excepttype\[31:0\]" -win $_nTrace1
srcAction -pos 132 2 10 -win $_nTrace1 -name "cp0_excepttype\[31:0\]" -ctrlKey \
          off
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_status_o\[15:8\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_cause_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_status_o\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_status_o\[1\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
verdiWindowBeDocked -win $_nWave2
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
wvResizeWindow -win $_nWave2 57 19 1847 867
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_excepttype\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "current_addr_o" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSetCursor -win $_nWave2 5369.625843 -snap {("G5" 2)}
srcActiveTrace "except_tb.sopc.openmips0.cp0.current_inst\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5350 -TraceValue \
           00000000000000000000000100011100
nsMsgSwitchTab -tab trace
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "current_inst_i\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 5370.222655 -snap {("G4" 17)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.current_inst_i\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 5350 -TraceValue \
           00000000000000000000000100011100
srcHBSelect "except_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
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
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
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
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 5453.776324 -snap {("G3" 4)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.cp0_we_o" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 410 -TraceValue 1
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvScrollDown -win $_nWave2 13
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSetCursor -win $_nWave2 5308.968214 -snap {("G5" 4)}
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
wvSetCursor -win $_nWave2 5429.126347 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 5450.412639 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 5469.311683 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 5469.311683 -snap {("G2" 12)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "alusel" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "aluop" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 18 )} 
wvSelectSignal -win $_nWave2 {( "G4" 18 19 )} 
wvSetPosition -win $_nWave2 {("G4" 18)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 11)}
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
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 2)}
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
wvSetCursor -win $_nWave2 5429.325284 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 5449.815827 -snap {("G3" 0)}
wvSetCursor -win $_nWave2 5470.306370 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 5370.439842 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 5390.333572 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 5429.126347 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 5450.810514 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 5470.704244 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 5469.311683 -snap {("G3" 1)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.alusel\[2:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5450 -TraceValue 000
srcHBSelect "except_tb.sopc.openmips0.id_ex0" -win $_nTrace1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 5429.723159 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 5450.014764 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 5449.616890 -snap {("G2" 1)}
srcActiveTrace "except_tb.sopc.openmips0.id0.alusel_o\[2:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5430 -TraceValue 100
srcHBSelect "except_tb.sopc.openmips0.id0" -win $_nTrace1
wvSetCursor -win $_nWave2 5450.014764 -snap {("G2" 1)}
srcActiveTrace "except_tb.sopc.openmips0.id0.alusel_o\[2:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5430 -TraceValue 100
srcHBSelect "except_tb.sopc.openmips0.id0" -win $_nTrace1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
verdiWindowBeDocked -win $_nWave2
srcHBSelect "except_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.id0" -delim "."
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_i" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_i" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 5429.922096 -snap {("G4" 16)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.cp0_excepttype\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 5370 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
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
wvScrollUp -win $_nWave2 1
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
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "flush" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvScrollDown -win $_nWave2 12
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 1)}
srcHBSelect "except_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_i" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_i" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_current_inst_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.wb0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.wb0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.id_ex0" -delim "."
srcHBSelect "except_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ex_mem0" -delim "."
srcHBSelect "except_tb.sopc.openmips0.wb0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.wb0" -delim "."
srcHBSelect "except_tb.sopc.openmips0.pc_reg0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.pc_reg0" -delim "."
srcHBSelect "except_tb.sopc.openmips0.pc_id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.pc_id0" -delim "."
srcHBSelect "except_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.id_ex0" -delim "."
srcHBSelect "except_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ex_mem0" -delim "."
srcHBSelect "except_tb.sopc.openmips0.wb0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.wb0" -delim "."
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
wvResizeWindow -win $_nWave2 57 19 1847 867
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
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvSetCursor -win $_nWave2 5429.325284 -snap {("G6" 4)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.cp0_current_inst_o\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 5370 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "current_inst_i\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 5429.524222 -snap {("G6" 5)}
srcActiveTrace "except_tb.sopc.openmips0.mem0.current_inst_i\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 5370 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_current_inst\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 5410.426240 -snap {("G6" 6)}
srcActiveTrace "except_tb.sopc.openmips0.ex_mem0.ex_current_inst\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 5410 -TraceValue \
           00000000000000000000000000100000
srcHBSelect "except_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype_i\[31:12\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "current_addr_i\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 5409.630491 -snap {("G6" 7)}
srcActiveTrace "except_tb.sopc.openmips0.ex0.current_addr_i\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 5370 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_current_addr\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 5389.338886 -snap {("G6" 8)}
srcActiveTrace "except_tb.sopc.openmips0.id_ex0.id_current_addr\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 5370 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_i\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 5389.736760 -snap {("G6" 9)}
srcActiveTrace "except_tb.sopc.openmips0.id0.pc_i\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5370 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.pc_id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_pc  \[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 5369.644093 -snap {("G6" 10)}
srcActiveTrace "except_tb.sopc.openmips0.pc_id0.pc_pc\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5350 -TraceValue \
           00000000000000000000000100011000
srcHBSelect "except_tb.sopc.openmips0.pc_reg0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "new_pc\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 5348.556738 -snap {("G6" 11)}
wvSetCursor -win $_nWave2 5348.954613 -snap {("G6" 11)}
srcActiveTrace "except_tb.sopc.openmips0.pc_reg0.new_pc\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 5429.524222 -snap {("G6" 1)}
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
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
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
srcHBSelect "except_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
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
srcSelect -signal "cp0_status_o\[15:8\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_cause_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_status_o\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cp0_status_o\[1\]" -win $_nTrace1
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
wvSetCursor -win $_nWave2 5386.951638 -snap {("G4" 14)}
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
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 5309.966524 -snap {("G5" 4)}
wvSetCursor -win $_nWave2 5330.457067 -snap {("G5" 4)}
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
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
srcHBSelect "except_tb.sopc.openmips0.cp0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.cp0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "timer_int_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.LLbit0" -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "flush" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "new_pc\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.pc_reg0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.pc_reg0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ce" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvSetCursor -win $_nWave2 5370.244528 -snap {("G6" 3)}
srcActiveTrace "except_tb.sopc.openmips0.ctrl0.new_pc\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5350 -TraceValue \
           00000000000000000000000000100000
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
wvSetCursor -win $_nWave2 5369.846653 -snap {("G6" 4)}
srcHBSelect "except_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.id_ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_inst" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_inst" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 67 27 1847 869
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
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 5390.536133 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 5349.555048 -snap {("G1" 3)}
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
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
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
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
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvScrollDown -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSelectSignal -win $_nWave2 {( "G4" 15 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetCursor -win $_nWave2 5509.699579 -snap {("G4" 7)}
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
verdiWindowBeDocked -win $_nWave2
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "except_tb.sopc.openmips0.cp0" -win $_nTrace1
srcSetScope -win $_nTrace1 "except_tb.sopc.openmips0.cp0" -delim "."
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "we" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "excepttype" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
debExit
