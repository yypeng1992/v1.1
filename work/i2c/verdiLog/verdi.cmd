verdiWindowResize -win $_Verdi_1 "67" "27" "1853" "1025"
debImport "-sv" "-f" "filelist.vc" "+define+SIM_I2C"
srcHBSelect "led_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "led_tb" -delim "."
srcHBSelect "led_tb.top0" -win $_nTrace1
srcSetScope -win $_nTrace1 "led_tb.top0" -delim "."
srcHBSelect "tb.top0" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb.top0" -delim "."
srcHBSelect "led_tb.top0.led0" -win $_nTrace1
srcHBSelect "led_tb.top0.debounce0" -win $_nTrace1
srcSetScope -win $_nTrace1 "led_tb.top0.debounce0" -delim "."
srcHBSelect "led_tb.top0" -win $_nTrace1
srcSetScope -win $_nTrace1 "led_tb.top0" -delim "."
srcHBSelect "led_tb.top0.led0" -win $_nTrace1
srcSetScope -win $_nTrace1 "led_tb.top0.led0" -delim "."
srcHBSelect "tb.top0" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb.top0" -delim "."
srcHBSelect "led_key_old" -win $_nTrace1
srcSetScope -win $_nTrace1 "led_key_old" -delim "."
wvCreateWindow
srcHBSelect "led_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "led_tb" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 7 -pos 3 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "led_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "led_tb" -delim "."
srcDeselectAll -win $_nTrace1
srcAction -pos 26 0 3 -win $_nTrace1 -name "initial" -ctrlKey off
srcHBSelect "tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb" -delim "."
debExit
