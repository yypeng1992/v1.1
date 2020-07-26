verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "833"
debImport "-sv" "-f" "filelist.vc" "+define+SIM_SHARE"
srcHBSelect "share_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb" -delim "."
srcHBSelect "led_tb" -win $_nTrace1
srcHBSelect "led_tb" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "led_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "led_tb" -delim "."
srcHBSelect "share_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb" -delim "."
srcHBSelect "share_tb.stack_128x8" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb.stack_128x8" -delim "."
srcHBSelect "share_tb.stack_128x8.rf1_MxN" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb.stack_128x8.rf1_MxN" -delim "."
srcHBSelect "share_tb.stack_128x8" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb.stack_128x8" -delim "."
srcHBSelect "share_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb" -delim "."
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/share/share.fsdb}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {3 38 1 1 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcSelect -win $_nTrace1 -range {21 21 1 2 1 2} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "share_tb.stack_128x8" -win $_nTrace1
srcHBSelect "share_tb.stack_128x8" -win $_nTrace1
srcHBSelect "share_tb.stack_128x8" -win $_nTrace1
srcHBSelect "share_tb.stack_128x8" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb.stack_128x8" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {5 6 3 2 1 2}
srcSelect -win $_nTrace1 -range {5 7 3 2 1 2}
srcSelect -win $_nTrace1 -range {5 8 3 2 1 2}
srcSelect -win $_nTrace1 -range {5 9 3 3 1 1}
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pop" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {5 6 3 2 1 3}
srcSelect -win $_nTrace1 -range {5 7 3 2 1 3}
srcSelect -win $_nTrace1 -range {5 8 3 2 1 3}
srcSelect -win $_nTrace1 -range {5 9 3 3 1 1}
srcSelect -win $_nTrace1 -range {5 8 3 2 1 3}
srcSelect -win $_nTrace1 -range {5 8 3 12 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {5 10 1 1 1 1} -backward
srcSelect -win $_nTrace1 -range {5 5 1 3 1 1}
srcTBAddBrkPnt -win $_nTrace1 -line 5 -file /home/ft/tree/v1.1/share/stack_MxN.v
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {5 11 2 1 1 1}
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "share_tb" -win $_nTrace1
srcHBSelect "share_tb" -win $_nTrace1
srcHBSelect "share_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "push" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "rf1_128x8" -win $_nTrace1
srcHBSelect "rf1_128x8" -win $_nTrace1
srcHBSelect "rf1_128x8" -win $_nTrace1
srcHBSelect "rf1_128x8" -win $_nTrace1
srcSetScope -win $_nTrace1 "rf1_128x8" -delim "."
srcHBSelect "share_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb" -delim "."
srcHBSelect "share_tb.stack_128x8" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb.stack_128x8" -delim "."
srcHBSelect "share_tb.stack_128x8.rf1_MxN" -win $_nTrace1
srcHBSelect "share_tb.stack_128x8.rf1_MxN" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb.stack_128x8.rf1_MxN" -delim "."
srcHBSelect "share_tb.stack_128x8.rf1_MxN" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb.stack_128x8.rf1_MxN" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {6 8 2 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb"
wvGetSignalSetScope -win $_nWave2 "/tb/top0"
wvGetSignalClose -win $_nWave2
srcDeselectAll -win $_nTrace1
srcHBSelect "tb" -win $_nTrace1
srcHBSelect "tb.top0" -win $_nTrace1
srcHBSelect "tb.top0" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb.top0" -delim "."
srcHBSelect "tb.top0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sda" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcHBSelect "tb" -win $_nTrace1
srcHBSelect "share_tb" -win $_nTrace1
srcHBSelect "share_tb" -win $_nTrace1
srcHBSelect "share_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "share_tb.stack_128x8" -win $_nTrace1
srcHBSelect "share_tb.stack_128x8" -win $_nTrace1
srcSetScope -win $_nTrace1 "share_tb.stack_128x8" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "push" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "push_data" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "full" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pop" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pop_data" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "empty" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pr\[WIDTH:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Wr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Wr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Wr" -win $_nTrace1
srcAction -pos 57 4 1 -win $_nTrace1 -name "Wr" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "conflict" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "conflict" -win $_nTrace1
srcAction -pos 47 7 4 -win $_nTrace1 -name "conflict" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "full" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "x_push" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "x_pop" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "conflict" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "En" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Wr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 0.000000 9623.264042
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvZoom -win $_nWave2 684.208372 1501.457260
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G1" 17 )} 
wvSelectSignal -win $_nWave2 {( "G1" 17 )} 
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
verdiWindowResize -win $_Verdi_1 "67" "27" "1853" "1025"
verdiWindowResize -win $_Verdi_1 "1" "33" "1919" "1019"
verdiWindowResize -win $_Verdi_1 "67" "27" "1853" "1025"
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pr_minus_one\[WIDTH:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Addr\[WIDTH-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Data\[N-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pop_data\[N-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Data\[N-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 17 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "WrData\[N-1:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 3612.201338 -snap {("G1" 16)}
wvSetCursor -win $_nWave2 3628.341648 -snap {("G1" 20)}
wvSetCursor -win $_nWave2 3655.242164 -snap {("G1" 20)}
wvSetCursor -win $_nWave2 3679.452629 -snap {("G1" 20)}
wvSetCursor -win $_nWave2 3696.130949 -snap {("G1" 20)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 5956.850345 -snap {("G1" 8)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 19 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "empty" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
