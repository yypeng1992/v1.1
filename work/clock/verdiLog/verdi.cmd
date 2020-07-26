verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "833"
debImport "-sv" "-f" "filelist.vc"
srcDeselectAll -win $_nTrace1
srcHBSelect "clock_tb.top0" -win $_nTrace1
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/clock/clock.fsdb}
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.second_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_en" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 0.000000 5014446.539759
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "time_clock_key" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "clock_tb.top0.time_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.time_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "clock_tb.top0.min_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.min_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_reg" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_en" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 5)}
srcHBSelect "clock_tb.top0.hour_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.hour_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hour_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 11188861.435703 -snap {("G1" 6)}
srcHBSelect "clock_tb.top0.clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_time" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_time" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hour_time" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "led" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.seg0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hour_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 0.000000 11406355.502488
wvSetCursor -win $_nWave2 7496557.895377
srcDeselectAll -win $_nTrace1
srcHBSelect "clock_tb.top0.mode0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.mode0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_select" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_select" -win $_nTrace1
srcAction -pos 4 9 4 -win $_nTrace1 -name "mode_select" -ctrlKey off
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.add0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_select" -win $_nTrace1
srcAction -pos 4 9 5 -win $_nTrace1 -name "add_select" -ctrlKey off
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "clock_tb.top0.time_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.time_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "time_clock_key" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.seg0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "seg_out" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 30920.843230 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 11000000
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sel\[5:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoom -win $_nWave2 8589.123119 872654.908925
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 18 )} 
wvSetCursor -win $_nWave2 449991.404061 -snap {("G1" 18)}
srcActiveTrace "clock_tb.top0.seg0.sel\[5:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 111111
srcHBSelect "clock_tb" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 446607.496519 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 38000 -TraceValue 11111111
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 466387.315712 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 450000 -TraceValue 11111001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 449730.625865 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 38000 -TraceValue 11111111
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 467428.358828 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 450000 -TraceValue 11111001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 485126.091790 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 470000 -TraceValue 10100100
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 510111.126560 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 490000 -TraceValue 10110000
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 528849.902638 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 510000 -TraceValue 10011001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 651692.990258 -snap {("G1" 17)}
wvSetCursor -win $_nWave2 847409.095959 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 830000 -TraceValue 11000000
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 1028550.598044 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 850000 -TraceValue 10011001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 1230512.962437 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1030000 -TraceValue 10010010
srcHBSelect "clock_tb" -win $_nTrace1
wvSetCursor -win $_nWave2 1026468.511813 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 850000 -TraceValue 10011001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 7
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
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
wvScrollDown -win $_nWave2 1
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
wvZoom -win $_nWave2 121709.867470 47345138.445783
wvZoom -win $_nWave2 121709.867470 17474897.477573
wvZoom -win $_nWave2 184432.232326 6299862.805766
wvZoom -win $_nWave2 221272.175539 2612184.490095
wvZoom -win $_nWave2 316332.544672 1768163.636884
wvSetCursor -win $_nWave2 1027379.941038 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 850000 -TraceValue 10011001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 2869281.314652 -snap {("G1" 18)}
srcActiveTrace "clock_tb.top0.seg0.sel\[5:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 2450000 -TraceValue 011111
srcHBSelect "clock_tb" -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 2854684.749988 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1250000 -TraceValue 11000000
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 2777720.210160 4107107.716282
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 2869816.332572 -snap {("G1" 19)}
srcActiveTrace "clock_tb.top0.seg0.sec_reg\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 2850000 -TraceValue 10001101
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvExpandBus -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 27)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvCollapseBus -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvZoom -win $_nWave2 615041.930543 27676886.874443
wvZoom -win $_nWave2 615041.930543 21677634.501337
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_en" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 243419.734940 28480108.987952
wvZoom -win $_nWave2 18103976.190158 21471966.835999
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "time_clock_key\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg_temp" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "SEC_IS_MAX" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_count" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_count\[29:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg_temp\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 22318.010304 1596752.191733
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_key\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_key\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "clock_tb.top0.mode0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.mode0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_select" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.add0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_select" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "clock_tb.top0.debounce_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.debounce_1" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "key_in" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "key" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.second_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_key\[0\]" -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
srcHBSelect "clock_tb.top0.min_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.min_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.seg0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hour_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sel" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "seg_out" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 449241.181043 -snap {("G1" 8)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 38000 -TraceValue 11111111
nsMsgSwitchTab -tab trace
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 527984.788090 -snap {("G1" 8)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 450000 -TraceValue 10011001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 631395.067224 -snap {("G1" 8)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 530000 -TraceValue 10010010
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 447343.744728 -snap {("G1" 8)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 38000 -TraceValue 11111111
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 529882.224404 -snap {("G1" 8)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 450000 -TraceValue 10011001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 626651.476438 -snap {("G1" 8)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 530000 -TraceValue 10010010
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 727215.601101 -snap {("G1" 8)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 630000 -TraceValue 11000000
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 829677.162078 -snap {("G1" 8)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 730000 -TraceValue 11111001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 849600.243380 -snap {("G1" 8)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 830000 -TraceValue 10100100
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetCursor -win $_nWave2 880907.942567 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 848651.525222 -snap {("G1" 7)}
srcActiveTrace "clock_tb.top0.seg0.sel\[5:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 450000 -TraceValue 111110
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 848651.525222 -snap {("G1" 8)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 830000 -TraceValue 10100100
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 1248061.869402 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 1248061.869402 -snap {("G1" 7)}
srcActiveTrace "clock_tb.top0.seg0.sel\[5:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 850000 -TraceValue 111101
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 1248061.869402 -snap {("G1" 8)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 850000 -TraceValue 11000000
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 1654587.599761 -snap {("G1" 8)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1650000 -TraceValue 11000000
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 2449139.056413 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 1649369.649896 -snap {("G1" 7)}
srcActiveTrace "clock_tb.top0.seg0.sel\[5:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 1250000 -TraceValue 111011
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 2046882.557762 -snap {("G1" 7)}
srcActiveTrace "clock_tb.top0.seg0.sel\[5:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 1650000 -TraceValue 110111
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetCursor -win $_nWave2 1647472.213582 -snap {("G1" 8)}
srcActiveTrace "clock_tb.top0.seg0.seg_out\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1250000 -TraceValue 10100100
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 2869421.200051 -snap {("G1" 8)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 22769.235773 1396513.127394
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 643862.605124 -snap {("G1" 8)}
srcDeselectAll -win $_nTrace1
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.add0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_select" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "clock_tb.top0.hour_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.hour_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "clock_tb.top0.mode0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.mode0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_select" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "clock_tb.top0.time_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.time_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "time_clock_key" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectGroup -win $_nWave2 {G2}
wvScrollDown -win $_nWave2 0
srcHBSelect "clock_tb.top0.mode0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.mode0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcSelect -all -win $_nTrace1
srcSelect -win $_nTrace1 -range {1 56 1 2 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcSelect -signal "mode_key" -win $_nTrace1
srcSelect -toggle -signal "mode_key" -win $_nTrace1
srcSelect -signal "mode_key" -win $_nTrace1
srcSelect -signal "mode_select" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_select" -win $_nTrace1
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.add0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcSelect -signal "add_key" -win $_nTrace1
srcSelect -signal "add_select" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "clock_tb.top0.clock0" -win $_nTrace1
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
srcHBSelect "clock_tb.top0.time_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.time_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcSelect -win $_nTrace1 -range {2 3 3 3 3 4}
srcSelect -win $_nTrace1 -range {2 4 3 3 3 4}
srcSelect -signal "key_in" -win $_nTrace1
srcSelect -signal "time_clock_key" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.second_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_key" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_en" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
srcHBSelect "clock_tb.top0.min_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.min_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hour_en" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcHBSelect "clock_tb.top0.hour_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.hour_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hour_en" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hour_en" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hour_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcHBSelect "clock_tb.top0.clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "led" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_time" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_time" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hour_time" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "led" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
srcHBSelect "clock_tb.top0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sel" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "seg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 0.000000 10634382.207068
wvZoom -win $_nWave2 65929.213931 4522744.075665
wvSetCursor -win $_nWave2 444468.355938 -snap {("G1" 4)}
srcActiveTrace "clock_tb.top0.seg\[7:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 38000 -TraceValue 11111111
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 530123.198290 -snap {("G1" 4)}
srcActiveTrace "clock_tb.top0.seg\[7:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 450000 -TraceValue 10011001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 626830.278365 -snap {("G1" 4)}
srcActiveTrace "clock_tb.top0.seg\[7:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 530000 -TraceValue 10010010
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 524597.079429 -snap {("G1" 4)}
srcActiveTrace "clock_tb.top0.seg\[7:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 450000 -TraceValue 10011001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 626830.278365 -snap {("G1" 4)}
srcActiveTrace "clock_tb.top0.seg\[7:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 530000 -TraceValue 10010010
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 720774.299009 -snap {("G1" 4)}
srcActiveTrace "clock_tb.top0.seg\[7:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 630000 -TraceValue 11000000
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 820244.438515 -snap {("G1" 4)}
srcActiveTrace "clock_tb.top0.seg\[7:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 730000 -TraceValue 11111001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 530123.198290 -snap {("G1" 4)}
srcActiveTrace "clock_tb.top0.seg\[7:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 450000 -TraceValue 10011001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 444468.355938 -snap {("G1" 4)}
srcActiveTrace "clock_tb.top0.seg\[7:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 38000 -TraceValue 11111111
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvSetCursor -win $_nWave2 527360.138859 -snap {("G1" 4)}
srcActiveTrace "clock_tb.top0.seg\[7:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 450000 -TraceValue 10011001
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.second_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "time_clock_key\[0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_count\[29:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 76981.451654 554990.733167
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "time_clock_key\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_count" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg_temp\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_count" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg_temp" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 9)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_key\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.second_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_en" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 3221895.169628 -snap {("G1" 9)}
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.seg0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 2025521.705132 -snap {("G1" 12)}
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.seg0" -delim "."
srcDeselectAll -win $_nTrace1
verdiDockWidgetUndock -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetDock -dock widgetDock_MTB_SOURCE_TAB_1
debReload
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 605422.215355 1169668.757203
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
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
srcHBSelect "clock_tb.top0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "key2" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSetCursor -win $_nWave2 428869.349229 -snap {("G1" 12)}
srcActiveTrace "clock_tb.top0.seg0.sec_reg\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 330000 -TraceValue 00000011
nsMsgSwitchTab -tab trace
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg_temp" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 477843.010641 -snap {("G1" 14)}
wvSetCursor -win $_nWave2 393188.538771 -snap {("G1" 14)}
wvSetCursor -win $_nWave2 531714.038195 -snap {("G1" 14)}
wvSetCursor -win $_nWave2 429568.972963 -snap {("G1" 14)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 330000 -TraceValue 00000011
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
wvSetCursor -win $_nWave2 529615.166992 -snap {("G1" 14)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 430000 -TraceValue 00000100
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_key\[1\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 508626.454958 -snap {("G1" 15)}
srcActiveTrace "clock_tb.top0.second_clock0.add_key\[1\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 488337.366658 -snap {("G1" 16)}
srcActiveTrace "clock_tb.top0.add0.state\[2:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 470000 -TraceValue 011
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "CNT1_IS_MAX" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt1" -win $_nTrace1
srcAction -pos 85 5 1 -win $_nTrace1 -name "cnt1" -ctrlKey off
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 552702.750229 674437.280027
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 508371.849172 -snap {("G1" 15)}
srcActiveTrace "clock_tb.top0.second_clock0.add_key\[1\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
debReload
wvSetCursor -win $_nWave2 504749.246922 -snap {("G1" 15)}
srcActiveTrace "clock_tb.top0.second_clock0.add_key\[1\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
wvSetCursor -win $_nWave2 508371.849172 -snap {("G1" 15)}
srcActiveTrace "clock_tb.top0.second_clock0.add_key\[1\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
wvSetCursor -win $_nWave2 538560.201261 -snap {("G1" 15)}
wvSelectSignal -win $_nWave2 {( "G1" 17 )} 
wvSetCursor -win $_nWave2 752293.734048 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 507164.315089 -snap {("G1" 15)}
srcActiveTrace "clock_tb.top0.second_clock0.add_key\[1\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_key" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 17 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetCursor -win $_nWave2 530107.462676 -snap {("G1" 17)}
srcActiveTrace "clock_tb.top0.add0.cnt1\[29:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 000000000000000000000000000000
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "CNT1_IS_MAX" -win $_nTrace1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
debReload
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
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
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0\[29:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
debReload
wvZoom -win $_nWave2 364675.293230 611012.246273
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 18 )} 
wvSetCursor -win $_nWave2 530242.964021 -snap {("G1" 14)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 430000 -TraceValue 00000100
nsMsgSwitchTab -tab trace
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
wvSetCursor -win $_nWave2 587665.589157 -snap {("G1" 14)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 530000 -TraceValue 00000101
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 505807.804388 -snap {("G1" 20)}
srcActiveTrace "clock_tb.top0.add0.add_key" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 430000 -TraceValue 0
srcDeselectAll -win $_nTrace1
debReload
wvSetCursor -win $_nWave2 817356.089700 -snap {("G1" 16)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
srcDeselectAll -win $_nTrace1
srcHBSelect "clock_tb.top0.mode0" -win $_nTrace1
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.second_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_count" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 587665.589157 -snap {("G1" 14)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 530000 -TraceValue 00000101
nsMsgSwitchTab -tab trace
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
wvSetCursor -win $_nWave2 604770.200899 -snap {("G1" 14)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 590000 -TraceValue 00000110
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 507029.562370 -snap {("G1" 21)}
srcActiveTrace "clock_tb.top0.add0.add_key" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 430000 -TraceValue 0
srcHBSelect "clock_tb.top0.debounce_2" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvSetCursor -win $_nWave2 510694.836315 -snap {("G1" 21)}
wvSetCursor -win $_nWave2 505807.804388 -snap {("G1" 21)}
srcActiveTrace "clock_tb.top0.add0.add_key" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 430000 -TraceValue 0
srcHBSelect "clock_tb.top0.debounce_2" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSetCursor -win $_nWave2 608435.474844 -snap {("G1" 14)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 590000 -TraceValue 00000110
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_key\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 568117.461451 -snap {("G1" 19)}
srcActiveTrace "clock_tb.top0.second_clock0.add_key\[0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
wvSetCursor -win $_nWave2 568117.461451 -snap {("G1" 19)}
srcDeselectAll -win $_nTrace1
debReload
wvSetCursor -win $_nWave2 590109.105120 -snap {("G1" 14)}
wvSetCursor -win $_nWave2 587665.589157 -snap {("G1" 14)}
wvSetCursor -win $_nWave2 587665.589157 -snap {("G1" 14)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 530000 -TraceValue 00000101
nsMsgSwitchTab -tab trace
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
wvSetCursor -win $_nWave2 588887.347138 -snap {("G1" 14)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 530000 -TraceValue 00000101
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
wvSetCursor -win $_nWave2 643866.456311 -snap {("G1" 20)}
wvSetCursor -win $_nWave2 590109.105120 -snap {("G1" 18)}
wvSetCursor -win $_nWave2 1747724.792699 -snap {("G1" 14)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1690000 -TraceValue 00000100
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetCursor -win $_nWave2 1507038.470321 -snap {("G1" 20)}
srcActiveTrace "clock_tb.top0.add0.state\[2:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 570000 -TraceValue 000
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "key_down_edge" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state\[2:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 1423958.927572 -snap {("G1" 18)}
srcActiveTrace "clock_tb.top0.key2" -win $_nTrace1 -TraceByDConWave -TraceTime \
           425000 -TraceValue 1
srcHBSelect "clock_tb" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 1505816.712340 -snap {("G1" 20)}
wvSetCursor -win $_nWave2 1425180.685553 -snap {("G1" 15)}
wvSetCursor -win $_nWave2 1409297.831792 -snap {("G1" 15)}
srcDeselectAll -win $_nTrace1
srcHBSelect "clock_tb.top0" -win $_nTrace1
srcHBSelect "clock_tb.top0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0" -delim "."
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.add0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "key_down_edge" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 1489933.858579 -snap {("G1" 19)}
srcActiveTrace "clock_tb.top0.add0.key_down_edge" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 450000 -TraceValue 0
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
wvSetCursor -win $_nWave2 1488712.100597 -snap {("G1" 19)}
srcActiveTrace "clock_tb.top0.add0.key_down_edge" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 450000 -TraceValue 0
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_key" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_key_d" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 18 )} 
wvSelectSignal -win $_nWave2 {( "G1" 18 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 19 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSelectSignal -win $_nWave2 {( "G1" 18 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 19)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_key" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 19 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSelectSignal -win $_nWave2 {( "G1" 18 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvZoom -win $_nWave2 9774.063853 2472838.154788
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 623631.326442 -snap {("G1" 13)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 530000 -TraceValue 00000101
nsMsgSwitchTab -tab trace
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 2069708.012192 -snap {("G1" 13)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1990000 -TraceValue 00000010
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_key\[2\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvScrollUp -win $_nWave2 1
debReload
wvSetCursor -win $_nWave2 878641.681796 -snap {("G1" 17)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_key\[0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_key\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_key\[0\]" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 629739.358905 -snap {("G1" 13)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 530000 -TraceValue 00000101
nsMsgSwitchTab -tab trace
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
wvSetCursor -win $_nWave2 1148922.118309 -snap {("G1" 18)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 19 )} 
wvSetCursor -win $_nWave2 528344.808099 -snap {("G1" 13)}
wvSelectSignal -win $_nWave2 {( "G1" 19 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2424888.888038 2928801.566282
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {47 52 1 1 1 1}
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 19 )} 
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 17 )} 
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSetPosition -win $_nWave2 {("G1" 13)}
wvExpandBus -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 26)}
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSetPosition -win $_nWave2 {("G1" 13)}
wvCollapseBus -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 18)}
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.second_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_clock" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_count" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 19 )} 
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvZoom -win $_nWave2 29991.083144 779768.161748
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 734437.559947 -snap {("G1" 13)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 730000 -TraceValue 00000001
nsMsgSwitchTab -tab trace
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "time_clock_key\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_key\[0\]" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 22)}
wvZoom -win $_nWave2 2524977.737741 3153433.168784
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 17 )} 
wvScrollDown -win $_nWave2 1
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSetPosition -win $_nWave2 {("G1" 16)}
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvZoom -win $_nWave2 1546008.152746 1882638.960198
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.add0" -delim "."
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 1287743.661597 -snap {("G1" 17)}
wvSetCursor -win $_nWave2 1292752.427486 -snap {("G1" 17)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1642875.211573 -snap {("G1" 23)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoom -win $_nWave2 2577844.844176 3272393.714110
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcHBSelect "clock_tb.top0.min_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.min_clock0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_key\[1\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
srcHBSelect "clock_tb.top0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "key1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "clock_tb.top0.mode0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.mode0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_select" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "key_edge" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "key_edge" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_key" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_key" -win $_nTrace1
srcHBSelect "clock_tb.top0.debounce_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.debounce_1" -delim "."
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 22 )} 
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
srcHBSelect "clock_tb.top0.mode0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.mode0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode_key_d" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 4939779.687466 -snap {("G1" 25)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 25 )} 
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSelectSignal -win $_nWave2 {( "G1" 22 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSelectSignal -win $_nWave2 {( "G1" 19 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSelectSignal -win $_nWave2 {( "G1" 18 )} 
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 2087521.959975 -snap {("G1" 24)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1950000 -TraceValue 00000001
nsMsgSwitchTab -tab trace
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
wvSetCursor -win $_nWave2 2797141.636138 -snap {("G1" 24)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 2710000 -TraceValue 00000010
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
wvSetCursor -win $_nWave2 3272517.924054 -snap {("G1" 24)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_reg_temp\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 2810000 -TraceValue 00000011
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_count" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvScrollDown -win $_nWave2 1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvZoom -win $_nWave2 20668.534257 1743046.389022
wvSetCursor -win $_nWave2 927239.395197 -snap {("G1" 25)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_count\[29:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 910000 -TraceValue \
           000000000000000000000000000100
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2868138.200805 -snap {("G1" 25)}
srcActiveTrace "clock_tb.top0.second_clock0.sec_count\[29:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 2850000 -TraceValue \
           000000000000000000000000000010
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 18 )} 
wvScrollDown -win $_nWave2 2
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSelectSignal -win $_nWave2 {( "G1" 25 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 24)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2750679.078658 3528044.905235
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
wvSetCursor -win $_nWave2 2847789.564743 -snap {("G1" 20)}
srcActiveTrace "clock_tb.top0.second_clock0.add_key\[2\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2836704.993130 -snap {("G1" 20)}
srcActiveTrace "clock_tb.top0.second_clock0.add_key\[2\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cnt0" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 2597663.796613 2871404.521657
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
wvSelectSignal -win $_nWave2 {( "G1" 22 )} 
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2802236.114026 -snap {("G1" 21)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcHBSelect "clock_tb.top0.seg0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.seg0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hour_clock" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_clock" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_clock" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sec_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "min_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hour_reg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
wvSelectSignal -win $_nWave2 {( "G1" 28 )} 
srcHBSelect "clock_tb.top0.second_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.second_clock0" -delim "."
srcDeselectAll -win $_nTrace1
debReload
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 29 )} 
srcHBSelect "clock_tb.top0.min_clock0" -win $_nTrace1
srcSetScope -win $_nTrace1 "clock_tb.top0.min_clock0" -delim "."
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 29 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "time_clock_key\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G1" 31 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 30)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 2590439.198431 3079201.311343
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2630588.597042 -snap {("G1" 20)}
srcActiveTrace "clock_tb.top0.second_clock0.add_key\[2\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "clock_tb.top0.add0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debExit
