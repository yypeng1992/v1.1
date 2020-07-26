verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "833"
debImport "-sv" "-f" "filelist.vc"
srcHBSelect "rtc_tb.rtc0" -win $_nTrace1
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/rtc/rtc.fsdb}
srcHBSelect "rtc_tb.rtc0.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0" -delim "."
srcHBSelect "rtc_tb.rtc0.seg1" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.seg1" -delim "."
srcHBSelect "rtc_tb.rtc0.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0" -delim "."
srcHBSelect "rtc_tb.rtc0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "sel" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "seg" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_for_seg" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 24337354.021687 705783266.628916
wvSetCursor -win $_nWave2 106028761.617366 -snap {("G1" 1)}
srcActiveTrace "rtc_tb.rtc0.data_for_seg\[23:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 71250000 -TraceValue 00000000zzzzzzzz00000000
nsMsgSwitchTab -tab trace
srcHBSelect "rtc_tb.rtc0.test0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_hour\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_min\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_second\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_hour\[7:0\]" -win $_nTrace1
srcAction -pos 36 7 6 -win $_nTrace1 -name "read_hour\[7:0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_data\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_hour" -win $_nTrace1
srcAction -pos 22 8 1 -win $_nTrace1 -name "read_hour" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_second" -win $_nTrace1
srcAction -pos 9 8 5 -win $_nTrace1 -name "write_second" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_second\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_min   \[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
srcDeselectAll -win $_nTrace1
srcSelect -signal "T_WRITE_CH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0" -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0.io0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmd_read" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmd_read" -win $_nTrace1
srcAction -pos 5 2 4 -win $_nTrace1 -name "cmd_read" -ctrlKey off
srcDeselectAll -win $_nTrace1
debReload
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
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmd_write" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmd_read" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmd_write" -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0.io0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 0.000000 -snap {("G1" 3)}
wvZoom -win $_nWave2 82101917.181594 1000001351.271813
srcDeselectAll -win $_nTrace1
wvZoom -win $_nWave2 93713897.974298 311023824.237825
wvZoom -win $_nWave2 98950281.739676 202237951.511919
wvZoom -win $_nWave2 103679114.813580 118985600.815973
wvZoom -win $_nWave2 105984308.488559 109313008.155345
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ds1302_io" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pin" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "D_in" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_second\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
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
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state\[2:0\]" -win $_nTrace1
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_time_ack" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
debReload
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
srcHBSelect "rtc_tb.rtc0.test0.ds0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata" -win $_nTrace1
srcAction -pos 21 10 1 -win $_nTrace1 -name "wdata" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_time_req" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_time_req" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0.io0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata" -win $_nTrace1
srcAction -pos 10 7 3 -win $_nTrace1 -name "wdata" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0.io0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmd_read" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmd_write" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 126884446.218593 34639453817.675880
wvZoom -win $_nWave2 126884446.218500 7194156817.509378
wvZoom -win $_nWave2 126884446.218500 1232255564.592513
wvZoom -win $_nWave2 143548332.425143 238671349.521400
wvZoom -win $_nWave2 164700058.588463 209692289.664771
wvZoom -win $_nWave2 171313238.281777 190559286.876604
wvZoom -win $_nWave2 175048809.271525 182253988.268081
wvZoom -win $_nWave2 177483725.289180 179506787.482309
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata" -win $_nTrace1
srcAction -pos 15 9 1 -win $_nTrace1 -name "rdata" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata_rec\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[7:0\]" -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0.spi_mastet0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0.io0.spi_mastet0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "D_in" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pin" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pin" -win $_nTrace1
srcAction -pos 9 2 1 -win $_nTrace1 -name "r_pin" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pin_shift\[7\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_in" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 71140800.308171 -snap {("G1" 25)}
srcActiveTrace "rtc_tb.rtc0.test0.ds0.io0.spi_mastet0.data_in\[7:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 53550000 -TraceValue 00000000
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "send_data\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 65122444.437156 78135105.779891
wvZoom -win $_nWave2 69601677.110403 72756757.059082
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr" -win $_nTrace1
srcAction -pos 8 7 1 -win $_nTrace1 -name "waddr" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_time_req" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_time_req" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_time_req" -win $_nTrace1
srcAction -pos 222 9 5 -win $_nTrace1 -name "read_time_req" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_time_ack" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 31 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_time_ack" -win $_nTrace1
srcAction -pos 85 5 4 -win $_nTrace1 -name "read_time_ack" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmd_read_ack" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmd_read_ack" -win $_nTrace1
srcAction -pos 236 8 9 -win $_nTrace1 -name "cmd_read_ack" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[7:0\]" -win $_nTrace1
debReload
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "G1" 22 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
srcHBSelect "rtc_tb.rtc0.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {2 7 2 10 10 1}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 "/rtc_tb/rtc0/test0/clk" "/rtc_tb/rtc0/test0/reset_n" \
           "/rtc_tb/rtc0/test0/io" "/rtc_tb/rtc0/test0/dclk" \
           "/rtc_tb/rtc0/test0/dce" "/rtc_tb/rtc0/test0/data_for_seg\[23:0\]"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 5073495.394861 486040858.827655
srcHBSelect "rtc_tb.rtc0.test0.ds0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0.io0" -delim "."
srcHBSelect "rtc_tb.rtc0.test0.ds0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0" -delim "."
srcDeselectAll -win $_nTrace1
wvZoom -win $_nWave2 244411179.030861 256495786.152288
wvZoom -win $_nWave2 248935315.867716 249891760.903708
srcDeselectAll -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_second" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_min" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_min" -win $_nTrace1
srcAction -pos 25 10 4 -win $_nTrace1 -name "read_min" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
srcSelect -signal "read_data\[7:0\]" -win $_nTrace1
srcAction -pos 97 6 5 -win $_nTrace1 -name "read_data\[7:0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata_rec\[0\]" -win $_nTrace1
srcAction -pos 53 7 7 -win $_nTrace1 -name "rdata_rec\[0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "D_in_shift\[7:0\]" -win $_nTrace1
srcAction -pos 29 5 7 -win $_nTrace1 -name "D_in_shift\[7:0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0" -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "waddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "raddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0.spi_mastet0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0.io0.spi_mastet0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "D_in_shift\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pin_shift\[7:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pin_shift\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 5178809.998848 78695308.845776
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pin_shift\[7:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pin" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0" -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0" -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0.io0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pin" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ds1302_io" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ds1302_io" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "D_in" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ds1302_io_oe" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
wvSetCursor -win $_nWave2 18840911.764790 -snap {("G2" 12)}
srcActiveTrace "rtc_tb.rtc0.test0.ds0.io0.spi_mastet0.D_in_shift\[7:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 17910000 -TraceValue 00000000
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0.spi_mastet0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "rtc_tb.rtc0.test0.ds0.io0" -win $_nTrace1
srcSetScope -win $_nTrace1 "rtc_tb.rtc0.test0.ds0.io0" -delim "."
srcDeselectAll -win $_nTrace1
