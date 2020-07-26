verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/icache/icache.fsdb}
srcHBSelect "icache_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "icache_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "htrans" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "haddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hready_out" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hready_out" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
srcDeselectAll -win $_nTrace1
srcHBSelect "icache_tb.test0.inst_cache0" -win $_nTrace1
srcSetScope -win $_nTrace1 "icache_tb.test0.inst_cache0" -delim "."
srcHBSelect "icache_tb.test0.inst_cache0.hit_ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "icache_tb.test0.inst_cache0.hit_ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "index_cnt" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "index\[3:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "icache_tb.test0.inst_cache0.miss_ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "req" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetCursor -win $_nWave2 6786.768350 -snap {("G2" 3)}
srcActiveTrace "icache_tb.test0.inst_cache0.hit_ctrl0.miss" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 740 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "icache_tb.test0.inst_cache0.hit_ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "icache_tb.test0.inst_cache0.miss_ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_flag" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 6594.455901 -snap {("G2" 7)}
srcActiveTrace "icache_tb.test0.inst_cache0.miss_ctrl0.data_flag" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data0_valid_up" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 6594.455901 -snap {("G2" 8)}
wvSetCursor -win $_nWave2 6600.659529 -snap {("G2" 8)}
srcActiveTrace "icache_tb.test0.inst_cache0.miss_ctrl0.data0_valid_up" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data0_valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 6588.252274 -snap {("G2" 9)}
srcActiveTrace "icache_tb.test0.inst_cache0.miss_ctrl0.data0_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_cnt" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoom -win $_nWave2 6104.369338 12481.698281
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoom -win $_nWave2 6439.805525 10036.651380
wvZoom -win $_nWave2 9081.595351 9211.519441
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
wvZoom -win $_nWave2 4327.030095 23977.019810
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 5691.828118 16641.230437
wvZoom -win $_nWave2 6170.604265 12110.204002
wvZoom -win $_nWave2 6377.624535 10450.277840
srcHBSelect "icache_tb.test0.inst_cache0.arbit0" -win $_nTrace1
srcSetScope -win $_nTrace1 "icache_tb.test0.inst_cache0.arbit0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "arbit_flag" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 9544.383473 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 9541.802578 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 9531.478995 -snap {("G1" 3)}
srcActiveTrace "icache_tb.test0.hready_out" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 6780 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "arbit_flag" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_flag" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 6617.647828 -snap {("G2" 13)}
srcActiveTrace "icache_tb.test0.inst_cache0.data_flag" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
wvSetCursor -win $_nWave2 9534.059891 -snap {("G1" 4)}
srcActiveTrace "icache_tb.test0.rdata\[31:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 6660 -TraceValue 11100001100110101010010111001010
srcHBSelect "icache_tb.test0.inst_cache0" -win $_nTrace1
wvSetCursor -win $_nWave2 9495.346456 -snap {("G2" 13)}
srcActiveTrace "icache_tb.test0.inst_cache0.data_flag" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 6660 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
srcDeselectAll -win $_nTrace1
srcHBSelect "icache_tb.test0.inst_cache0.arbit0" -win $_nTrace1
srcSetScope -win $_nTrace1 "icache_tb.test0.inst_cache0.arbit0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "arbit_flag" -win $_nTrace1
srcAction -pos 16 2 6 -win $_nTrace1 -name "arbit_flag" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss_flag" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "last_addr\[17:2\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss_addr\[17:2\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss_flag" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
wvSetCursor -win $_nWave2 9694.075420 -snap {("G2" 16)}
srcActiveTrace "icache_tb.test0.inst_cache0.arbit0.miss_flag" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 6697.655593 -snap {("G1" 4)}
srcActiveTrace "icache_tb.test0.rdata\[31:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 6660 -TraceValue 11100001100110101010010111001010
srcHBSelect "icache_tb.test0.inst_cache0" -win $_nTrace1
wvSetCursor -win $_nWave2 6646.037681 -snap {("G2" 12)}
srcActiveTrace "icache_tb.test0.inst_cache0.arbit0.arbit_flag" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0.arbit0" -win $_nTrace1
wvSetCursor -win $_nWave2 6656.361263 -snap {("G2" 14)}
srcActiveTrace "icache_tb.test0.inst_cache0.arbit0.last_addr\[17:2\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           0000000000000000
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
wvSetCursor -win $_nWave2 6656.361263 -snap {("G2" 14)}
wvSetCursor -win $_nWave2 6736.369028 -snap {("G1" 4)}
srcActiveTrace "icache_tb.test0.rdata\[31:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 6700 -TraceValue 00000000000000000000000000000000
srcHBSelect "icache_tb.test0.inst_cache0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 5399.465091 16538.610632
wvZoom -win $_nWave2 6253.607430 12754.971843
wvZoom -win $_nWave2 6397.807528 9669.089748
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "icache_tb.test0.inst_cache0.miss_ctrl0" -delim "."
srcHBSelect "icache_tb.test0.inst_cache0.arbit0" -win $_nTrace1
srcSetScope -win $_nTrace1 "icache_tb.test0.inst_cache0.arbit0" -delim "."
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss" -win $_nTrace1
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
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 6 7 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 6 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "arbit_flag" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss_addr\[1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 6851.806771 -snap {("G1" 3)}
srcActiveTrace "icache_tb.test0.hready_out" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 6780 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "icache_tb.test0.inst_cache0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_flag" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "arbit_done" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 6661.085628 -snap {("G3" 5)}
srcActiveTrace "icache_tb.test0.inst_cache0.arbit_done" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0.arbit0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "last_addr\[17:2\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss_addr\[17:2\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss_addr\[1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 9494.953052 -snap {("G3" 4)}
srcActiveTrace "icache_tb.test0.inst_cache0.data_flag" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 6660 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
debReload
debReload
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 6 7 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_cnt\[1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 9139.118019 12518.199146
srcHBSelect "icache_tb.test0.inst_cache0.arbit0" -win $_nTrace1
srcSetScope -win $_nTrace1 "icache_tb.test0.inst_cache0.arbit0" -delim "."
srcHBSelect "icache_tb.test0.inst_cache0.hit_ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "icache_tb.test0.inst_cache0.hit_ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "icache_tb.test0.inst_cache0.miss_ctrl0" -delim "."
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss_addr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "req" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "req" -win $_nTrace1
srcAction -pos 17 4 1 -win $_nTrace1 -name "req" -ctrlKey off
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 15325.534607 -snap {("G3" 3)}
wvZoom -win $_nWave2 16214.372490 21619.189197
wvZoom -win $_nWave2 20969.426925 23185.470277
wvZoomOut -win $_nWave2
debReload
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 6637.102351 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 15229.075703 -snap {("G3" 1)}
srcHBSelect "icache_tb.test0.inst_cache0.hit_ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "icache_tb.test0.inst_cache0.hit_ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "hit_data_En0" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hit_data_En3" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_Wr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "index\[3:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 3830.916559 17199.711793
wvZoom -win $_nWave2 6050.577111 16623.616688
wvZoom -win $_nWave2 12422.542027 16596.815574
wvSetCursor -win $_nWave2 15266.232815 -snap {("G3" 7)}
srcActiveTrace "icache_tb.test0.inst_cache0.hit_ctrl0.index\[3:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 15260 -TraceValue 0010
nsMsgSwitchTab -tab trace
srcHBSelect "icache_tb.test0.inst_cache0.hit_ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data3_valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 15263.587521 -snap {("G3" 8)}
srcActiveTrace "icache_tb.test0.inst_cache0.hit_ctrl0.data3_valid" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss_tag_En" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data3_valid" -win $_nTrace1
srcAction -pos 327 6 6 -win $_nTrace1 -name "data3_valid" -ctrlKey off
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 14917.054039 -snap {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 15216.515584 -snap {("G3" 4)}
srcActiveTrace "icache_tb.test0.inst_cache0.hit_ctrl0.hit_data_En3" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0.hit_ctrl0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetCursor -win $_nWave2 15258.840284 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 15258.840284 -snap {("G3" 6)}
srcActiveTrace "icache_tb.test0.inst_cache0.hit_ctrl0.index\[3:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 9621 -TraceValue 0011
srcHBSelect "icache_tb.test0.inst_cache0.hit_ctrl0" -win $_nTrace1
wvSetCursor -win $_nWave2 15208.579703 -snap {("G3" 4)}
srcActiveTrace "icache_tb.test0.inst_cache0.hit_ctrl0.hit_data_En3" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0.hit_ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss_data_En3" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 15216.515584 -snap {("G3" 9)}
srcActiveTrace "icache_tb.test0.inst_cache0.hit_ctrl0.miss_data_En3" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0.miss_ctrl0" -win $_nTrace1
wvSetCursor -win $_nWave2 15211.224997 -snap {("G3" 5)}
srcActiveTrace "icache_tb.test0.inst_cache0.hit_ctrl0.data_Wr" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "icache_tb.test0.inst_cache0.hit_ctrl0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
debExit
