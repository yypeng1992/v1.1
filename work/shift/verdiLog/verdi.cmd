verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "833"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/shift/shift.fsdb}
srcHBSelect "shift_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "shift_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {42 49 1 1 16 1}
wvAddSignal -win $_nWave2 "/shift_tb/sopc/openmips0/ex0/ex_we" \
           "/shift_tb/sopc/openmips0/ex0/ex_waddr\[4:0\]" \
           "/shift_tb/sopc/openmips0/ex0/ex_wdata\[31:0\]" \
           "/shift_tb/sopc/openmips0/ex0/ex_whilo" \
           "/shift_tb/sopc/openmips0/ex0/ex_hi\[31:0\]" \
           "/shift_tb/sopc/openmips0/ex0/ex_lo\[31:0\]"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 805
wvResizeWindow -win $_nWave2 67 27 1851 833
wvZoom -win $_nWave2 187.761010 589.924795
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 214.087189 567.231010
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 246.590476 613.350539
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
srcDeselectAll -win $_nTrace1
debExit
