verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/load_store/load_store.fsdb}
srcHBSelect "load_store_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb" -delim "."
srcHBSelect "load_store_tb.sopc.openmips0.pc_id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.pc_id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_pc" -win $_nTrace1
srcSelect -win $_nTrace1 -range {5 6 10 10 4 4}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_pc" -win $_nTrace1
srcSelect -signal "pc_inst" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 120814.193708 941343.925972
wvZoom -win $_nWave2 195729.924969 634594.377698
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_o\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "aluop_o" -win $_nTrace1
srcSelect -win $_nTrace1 -range {72 73 9 8 5 5}
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_i" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "aluop_o" -win $_nTrace1
srcSelect -signal "mem_addr" -win $_nTrace1
srcSelect -signal "mem_data" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ce" -win $_nTrace1
srcSelect -signal "we" -win $_nTrace1
srcSelect -signal "sel" -win $_nTrace1
srcSelect -signal "mem_addr" -win $_nTrace1
srcSelect -signal "mem_data" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 8)}
wvScrollDown -win $_nWave2 1
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_from_mem" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.mem0" -delim "."
nsMsgSwitchTab -tab general
nsMsgSwitchTab -tab cmpl
nsMsgSwitchTab -tab trace
nsMsgSwitchTab -tab search
nsMsgSwitchTab -tab intercon
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_we" -win $_nTrace1
srcSelect -win $_nTrace1 -range {20 21 5 11 3 4}
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_we" -win $_nTrace1
srcSelect -signal "mem_waddr" -win $_nTrace1
srcSelect -signal "mem_wdata" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/load_store_tb/sopc/openmips0/mem0/mem_we" \
           "/load_store_tb/sopc/openmips0/mem0/mem_waddr\[4:0\]" \
           "/load_store_tb/sopc/openmips0/mem0/mem_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 3)}
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSetCursor -win $_nWave2 269827.079184 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 289590.870084 -snap {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
verdiWindowResize -win $_Verdi_1 "67" "27" "1127" "789"
verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSetCursor -win $_nWave2 289320.133223 -snap {("G4" 7)}
wvSetCursor -win $_nWave2 289320.133223 -snap {("G4" 7)}
wvSetCursor -win $_nWave2 289320.133223 -snap {("G4" 7)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_addr\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
nsMsgSwitchTab -tab trace
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 289396.797472 -snap {("G4" 7)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_addr\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_store_addr\[31:0\]" -win $_nTrace1
srcAction -pos 151 8 3 -win $_nTrace1 -name "load_store_addr\[31:0\]" -ctrlKey \
          off
wvSetCursor -win $_nWave2 288850.811641 -snap {("G4" 6)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.sel\[3:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 1111
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSetCursor -win $_nWave2 289123.804556 -snap {("G4" 7)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_addr\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_store_addr\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 289396.797472 -snap {("G4" 4)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.load_store_addr\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 270000 -TraceValue \
           11111111111111111110111011111111
srcHBSelect "load_store_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_mem_addr\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 269468.314638 -snap {("G4" 5)}
srcActiveTrace "load_store_tb.sopc.openmips0.ex_mem0.ex_mem_addr\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 250000 -TraceValue \
           11111111111111111110111011111111
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "signed_offset\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSetCursor -win $_nWave2 289669.790388 -snap {("G4" 7)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_addr\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_store_addr\[31:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvAddSignal -win $_nWave2 \
           "/load_store_tb/sopc/openmips0/mem0/load_store_addr\[31:0\]"
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 289942.783303 -snap {("G5" 1)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.load_store_addr\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 270000 -TraceValue \
           11111111111111111110111011111111
srcHBSelect "load_store_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_mem_addr\[31:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvAddSignal -win $_nWave2 \
           "/load_store_tb/sopc/openmips0/ex_mem0/ex_mem_addr\[31:0\]"
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetCursor -win $_nWave2 269468.314638 -snap {("G5" 2)}
wvSetCursor -win $_nWave2 269468.314638 -snap {("G5" 2)}
wvSetCursor -win $_nWave2 269468.314638 -snap {("G5" 2)}
srcActiveTrace "load_store_tb.sopc.openmips0.ex_mem0.ex_mem_addr\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 250000 -TraceValue \
           11111111111111111110111011111111
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "signed_offset\[31:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvAddSignal -win $_nWave2 \
           "/load_store_tb/sopc/openmips0/ex0/signed_offset\[31:0\]"
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data\[31:0\]" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "signed_offset\[31:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data\[31:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvAddSignal -win $_nWave2 "/load_store_tb/sopc/openmips0/ex0/reg1_data\[31:0\]"
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetCursor -win $_nWave2 269468.314638 -snap {("G5" 4)}
srcActiveTrace "load_store_tb.sopc.openmips0.ex0.reg1_data\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_tb.sopc.openmips0.id_ex0" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_reg1_data\[31:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvAddSignal -win $_nWave2 \
           "/load_store_tb/sopc/openmips0/id_ex0/id_reg1_data\[31:0\]"
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetCursor -win $_nWave2 248174.867227 -snap {("G5" 5)}
wvSetCursor -win $_nWave2 249266.838889 -snap {("G5" 5)}
srcActiveTrace "load_store_tb.sopc.openmips0.id_ex0.id_reg1_data\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_wdata\[31:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg2_data_o\[31:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 211320.823631 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 229065.363140 -snap {("G2" 1)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "load_store_tb.sopc.openmips0.hilo0" -win $_nTrace1
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_read_o" -win $_nTrace1
srcSelect -signal "reg2_read_o" -win $_nTrace1
srcSelect -signal "reg1_addr_o" -win $_nTrace1
srcSelect -signal "reg2_addr_o" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvAddSignal -win $_nWave2 "/load_store_tb/sopc/openmips0/id0/reg1_read_o" \
           "/load_store_tb/sopc/openmips0/id0/reg2_read_o" \
           "/load_store_tb/sopc/openmips0/id0/reg1_addr_o\[4:0\]" \
           "/load_store_tb/sopc/openmips0/id0/reg2_addr_o\[4:0\]"
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetCursor -win $_nWave2 208317.901560 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 229611.348971 -snap {("G2" 2)}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 4)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data_o" -win $_nTrace1
srcSelect -win $_nTrace1 -range {47 48 11 11 5 4}
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data_o" -win $_nTrace1
srcSelect -signal "reg2_data_o" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvAddSignal -win $_nWave2 "/load_store_tb/sopc/openmips0/id0/reg1_data_o\[31:0\]" \
           "/load_store_tb/sopc/openmips0/id0/reg2_data_o\[31:0\]"
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 4 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 7)}
wvScrollUp -win $_nWave2 8
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data\[31:0\]" -win $_nTrace1
wvSetCursor -win $_nWave2 250631.803467 -snap {("G3" 1)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data\[31:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvAddSignal -win $_nWave2 "/load_store_tb/sopc/openmips0/ex0/reg1_data\[31:0\]"
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
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
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSetCursor -win $_nWave2 228519.377309 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 250085.817636 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 229858.417028 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 247602.956538 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 249786.899862 -snap {("G2" 2)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.reg1_read_o" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 230000 -TraceValue 1
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvScrollDown -win $_nWave2 5
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 10
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 825
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 270597.562137 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 289007.668729 -snap {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSetCursor -win $_nWave2 289819.879314 -snap {("G4" 6)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.sel\[3:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 1111
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 289549.142453 -snap {("G4" 6)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.sel\[3:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 1111
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 389721.781262 -snap {("G4" 4)}
wvSetCursor -win $_nWave2 408673.361577 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 428707.889339 -snap {("G4" 7)}
wvSetCursor -win $_nWave2 409214.835300 -snap {("G4" 6)}
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSetCursor -win $_nWave2 429249.363062 -snap {("G4" 9)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.data_from_mem\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_tb.sopc.openmips0.ram0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_mem3\[addr\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_mem3" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiDockWidgetUndock -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetDock -dock widgetDock_MTB_SOURCE_TAB_1
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSetCursor -win $_nWave2 429249.363062 -snap {("G4" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 410000 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
wvSetCursor -win $_nWave2 429520.099924 -snap {("G4" 6)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.sel\[3:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 410000 -TraceValue 0111
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
verdiWindowBeDocked -win $_nWave2
srcHBSelect "load_store_tb.sopc.rom0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.rom0" -delim "."
srcHBSelect "load_store_tb" -win $_nTrace1
srcHBSelect "load_store_tb.sopc.openmips0.ram0" -win $_nTrace1
srcHBSelect "load_store_tb.sopc.openmips0.ram0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.ram0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "d0" -win $_nTrace1
srcSelect -signal "d1" -win $_nTrace1
srcSelect -signal "d2" -win $_nTrace1
srcSelect -signal "d3" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSetCursor -win $_nWave2 429790.836786 -snap {("G5" 1)}
srcActiveTrace "load_store_tb.sopc.openmips0.ram0.d0\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 390000 -TraceValue 00000000
nsMsgSwitchTab -tab trace
srcHBSelect "load_store_tb.sopc.openmips0.ram0" -win $_nTrace1
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvSetCursor -win $_nWave2 409756.309024 -snap {("G4" 6)}
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 825
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 429520.099924 -snap {("G5" 1)}
srcActiveTrace "load_store_tb.sopc.openmips0.ram0.d0\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 390000 -TraceValue 00000000
srcHBSelect "load_store_tb.sopc.openmips0.ram0" -win $_nTrace1
wvSetOptions -win $_nWave2 -fixedDelta on
srcDeselectAll -win $_nTrace1
srcSetOptions -win $_nTrace1 -annotate on
schSetOptions -win $_nSchema1 -annotate on
srcDeselectAll -win $_nTrace1
srcSetOptions -win $_nTrace1 -annotate off
schSetOptions -win $_nSchema1 -annotate off
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcSelect -win $_nTrace1 -range {2 3 3 3 3 3}
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcSelect -signal "ce" -win $_nTrace1
srcSelect -signal "we" -win $_nTrace1
srcSelect -signal "sel" -win $_nTrace1
srcSelect -signal "addr" -win $_nTrace1
srcSelect -signal "wdata" -win $_nTrace1
srcSelect -signal "rdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSetPosition -win $_nWave2 {("G5" 11)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetCursor -win $_nWave2 309854.407076 -snap {("G5" 12)}
srcActiveTrace "load_store_tb.sopc.openmips0.ram0.d3\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 290000 -TraceValue xxxxxxxx
srcHBSelect "load_store_tb.sopc.openmips0.ram0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSetCursor -win $_nWave2 310125.143938 -snap {("G5" 12)}
srcActiveTrace "load_store_tb.sopc.openmips0.ram0.d3\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 290000 -TraceValue xxxxxxxx
srcHBSelect "load_store_tb.sopc.openmips0.ram0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcSetOptions -win $_nTrace1 -annotate on
schSetOptions -win $_nSchema1 -annotate on
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 4 5 6 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSetCursor -win $_nWave2 428437.152478 -snap {("G4" 9)}
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSetCursor -win $_nWave2 449825.364548 -snap {("G4" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 430000 -TraceValue \
           11111111111111111111111111111111
nsMsgSwitchTab -tab trace
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 470807.471325 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 490300.525364 -snap {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSetCursor -win $_nWave2 489488.314779 -snap {("G4" 6)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.sel\[3:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 470000 -TraceValue 1111
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 470268.536251 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 488543.274413 -snap {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSetCursor -win $_nWave2 509931.486483 -snap {("G5" 1)}
srcActiveTrace "load_store_tb.sopc.openmips0.ram0.d0\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 490000 -TraceValue xxxxxxxx
srcHBSelect "load_store_tb.sopc.openmips0.ram0" -win $_nTrace1
srcSetOptions -win $_nTrace1 -annotate off
schSetOptions -win $_nSchema1 -annotate off
wvSetCursor -win $_nWave2 488814.011274 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 488814.011274 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 489084.748136 -snap {("G4" 6)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.sel\[3:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 470000 -TraceValue 1111
srcHBSelect "load_store_tb.sopc.openmips0" -win $_nTrace1
wvSetCursor -win $_nWave2 550000.542006 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 489896.958721 -snap {("G4" 7)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_addr\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 470000 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 508848.539037 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 549459.068284 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 569764.332907 -snap {("G4" 8)}
wvSetCursor -win $_nWave2 569222.859184 -snap {("G4" 8)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_data\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 550000 -TraceValue \
           00000000000000000000000000000000
nsMsgSwitchTab -tab trace
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_store_data\[15:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 569493.596045 -snap {("G5" 5)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.load_store_data\[15:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 550000 -TraceValue \
           1000100010011001
srcHBSelect "load_store_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_mem_data\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 528341.593075 -snap {("G5" 6)}
wvSetCursor -win $_nWave2 549459.068284 -snap {("G5" 6)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetCursor -win $_nWave2 529424.540522 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 550000.542007 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 509119.275898 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 529424.540522 -snap {("G2" 7)}
wvSetCursor -win $_nWave2 508036.328452 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 528883.066798 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 508848.539037 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 529695.277383 -snap {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetCursor -win $_nWave2 508307.065313 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 529153.803660 -snap {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 590340.334392 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 609021.177846 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 629055.705608 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 689251.895640 -snap {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSetCursor -win $_nWave2 709827.897125 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 729320.951164 -snap {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSetCursor -win $_nWave2 709557.160264 -snap {("G4" 5)}
wvSetCursor -win $_nWave2 730133.161749 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 729862.424887 -snap {("G4" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 710000 -TraceValue \
           01000100010101010110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
verdiWindowResize -win $_Verdi_1 "57" "19" "1388" "833"
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 749626.215788 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 749896.952650 -snap {("G4" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 730000 -TraceValue \
           10111011100010001001100101110111
srcHBSelect "load_store_tb.sopc.openmips0" -win $_nTrace1
verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
wvSetCursor -win $_nWave2 769931.480411 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 749355.478926 -snap {("G4" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 730000 -TraceValue \
           10111011100010001001100101110111
srcHBSelect "load_store_tb.sopc.openmips0" -win $_nTrace1
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_store_data" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_from_mem\[15\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_from_mem\[31:16\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_from_mem\[31:24\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_store_data\[31:8\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_from_mem\[31:24\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_store_data\[31:8\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_from_mem\[31:24\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 749355.478926 -snap {("G5" 6)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.data_from_mem\[31:24\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 730000 -TraceValue 10101010
nsMsgSwitchTab -tab trace
srcHBSelect "load_store_tb.sopc.openmips0.ram0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSetCursor -win $_nWave2 689251.895641 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 710098.633988 -snap {("G1" 2)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 749626.215788 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 689251.895641 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 710098.633988 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 730403.898611 -snap {("G3" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetCursor -win $_nWave2 709827.897126 -snap {("G6" 1)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.load_store_data\[31:8\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 690000 -TraceValue \
           010001000101010101100110
srcHBSelect "load_store_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_mem_data\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 689793.369364 -snap {("G6" 2)}
srcActiveTrace "load_store_tb.sopc.openmips0.ex_mem0.ex_mem_data\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 670000 -TraceValue \
           01000100010101010110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg2_data\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 689522.632502 -snap {("G6" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.ex0.reg2_data\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 670000 -TraceValue \
           01000100010101010110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_reg2_data\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.mem0" -delim "."
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 728779.477441 -snap {("G4" 3)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 729591.688026 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 668675.894156 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 687356.737609 -snap {("G2" 6)}
wvSetCursor -win $_nWave2 709015.686541 -snap {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetCursor -win $_nWave2 709286.423403 -snap {("G3" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.ex0.mem_data\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 690000 -TraceValue \
           00000000000000000110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
wvSetCursor -win $_nWave2 669488.104741 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 689251.895641 -snap {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSetCursor -win $_nWave2 690064.106226 -snap {("G2" 6)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.reg2_data_o\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 670000 -TraceValue \
           00000000000000000110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
wvSetCursor -win $_nWave2 730133.161749 -snap {("G4" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 710000 -TraceValue \
           01000100010101010110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_from_mem\[23:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_store_data\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetCursor -win $_nWave2 709557.160264 -snap {("G3" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.ex0.mem_data\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 690000 -TraceValue \
           00000000000000000110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
verdiWindowResize -win $_Verdi_1 "57" "19" "1388" "833"
wvResizeWindow -win $_nWave2 57 42 1851 802
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 729862.424888 -snap {("G6" 6)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.load_store_data\[7:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 670000 -TraceValue 01110111
srcHBSelect "load_store_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
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
wvSetCursor -win $_nWave2 709557.160264 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 710098.633988 -snap {("G3" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.ex0.mem_data\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 690000 -TraceValue \
           00000000000000000110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSetCursor -win $_nWave2 688981.158779 -snap {("G2" 6)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.reg2_data_o\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 670000 -TraceValue \
           00000000000000000110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetCursor -win $_nWave2 690064.106226 -snap {("G2" 6)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.reg2_data_o\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 670000 -TraceValue \
           00000000000000000110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 669758.841602 -snap {("G6" 7)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.ex_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 650000 -TraceValue \
           01000100010101010110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.id0" -delim "."
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 668675.894156 -snap {("G6" 7)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.ex_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 650000 -TraceValue \
           01000100010101010110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
wvSetCursor -win $_nWave2 670029.578464 -snap {("G6" 7)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.ex_wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 650000 -TraceValue \
           01000100010101010110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "alusel\[2:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 7 )} 
wvSetCursor -win $_nWave2 689251.895641 -snap {("G6" 4)}
srcActiveTrace "load_store_tb.sopc.openmips0.id_ex0.id_reg2_data\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 670000 -TraceValue \
           00000000000000000110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg2_addr_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
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
wvScrollUp -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 629554.417648 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 729456.319595 -snap {("G4" 3)}
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
wvSetCursor -win $_nWave2 729862.424888 -snap {("G6" 10)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.reg2_addr_o\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 670000 -TraceValue 00001
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 729862.424888 -snap {("G4" 3)}
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 629419.049217 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 649453.576979 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 669758.841602 -snap {("G2" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.reg2_read_o" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 650000 -TraceValue 1
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
wvSetCursor -win $_nWave2 628877.575494 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 648370.629532 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 668946.631017 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 689522.632502 -snap {("G2" 6)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSetCursor -win $_nWave2 689793.369364 -snap {("G2" 6)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.reg2_data_o\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 670000 -TraceValue \
           00000000000000000110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg2_data_i\[31:0\]" -win $_nTrace1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvScrollDown -win $_nWave2 13
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 11 )} 
wvSelectSignal -win $_nWave2 {( "G6" 12 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 12)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg2_addr_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_wdata\[31:0\]" -win $_nTrace1
srcAction -pos 1061 6 7 -win $_nTrace1 -name "ex_wdata\[31:0\]" -ctrlKey off
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 728779.477441 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 751250.636958 -snap {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSetCursor -win $_nWave2 749084.742065 -snap {("G4" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 730000 -TraceValue \
           10111011100010001001100101110111
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 7 8 9 10 11 12 13 14 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_store_data\[31:8\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_from_mem\[31:24\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 708474.212818 -snap {("G6" 1)}
wvSetCursor -win $_nWave2 750167.689511 -snap {("G6" 2)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 709827.897126 -snap {("G6" 1)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.load_store_data\[31:8\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 690000 -TraceValue \
           010001000101010101100110
srcHBSelect "load_store_tb.sopc.openmips0.ex_mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_mem_data\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 689522.632502 -snap {("G6" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.ex_mem0.ex_mem_data\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 670000 -TraceValue \
           01000100010101010110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg2_data\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 690064.106226 -snap {("G6" 4)}
srcActiveTrace "load_store_tb.sopc.openmips0.ex0.reg2_data\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 670000 -TraceValue \
           01000100010101010110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.id_ex0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "id_reg2_data\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 669217.367879 -snap {("G6" 5)}
srcActiveTrace "load_store_tb.sopc.openmips0.id_ex0.id_reg2_data\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 650000 -TraceValue \
           01000100010101010110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 688710.421918 -snap {("G6" 5)}
wvSetCursor -win $_nWave2 689251.895641 -snap {("G6" 5)}
srcActiveTrace "load_store_tb.sopc.openmips0.id_ex0.id_reg2_data\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 670000 -TraceValue \
           00000000000000000110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 163602.553979 2063909.142505
wvZoom -win $_nWave2 163602.553979 514121.782831
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvScrollDown -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 430127.859268 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 469807.241436 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 550030.951432 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 630254.661428 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 729615.294160 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 729615.294160 -snap {("G4" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.mem_wdata\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 710000 -TraceValue \
           01000100010101010110011001110111
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_store_data\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
srcHBSelect "load_store_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "stallreg_from_id" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "stallreg_for_reg1_loadrelative" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "stallreg_for_reg2_loadrelative" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "pre_is_load" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_aluop_i" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_aluop_i" -win $_nTrace1
srcAction -pos 93 7 6 -win $_nTrace1 -name "ex_aluop_i" -ctrlKey off
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvSetCursor -win $_nWave2 634255.035107 -snap {("G6" 5)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.pre_is_load" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue x
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pre_is_load" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_aluop_i" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_aluop_i" -win $_nTrace1
srcAction -pos 93 7 4 -win $_nTrace1 -name "ex_aluop_i" -ctrlKey off
debReload
wvSelectSignal -win $_nWave2 {( "G6" 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_id_aluop\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 248239.404517 -snap {("G6" 5)}
srcActiveTrace "load_store_tb.sopc.openmips0.ex_id_aluop\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue zzzzz000
nsMsgSwitchTab -tab trace
srcHBSelect "load_store_tb.sopc.openmips0.ex0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvScrollDown -win $_nWave2 0
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 815643.757699 -snap {("G4" 3)}
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 688496.745629 -snap {("G6" 2)}
srcActiveTrace "load_store_tb.sopc.openmips0.ctrl0.stallreg_from_id" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 688496.745629 -snap {("G6" 4)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.stallreg_for_reg2_loadrelative" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 688496.745629 -snap {("G6" 4)}
wvSetCursor -win $_nWave2 688496.745629 -snap {("G6" 4)}
wvSetCursor -win $_nWave2 688496.745629 -snap {("G6" 4)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.stallreg_for_reg2_loadrelative" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pre_is_load" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 185098.371312 819968.486000
wvZoom -win $_nWave2 351551.054065 744379.385362
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
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_aluop_i" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
srcHBSelect "load_store_tb.sopc.openmips0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.ctrl0" -delim "."
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 689490.047275 -snap {("G6" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.stallreg_for_reg2_loadrelative" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
debReload
wvSetCursor -win $_nWave2 689490.047275 -snap {("G6" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.stallreg_for_reg2_loadrelative" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pre_is_load" -win $_nTrace1
wvSetCursor -win $_nWave2 709604.021055 -snap {("G6" 5)}
wvSetCursor -win $_nWave2 689974.721342 -snap {("G6" 3)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.stallreg_for_reg2_loadrelative" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 809446.878856 -snap {("G4" 3)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 789211.736559 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 811264.406607 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 830166.695219 -snap {("G4" 5)}
wvScrollDown -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSetCursor -win $_nWave2 829924.358186 -snap {("G4" 6)}
srcActiveTrace "load_store_tb.sopc.openmips0.mem0.sel\[3:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 810000 -TraceValue 1111
srcHBSelect "load_store_tb.sopc.openmips0.mem0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "load_store_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "stallreg_from_id" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "stallreg_for_reg2_loadrelative" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pre_is_load" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg2_read_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg2_addr_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSetCursor -win $_nWave2 869667.631679 -snap {("G6" 4)}
wvSetCursor -win $_nWave2 869425.294646 -snap {("G6" 5)}
wvSetCursor -win $_nWave2 869425.294646 -snap {("G6" 5)}
wvSetCursor -win $_nWave2 869425.294646 -snap {("G6" 5)}
srcActiveTrace "load_store_tb.sopc.openmips0.id0.reg2_addr_o\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 790000 -TraceValue 00001
srcHBSelect "load_store_tb.sopc.openmips0.id0" -win $_nTrace1
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
wvSetCursor -win $_nWave2 829682.021152 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 850765.343066 -snap {("G3" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 909653.242206 -snap {("G4" 2)}
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 769974.530192 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 789846.166939 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 808263.781484 -snap {("G4" 3)}
wvSetCursor -win $_nWave2 770216.867226 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 787665.133637 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 811414.162920 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 830316.451533 -snap {("G4" 4)}
wvSetCursor -win $_nWave2 847764.717944 -snap {("G5" 3)}
wvSetCursor -win $_nWave2 869090.376892 -snap {("G5" 1)}
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
wvScrollDown -win $_nWave2 0
verdiWindowResize -win $_Verdi_1 "67" "27" "1127" "789"
wvResizeWindow -win $_nWave2 57 37 1127 787
verdiWindowResize -win $_Verdi_1 "1" "27" "1193" "789"
wvResizeWindow -win $_nWave2 57 19 1127 787
verdiWindowResize -win $_Verdi_1 "67" "27" "1127" "789"
wvResizeWindow -win $_nWave2 57 19 1127 787
verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
wvResizeWindow -win $_nWave2 57 41 1851 802
verdiWindowResize -win $_Verdi_1 "1" "27" "1917" "873"
verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 131831.346221 649463.249768
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvScrollUp -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 370689.251127 -snap {("G4" 3)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 389210.318620 -snap {("G4" 2)}
wvScrollDown -win $_nWave2 0
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
verdiWindowResize -win $_Verdi_1 "67" "27" "1127" "789"
verdiWindowResize -win $_Verdi_1 "1" "25" "1193" "791"
verdiWindowResize -win $_Verdi_1 "67" "27" "1127" "789"
verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
verdiWindowResize -win $_Verdi_1 "1" "27" "1917" "873"
verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
debExit
