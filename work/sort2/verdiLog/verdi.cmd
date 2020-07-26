verdiWindowResize -win $_Verdi_1 "67" "27" "1853" "1025"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/sort2/sort.fsdb}
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top.quick_sort_core" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomAll -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 639442.831949 -snap {("G1" 2)}
wvZoom -win $_nWave2 0.000000 1370234.639892
wvZoom -win $_nWave2 0.000000 23084.578771
wvZoom -win $_nWave2 444.468424 4347.456772
wvZoom -win $_nWave2 1017.470323 3112.214972
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
schCreateWindow -delim "." -win $_nSchema1 -scope \
           "sort_tb.quick_sort_top.quick_sort_core"
wvSetCursor -win $_nWave2 2934.501979 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 2918.117093 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 2942.064234 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 2916.856717 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 2910.554838 -snap {("G1" 1)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.state\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2890 -TraceValue 01010
nsMsgSwitchTab -tab trace
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
wvSetCursor -win $_nWave2 2894.169952 -snap {("G1" 2)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.next_state\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2890 -TraceValue 01011
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
wvSetCursor -win $_nWave2 2918.117093 -snap {("G1" 2)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.next_state\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2910 -TraceValue 01110
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "QS_GET_POSITION" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_left_valid" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_right_valid" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_left_valid" -win $_nTrace1
wvSetCursor -win $_nWave2 2940.803858 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 2919.377469 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 2934.460979 -snap {("G1" 1)}
srcDeselectAll -win $_nTrace1
debReload
wvSetPosition -win $_nWave2 {("G2" 0)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0\[MW-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "MW" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt1\[MW-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pos\[MW-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 1905.844547 -snap {("G2" 3)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2930.139429 -snap {("G1" 1)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.state\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2910 -TraceValue 01011
nsMsgSwitchTab -tab trace
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 2911.217725 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 2908.694831 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 2906.171938 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 2885.988787 -snap {("G1" 2)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.next_state\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2870 -TraceValue 01010
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
wvSetCursor -win $_nWave2 2904.910491 -snap {("G1" 2)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.next_state\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2890 -TraceValue 01011
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_left_valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_right_valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvZoomAll -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetCursor -win $_nWave2 1942.069237 -snap {("G2" 0)}
wvSelectGroup -win $_nWave2 {G2}
wvZoom -win $_nWave2 1935.897407 2583.939579
wvZoom -win $_nWave2 2089.626939 2383.921320
wvSetCursor -win $_nWave2 2209.774645 -snap {("G1" 2)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.next_state\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2190 -TraceValue 01110
nsMsgSwitchTab -tab trace
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_left_valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_right_valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 2209.581792 -snap {("G3" 1)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.sub_left_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_left_length\[MW-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sub_left_length\[MW-1:0\]" -win $_nTrace1
srcAction -pos 295 6 5 -win $_nTrace1 -name "sub_left_length\[MW-1:0\]" -ctrlKey \
          off
debReload
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 4908.451743 5290.546789
wvZoomAll -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
srcHBSelect "sort_tb.quick_sort_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {6 13 1 1 1 1} -backward
srcHBSelect "sort_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb" -delim "."
srcHBSelect "sort_tb.quick_sort_top" -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {6 7 2 1 1 1}
srcSelect -win $_nTrace1 -range {6 8 2 1 1 1}
srcSelect -win $_nTrace1 -range {6 9 2 1 1 1}
srcSelect -win $_nTrace1 -range {6 10 2 1 1 1}
srcSelect -win $_nTrace1 -range {6 11 2 1 1 1}
srcSelect -win $_nTrace1 -range {6 12 2 1 1 1}
srcSelect -win $_nTrace1 -range {6 13 2 3 1 1}
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSetCursor -win $_nWave2 5169.305092 -snap {("G4" 3)}
wvZoom -win $_nWave2 4926.821697 5569.770092
wvSetCursor -win $_nWave2 5194.365754 -snap {("G4" 7)}
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
srcDeselectAll -win $_nTrace1
wvScrollUp -win $_nWave2 4
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top.quick_sort_core" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "MemWr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "MemWr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {12 13 1 4 1 3}
srcSelect -win $_nTrace1 -range {12 14 1 5 1 2}
srcSelect -win $_nTrace1 -range {12 15 1 5 1 2}
srcSelect -win $_nTrace1 -range {12 16 1 4 1 3}
srcSelect -win $_nTrace1 -range {12 17 1 5 1 2}
srcSelect -win $_nTrace1 -range {12 18 1 5 1 2}
srcSelect -win $_nTrace1 -range {12 19 1 3 1 1}
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 2 3 4 5 6 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 6)}
wvZoomAll -win $_nWave2
wvCollapseGroup -win $_nWave2 "G3"
wvSetPosition -win $_nWave2 {("G2" 1)}
wvExpandBus -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSelectGroup -win $_nWave2 {G2}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvExpandBus -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSelectGroup -win $_nWave2 {G2}
wvCollapseGroup -win $_nWave2 "G2"
wvSelectGroup -win $_nWave2 {G2}
wvScrollDown -win $_nWave2 2
wvSelectGroup -win $_nWave2 {G2}
wvExpandGroup -win $_nWave2 "G2"
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetPosition -win $_nWave2 {("G2" 1)}
wvCollapseBus -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 6
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvCollapseBus -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 1027.732339 2189.683454
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 1820.116239 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 1919.462265 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 1822.500544 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 1910.719814 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 1819.321471 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 1926.615178 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 1828.858689 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 1919.462265 -snap {("G2" 1)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvZoomAll -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvZoom -win $_nWave2 1639.662462 2125.757086
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1062.878543 1842.806484
wvSetCursor -win $_nWave2 1398.428936 -snap {("G4" 2)}
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 964.934104 2169.287948
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetCursor -win $_nWave2 1906.504859 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 2049.841089 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 2049.017318 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 2049.017318 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 2007.828746 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 2208.005206 -snap {("G2" 1)}
srcHBSelect "sort_tb.quick_sort_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "Data" -win $_nTrace1
srcAction -pos 11 9 2 -win $_nTrace1 -name "Data" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "host_rd_mem_d" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_Data\[MN-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "host_rd_mem_d" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_Data\[MN-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 4719.470937 5100.365978
wvSetCursor -win $_nWave2 5096.718556 -snap {("G5" 0)}
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 4701.333078 5227.330992
wvSetCursor -win $_nWave2 5070.107265 -snap {("G5" 2)}
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSetRadix -win $_nWave2 -format UDec
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "host_rd_mem" -win $_nTrace1
srcAction -pos 115 6 6 -win $_nTrace1 -name "host_rd_mem" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "acs_mem" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "acs_mem" -win $_nTrace1
srcAction -pos 101 11 1 -win $_nTrace1 -name "acs_mem" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "host_acs_mem_addr\[MW-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 3)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "host_rd_mem" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSetCursor -win $_nWave2 5054.897886 -snap {("G5" 4)}
wvSetCursor -win $_nWave2 5035.829563 -snap {("G5" 4)}
wvSetCursor -win $_nWave2 5033.311105 -snap {("G5" 4)}
wvSetCursor -win $_nWave2 5050.940310 -snap {("G5" 2)}
wvSetCursor -win $_nWave2 5052.739208 -snap {("G5" 4)}
wvSetCursor -win $_nWave2 5068.929295 -snap {("G5" 2)}
wvSetCursor -win $_nWave2 5035.110003 -snap {("G5" 4)}
wvSetCursor -win $_nWave2 5053.458768 -snap {("G5" 4)}
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 935.913529 3544.137668
wvZoom -win $_nWave2 1203.515185 3017.854411
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 20 1853 544
wvResizeWindow -win $_nWave2 57 17 1853 1025
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 1875.381945 -snap {("G4" 1)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetCursor -win $_nWave2 2009.409740 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 2210.451432 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 3090.263412 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 2407.714456 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 3091.504410 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 3127.286258 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 3268.760042 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 3431.330793 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 3570.322581 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 3433.812789 -snap {("G4" 2)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G5" 0)}
verdiWindowBeDocked -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core.stack_128x16" -win $_nTrace1
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcSetScope -win $_nTrace1 "sort_tb.quick_sort_top.quick_sort_core" -delim "."
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 3427.607799 -snap {("G4" 2)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.MemWrAddr\[7:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 3410 -TraceValue 00000111
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_V\[MN-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_R\[MN-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_L\[MN-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 3567.840584 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 3427.607799 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 3267.519044 -snap {("G4" 5)}
wvSetCursor -win $_nWave2 3327.086953 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 3266.278046 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 3425.125803 -snap {("G4" 0)}
wvSetCursor -win $_nWave2 3267.519044 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 3443.740774 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 3565.358588 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 3428.848797 -snap {("G4" 0)}
wvSetCursor -win $_nWave2 3427.607799 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 3566.599586 -snap {("G4" 0)}
wvSetCursor -win $_nWave2 3569.081583 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 3448.704767 -snap {("G2" 2)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 3432.571791 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 3277.447028 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 3333.291943 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 3427.607799 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 3469.801734 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 3433.812789 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 3466.078740 -snap {("G4" 5)}
wvSetCursor -win $_nWave2 3494.621696 -snap {("G4" 5)}
wvSetCursor -win $_nWave2 3464.837742 -snap {("G4" 5)}
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 3298.543996 3662.156440
wvZoom -win $_nWave2 3383.851156 3525.366533
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 3431.184275 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 3431.377866 -snap {("G1" 1)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.state\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 3430 -TraceValue 00101
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
wvSetCursor -win $_nWave2 3409.308437 -snap {("G1" 2)}
srcActiveTrace "sort_tb.quick_sort_top.quick_sort_core.next_state\[4:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 3390 -TraceValue 01101
srcHBSelect "sort_tb.quick_sort_top.quick_sort_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvScrollDown -win $_nWave2 4
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 4512.607462 5578.667989
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 14164.047948 -snap {("G6" 1)}
wvZoom -win $_nWave2 14099.174446 15785.885499
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSaveSignal -win $_nWave2 "/home/ft/tree/v1.1/work/sort2/sort2.rc"
srcDeselectAll -win $_nTrace1
debExit
