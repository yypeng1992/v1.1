verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "833"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/ram_fifo/fifo.fsdb}
srcHBSelect "fifo_test.fifo0" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test.fifo0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "fifo_test" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "fifo_test.fifo0" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test.fifo0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wclk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 0.080120 -snap {("G1" 4)}
srcActiveTrace "fifo_test.fifo0.reset_n" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "fifo_test" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 0.007831 -snap {("G1" 1)}
srcActiveTrace "fifo_test.fifo0.reset_n" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 0
nsMsgSwitchTab -tab trace
debReload
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcHBSelect "fifo_test" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "wclk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rclk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
debReload
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCreateWindow
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 {/home/ft/tree/v1.1/work/ram_fifo/fifo.fsdb}
srcDeselectAll -win $_nTrace1
srcHBSelect "fifo_test" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rclk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 0 -pos 2 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 0 -pos 2 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rclk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvAddSignal -win $_nWave3 "/fifo_test/rclk"
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "rclk" -win $_nTrace1
srcAction -pos 1 2 2 -win $_nTrace1 -name "rclk" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcAction -pos 14 2 1 -win $_nTrace1 -name "begin" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "rclk" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rclk" -win $_nTrace1
srcAction -pos 15 1 2 -win $_nTrace1 -name "rclk" -ctrlKey off
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
wvCreateWindow
verdiDockWidgetSetCurTab -dock windowDock_nWave_3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvDisplayGridCount -win $_nWave4 -off
wvGetSignalClose -win $_nWave4
wvReloadFile -win $_nWave3
wvSetCursor -win $_nWave3 0.040361 -snap {("G1" 1)}
srcActiveTrace "fifo_test.rclk" -win $_nTrace1 -TraceByDConWave -TraceTime 0 \
           -TraceValue 0
wvSetCursor -win $_nWave3 0.156627 -snap {("G2" 0)}
wvSetCursor -win $_nWave3 0.148795 -snap {("G2" 0)}
wvTpfCloseForm -win $_nWave3
wvGetSignalClose -win $_nWave3
wvCloseWindow -win $_nWave3
wvCloseWindow -win $_nWave4
wvCreateWindow
srcDeselectAll -win $_nTrace1
srcSelect -signal "rclk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wclk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wden" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rden" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomIn -win $_nWave5
wvZoomIn -win $_nWave5
wvZoomIn -win $_nWave5
wvZoomIn -win $_nWave5
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
srcHBSelect "fifo_test.fifo0.ram0" -win $_nTrace1
srcHBSelect "fifo_test.fifo0" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test.fifo0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "full" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave5 33221.281928 -snap {("G1" 8)}
srcActiveTrace "fifo_test.fifo0.full" -win $_nTrace1 -TraceByDConWave -TraceTime \
           0 -TraceValue x
nsMsgSwitchTab -tab trace
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr\[3:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "raddr_d\[3:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "g_waddr_d\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "g_waddr\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr_d\[i\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr_d\[4\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "g_waddr_d\[4\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 14 )} 
wvSelectSignal -win $_nWave5 {( "G1" 14 )} 
wvSelectSignal -win $_nWave5 {( "G1" 15 )} 
wvSelectSignal -win $_nWave5 {( "G1" 14 )} 
wvSelectSignal -win $_nWave5 {( "G1" 15 )} 
wvSelectSignal -win $_nWave5 {( "G1" 8 )} 
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave5 {( "G1" 7 )} 
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvSelectSignal -win $_nWave5 {( "G1" 7 )} 
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoom -win $_nWave5 9159160.569504 12071748.842621
wvSelectSignal -win $_nWave5 {( "G1" 10 )} 
wvScrollDown -win $_nWave5 1
srcDeselectAll -win $_nTrace1
srcHBSelect "fifo_test.fifo0" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test.fifo0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave5 10104458.661819 -snap {("G1" 16)}
srcActiveTrace "fifo_test.fifo0.rdata\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 0000
srcHBSelect "fifo_test.fifo0.ram0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rden" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "raddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave5 {( "G1" 7 )} 
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvSelectSignal -win $_nWave5 {( "G1" 7 )} 
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
wvSetCursor -win $_nWave5 10106061.252451 -snap {("G1" 16)}
srcActiveTrace "fifo_test.fifo0.rdata\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 0000
srcHBSelect "fifo_test.fifo0.ram0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave5 {( "G1" 10 )} 
wvSelectSignal -win $_nWave5 {( "G1" 18 )} 
wvSelectSignal -win $_nWave5 {( "G1" 10 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G2" 0)}
wvSetPosition -win $_nWave5 {("G1" 17)}
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1" 12 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G2" 0)}
wvSetPosition -win $_nWave5 {("G1" 16)}
wvSelectSignal -win $_nWave5 {( "G1" 11 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G2" 0)}
wvSetPosition -win $_nWave5 {("G1" 15)}
wvSelectSignal -win $_nWave5 {( "G1" 10 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G2" 0)}
wvSetPosition -win $_nWave5 {("G1" 14)}
wvSelectSignal -win $_nWave5 {( "G1" 8 )} 
wvSelectSignal -win $_nWave5 {( "G1" 11 )} 
wvSetCursor -win $_nWave5 10110716.324096 -snap {("G1" 12)}
srcActiveTrace "fifo_test.fifo0.rdata\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 0000
srcHBSelect "fifo_test.fifo0.ram0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "fifo_test.fifo0" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test.fifo0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "empty" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "fifo_test.fifo0.ram0" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test.fifo0.ram0" -delim "."
wvSetCursor -win $_nWave5 10026888.002702 -snap {("G1" 14)}
wvSetCursor -win $_nWave5 10050074.559684 -snap {("G1" 14)}
wvSetCursor -win $_nWave5 10067910.372746 -snap {("G1" 14)}
wvSetCursor -win $_nWave5 10091096.929727 -snap {("G1" 14)}
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave5 10110716.324096 -snap {("G1" 12)}
srcActiveTrace "fifo_test.fifo0.rdata\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 0000
srcHBSelect "fifo_test.fifo0.ram0" -win $_nTrace1
wvSetCursor -win $_nWave5 10346149.056522 -snap {("G1" 12)}
srcActiveTrace "fifo_test.fifo0.rdata\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 10110000 -TraceValue xxxx
srcHBSelect "fifo_test.fifo0.ram0" -win $_nTrace1
wvZoom -win $_nWave5 9987649.213965 10315828.174316
wvZoom -win $_nWave5 10139178.262405 10140785.997667
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
srcDeselectAll -win $_nTrace1
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
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
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
srcHBSelect "fifo_test.fifo0" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test.fifo0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 15)}
wvSetPosition -win $_nWave5 {("G1" 14)}
wvSetPosition -win $_nWave5 {("G1" 13)}
wvSetPosition -win $_nWave5 {("G1" 12)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 8)}
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 2)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rclk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 2)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvZoom -win $_nWave5 0.000000 1127853.331292
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "g_waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 5)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 1)}
wvSetPosition -win $_nWave5 {("G1" 0)}
wvSetPosition -win $_nWave5 {("G1" 1)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 1)}
wvSetPosition -win $_nWave5 {("G1" 2)}
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 1)}
wvScrollDown -win $_nWave5 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "g_waddr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "g_waddr_d" -win $_nTrace1
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "g_waddr_d" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave5 1
wvScrollUp -win $_nWave5 2
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvSelectSignal -win $_nWave5 {( "G1" 2 )} 
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvSetPosition -win $_nWave5 {("G1" 0)}
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvSetPosition -win $_nWave5 {("G1" 5)}
wvExpandBus -win $_nWave5 {("G1" 5)}
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvSetPosition -win $_nWave5 {("G1" 5)}
wvCollapseBus -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 5)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr_d" -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 2)}
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSelectSignal -win $_nWave5 {( "G1" 2 )} 
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvSelectSignal -win $_nWave5 {( "G1" 2 )} 
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvSetCursor -win $_nWave5 312870.519948 -snap {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSetCursor -win $_nWave5 288697.300968 -snap {("G1" 4)}
wvSelectSignal -win $_nWave5 {( "G1" 1 )} 
wvSelectSignal -win $_nWave5 {( "G1" 2 )} 
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSelectSignal -win $_nWave5 {( "G1" 2 )} 
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1" 10 )} 
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvZoomOut -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 11 )} 
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
srcDeselectAll -win $_nTrace1
srcHBSelect "fifo_test.fifo0.ram0" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test.fifo0.ram0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem\[waddr\]\[3:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata\[3:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1" 12 )} 
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
wvScrollDown -win $_nWave5 0
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wclk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetPosition -win $_nWave5 {("G1" 12)}
wvSetPosition -win $_nWave5 {("G1" 13)}
wvSetPosition -win $_nWave5 {("G1" 14)}
wvSetPosition -win $_nWave5 {("G1" 15)}
wvSetPosition -win $_nWave5 {("G1" 16)}
wvSetPosition -win $_nWave5 {("G1" 17)}
wvSetPosition -win $_nWave5 {("G1" 18)}
wvSetPosition -win $_nWave5 {("G1" 19)}
wvSetPosition -win $_nWave5 {("G1" 20)}
wvSetPosition -win $_nWave5 {("G1" 21)}
wvSetPosition -win $_nWave5 {("G2" 0)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSelectSignal -win $_nWave5 {( "G1" 9 )} 
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetPosition -win $_nWave5 {("G1" 12)}
wvSetPosition -win $_nWave5 {("G1" 13)}
wvSetPosition -win $_nWave5 {("G1" 14)}
wvSetPosition -win $_nWave5 {("G1" 15)}
wvSetPosition -win $_nWave5 {("G1" 16)}
wvSetPosition -win $_nWave5 {("G1" 17)}
wvSetPosition -win $_nWave5 {("G1" 18)}
wvSetPosition -win $_nWave5 {("G1" 19)}
wvSetPosition -win $_nWave5 {("G1" 20)}
wvSetPosition -win $_nWave5 {("G1" 21)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 21)}
wvScrollDown -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1" 21 )} 
wvSetPosition -win $_nWave5 {("G2" 0)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G2" 1)}
wvSetPosition -win $_nWave5 {("G2" 1)}
wvScrollDown -win $_nWave5 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata\[3:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 0
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave5 {("G2" 2)}
wvSetPosition -win $_nWave5 {("G2" 1)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G2" 1)}
wvSetPosition -win $_nWave5 {("G2" 2)}
wvSetCursor -win $_nWave5 41439.803967 -snap {("G2" 1)}
wvSetCursor -win $_nWave5 73210.320341 -snap {("G2" 2)}
wvSetCursor -win $_nWave5 102218.183118 -snap {("G2" 2)}
wvSetCursor -win $_nWave5 133988.699492 -snap {("G2" 2)}
wvSetCursor -win $_nWave5 162996.562269 -snap {("G2" 2)}
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvSetCursor -win $_nWave5 10030626.088794 -snap {("G1" 19)}
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
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave5 10029244.761995 -snap {("G1" 19)}
wvSetCursor -win $_nWave5 10047202.010380 -snap {("G1" 19)}
wvSetCursor -win $_nWave5 10107980.389532 -snap {("G1" 17)}
srcActiveTrace "fifo_test.fifo0.rdata\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 0000
srcHBSelect "fifo_test.fifo0.ram0" -win $_nTrace1
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 18 )} 
srcDeselectAll -win $_nTrace1
debReload
wvSetCursor -win $_nWave5 10018194.147605 -snap {("G1" 18)}
wvSetCursor -win $_nWave5 10030626.088795 -snap {("G1" 19)}
wvSetCursor -win $_nWave5 10049964.663979 -snap {("G1" 19)}
wvSetCursor -win $_nWave5 10019575.474404 -snap {("G1" 18)}
wvSetCursor -win $_nWave5 10029244.761996 -snap {("G1" 17)}
srcActiveTrace "fifo_test.fifo0.rdata\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 0000
nsMsgSwitchTab -tab trace
srcHBSelect "fifo_test.fifo0.ram0" -win $_nTrace1
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
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSetPosition -win $_nWave5 {("G1" 8)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 10)}
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvSetCursor -win $_nWave5 33151.843173 -snap {("G1" 6)}
wvSetCursor -win $_nWave5 40058.477168 -snap {("G1" 12)}
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave5 71828.993542 -snap {("G1" 12)}
wvSetCursor -win $_nWave5 42821.130766 -snap {("G1" 12)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "wren" -win $_nTrace1
wvSelectSignal -win $_nWave5 {( "G1" 8 )} 
srcHBSelect "fifo_test.fifo0" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test.fifo0" -delim "."
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
wvScrollDown -win $_nWave5 2
wvScrollDown -win $_nWave5 2
wvSelectSignal -win $_nWave5 {( "G1" 17 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wden" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "wren" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "fifo_test.fifo0.ram0" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test.fifo0.ram0" -delim "."
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave5 {( "G1" 14 )} 
wvSelectSignal -win $_nWave5 {( "G1" 12 )} 
wvSetPosition -win $_nWave5 {("G1" 12)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetCursor -win $_nWave5 74591.647140 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 46965.111162 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 71828.993542 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 103599.509917 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 133988.699492 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 41439.803967 -snap {("G1" 11)}
wvSelectSignal -win $_nWave5 {( "G1" 13 )} 
wvSelectSignal -win $_nWave5 {( "G1" 13 )} 
wvSetCursor -win $_nWave5 74591.647140 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 102218.183118 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 139514.006688 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 160233.908671 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 190623.098247 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 222393.614621 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 250020.150599 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 285934.647370 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 316323.836945 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 345331.699722 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 372958.235700 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 408872.732471 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 440643.248845 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 469651.111622 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 488989.686806 -snap {("G1" 11)}
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem0" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave5 {( "G1" 13 )} 
wvSelectSignal -win $_nWave5 {( "G1" 12 )} 
wvSelectSignal -win $_nWave5 {( "G1" 15 )} 
wvSelectSignal -win $_nWave5 {( "G1" 12 )} 
srcDeselectAll -win $_nTrace1
wvZoom -win $_nWave5 9897452.733078 10369866.498298
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 0
verdiSetSyncSelection -widget MTB_SOURCE_TAB_1
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvSelectSignal -win $_nWave5 {( "G2" 3 )} 
srcHBSelect "fifo_test.fifo0.ram0" -win $_nTrace1
srcSetScope -win $_nTrace1 "fifo_test.fifo0.ram0" -delim "."
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem0" -win $_nTrace1
srcSelect -signal "mem1" -win $_nTrace1
srcSelect -signal "mem2" -win $_nTrace1
srcSelect -signal "mem3" -win $_nTrace1
srcSelect -signal "mem4" -win $_nTrace1
srcSelect -signal "mem5" -win $_nTrace1
srcSelect -signal "mem6" -win $_nTrace1
srcSelect -signal "mem7" -win $_nTrace1
srcSelect -signal "mem8" -win $_nTrace1
srcSelect -signal "mem9" -win $_nTrace1
srcSelect -signal "mem10" -win $_nTrace1
srcSelect -signal "mem11" -win $_nTrace1
srcSelect -signal "mem12" -win $_nTrace1
srcSelect -signal "mem13" -win $_nTrace1
srcSelect -signal "mem14" -win $_nTrace1
srcSelect -signal "mem15" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1" 14 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 29)}
wvSetPosition -win $_nWave5 {("G1" 28)}
wvSelectSignal -win $_nWave5 {( "G1" 14 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 28)}
wvSetPosition -win $_nWave5 {("G1" 27)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata\[3:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 27)}
wvSetPosition -win $_nWave5 {("G1" 26)}
wvSetPosition -win $_nWave5 {("G1" 25)}
wvSetPosition -win $_nWave5 {("G1" 24)}
wvSetPosition -win $_nWave5 {("G1" 23)}
wvSetPosition -win $_nWave5 {("G1" 22)}
wvSetPosition -win $_nWave5 {("G1" 21)}
wvSetPosition -win $_nWave5 {("G1" 20)}
wvSetPosition -win $_nWave5 {("G1" 19)}
wvSetPosition -win $_nWave5 {("G1" 18)}
wvSetPosition -win $_nWave5 {("G1" 17)}
wvSetPosition -win $_nWave5 {("G1" 16)}
wvSetPosition -win $_nWave5 {("G1" 15)}
wvSetPosition -win $_nWave5 {("G1" 14)}
wvSetPosition -win $_nWave5 {("G1" 13)}
wvSetPosition -win $_nWave5 {("G1" 12)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 8)}
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 1)}
wvSetPosition -win $_nWave5 {("G1" 0)}
wvSetPosition -win $_nWave5 {("G1" 1)}
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSetPosition -win $_nWave5 {("G1" 8)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetPosition -win $_nWave5 {("G1" 12)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetPosition -win $_nWave5 {("G1" 12)}
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvZoomOut -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 13 )} 
wvSetCursor -win $_nWave5 43972.377412 -snap {("G1" 11)}
wvSelectSignal -win $_nWave5 {( "G1" 11 )} 
wvSetCursor -win $_nWave5 75215.908731 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 103566.520483 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 74637.324817 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 44550.961325 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 69430.069598 -snap {("G1" 10)}
wvSetCursor -win $_nWave5 43393.793498 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 75215.908731 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 104723.688310 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 135388.635715 -snap {("G1" 11)}
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 16 )} 
wvSelectSignal -win $_nWave5 {( "G1" 17 )} 
wvSetCursor -win $_nWave5 164896.415294 -snap {("G1" 11)}
wvSetCursor -win $_nWave5 163739.247468 -snap {("G1" 17)}
srcActiveTrace "fifo_test.fifo0.ram0.mem4\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue xxxx
nsMsgSwitchTab -tab trace
wvSetCursor -win $_nWave5 134810.051802 -snap {("G1" 16)}
wvSetCursor -win $_nWave5 162582.079641 -snap {("G1" 11)}
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
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1" 30 )} 
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave5 10029985.261016 -snap {("G1" 36)}
wvSetCursor -win $_nWave5 10089000.820174 -snap {("G1" 34)}
srcActiveTrace "fifo_test.fifo0.rdata\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 10070000 -TraceValue 0010
srcHBSelect "fifo_test.fifo0.ram0" -win $_nTrace1
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
wvSetCursor -win $_nWave5 133652.883975 -snap {("G1" 15)}
wvScrollUp -win $_nWave5 1
wvSetCursor -win $_nWave5 131338.548322 -snap {("G1" 10)}
wvSetCursor -win $_nWave5 134810.051802 -snap {("G1" 11)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave5 {( "G1" 17 )} 
wvSelectSignal -win $_nWave5 {( "G1" 18 )} 
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvSetCursor -win $_nWave5 162003.495728 -snap {("G1" 13)}
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
wvScrollDown -win $_nWave5 1
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
wvSelectSignal -win $_nWave5 {( "G1" 12 )} 
wvSelectSignal -win $_nWave5 {( "G1" 17 )} 
wvSelectSignal -win $_nWave5 {( "G1" 18 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wren" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "valid" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata\[3:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
srcDeselectAll -win $_nTrace1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1" 9 )} 
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetPosition -win $_nWave5 {("G1" 12)}
wvSetPosition -win $_nWave5 {("G1" 13)}
wvSetPosition -win $_nWave5 {("G1" 14)}
wvSetPosition -win $_nWave5 {("G1" 15)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 15)}
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvSetCursor -win $_nWave5 134810.051802 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 103566.520483 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 72901.573077 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 163739.247468 -snap {("G1" 15)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem3" -win $_nTrace1
srcAction -pos 36 2 1 -win $_nTrace1 -name "mem3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem\[3\]" -win $_nTrace1
srcAction -pos 36 6 2 -win $_nTrace1 -name "mem\[3\]" -ctrlKey off
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
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvSetCursor -win $_nWave5 164317.831381 -snap {("G1" 21)}
srcActiveTrace "fifo_test.fifo0.ram0.mem4\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue xxxx
wvSetCursor -win $_nWave5 164317.831381 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 134231.467889 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 164317.831381 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 133652.883975 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 102987.936570 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 74058.740904 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 133652.883975 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 163160.663554 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 193247.027047 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 224490.558365 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 253998.337944 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 286977.621003 -snap {("G1" 15)}
wvSetCursor -win $_nWave5 164317.831381 -snap {("G1" 15)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvSetCursor -win $_nWave5 43393.793498 -snap {("G1" 16)}
wvSetCursor -win $_nWave5 75215.908731 -snap {("G1" 19)}
wvSetCursor -win $_nWave5 103566.520483 -snap {("G1" 20)}
wvSetCursor -win $_nWave5 130759.964409 -snap {("G1" 21)}
wvSetCursor -win $_nWave5 164896.415294 -snap {("G1" 16)}
wvSetCursor -win $_nWave5 164896.415294 -snap {("G1" 22)}
srcActiveTrace "fifo_test.fifo0.ram0.mem4\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue xxxx
wvSelectSignal -win $_nWave5 {( "G1" 22 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem4" -win $_nTrace1
srcAction -pos 37 2 2 -win $_nTrace1 -name "mem4" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem\[4\]" -win $_nTrace1
srcAction -pos 37 6 1 -win $_nTrace1 -name "mem\[4\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave5 {( "G1" 23 )} 
wvSetCursor -win $_nWave5 145224.562242 -snap {("G1" 23)}
srcActiveTrace "fifo_test.fifo0.ram0.mem4\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue xxxx
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1" 17 )} 
wvSetPosition -win $_nWave5 {("G1" 18)}
wvSetPosition -win $_nWave5 {("G1" 19)}
wvSetPosition -win $_nWave5 {("G1" 20)}
wvSetPosition -win $_nWave5 {("G1" 21)}
wvSetPosition -win $_nWave5 {("G1" 22)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 22)}
wvSetCursor -win $_nWave5 1735.751740 -snap {("G1" 23)}
srcActiveTrace "fifo_test.fifo0.ram0.mem4\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue xxxx
verdiDockWidgetUndock -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetDock -dock widgetDock_MTB_SOURCE_TAB_1
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 22 )} 
wvSetCursor -win $_nWave5 42236.625672 -snap {("G1" 16)}
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
srcDeselectAll -win $_nTrace1
debReload
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
srcDeselectAll -win $_nTrace1
debReload
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
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
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
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
debExit
