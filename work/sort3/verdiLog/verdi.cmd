verdiWindowResize -win $_Verdi_1 "67" "27" "1853" "1025"
debImport "-sv" "-f" "filelist.vc"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "sort_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb" -delim "."
srcHBSelect "sort_tb.quick_sort_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top" -delim "."
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top.quick_sort_core" -delim "."
srcHBSelect "sort_tb.quick_sort_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top" -delim "."
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/sort3/sort.fsdb}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {8 13 4 1 2 1} -backward
srcDeselectAll -win $_nTrace1
srcSelect -signal "Data" -win $_nTrace1
srcAction -pos 11 9 1 -win $_nTrace1 -name "Data" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "host_rd_mem_d" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_Data\[MN-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 8123.953231 8998.502022
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
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 8354.956191 -snap {("G1" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top.quick_sort_core" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {11 24 2 1 1 1}
wvAddSignal -win $_nWave2 "sort_tb/quick_sort_top/quick_sort_core/MW"
wvAddSignal -win $_nWave2 "sort_tb/quick_sort_top/quick_sort_core/MN"
wvAddSignal -win $_nWave2 "/sort_tb/quick_sort_top/quick_sort_core/clk" \
           "/sort_tb/quick_sort_top/quick_sort_core/reset_n" \
           "/sort_tb/quick_sort_top/quick_sort_core/num\[8:0\]" \
           "/sort_tb/quick_sort_top/quick_sort_core/start" \
           "/sort_tb/quick_sort_top/quick_sort_core/done" \
           "/sort_tb/quick_sort_top/quick_sort_core/MemWr" \
           "/sort_tb/quick_sort_top/quick_sort_core/MemWrAddr\[7:0\]" \
           "/sort_tb/quick_sort_top/quick_sort_core/MemWrData\[31:0\]" \
           "/sort_tb/quick_sort_top/quick_sort_core/MemRd" \
           "/sort_tb/quick_sort_top/quick_sort_core/MemRdAddr\[7:0\]" \
           "/sort_tb/quick_sort_top/quick_sort_core/MemRdData\[31:0\]"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvZoomAll -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 8178.956300 8613.480542
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
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
wvScrollDown -win $_nWave2 1
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
srcDeselectAll -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvZoom -win $_nWave2 600209.644477 606829.603791
wvZoom -win $_nWave2 604423.794268 605383.728200
wvSetCursor -win $_nWave2 604830.986460 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 604853.511985 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 604829.253727 -snap {("G1" 2)}
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetPosition -win $_nWave2 {("G3" 0)}
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvZoom -win $_nWave2 0.000000 23551.543792
wvZoom -win $_nWave2 857.787857 4981.189134
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top.quick_sort_core" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0" -win $_nTrace1
srcAction -pos 66 8 2 -win $_nTrace1 -name "cnt0" -ctrlKey off
srcSelect -signal "cnt1\[MW:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 1924.866143 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1969.657083 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1932.770426 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1980.196128 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1924.866143 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1982.830889 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1914.327098 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1980.196128 -snap {("G3" 2)}
wvZoom -win $_nWave2 1139.707305 1919.596620
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state\[4:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state\[4:0\]" -win $_nTrace1
srcAction -pos 297 7 1 -win $_nTrace1 -name "state\[4:0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "state\[4:0\]" -win $_nTrace1
srcSelect -signal "state_next\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 2)}
schCreateWindow -delim "." -win $_nSchema1 -scope \
           "sort_tb.quick_sort_top.quick_sort_core"
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
verdiDockWidgetSetCurTab -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state_last1\[4:0\]" -win $_nTrace1
srcSelect -signal "state_last2\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
schCreateWindow -delim "." -win $_nSchema1 -scope \
           "sort_tb.quick_sort_top.quick_sort_core"
verdiDockWidgetSetCurTab -dock widgetDock_MTB_SOURCE_TAB_1
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSaveSignal -win $_nWave2 "/home/ft/tree/v1.1/work/sort3/sort3.rc"
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvScrollUp -win $_nWave2 7
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectGroup -win $_nWave2 {G1}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollDown -win $_nWave2 9
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 4 )} 
wvScrollUp -win $_nWave2 9
wvSelectGroup -win $_nWave2 {G1}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSelectGroup -win $_nWave2 {G3}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSelectGroup -win $_nWave2 {G4}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSelectGroup -win $_nWave2 {G1}
wvRestoreSignal -win $_nWave2 "/home/ft/tree/v1.1/work/sort3/sort3.rc" \
           -overWriteAutoAlias on
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 1553.322724 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1572.757666 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 1557.807711 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1535.382779 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1551.827729 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1570.266007 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 1551.329397 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1533.887783 -snap {("G3" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_V\[MN-1:0\]" -win $_nTrace1
srcSelect -signal "reg_R\[MN-1:0\]" -win $_nTrace1
srcSelect -signal "reg_L\[MN-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvChangeDisplayAttr -win $_nWave2 -c ID_PURPLE7 -lw 1 -ls solid
wvSetPreference -paintSpecificColorPattern on
simSetInteractiveFsdbFile inter.fsdb
simSetSimMode on
wvSetCursor -win $_nWave2 1548.339406 -snap {("G3" 9)}
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 1513.954510 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1528.904465 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1514.452842 -snap {("G2" 11)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 1512.459514 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1529.402797 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1547.342742 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1533.887783 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1550.332733 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1529.901128 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1514.951173 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1530.897792 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1552.824393 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1534.884447 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1552.326061 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1533.389451 -snap {("G3" 6)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 1493.522905 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 1508.971192 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 1509.967855 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1529.901128 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 1529.901128 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1515.449505 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 1512.459514 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1530.897792 -snap {("G2" 9)}
wvSetCursor -win $_nWave2 1531.894456 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1528.904465 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 1528.904465 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1528.904465 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 1528.406133 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1528.406133 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 1528.406133 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1529.402797 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 1528.904465 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1549.834402 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1532.891119 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1546.844411 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1532.392788 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1544.851083 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1530.399460 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1546.346079 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1533.887783 -snap {("G3" 6)}
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 1513.456178 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1527.907801 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1516.446169 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1528.406133 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1515.947837 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1527.907801 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1508.472860 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1527.409469 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1513.954510 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1528.406133 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1514.452842 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1527.907801 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1511.961183 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1529.901128 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1514.951173 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1531.894456 -snap {("G2" 11)}
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 1546.346079 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1533.887783 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1545.349415 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1533.389451 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1547.342742 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1532.392788 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1545.349415 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1532.891119 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1549.834402 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1532.392788 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 1547.342742 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1529.901128 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1545.349415 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1533.389451 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1546.844411 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1529.402797 -snap {("G3" 6)}
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 1351.996665 -snap {("G3" 5)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 1489.037918 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1510.466187 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1491.031246 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1509.469523 -snap {("G3" 6)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvScrollUp -win $_nWave2 4
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvPrevView -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1366.697454 2136.121800
wvSetCursor -win $_nWave2 1770.829603 -snap {("G2" 8)}
wvSetCursor -win $_nWave2 1791.970336 -snap {("G2" 8)}
wvSetCursor -win $_nWave2 1806.719684 -snap {("G2" 8)}
wvSetCursor -win $_nWave2 1792.461980 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1774.271117 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1791.970336 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1812.619423 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1829.826997 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1811.144489 -snap {("G3" 1)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 1772.304538 -snap {("G3" 9)}
wvSetCursor -win $_nWave2 1809.669554 -snap {("G3" 8)}
wvZoom -win $_nWave2 1685.283381 1953.229879
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 1790.236227 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1772.087774 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1790.921074 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1772.772621 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1790.578650 -snap {("G3" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetCursor -win $_nWave2 1770.718079 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1771.231715 -snap {("G3" 9)}
wvSetCursor -win $_nWave2 1810.610433 -snap {("G3" 8)}
wvSetCursor -win $_nWave2 1810.096798 -snap {("G3" 8)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.cnt0\[8:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 1630 -TraceValue 000000001
nsMsgSwitchTab -tab trace
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0_inc" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0_inc" -win $_nTrace1
srcAction -pos 329 9 3 -win $_nTrace1 -name "cnt0_inc" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "left_move" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "right_move" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "left_move" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "swap_right_gap2" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "swap_left_gap2" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "left_move" -win $_nTrace1
srcSelect -signal "right_move" -win $_nTrace1
srcSelect -signal "swap_right_gap2" -win $_nTrace1
srcSelect -signal "swap_left_gap2" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 3
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "swap_right_gap2" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "swap_right_gap2" -win $_nTrace1
srcAction -pos 297 10 7 -win $_nTrace1 -name "swap_right_gap2" -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetCursor -win $_nWave2 1789.893803 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1790.749862 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 1791.605921 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1791.092286 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 1791.092286 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1811.808916 -snap {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvChangeDisplayAttr -win $_nWave2 -c ID_YELLOW5 -lw 1 -ls solid
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 1810.268010 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 1848.961881 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 1831.969108 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1849.946349 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1870.320555 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 1889.667491 -snap {("G2" 11)}
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetPosition -win $_nWave2 {("G3" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "right_is_small" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "right_compare" -win $_nTrace1
srcSelect -signal "left_compare" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 1909.870486 -snap {("G3" 4)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 1850.973620 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 1849.946349 -snap {("G3" 14)}
wvSetCursor -win $_nWave2 1850.288773 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 1850.117561 -snap {("G3" 14)}
wvSetCursor -win $_nWave2 1850.117561 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 1850.288773 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 1850.973620 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 1850.631196 -snap {("G3" 14)}
wvSetCursor -win $_nWave2 1851.316043 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 1850.288773 -snap {("G3" 14)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "right_is_small" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ready_to_meet" -win $_nTrace1
srcSelect -signal "swap_exit_meet" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "meet_pending" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "swap_left_gap2" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "swap_right_gap2" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "left_compare" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "left_compare" -win $_nTrace1
srcAction -pos 345 7 6 -win $_nTrace1 -name "left_compare" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "right_is_small" -win $_nTrace1
srcSelect -signal "right_is_big" -win $_nTrace1
srcSelect -signal "left_is_small" -win $_nTrace1
srcSelect -signal "left_is_big" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSetCursor -win $_nWave2 1910.041698 -snap {("G3" 10)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSelectSignal -win $_nWave2 {( "G3" 14 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 14 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "right_is_big" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "left_is_small" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "right_is_big" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "left_is_small" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "right_is_big" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "left_is_small" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "right_is_big" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "left_is_small" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "right_is_small" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ready_to_meet" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "right_is_small" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ready_to_meet" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "ready_to_meet" -win $_nTrace1
srcAction -pos 170 10 6 -win $_nTrace1 -name "ready_to_meet" -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0\[MW:0\]" -win $_nTrace1
srcSelect -signal "cnt1\[MW:0\]" -win $_nTrace1
wvScrollDown -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G3" 20 )} 
wvSelectSignal -win $_nWave2 {( "G3" 20 21 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0\[MW:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0\[MW:0\]" -win $_nTrace1
srcSelect -signal "cnt1\[MW:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G3" 16)}
wvSetPosition -win $_nWave2 {("G3" 17)}
wvSetPosition -win $_nWave2 {("G3" 18)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 20)}
wvSetPosition -win $_nWave2 {("G3" 21)}
wvAddSignal -win $_nWave2 "/sort_tb/quick_sort_top/quick_sort_core/cnt0\[8:0\]" \
           "/sort_tb/quick_sort_top/quick_sort_core/cnt1\[8:0\]"
wvSetPosition -win $_nWave2 {("G3" 21)}
wvSetPosition -win $_nWave2 {("G3" 23)}
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 22 )} 
wvSelectSignal -win $_nWave2 {( "G3" 22 )} 
wvSelectSignal -win $_nWave2 {( "G3" 22 23 )} 
wvVerilogExpression -win $_nWave2 "logical_expression_1\[8:0\]" \
           "\"/sort_tb/quick_sort_top/quick_sort_core/cnt0\[8:0\]\"-\"/sort_tb/quick_sort_top/quick_sort_core/cnt1\[8:0\]\""
wvSetPosition -win $_nWave2 {("G3" 23)}
wvSetPosition -win $_nWave2 {("G3" 23)}
wvSetPosition -win $_nWave2 {("G3" 24)}
wvSelectSignal -win $_nWave2 {( "G3" 20 )} 
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 1938.548466 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1954.299953 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1933.069688 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1931.015146 -snap {("G3" 1)}
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
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 10 11 12 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 20)}
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 18 )} 
wvSelectSignal -win $_nWave2 {( "G3" 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G3" 18 19 20 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 17)}
wvSelectSignal -win $_nWave2 {( "G3" 16 )} 
wvSelectSignal -win $_nWave2 {( "G3" 17 )} 
wvSelectSignal -win $_nWave2 {( "G3" 16 )} 
wvSelectSignal -win $_nWave2 {( "G3" 17 )} 
wvSetCursor -win $_nWave2 1871.433432 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 1887.869767 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 1910.469727 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1935.809077 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1950.190869 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1973.475677 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1990.596859 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1976.899913 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1988.542317 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1976.215066 -snap {("G3" 1)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetCursor -win $_nWave2 1996.760484 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 1991.966554 -snap {("G3" 17)}
wvSetCursor -win $_nWave2 2014.566514 -snap {("G2" 11)}
wvSetCursor -win $_nWave2 1996.075637 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 2013.881666 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 2259.056992 -snap {("G2" 7)}
wvSetCursor -win $_nWave2 2278.917564 -snap {("G2" 7)}
wvSetCursor -win $_nWave2 2297.922076 -snap {("G3" 16)}
wvSetCursor -win $_nWave2 2328.740203 -snap {("G3" 16)}
wvSetCursor -win $_nWave2 2293.128145 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 2309.564479 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 2330.940048 -snap {("G3" 16)}
wvSetCursor -win $_nWave2 2411.780135 -snap {("G3" 17)}
wvSetCursor -win $_nWave2 2533.725351 -snap {("G3" 16)}
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
wvZoom -win $_nWave2 3903.649332 4316.088473
wvSetCursor -win $_nWave2 4192.056874 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 4211.411256 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 4231.583428 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 4252.845988 -snap {("G1" 2)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvUnknownSaveResult -win $_nWave2 -clear
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvScrollDown -win $_nWave2 4
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "debug_cnt\[63:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomAll -win $_nWave2
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 9616.031097 10659.246279
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvCreateWindow
wvSetPosition -win $_nWave5 {("G1" 0)}
wvOpenFile -win $_nWave5 {/home/ft/tree/v1.1/work/sort3/sort1.fsdb}
wvSetPrimaryWindow -win $_nWave5
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
srcDeselectAll -win $_nTrace1
debReload
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSaveSignal -win $_nWave2 "/home/ft/tree/v1.1/work/sort3/sort1.rc"
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
wvRestoreSignal -win $_nWave5 "/home/ft/tree/v1.1/work/sort3/sort1.rc" \
           "/home/ft/tree/v1.1/work/sort3/sort3.rc" -overWriteAutoAlias on
wvUnknownSaveResult -win $_nWave5 -clear
wvSelectSignal -win $_nWave5 {( "G2" 18 )} 
wvScrollDown -win $_nWave5 5
wvSelectSignal -win $_nWave5 {( "G4" 1 )} 
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvZoom -win $_nWave5 14706.539655 15676.201610
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvScrollDown -win $_nWave5 12
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvSetCursor -win $_nWave5 7585.584671 -snap {("G4" 0)}
wvSetCursor -win $_nWave5 10736.986026 -snap {("G4" 1)}
wvBusWaveform -win $_nWave5 -analog
wvSetPosition -win $_nWave5 {("G2" 14)}
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvSetCursor -win $_nWave5 10110.746013 -snap {("G4" 1)}
wvSetCursor -win $_nWave5 10999.602805 -snap {("G4" 1)}
wvSetCursor -win $_nWave5 10110.746013 -snap {("G4" 1)}
wvSetCursor -win $_nWave5 10181.450530 -snap {("G4" 1)}
wvSelectSignal -win $_nWave5 {( "G4" 1 )} 
srcDeselectAll -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top.quick_sort_core" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "debug_cnt\[63:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvZoom -win $_nWave5 9999.638914 10474.369246
wvZoom -win $_nWave5 10139.479606 10212.585044
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G4" 1 )} 
wvSetCursor -win $_nWave5 10169.025414 -snap {("G2" 15)}
wvSetCursor -win $_nWave5 10169.025414 -snap {("G2" 15)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.debug_cnt\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 10150 -TraceValue \
           0000000000000000000000000000000000000000000000000000000110101011
nsMsgSwitchTab -tab trace
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
wvSetCursor -win $_nWave5 10189.392168 -snap {("G2" 18)}
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G3" 6 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
wvZoomAll -win $_nWave5
wvSelectGroup -win $_nWave5 {G4}
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "debug_cnt\[63:0\]" -win $_nTrace1
wvSetCursor -win $_nWave5 14969.156435 -snap {("G2" 15)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core.stack_128x16" -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top" -win $_nTrace1
srcHBSelect "sort_tb" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSaveSignal -win $_nWave2 "/home/ft/tree/v1.1/work/sort3/sort1.rc"
wvZoomAll -win $_nWave2
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
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
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
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
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
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetRadix -win $_nWave2 -format UDec
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
wvSelectSignal -win $_nWave5 {( "G4" 1 )} 
wvSelectSignal -win $_nWave5 {( "G4" 1 )} 
wvSetRadix -win $_nWave5 -format UDec
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
debExit
