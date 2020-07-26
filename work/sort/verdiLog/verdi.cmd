verdiWindowResize -win $_Verdi_1 "67" "27" "1853" "1025"
debImport "-sv" "-f" "filelist.vc"
srcHBSelect "sort_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb" -delim "."
srcHBSelect "sort_tb.quick_sort_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top" -delim "."
wvCreateWindow
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top.quick_sort_core" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcSelect -signal "num" -win $_nTrace1
srcSelect -signal "start" -win $_nTrace1
srcSelect -signal "done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {6 19 2 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/sort/sort.fsdb}
srcAddSelectedToWave -win $_nTrace1
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1019587.239651 5646944.711913
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
srcDeselectAll -win $_nTrace1
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 0.000000 1600941.069748
wvZoom -win $_nWave2 0.000000 226636.130753
wvZoom -win $_nWave2 0.000000 7178.519979
wvSetPosition -win $_nWave2 {("G2" 0)}
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 0.000000 1853721.238655
wvZoom -win $_nWave2 0.000000 63508.226017
wvZoom -win $_nWave2 0.000000 4269.460573
wvZoomOut -win $_nWave2
schCreateWindow -delim "." -win $_nSchema1 -scope \
           "sort_tb.quick_sort_top.quick_sort_core"
verdiDockWidgetSetCurTab -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core.stack_128x16" -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top.quick_sort_core" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top.quick_sort_core" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "start" -win $_nTrace1
srcTraceLoad "sort_tb.quick_sort_top.quick_sort_core.start" -win $_nTrace1
nsMsgSwitchTab -tab trace
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state_next\[4:0\]" -win $_nTrace1
srcSelect -signal "state\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 899.705331 1898.764624
wvZoom -win $_nWave2 1171.588952 1461.555095
wvSetPosition -win $_nWave2 {("G3" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0_near_cnt1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0_near_cnt1" -win $_nTrace1
srcAction -pos 153 6 6 -win $_nTrace1 -name "cnt0_near_cnt1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0_meet_cnt1" -win $_nTrace1
srcTraceLoad "sort_tb.quick_sort_top.quick_sort_core.cnt0_meet_cnt1" -win \
           $_nTrace1
srcNextTraced
srcNextTraced
srcNextTraced
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0_near_cnt1" -win $_nTrace1
srcTraceLoad "sort_tb.quick_sort_top.quick_sort_core.cnt0_near_cnt1" -win \
           $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcNextTraced
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcNextTraced
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcNextTraced
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0_near_cnt1" -win $_nTrace1
srcAction -pos 195 5 7 -win $_nTrace1 -name "cnt0_near_cnt1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0_near_cnt1" -win $_nTrace1
srcAction -pos 336 2 9 -win $_nTrace1 -name "cnt0_near_cnt1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt1_minus_cnt0\[MW-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt1_minus_cnt0\[MW-1:0\]" -win $_nTrace1
srcAction -pos 339 7 7 -win $_nTrace1 -name "cnt1_minus_cnt0\[MW-1:0\]" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt1\[MW-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0\[MW-1:0\]" -win $_nTrace1
srcSelect -signal "cnt1\[MW-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 1155.375590 1486.765468
wvSetCursor -win $_nWave2 1290.759173 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 1311.537982 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 1332.959435 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 1355.451961 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 1371.732265 -snap {("G2" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvUndo -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvChangeDisplayAttr -win $_nWave2 -c ID_YELLOW5 -lw 1 -ls solid
wvSetCursor -win $_nWave2 1331.459934 -snap {("G2" 1)}
wvSetMarker -win $_nWave2 1390.000000
wvSetMarker -win $_nWave2 1450.000000
wvSetCursor -win $_nWave2 1389.297857 -snap {("G2" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2230.818215 -snap {("G3" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "get_position" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "position\[MW-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "get_position" -win $_nTrace1
wvSetCursor -win $_nWave2 2232.531931 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2249.669094 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2225.677066 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2242.814229 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2222.249634 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2247.955377 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2223.963350 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2244.527945 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2223.963350 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2254.810242 -snap {("G2" 3)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "position\[MW-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 4 )} 
wvZoom -win $_nWave2 1975.474496 2523.863692
wvSetCursor -win $_nWave2 2253.391192 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 2231.767572 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 2249.491851 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 2231.767572 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 2250.555308 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 2230.704115 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 2251.264279 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 2232.122057 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 2253.036707 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 2235.666913 -snap {("G2" 1)}
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvZoom -win $_nWave2 0.000000 7055.960543
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvZoom -win $_nWave2 0.000000 9071.949270
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvZoom -win $_nWave2 791.669781 5993.233454
wvSetCursor -win $_nWave2 2688.038179 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 2667.864047 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 2681.313468 -snap {("G3" 2)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.cnt1\[7:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2670 -TraceValue 11111111
nsMsgSwitchTab -tab trace
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetCursor -win $_nWave2 2203.859014 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2247.569633 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2210.583724 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2261.019054 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2220.670790 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2257.656699 -snap {("G2" 3)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
srcTraceConnectivity "sort_tb.quick_sort_top.quick_sort_core.get_position" -win \
           $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state\[4:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_left_valid" -win $_nTrace1
srcSelect -signal "sub_right_valid" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_left_depth\[MW-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_left_cnt0\[MW-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "C0\[MW-1:0\]" -win $_nTrace1
srcSelect -signal "C1\[MW-1:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvAddSignal -win $_nWave2 "/sort_tb/quick_sort_top/quick_sort_core/C0\[7:0\]" \
           "/sort_tb/quick_sort_top/quick_sort_core/C1\[7:0\]"
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_left_cnt0\[MW-1:0\]" -win $_nTrace1
srcSelect -signal "sub_left_cnt1\[MW-1:0\]" -win $_nTrace1
srcSelect -signal "sub_right_cnt0\[MW-1:0\]" -win $_nTrace1
srcSelect -signal "sub_right_cnt1\[MW-1:0\]" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 4 )} 
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetPosition -win $_nWave2 {("G3" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_left_valid" -win $_nTrace1
srcSelect -signal "sub_right_valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "push" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvAddSignal -win $_nWave2 "/BLANK"
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_right_cnt1\[MW-1:0\]" -win $_nTrace1
srcSelect -signal "sub_right_cnt0\[MW-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_right_cnt1\[MW-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_right_cnt0\[MW-1:0\]" -win $_nTrace1
srcAction -pos 387 10 8 -win $_nTrace1 -name "sub_right_cnt0\[MW-1:0\]" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_left_cnt0\[MW-1:0\]" -win $_nTrace1
srcSelect -signal "sub_left_cnt1\[MW-1:0\]" -win $_nTrace1
srcSelect -signal "sub_right_cnt1\[MW-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_left_cnt0\[MW-1:0\]" -win $_nTrace1
srcSelect -signal "sub_left_cnt1\[MW-1:0\]" -win $_nTrace1
srcSelect -signal "sub_right_cnt0\[MW-1:0\]" -win $_nTrace1
srcSelect -signal "sub_right_cnt1\[MW-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
srcBackwardHistory -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "push" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "push_data\[SN-1:0\]" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 8)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "push_data\[SN-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 1652.432742 2859.518300
wvSetCursor -win $_nWave2 2250.903733 -snap {("G4" 8)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pop" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "stack_cnt0\[MW-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "stack_cnt1\[MW-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "stack_cnt0\[MW-1:0\]" -win $_nTrace1
srcSelect -signal "stack_cnt1\[MW-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSetCursor -win $_nWave2 2431.927553 -snap {("G4" 11)}
wvSetCursor -win $_nWave2 2441.290854 -snap {("G4" 11)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.stack_cnt0\[7:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2430 -TraceValue 00000011
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pop_data\[0  +: MW\]" -win $_nTrace1
srcAction -pos 390 6 3 -win $_nTrace1 -name "pop_data\[0  +: MW\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "En" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "En" -win $_nTrace1
srcSelect -signal "Wr" -win $_nTrace1
srcSelect -signal "Addr\[WIDTH-1:0\]" -win $_nTrace1
srcSelect -signal "WrData\[N-1:0\]" -win $_nTrace1
srcSelect -signal "Data\[N-1:0\]" -win $_nTrace1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvScrollDown -win $_nWave2 1
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "valid" -win $_nTrace1
srcSelect -signal "pop_data\[N-1:0\]" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvSetPosition -win $_nWave2 {("G6" 0)}
srcAddSelectedToWave -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 2412.420676 -snap {("G6" 1)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 2220.473005 2574.717894
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G6" 2)}
srcTraceConnectivity "sort_tb.quick_sort_top.quick_sort_core.pop" -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core.stack_128x16" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pop" -win $_nTrace1
srcAction -pos 48 11 2 -win $_nTrace1 -name "pop" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "pop_data\[SN-1:0\]" -win $_nTrace1
srcSelect -signal "valid" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "empty" -win $_nTrace1
srcSelect -signal "pop_data\[SN-1:0\]" -win $_nTrace1
srcSelect -signal "valid" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvAddSignal -win $_nWave2 "/sort_tb/quick_sort_top/quick_sort_core/empty" \
           "/sort_tb/quick_sort_top/quick_sort_core/pop_data\[15:0\]" \
           "/sort_tb/quick_sort_top/quick_sort_core/valid"
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomAll -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSetPosition -win $_nWave2 {("G7" 0)}
srcHBSelect "sort_tb.quick_sort_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "Data" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Data" -win $_nTrace1
srcAction -pos 11 9 2 -win $_nTrace1 -name "Data" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "host_rd_mem_d" -win $_nTrace1
srcSelect -signal "mem_Data\[MN-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 5019.373562 5499.644557
wvSetCursor -win $_nWave2 5173.668768 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 5234.517582 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 5253.455223 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 5273.013771 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 5300.333646 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 5297.850021 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 5317.098115 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 5337.588022 -snap {("G7" 2)}
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvSetRadix -win $_nWave2 -format UDec
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 1946.361403 -snap {("G7" 2)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 2971.902476 -snap {("G7" 2)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvSelectSignal -win $_nWave2 {( "G7" 1 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvUndo -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 5051.873103 5488.811377
wvSetCursor -win $_nWave2 5353.803946 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 5352.674177 -snap {("G7" 2)}
srcActiveTrace "sort_tb.quick_sort_top.mem_Data\[31:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 5350 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "sort_tb.quick_sort_top.mem_256x32" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSetOptions -win $_nTrace1 -annotate on
schSetOptions -win $_nSchema1 -annotate on
srcDeselectAll -win $_nTrace1
srcSelect -signal "RdData\[N-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Data\[N-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "RdData\[N-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "RdData\[N-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "RdData\[N-1:0\]" -win $_nTrace1
srcAction -pos 32 6 3 -win $_nTrace1 -name "RdData\[N-1:0\]" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.mem_256x32" -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.mem_256x32" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.mem_256x32" -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top" -win $_nTrace1
wvScrollDown -win $_nWave2 0
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 2235.246212 -snap {("G4" 8)}
wvZoom -win $_nWave2 2083.581687 2401.354977
wvZoomAll -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1643.032353 5394.923814
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 4 )} 
wvChangeDisplayAttr -win $_nWave2 -c ID_PURPLE7 -lw 1 -ls solid
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 6 )} 
wvChangeDisplayAttr -win $_nWave2 -c ID_YELLOW7 -lw 1 -ls solid
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetCursor -win $_nWave2 2300.280308 -snap {("G3" 6)}
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 3008.458916 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 3110.320222 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 3105.469684 -snap {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 6)}
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top.quick_sort_core" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_V\[MN-1:0\]" -win $_nTrace1
srcSelect -signal "reg_R\[MN-1:0\]" -win $_nTrace1
srcSelect -toggle -signal "reg_R\[MN-1:0\]" -win $_nTrace1
srcSelect -signal "reg_R\[MN-1:0\]" -win $_nTrace1
srcSelect -signal "reg_L\[MN-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 6)}
wvAddSignal -win $_nWave2 "/BLANK"
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSetCursor -win $_nWave2 2508.853459 -snap {("G3" 10)}
wvSetCursor -win $_nWave2 2984.206224 -snap {("G3" 10)}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSetCursor -win $_nWave2 3110.320222 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 3146.699260 -snap {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetCursor -win $_nWave2 3146.699260 -snap {("G3" 1)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 2795.035226 4182.289211
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSetCursor -win $_nWave2 3251.474966 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3277.480374 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3251.474966 -snap {("G1" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetCursor -win $_nWave2 3273.893421 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3272.996683 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3290.034708 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3277.480374 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3255.061919 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3275.686897 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3255.958657 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3275.686897 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3290.034708 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3264.926039 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3433.512819 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3433.512819 -snap {("G1" 8)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.MemWrData\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 3430 -TraceValue \
           00000000000000000000000000000000
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "swap_right_gap2" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_L\[MN-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvZoom -win $_nWave2 4939.930239 5503.255617
wvZoomAll -win $_nWave2
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
wvZoom -win $_nWave2 1830.807479 5326.313672
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetCursor -win $_nWave2 3161.675706 -snap {("G3" 2)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 2876.973844 4103.903297
wvSetCursor -win $_nWave2 3257.663009 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3279.869876 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3292.559515 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3410.731777 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3432.938645 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3410.731777 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3435.317952 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3413.904186 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3433.731747 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3413.904186 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3433.731747 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3413.904186 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3431.352440 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3413.111084 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3433.731747 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3413.111084 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3430.559337 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3413.904186 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3440.076566 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3412.317982 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3430.559337 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3449.593796 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3516.214399 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3535.248857 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3551.110906 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3534.455755 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3546.352291 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3533.662653 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3546.352291 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3613.765998 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3631.214251 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3647.869402 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3613.765998 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3635.179763 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3648.662504 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3713.696903 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3735.110669 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3704.179674 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3731.145157 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3709.731391 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3727.179644 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3716.869313 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3733.524464 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3711.317596 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3728.765849 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3708.938289 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3728.765849 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3715.283108 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3731.145157 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3714.490006 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3733.524464 -snap {("G1" 8)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetCursor -win $_nWave2 3809.662297 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3834.248472 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3812.041604 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3832.662267 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3848.524316 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 3908.800100 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 3929.420763 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 3908.800100 -snap {("G3" 3)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 3832.265716 4308.127171
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetCursor -win $_nWave2 4211.539907 -snap {("G3" 3)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 4228.765661 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 4210.924702 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 4171.243947 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 4194.314153 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 3898.400307 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 3913.165239 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 4210.001894 -snap {("G3" 3)}
wvZoomOut -win $_nWave2
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
wvSetCursor -win $_nWave2 4390.872311 -snap {("G3" 3)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSetCursor -win $_nWave2 4409.943682 -snap {("G3" 3)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 4669.560403 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 4453.869354 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 4436.028395 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 4452.023738 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 4454.484560 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 4669.191280 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 4690.723472 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 4668.576074 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 4687.032239 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 4670.421691 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 4692.569089 -snap {("G3" 3)}
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
wvSetCursor -win $_nWave2 4667.960869 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 4688.262650 -snap {("G3" 3)}
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
wvScrollDown -win $_nWave2 1
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
wvSetCursor -win $_nWave2 4711.025254 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 4868.763945 -snap {("G3" 3)}
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
wvSetCursor -win $_nWave2 4913.673946 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 5011.953025 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 5047.019739 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 5036.561245 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 5048.865355 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 5066.091109 -snap {("G3" 3)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 4995.342476 5044.558917
wvPrevView -win $_nWave2
wvZoom -win $_nWave2 4911.674528 5293.717145
wvSetCursor -win $_nWave2 5071.949679 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 5052.933983 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 5070.467936 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 5070.467936 -snap {("G2" 2)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.state_next\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 5050 -TraceValue 10010
nsMsgSwitchTab -tab trace
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "empty" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvAddSignal -win $_nWave2 "/sort_tb/quick_sort_top/quick_sort_core/empty"
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvScrollDown -win $_nWave2 0
wvZoomAll -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomAll -win $_nWave2
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
wvZoom -win $_nWave2 5952.692560 6446.989955
wvSetCursor -win $_nWave2 6313.111087 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 6334.199405 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 6354.329163 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 6370.305162 -snap {("G7" 2)}
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 14849.313794 15743.974667
wvSetCursor -win $_nWave2 15415.488969 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 15427.055366 -snap {("G7" 2)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 14953.989694 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14975.387530 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14953.989694 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14974.809211 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14958.037934 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14974.230891 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14956.302974 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14977.122490 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14952.833055 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14971.917611 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14957.459614 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14973.074251 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14953.411375 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14977.122490 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14954.568014 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14970.760971 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14955.724654 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14971.339291 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14956.881294 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14971.917611 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14955.724654 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14971.917611 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14952.254735 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14974.230891 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14953.411375 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14967.869372 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14955.146334 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 14970.182651 -snap {("G7" 2)}
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
wvSaveSignal -win $_nWave2 "/home/ft/tree/v1.1/work/sort/sort.rc"
debExit
