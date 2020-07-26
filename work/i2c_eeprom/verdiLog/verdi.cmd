verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/i2c_eeprom/i2c_eeprom.fsdb}
srcHBSelect "i2c_eeprom_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "i2c_eeprom_tb" -delim "."
srcHBSelect "i2c_eeprom_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "i2c_eeprom_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
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
srcHBSelect "i2c_eeprom_tb.test0.seg1" -win $_nTrace1
srcSetScope -win $_nTrace1 "i2c_eeprom_tb.test0.seg1" -delim "."
srcHBSelect "i2c_eeprom_tb.test0.master0" -win $_nTrace1
srcSetScope -win $_nTrace1 "i2c_eeprom_tb.test0.master0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sda" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "scl" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sda" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 4676.356111 201083.312778
srcDeselectAll -win $_nTrace1
srcSelect -signal "en" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "i2c_eeprom_tb.model0" -win $_nTrace1
srcSetScope -win $_nTrace1 "i2c_eeprom_tb.model0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "out_flag" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 98878.951994 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 97545.324510 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 99970.101753 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 97787.802235 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 100333.818340 -snap {("G1" 5)}
debReload
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcHBSelect "i2c_eeprom_tb.model0" -win $_nTrace1
srcSetScope -win $_nTrace1 "i2c_eeprom_tb.model0" -delim "."
srcHBSelect "i2c_eeprom_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "i2c_eeprom_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "key" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 443318.559333 -snap {("G1" 7)}
srcActiveTrace "i2c_eeprom_tb.test0.key" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "i2c_eeprom_tb.test0.debounce" -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 6)}
srcHBSelect "i2c_eeprom_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "i2c_eeprom_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_data\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1851 826
verdiWindowBeDocked -win $_nWave2
wvSetCursor -win $_nWave2 498499.561444 -snap {("G1" 8)}
srcActiveTrace "i2c_eeprom_tb.test0.read_data\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 480250 -TraceValue 00000000
nsMsgSwitchTab -tab trace
srcHBSelect "i2c_eeprom_tb.test0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvZoom -win $_nWave2 14964.339556 469506.153556
wvSetCursor -win $_nWave2 72764.101089 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 70519.450156 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 72202.938356 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 69397.124689 -snap {("G1" 3)}
srcHBSelect "i2c_eeprom_tb.model0" -win $_nTrace1
srcSetScope -win $_nTrace1 "i2c_eeprom_tb.model0" -delim "."
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetCursor -win $_nWave2 72202.938356 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 69116.543322 -snap {("G1" 3)}
wvZoom -win $_nWave2 53123.405422 85670.843956
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 72611.686519 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 71888.410107 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 71888.410107 -snap {("G1" 5)}
srcActiveTrace "i2c_eeprom_tb.test0.master0.en" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 0 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "i2c_eeprom_tb.test0.master0" -win $_nTrace1
wvSetCursor -win $_nWave2 70281.129192 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 72209.866291 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 70361.493238 -snap {("G1" 3)}
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 502540.845765 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 372852.885568 -snap {("G1" 8)}
debExit
