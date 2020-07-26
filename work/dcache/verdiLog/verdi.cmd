verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/dcache/dcache.fsdb}
srcHBSelect "dcache_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "dcache_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "htrans" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hburst" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hwrite" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 0.000000 1091892.645297
wvZoom -win $_nWave2 0.000000 47504.887666
wvZoom -win $_nWave2 0.000000 2661.776830
wvSetCursor -win $_nWave2 184.236366 -snap {("G1" 1)}
srcActiveTrace "dcache_tb.test0.htrans\[1:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 00
nsMsgSwitchTab -tab trace
srcHBSelect "dcache_tb.UpdateAHBbus" -win $_nTrace1
wvSetCursor -win $_nWave2 184.236366 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
srcHBSelect "dcache_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "dcache_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "dcache_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "dcache_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "dcache_tb.test0.top" -win $_nTrace1
srcSetScope -win $_nTrace1 "dcache_tb.test0.top" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "dcache_tb.test0.top.hit0" -win $_nTrace1
srcSetScope -win $_nTrace1 "dcache_tb.test0.top.hit0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tag1_En" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tag1_Wr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "dcache_tb.test0.top.miss0" -win $_nTrace1
srcSetScope -win $_nTrace1 "dcache_tb.test0.top.miss0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "req" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data0_valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss_done" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 984.348584 -snap {("G1" 9)}
srcActiveTrace "dcache_tb.test0.top.miss0.miss_done" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 980 -TraceValue 1
srcHBSelect "dcache_tb.test0.top.miss0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss_rdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 9)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss_wdata\[31: 0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 1061.552394 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 1093.135771 -snap {("G1" 5)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "data1_valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data2_valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data3_valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetCursor -win $_nWave2 1379.140797 -snap {("G1" 6)}
srcActiveTrace "dcache_tb.test0.top.miss0.req" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 780 -TraceValue 0
srcHBSelect "dcache_tb.test0.top.miss0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "miss_wdata\[127:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "dcache_tb.test0.top.hit0" -win $_nTrace1
srcSetScope -win $_nTrace1 "dcache_tb.test0.top.hit0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "haddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
srcHBSelect "dcache_tb.test0.top.hit0" -win $_nTrace1
srcSetScope -win $_nTrace1 "dcache_tb.test0.top.hit0" -delim "."
srcHBSelect "dcache_tb.test0.top.arbit0" -win $_nTrace1
srcSetScope -win $_nTrace1 "dcache_tb.test0.top.arbit0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "arbit_flag" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
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
verdiWindowResize -win $_Verdi_1 "67" "27" "1127" "789"
verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvPrevView -win $_nWave2
wvZoom -win $_nWave2 883.349862 1278.298477
wvSetCursor -win $_nWave2 1099.903349 -snap {("G1" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetCursor -win $_nWave2 1335.718880 -snap {("G1" 10)}
srcActiveTrace "dcache_tb.test0.top.miss0.miss_wdata\[127:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1180 -TraceValue \
           00000000000000000000000000000000000000000000000000000000000001010000000000000000000000000010010000000000000000000000000000000101
srcHBSelect "dcache_tb.test0.top.miss0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 1136.812656 -snap {("G2" 2)}
srcActiveTrace "dcache_tb.test0.top.miss0.wdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1060 -TraceValue \
           00000000000000000000000000100100
srcHBSelect "dcache_tb.test0.top.miss0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "arbit_done" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 1142.019625 -snap {("G2" 3)}
srcActiveTrace "dcache_tb.test0.top.miss0.arbit_done" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "dcache_tb.test0.top.arbit0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetCursor -win $_nWave2 35.618696 -snap {("G2" 3)}
srcActiveTrace "dcache_tb.test0.top.miss0.arbit_done" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "dcache_tb.test0.top" -win $_nTrace1
wvSetCursor -win $_nWave2 40.588747 -snap {("G2" 3)}
srcActiveTrace "dcache_tb.test0.top.miss0.arbit_done" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 38 -TraceValue 1
srcHBSelect "dcache_tb.test0.top" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1129.466955 1412.211694
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcHBSelect "dcache_tb.test0.top.arbit0" -win $_nTrace1
srcSetScope -win $_nTrace1 "dcache_tb.test0.top.arbit0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "dcache_tb.test0.top" -win $_nTrace1
srcSetScope -win $_nTrace1 "dcache_tb.test0.top" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "hwdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 17 )} 
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetCursor -win $_nWave2 1221.628430 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 1376.700034 -snap {("G1" 8)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 1700.262900 -snap {("G1" 11)}
srcActiveTrace "dcache_tb.test0.top.miss0.miss_wdata\[127:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1340 -TraceValue \
           00000000000000000000000000101100000000000000000000000000001001010000000000000000000000000010010000000000000000000000000000100001
srcHBSelect "dcache_tb.test0.top.miss0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvZoom -win $_nWave2 1290.217793 1515.369833
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvZoom -win $_nWave2 1521.075979 2079.005438
wvSetCursor -win $_nWave2 2020.159879 -snap {("G1" 7)}
srcActiveTrace "dcache_tb.test0.top.hit0.miss" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 1820 -TraceValue 0
srcHBSelect "dcache_tb.test0.top.hit0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hit" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 2020.895449 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 2019.792094 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 2020.895449 -snap {("G1" 4)}
srcActiveTrace "dcache_tb.test0.top.hit0.hit" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 0
srcHBSelect "dcache_tb.test0.top.hit0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "up_hit" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "way_hit" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 2019.424310 -snap {("G1" 10)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "hit_rd_tag0_En_d" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSetCursor -win $_nWave2 2019.792094 -snap {("G1" 6)}
srcActiveTrace "dcache_tb.test0.top.hit0.way_hit" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 0
srcHBSelect "dcache_tb.test0.top.hit0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "way_hit" -win $_nTrace1
srcAction -pos 146 8 3 -win $_nTrace1 -name "way_hit" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "way_hit" -win $_nTrace1
srcAction -pos 146 8 3 -win $_nTrace1 -name "way_hit" -ctrlKey off
wvSetCursor -win $_nWave2 1981.910265 -snap {("G1" 3)}
srcActiveTrace "dcache_tb.test0.top.hwdata\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1981 -TraceValue \
           00000000000000000000000000100001
srcHBSelect "dcache_tb.UpdateAHBbus" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 92 -pos 2 -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2020.539288 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 1977.876258 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 2020.539288 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 2060.260041 -snap {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetCursor -win $_nWave2 2023.481566 -snap {("G1" 4)}
srcHBSelect "dcache_tb.test0.top.hit0" -win $_nTrace1
srcSetScope -win $_nTrace1 "dcache_tb.test0.top.hit0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hit_done" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 2052.904346 -snap {("G1" 5)}
srcActiveTrace "dcache_tb.test0.top.hit0.hit_done" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "dcache_tb.test0.top.hit0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hit" -win $_nTrace1
srcAction -pos 455 7 1 -win $_nTrace1 -name "hit" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data0_En" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data1_En" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data2_Wr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data2_En" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data3_En" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSetCursor -win $_nWave2 2014.654732 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 2023.481566 -snap {("G1" 9)}
srcActiveTrace "dcache_tb.test0.top.hit0.data3_En" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 2020 -TraceValue 1
srcHBSelect "dcache_tb.test0.top.hit0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hit_data_En3" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 2024.952705 -snap {("G1" 10)}
srcActiveTrace "dcache_tb.test0.top.hit0.hit_data_En3" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 2020 -TraceValue 1
srcHBSelect "dcache_tb.test0.top.hit0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data3_Wr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "index\[3:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata\[127:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata\[127:0\]" -win $_nTrace1
srcAction -pos 609 6 4 -win $_nTrace1 -name "wdata\[127:0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "way3_hit" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "block_set\[1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata\[127:96\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hwdata_d\[31:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 1973.462841 -snap {("G1" 15)}
wvSetCursor -win $_nWave2 2060.260041 -snap {("G1" 14)}
srcActiveTrace "dcache_tb.test0.top.hit0.wdata\[127:96\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1380 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "dcache_tb.test0.top.hit0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hit_done" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 2020.539288 -snap {("G1" 14)}
wvSetCursor -win $_nWave2 2057.317763 -snap {("G1" 14)}
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSetCursor -win $_nWave2 2133.816990 -snap {("G1" 13)}
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata\[95 :64\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 604 503
wvResizeWindow -win $_nWave2 57 17 1851 873
