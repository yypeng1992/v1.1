verdiWindowResize -win $_Verdi_1 "67" "27" "1851" "873"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/jump_branch/jump_branch.fsdb}
srcHBSelect "jump_branch_tb.sopc.rom0" -win $_nTrace1
srcSetScope -win $_nTrace1 "jump_branch_tb.sopc.rom0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc" -win $_nTrace1
srcSelect -win $_nTrace1 -range {5 6 9 10 2 4}
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc" -win $_nTrace1
srcSelect -signal "inst" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 113550.752399 819653.706974
wvZoom -win $_nWave2 192608.984677 635786.846761
srcHBSelect "jump_branch_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "jump_branch_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_read_o" -win $_nTrace1
srcSelect -signal "reg2_addr_o" -win $_nTrace1
srcSelect -win $_nTrace1 -range {54 58 1 11 24 8} -backward
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg2_read_o" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_read_o" -win $_nTrace1
srcSelect -signal "reg1_addr_o" -win $_nTrace1
srcSelect -signal "reg2_read_o" -win $_nTrace1
srcSelect -signal "reg2_addr_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 4)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data_o" -win $_nTrace1
srcSelect -win $_nTrace1 -range {47 48 11 11 10 9}
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg1_data_o" -win $_nTrace1
srcSelect -signal "reg2_data_o" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wreg_o" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_in_delayslot_i" -win $_nTrace1
srcSelect -signal "is_in_delayslot_o" -win $_nTrace1
srcSelect -signal "link_addr" -win $_nTrace1
srcSelect -signal "next_is_delayslot" -win $_nTrace1
srcSelect -signal "branch_target_addr" -win $_nTrace1
srcSelect -signal "branch_flag" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 "/jump_branch_tb/sopc/openmips0/id0/is_in_delayslot_i" \
           "/jump_branch_tb/sopc/openmips0/id0/is_in_delayslot_o" \
           "/jump_branch_tb/sopc/openmips0/id0/link_addr\[31:0\]" \
           "/jump_branch_tb/sopc/openmips0/id0/next_is_delayslot" \
           "/jump_branch_tb/sopc/openmips0/id0/branch_target_addr\[31:0\]" \
           "/jump_branch_tb/sopc/openmips0/id0/branch_flag"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvScrollDown -win $_nWave2 1
srcHBSelect "jump_branch_tb.sopc.openmips0.ex0" -win $_nTrace1
srcSetScope -win $_nTrace1 "jump_branch_tb.sopc.openmips0.ex0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_we" -win $_nTrace1
srcSelect -signal "ex_waddr" -win $_nTrace1
srcSelect -signal "ex_wdata" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/jump_branch_tb/sopc/openmips0/ex0/ex_we" \
           "/jump_branch_tb/sopc/openmips0/ex0/ex_waddr\[4:0\]" \
           "/jump_branch_tb/sopc/openmips0/ex0/ex_wdata\[31:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetCursor -win $_nWave2 270016.250416 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 289864.267271 -snap {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSetCursor -win $_nWave2 310279.370323 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 328426.128592 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 349691.860937 -snap {("G2" 4)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSetCursor -win $_nWave2 369823.420891 -snap {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_whilo" -win $_nTrace1
srcSelect -win $_nTrace1 -range {47 48 5 10 6 4}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_whilo" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ex_whilo" -win $_nTrace1
srcSelect -signal "ex_hi" -win $_nTrace1
srcSelect -signal "ex_lo" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 6
wvScrollDown -win $_nWave2 3
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 6)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 3)}
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 1049453.448654 -snap {("G4" 2)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetCursor -win $_nWave2 1068924.237927 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 1089339.340979 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 1109470.900933 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 1149450.477743 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 1170432.666990 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 1188862.968357 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 1229409.631362 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 1250958.906806 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 1250108.277512 -snap {("G3" 1)}
srcActiveTrace "jump_branch_tb.sopc.openmips0.id0.branch_flag" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1210000 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "jump_branch_tb.sopc.openmips0.id0" -win $_nTrace1
debReload
wvSetCursor -win $_nWave2 209254.806282 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 269649.486143 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 289213.959901 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 329477.079809 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 1050227.379742 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 1089356.327258 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 1108070.171722 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 1168748.394682 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 1188879.954636 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 1229077.966898 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 1250343.699244 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 1270191.716100 -snap {("G4" 2)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSetCursor -win $_nWave2 1229361.509996 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 1248642.440656 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 1270475.259198 -snap {("G4" 2)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcHBSelect "jump_branch_tb.sopc.openmips0.id0" -win $_nTrace1
srcSetScope -win $_nTrace1 "jump_branch_tb.sopc.openmips0.id0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "wreg_o" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvAddSignal -win $_nWave2 "/jump_branch_tb/sopc/openmips0/id0/wreg_o"
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 1249209.526852 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 1269624.629904 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 1349069.763609 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 1368917.780465 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 1408897.357275 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 1430163.089620 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 1489423.597090 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 1510977.507073 -snap {("G2" 4)}
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
debExit
