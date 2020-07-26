verdiWindowResize -win $_Verdi_1 "67" "27" "1847" "869"
debImport "-sv" "-f" "filelist.vc"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/ft/tree/v1.1/work/spi_flash/flash.fsdb}
wvSelectGroup -win $_nWave2 {G1}
wvRestoreSignal -win $_nWave2 "/home/ft/tree/v1.1/work/spi_flash/flash.rc" \
           -overWriteAutoAlias on
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G3" 11)}
srcTraceConnectivity "spi_flash_tb.memory.mem_access.data_to_read\[7:0\]" -win \
           $_nTrace1
nsMsgSwitchTab -tab trace
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "content\[int_add\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "content\[int_add\]" -win $_nTrace1
srcAction -pos 126 5 2 -win $_nTrace1 -name "content\[int_add\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "content\[int_add + i\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
nMemCreateWindow
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 11)}
srcSearchString "content" -win $_nTrace1 -next -case
srcSearchString "content" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {184 184 2 2 1 8}
srcSearchString "content" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {127 127 6 6 1 8}
srcSearchString "content" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {58 58 11 11 50 57}
srcSearchString "content" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {58 58 7 8 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "content" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "initfile" -win $_nTrace1
srcAction -pos 57 3 4 -win $_nTrace1 -name "initfile" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "content" -win $_nTrace1
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/aes_test"
wvGetSignalSetScope -win $_nWave2 "/quick_sort3"
wvGetSignalSetScope -win $_nWave2 "/m25p16_driver"
wvGetSignalSetScope -win $_nWave2 "/share_tb"
wvGetSignalSetScope -win $_nWave2 "/spi_flash_tb"
wvGetSignalSetScope -win $_nWave2 "/spi_flash_tb/memory"
wvGetSignalSetScope -win $_nWave2 "/spi_flash_tb/memory/mem_access"
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/spi_flash_tb/clk} \
{/spi_flash_tb/memory/s} \
{/spi_flash_tb/memory/c} \
{/spi_flash_tb/test0/ctrl0/state\[3:0\]} \
{/spi_flash_tb/memory/spi_decoder/q_bis} \
{/spi_flash_tb/memory/spi_decoder/data_to_read\[7:0\]} \
{/spi_flash_tb/memory/spi_decoder/data_to_read\[7:0\]} \
{/spi_flash_tb/memory/mem_access/int_add\[31:0\]} \
{/spi_flash_tb/memory/mem_access/i\[31:0\]} \
{/spi_flash_tb/memory/data_in} \
{/spi_flash_tb/memory/data_out} \
{/spi_flash_tb/memory/spi_decoder/hold_cond} \
{/spi_flash_tb/test0/ctrl0/CS} \
{/spi_flash_tb/test0/ctrl0/state\[3:0\]} \
{/spi_flash_tb/test0/ctrl0/spi0/rdata\[7:0\]} \
{/spi_flash_tb/test0/ctrl0/data_into_flash\[7:0\]} \
{/spi_flash_tb/test0/ctrl0/data\[7:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/spi_flash_tb/memory/c} \
{/spi_flash_tb/memory/data_in} \
{/spi_flash_tb/memory/s} \
{/spi_flash_tb/memory/w} \
{/spi_flash_tb/memory/hold} \
{/spi_flash_tb/memory/data_out} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/spi_flash_tb/memory/spi_decoder/hold_cond} \
{/spi_flash_tb/memory/spi_decoder/q_bis} \
{/spi_flash_tb/memory/spi_decoder/s} \
{/spi_flash_tb/memory/spi_decoder/c_int} \
{/spi_flash_tb/memory/spi_decoder/read_data} \
{/spi_flash_tb/memory/spi_decoder/count_enable\[0\]} \
{/spi_flash_tb/memory/spi_decoder/byte_ok} \
{/spi_flash_tb/memory/spi_decoder/byte_cpt\[31:0\]} \
{/spi_flash_tb/memory/spi_decoder/cpt\[2:0\]} \
{/spi_flash_tb/memory/spi_decoder/bit_index\[2:0\]} \
{/spi_flash_tb/memory/mem_access/data_to_read\[7:0\]} \
{/spi_flash_tb/memory/mem_access/p_prog\[0:255\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSetPosition -win $_nWave2 {("G3" 12)}
wvGetSignalClose -win $_nWave2
wvScrollDown -win $_nWave2 5
nMemCloseWindow -win $_nMem0
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvZoomAll -win $_nWave2
wvPrevView -win $_nWave2
wvSetCursor -win $_nWave2 3239.151288 -snap {("G3" 11)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 11546.693148 23774.033471
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 11
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 14260.783775 22283.036246
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0" -delim "."
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/state\[3:0\]"
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/state\[2:0\]"
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "L_SE" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 18577.325714 -snap {("G1" 4)}
srcActiveTrace "spi_flash_tb.test0.ctrl0.state\[3:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 15540 -TraceValue 0110
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ack" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ack" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "flash_size" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state\[3:0\]" -win $_nTrace1
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ST_WRSR\[3:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[0\]" -win $_nTrace1
srcAction -pos 199 19 3 -win $_nTrace1 -name "rdata\[0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "Q" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "size" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "flash_size" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "flash_size" -win $_nTrace1
srcAction -pos 44 7 7 -win $_nTrace1 -name "flash_size" -ctrlKey off
debReload
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "flash_size" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "size" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
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
srcDeselectAll -win $_nTrace1
srcSelect -signal "data\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
debReload
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 20604.058165 -snap {("G1" 12)}
srcActiveTrace "spi_flash_tb.test0.ctrl0.state\[3:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 18580 -TraceValue 0111
nsMsgSwitchTab -tab trace
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ack" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "size" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 20044.129376 -snap {("G1" 13)}
srcActiveTrace "spi_flash_tb.test0.ctrl0.rdata\[0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 4060 -TraceValue 1
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Q" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 19 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 13438.290941 22621.123084
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[clk_cnt<<1\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt<<1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 285.506837 4305.909235
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
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSelectSignal -win $_nWave2 {( "G1" 25 )} 
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 16)}
wvScrollUp -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G1" 22 )} 
wvScrollUp -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSelectSignal -win $_nWave2 {( "G1" 25 )} 
wvSelectSignal -win $_nWave2 {( "G1" 27 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 16)}
wvScrollUp -win $_nWave2 7
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 3
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[clk_cnt<<1\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 3469.382780 -snap {("G1" 16)}
srcActiveTrace "spi_flash_tb.test0.ctrl0.spi0.rdata\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 00000000
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
wvSetCursor -win $_nWave2 3469.382780 -snap {("G1" 16)}
srcActiveTrace "spi_flash_tb.test0.ctrl0.spi0.rdata\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 00000000
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0.spi0" -delim "."
srcDeselectAll -win $_nTrace1
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
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "flag" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[clk_cnt<<1\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetCursor -win $_nWave2 3408.158378 -snap {("G4" 1)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/clk_cnt\[4:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 3081.628234 4520.401681
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 3670.466351 -snap {("G2" 3)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 3417.585485 -snap {("G4" 2)}
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt\[0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/clk_cnt\[0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 3377.416684 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 3377.416684 -snap {("G4" 6)}
srcActiveTrace "spi_flash_tb.test0.ctrl0.spi0.rdata\[7:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 00000000
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0.spi0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata" -win $_nTrace1
srcAction -pos 11 8 2 -win $_nTrace1 -name "rdata" -ctrlKey off
debReload
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 3459.580142 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 3416.672558 -snap {("G4" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/clk"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
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
debReload
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt\[0\]" -win $_nTrace1
wvSetCursor -win $_nWave2 3457.754287 -snap {("G4" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt<<1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 7)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 3380.155466 -snap {("G4" 8)}
wvSetCursor -win $_nWave2 3417.585486 -snap {("G4" 7)}
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSetCursor -win $_nWave2 3375.590829 -snap {("G4" 8)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt\[0\]" -win $_nTrace1
wvSetCursor -win $_nWave2 3336.334955 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 3376.503756 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 3338.160809 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 3373.764975 -snap {("G4" 1)}
wvSetCursor -win $_nWave2 3417.585486 -snap {("G4" 1)}
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt<<1" -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "index" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt\[0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt\[4:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 11627.042272 21472.050427
wvZoom -win $_nWave2 14138.268972 20609.987530
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 7)}
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 14663.890784 -snap {("G1" 2)}
srcActiveTrace "spi_flash_tb.test0.state\[2:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 4140 -TraceValue 010
nsMsgSwitchTab -tab trace
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "flash_ack" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 8)}
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
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvSetCursor -win $_nWave2 19476.615499 -snap {("G1" 20)}
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0.spi0" -delim "."
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "D" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/D"
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 25 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Q" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G1" 26)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/Q"
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSelectSignal -win $_nWave2 {( "G1" 26 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSelectSignal -win $_nWave2 {( "G1" 25 )} 
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 25 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvSetPosition -win $_nWave2 {("G1" 24)}
wvExpandBus -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 33)}
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvSetPosition -win $_nWave2 {("G1" 24)}
wvCollapseBus -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "flag" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "flag" -win $_nTrace1
srcAction -pos 68 7 3 -win $_nTrace1 -name "flag" -ctrlKey off
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 13974.012155 22088.298876
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 17052.358896 35258.017428
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 26)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 28973.830727 30775.913678
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
wvZoom -win $_nWave2 18075.768769 45638.111218
wvZoom -win $_nWave2 19597.294018 26942.588326
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pin" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ncs" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dclk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ncs" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "w_pin" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pin" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ready_for_rdata\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 1025.575533 48202.050051
wvZoom -win $_nWave2 17070.366359 32965.485628
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 20126.344239 -snap {("G2" 1)}
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0.spi0" -delim "."
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_data\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_for_write\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Q" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/Q"
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "D" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 4)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_into_flash\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "size\[8:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.debounce0" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0.spi0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "D" -win $_nTrace1
srcAction -pos 9 2 0 -win $_nTrace1 -name "D" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "shift_byte\[7\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "shift_byte\[7\]" -win $_nTrace1
srcAction -pos 51 6 6 -win $_nTrace1 -name "shift_byte\[7\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "shift_byte\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 23522.063162 33718.741831
wvZoom -win $_nWave2 23599.702847 29772.057828
wvSetCursor -win $_nWave2 24061.846177 -snap {("G3" 8)}
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
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[0\]" -win $_nTrace1
srcAction -pos 205 19 2 -win $_nTrace1 -name "rdata\[0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[7-index\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvZoom -win $_nWave2 17671.107661 27571.941031
wvZoom -win $_nWave2 18657.421645 27100.771930
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 14657.998972 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 19972.595091 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 15472.332249 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 20186.893322 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 15258.034018 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 20401.191552 -snap {("G3" 1)}
wvZoom -win $_nWave2 12557.876313 25501.489440
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 8460.998147 33843.992589
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetCursor -win $_nWave2 18607.753539 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 20025.078102 -snap {("G3" 2)}
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetPosition -win $_nWave2 {("G2" 0)}
wvRestoreSignal -win $_nWave2 "/home/ft/tree/v1.1/work/spi_flash/flash.rc" \
           -overWriteAutoAlias on
wvScrollDown -win $_nWave2 8
wvScrollUp -win $_nWave2 7
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 2
wvScrollUp -win $_nWave2 11
wvScrollDown -win $_nWave2 2
wvScrollUp -win $_nWave2 6
wvScrollUp -win $_nWave2 20
wvScrollDown -win $_nWave2 12
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvScrollDown -win $_nWave2 8
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvScrollDown -win $_nWave2 4
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 )} 
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvScrollUp -win $_nWave2 26
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvUndo -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 4 5 6 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 4 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 4 5 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 4 5 6 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 4 5 6 7 8 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 15)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectGroup -win $_nWave2 {G1}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G3}
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvScrollDown -win $_nWave2 3
wvScrollUp -win $_nWave2 3
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 7 8 )} 
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
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
wvZoom -win $_nWave2 8589.195089 37946.294721
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 14829.441521 -snap {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 3 4 5 )} 
wvScrollDown -win $_nWave2 4
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 831
wvResizeWindow -win $_nWave2 57 17 1847 869
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 3 4 5 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSetCursor -win $_nWave2 15462.779965 -snap {("G3" 15)}
wvSetCursor -win $_nWave2 16263.766820 -snap {("G3" 15)}
wvSetCursor -win $_nWave2 15332.386756 -snap {("G3" 15)}
wvSetCursor -win $_nWave2 15462.779965 -snap {("G3" 15)}
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 7 8 9 10 11 12 13 14 15 16 17 18 )} 
wvSetPosition -win $_nWave2 {("G3" 15)}
wvSetPosition -win $_nWave2 {("G3" 16)}
wvSetPosition -win $_nWave2 {("G3" 17)}
wvSetPosition -win $_nWave2 {("G3" 18)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvChangeDisplayAttr -win $_nWave2 -c ID_YELLOW5 -lw 1 -ls solid
wvSetPreference -paintSpecificColorPattern on
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvChangeDisplayAttr -win $_nWave2 -c ID_PURPLE5 -lw 1 -ls solid
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvZoom -win $_nWave2 13246.095411 21833.419606
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 14771.762146 -snap {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetMarker -win $_nWave2 18620.000000
wvZoom -win $_nWave2 13551.228758 21909.702942
wvSetCursor -win $_nWave2 18987.419138 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19173.045151 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19273.813558 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19035.151541 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19188.955952 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19257.902757 -snap {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 19740.530391 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19268.509958 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19767.048393 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19268.509958 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19782.959194 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19273.813558 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19788.262794 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19236.688355 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19751.137591 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19841.298798 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19942.067205 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19846.602398 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 19751.137591 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 18653.292315 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 18738.149921 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 18812.400326 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 18891.954331 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 18971.508337 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19051.062343 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19151.830750 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19210.170354 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19427.617969 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19501.868374 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19592.029580 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19666.279986 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19714.012389 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19782.959194 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19841.298798 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19894.334801 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19957.978006 -snap {("G3" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 18727.542720 31434.969208
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetCursor -win $_nWave2 20251.466328 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 20364.349558 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 20436.917349 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 20509.485140 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 20533.674403 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 20606.242194 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 20694.936161 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 20775.567040 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 20848.134831 -snap {("G3" 2)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 2)}
wvZoom -win $_nWave2 14336.208935 17609.822611
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 17127.920090 -snap {("G4" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
verdiWindowBeDocked -win $_nWave2
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
wvScrollUp -win $_nWave2 1
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 66.469313 31772.331723
wvZoom -win $_nWave2 12620.059506 24449.404111
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAction -pos 44 7 3 -win $_nTrace1 -name "state" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Q" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 19930.834661 -snap {("G4" 10)}
wvSetCursor -win $_nWave2 19998.388025 -snap {("G4" 10)}
wvSetCursor -win $_nWave2 19270.312881 -snap {("G4" 10)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0.spi0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "Q" -win $_nTrace1
srcAction -pos 6 2 0 -win $_nTrace1 -name "Q" -ctrlKey off
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0.spi0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata" -win $_nTrace1
srcAction -pos 11 8 2 -win $_nTrace1 -name "rdata" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "index" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[7-index\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "index" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 20004.622657 -snap {("G5" 7)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 18225.717408 20800.251164
wvSetCursor -win $_nWave2 20130.480327 -snap {("G5" 6)}
wvSetCursor -win $_nWave2 20021.029971 -snap {("G5" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[7-index\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt\[0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "flag" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 11 )} 
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSetPosition -win $_nWave2 {("G5" 11)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 11)}
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSetPosition -win $_nWave2 {("G5" 11)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 11)}
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvSelectSignal -win $_nWave2 {( "G5" 9 )} 
wvSelectSignal -win $_nWave2 {( "G5" 10 )} 
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 10)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "flag" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetCursor -win $_nWave2 19334.923259 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19379.030119 -snap {("G5" 8)}
wvSelectSignal -win $_nWave2 {( "G5" 9 )} 
wvSetCursor -win $_nWave2 19459.075902 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19539.121685 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19413.335455 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19372.495769 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19416.602629 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19462.343077 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19537.488098 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 19579.961370 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19619.167468 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19573.427021 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19416.602629 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19493.381238 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19576.694195 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19656.739978 -snap {("G5" 8)}
wvSetCursor -win $_nWave2 19740.052936 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 19818.465132 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 19895.243740 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 19981.823873 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 19459.075902 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 19537.488098 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 19620.801055 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 19702.480426 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 19780.892621 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 19860.938405 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 19940.984188 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 20014.495621 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 20094.541404 -snap {("G5" 9)}
wvSetCursor -win $_nWave2 19459.075902 -snap {("G5" 9)}
wvScrollUp -win $_nWave2 15
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvScrollUp -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 19419.869804 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19498.282000 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19573.427021 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19658.373566 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19740.052936 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19811.930782 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19900.144502 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19981.823873 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19893.610153 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19823.365894 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19908.312439 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19975.289523 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19901.778090 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19976.923111 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19905.045265 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19978.556698 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19913.213202 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19975.289523 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19906.678852 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 19967.121586 -snap {("G3" 2)}
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcHBSelect "seg_test" -win $_nTrace1
srcHBSelect "spi_flash_tb" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0.spi0" -delim "."
srcDeselectAll -win $_nTrace1
schCreateWindow -delim "." -win $_nSchema1 -scope "spi_flash_tb.test0.ctrl0.spi0"
schSelect -win $_nSchema4 -inst "spi_master\(@1\):FSM0:24:93:FSM"
schPushViewIn -win $_nSchema4
fsmSetCurrentWindow -win $_nState5
fsmResizeWindow 0 28 1253 421 -win $_nState5
fsmResizeWindow 0 28 1253 421 -win $_nState5
fsmResizeWindow 0 28 1253 421 -win $_nState5
fsmSelect -add -state "S_ACK" -win $_nState5
fsmDeselectAll -nonSticky -win $_nState5
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state\[3:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvSetCursor -win $_nWave2 20096.174991 -snap {("G5" 2)}
srcActiveTrace "spi_flash_tb.memory.spi_decoder.s" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 18620 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 11 )} 
wvSelectSignal -win $_nWave2 {( "G5" 12 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSelectSignal -win $_nWave2 {( "G5" 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSelectSignal -win $_nWave2 {( "G5" 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSelectSignal -win $_nWave2 {( "G5" 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvZoom -win $_nWave2 13330.073254 21615.628591
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 18566.375993 -snap {("G6" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 )} 
wvSelectGroup -win $_nWave2 {G7}
wvAddSignal -win $_nWave2 "/spi_flash_tb/memory/s" "/spi_flash_tb/memory/c" \
           "/spi_flash_tb/memory/data_in" "/spi_flash_tb/memory/data_out"
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
verdiWindowBeDocked -win $_nWave2
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ack" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "size" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0.spi0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "req" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 20837.543445 -snap {("G6" 9)}
wvSetCursor -win $_nWave2 20837.543445 -snap {("G6" 9)}
wvSetCursor -win $_nWave2 20837.543445 -snap {("G6" 9)}
srcActiveTrace "spi_flash_tb.test0.ctrl0.spi0.req" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 20140 -TraceValue 0
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
wvZoom -win $_nWave2 10094.077567 100520.189108
wvZoom -win $_nWave2 12217.025617 71372.686149
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 17396.899446 56621.306334
wvZoom -win $_nWave2 17820.005358 39871.289941
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvZoom -win $_nWave2 19261.174337 39745.362554
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 18457.254334 21134.756094
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 19269.339259 -snap {("G6" 5)}
wvSetCursor -win $_nWave2 19412.048744 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19493.597020 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19571.747453 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19660.091419 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19741.639696 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19812.994438 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19901.338405 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19989.682372 -snap {("G6" 3)}
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSetCursor -win $_nWave2 3401.242717 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 3489.586684 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 3584.726340 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 3649.285393 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 3730.833670 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 3815.779791 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 3893.930224 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 3975.478500 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19419.695891 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19497.846323 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19559.007531 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19660.942877 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19735.695464 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19820.641586 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19885.200639 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 19966.748916 -snap {("G6" 3)}
wvZoomAll -win $_nWave2
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetPosition -win $_nWave2 {("G7" 0)}
verdiWindowBeDocked -win $_nWave2
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.debounce0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.debounce0" -delim "."
srcHBSelect "spi_flash_tb" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.memory" -delim "."
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.memory.mem_access" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_to_read" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_to_read" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 197 -pos 3 -win $_nTrace1
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 26
srcDeselectAll -win $_nTrace1
srcSelect -signal "be_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "se_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 207 -pos 7 -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 207 -pos 15 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "se_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "se_enable" -win $_nTrace1
srcAction -pos 204 5 3 -win $_nTrace1 -name "se_enable" -ctrlKey off
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "protect" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "status_register\[1\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "se" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_cpt" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "select_ok" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "status_register\[1\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "c_int" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "select_ok" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "c_int" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "select_ok" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "se" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvZoom -win $_nWave2 8973.785914 20511.510660
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_cpt" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_cpt" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_cpt" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_cpt" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpt" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "only_res" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "only_rdsr" -win $_nTrace1
srcSelect -signal "only_res" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "only_rdsr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "se" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_ok" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1217 1217 48 61 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_cpt" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 4 )} 
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 9)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpt" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_ok" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvSelectSignal -win $_nWave2 {( "G7" 9 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_cpt" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1225 1225 7 14 1 1} -backward
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1225 1225 18 39 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1225 1225 18 42 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1225 1225 16 40 1 1} -backward
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1225 1225 5 41 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "select_ok" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "status_register\[1\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "protect" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G7" 12)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "only_rdsr" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "se_enable" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G7" 11)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "se_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 1245 -pos 3 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 1245 -pos 3 -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 7563.619556 31151.856815
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1250 1250 14 14 22 38}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "se_enable" -win $_nTrace1
srcTraceLoad "spi_flash_tb.memory.spi_decoder.se_enable" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
wvScrollUp -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvSelectSignal -win $_nWave2 {( "G7" 1 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvScrollDown -win $_nWave2 2
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "content\[i\]" -win $_nTrace1
srcAction -pos 209 1 2 -win $_nTrace1 -name "content\[i\]" -ctrlKey off
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvPrevView -win $_nWave2
wvZoom -win $_nWave2 11494.775517 30293.522977
srcDeselectAll -win $_nTrace1
srcSelect -signal "be_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "se_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 207 -pos 7 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 207 -pos 3 -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "content\[i\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 207 -pos 7 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 207 -pos 7 -win $_nTrace1
srcAction -pos 207 7 4 -win $_nTrace1 -name "int_add" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -word -line 50 -pos 1 -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 207 -pos 21 -win $_nTrace1
srcAction -pos 207 21 1 -win $_nTrace1 -name "SSIZE" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 207 -pos 7 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 207 -pos 7 -win $_nTrace1
srcAction -pos 207 7 4 -win $_nTrace1 -name "int_add" -ctrlKey off
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cut_add" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cut_add" -win $_nTrace1
srcAction -pos 178 5 3 -win $_nTrace1 -name "cut_add" -ctrlKey off
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_request" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cut_add" -win $_nTrace1
srcAction -pos 178 5 4 -win $_nTrace1 -name "cut_add" -ctrlKey off
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "se_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "se_enable" -win $_nTrace1
srcAction -pos 204 5 4 -win $_nTrace1 -name "se_enable" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "se_enable" -win $_nTrace1
srcAction -pos 204 5 2 -win $_nTrace1 -name "se_enable" -ctrlKey off
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 1247 -pos 3 -win $_nTrace1
srcAction -pos 1247 3 1 -win $_nTrace1 -name "Tbase" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {69 69 8 8 24 40}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {69 69 8 9 47 1}
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 1245 -pos 3 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 1245 -pos 15 -win $_nTrace1
srcAction -pos 1245 15 1 -win $_nTrace1 -name "TSE" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {66 66 6 7 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {66 66 6 7 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {69 69 6 7 2 1} -backward
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {69 69 8 9 24 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {69 69 6 7 7 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {69 69 6 7 7 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {69 69 6 6 3 7} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {68 69 8 7 3 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {69 69 6 7 2 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 1245 -pos 3 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 1247 -pos 3 -win $_nTrace1
srcAction -pos 1247 3 3 -win $_nTrace1 -name "Tbase" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcAction -pos 68 3 2 -win $_nTrace1 -name "Tbase" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSearchString "Tbase" -win $_nTrace1 -next -case -allfiles -fileType "*.*"
nsMsgSwitchTab -tab search
nsMsgSelect -range {0 1-1}
nsMsgSelect -range {0 1 0-0}
nsMsgSelect -range {0 1 0-0}
nsMsgAction -tab search -index {0 1 0}
nsMsgSelect -range {0 1 0-0}
nsMsgSelect -range {0 2-2}
nsMsgSelect -range {0 2 0-0}
nsMsgSelect -range {0 2 1-1}
nsMsgSelect -range {0 2 3-3}
nsMsgSelect -range {0 2 1-1}
nsMsgSelect -range {0 2 3-3}
nsMsgSelect -range {0 2 1-1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcInvokeExtEditor -win $_nTrace1
srcCloseWindow -win $_nTrace6
fsmResizeWindow 0 28 1253 196 -win $_nState5
verdiDockWidgetSetCurTab -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSearchString "ERROR : tSHSL condition violated" -win $_nTrace1 -next -case \
           -allfiles -fileType "*.*"
nsMsgSelect -range {1 0 0-0}
nsMsgAction -tab search -index {1 0 0}
nsMsgSelect -range {1 0 0-0}
verdiDockWidgetSetCurTab -dock windowDock_nState_5
verdiDockWidgetSetCurTab -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {58 58 2 3 41 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "t_S_rise" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "s" -win $_nTrace1
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
wvGoToTime -win $_nWave2 15580
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
wvZoom -win $_nWave2 15055.161873 16808.598343
wvSetCursor -win $_nWave2 15546.925147 -snap {("G6" 2)}
wvSetMarker -win $_nWave2 15580.000000
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.acdc_watch" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory" -win $_nTrace1
srcHBSelect "aes_test" -win $_nTrace1
srcHBSelect "sram_tb" -win $_nTrace1
srcHBSelect "handshake_tb" -win $_nTrace1
srcHBSelect "clock_tb" -win $_nTrace1
srcHBSelect "fifo_test" -win $_nTrace1
srcHBSelect "i2c_eeprom_tb" -win $_nTrace1
srcHBSelect "i2c_eeprom_tb" -win $_nTrace1
srcHBSelect "rtc_tb" -win $_nTrace1
srcHBSelect "buzzer_pwm_tb" -win $_nTrace1
srcHBSelect "seg_test" -win $_nTrace1
srcSetScope -win $_nTrace1 "seg_test" -delim "."
srcHBSelect "uart_test" -win $_nTrace1
srcHBSelect "uart_test" -win $_nTrace1
srcSetScope -win $_nTrace1 "uart_test" -delim "."
srcHBSelect "aes_top" -win $_nTrace1
srcHBSelect "m25p16_driver" -win $_nTrace1
srcSetScope -win $_nTrace1 "m25p16_driver" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvScrollDown -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G7" 17)}
srcTraceConnectivity "spi_flash_tb.test0.ctrl0.state\[3:0\]" -win $_nTrace1
nsMsgSwitchTab -tab trace
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
schCreateWindow -delim "." -win $_nSchema1 -scope "spi_flash_tb.test0.ctrl0"
schCloseWindow -win $_nSchema7
fsmResizeWindow 0 28 1253 277 -win $_nState5
fsmCloseWindow -win $_nState5
schCloseWindow -win $_nSchema4
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
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSetCursor -win $_nWave2 2547449.468050 -snap {("G7" 9)}
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 4 )} 
wvScrollUp -win $_nWave2 25
wvScrollUp -win $_nWave2 5
wvScrollUp -win $_nWave2 11
wvScrollDown -win $_nWave2 0
wvSelectGroup -win $_nWave2 {G4}
wvSelectGroup -win $_nWave2 {G4}
wvSelectGroup -win $_nWave2 {G5}
wvSelectGroup -win $_nWave2 {G6}
wvScrollDown -win $_nWave2 1
wvSelectGroup -win $_nWave2 {G7}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSelectGroup -win $_nWave2 {G4}
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
wvZoom -win $_nWave2 1408160.797187 3992067.502704
wvZoom -win $_nWave2 2655846.712731 3323137.340361
wvZoom -win $_nWave2 2977213.201544 3099154.636035
wvZoom -win $_nWave2 3011722.008513 3039267.154883
wvZoom -win $_nWave2 3017926.657599 3031122.460587
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 3025177.650865 -snap {("G2" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ready_for_rdata\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ready_for_rdata\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "D" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Q" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 13
wvScrollDown -win $_nWave2 7
wvScrollDown -win $_nWave2 10
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 10
wvScrollUp -win $_nWave2 7
wvScrollUp -win $_nWave2 13
wvScrollDown -win $_nWave2 13
wvScrollUp -win $_nWave2 13
wvSelectSignal -win $_nWave2 {( "G7" 3 )} 
wvScrollDown -win $_nWave2 13
wvScrollDown -win $_nWave2 7
wvScrollDown -win $_nWave2 10
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
wvScrollUp -win $_nWave2 10
wvScrollUp -win $_nWave2 7
wvScrollUp -win $_nWave2 13
wvScrollDown -win $_nWave2 13
wvScrollDown -win $_nWave2 7
wvScrollDown -win $_nWave2 10
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 6
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvCollapseGroup -win $_nWave2 "G7"
wvScrollDown -win $_nWave2 0
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G7" 17)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/state\[2:0\]"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
schCreateWindow -delim "." -win $_nSchema1 -scope "spi_flash_tb.test0"
verdiDockWidgetSetCurTab -dock widgetDock_MTB_SOURCE_TAB_1
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetCursor -win $_nWave2 3025144.158980 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 3025278.126523 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 3025135.786008 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 3025244.634637 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 3025068.802237 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 3025253.007608 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 3025169.277894 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 3025269.753551 -snap {("G3" 2)}
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 525508.612678
wvZoom -win $_nWave2 0.000000 43681.236206
wvZoom -win $_nWave2 16934.793986 24556.837106
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 19875.277626 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 20063.894175 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 19880.113948 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 20034.876245 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 19870.441304 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 20015.530958 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 19870.441304 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 20030.039923 -snap {("G3" 5)}
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
wvZoom -win $_nWave2 2114851.733947 3870819.537284
wvZoom -win $_nWave2 2705373.901312 3190047.755660
wvZoom -win $_nWave2 2927106.038993 3092251.889110
wvZoom -win $_nWave2 3001924.653829 3039753.113152
wvZoom -win $_nWave2 3014910.184599 3032456.252978
wvSetCursor -win $_nWave2 3019207.635356 -snap {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetCursor -win $_nWave2 3019831.099714 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 3019909.032759 -snap {("G3" 2)}
wvZoom -win $_nWave2 3022670.089205 3024317.816438
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvExpandGroup -win $_nWave2 "G4"
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvScrollDown -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectGroup -win $_nWave2 {G5}
wvScrollDown -win $_nWave2 6
wvSelectGroup -win $_nWave2 {G5}
wvSelectGroup -win $_nWave2 {G5}
wvSelectGroup -win $_nWave2 {G6}
wvScrollDown -win $_nWave2 9
wvSelectGroup -win $_nWave2 {G6}
wvSelectGroup -win $_nWave2 {G7}
wvScrollDown -win $_nWave2 17
wvScrollUp -win $_nWave2 16
wvSelectGroup -win $_nWave2 {G4}
wvSelectGroup -win $_nWave2 {G4}
wvScrollDown -win $_nWave2 4
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 3023665.416823 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 3023665.416823 -snap {("G3" 2)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 3019922.483132 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 3019880.662644 -snap {("G3" 2)}
wvSetMarker -win $_nWave2 -keepViewRange -name "0" 3019860.000000 ID_GREEN5 \
           long_dashed
wvSetCursor -win $_nWave2 3020365.780307 -snap {("G3" 4)}
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 57 19 1847 867
wvSetCursor -win $_nWave2 3020407.600795 -snap {("G3" 4)}
wvSetCursor -win $_nWave2 3020332.323916 -snap {("G3" 4)}
wvSetCursor -win $_nWave2 3020390.872600 -snap {("G3" 4)}
wvSetCursor -win $_nWave2 3019178.078443 -snap {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvChangeDisplayAttr -win $_nWave2 -c ID_PURPLE6 -lw 1 -ls solid
wvChangeDisplayAttr -win $_nWave2 -c ID_PURPLE5 -lw 1 -ls solid
wvSetCursor -win $_nWave2 3023585.957895 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 3025124.951859 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 3023652.870676 -snap {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvSelectSignal -win $_nWave2 {( "G7" 12 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvResizeWindow -win $_nWave2 67 27 1847 869
verdiWindowBeDocked -win $_nWave2
verdiWindowResize -win $_Verdi_1 "297" "103" "1385" "642"
verdiWindowResize -win $_Verdi_1 "67" "27" "1847" "869"
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvScrollUp -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 5 )} 
srcDeselectAll -win $_nTrace1
wvSelectGroup -win $_nWave2 {G7}
wvSelectGroup -win $_nWave2 {G7}
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvScrollUp -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 33
wvSelectSignal -win $_nWave2 {( "G7" 12 )} 
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G3" 1)}
srcTraceConnectivity "spi_flash_tb.memory.mem_access.pp_enable" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 17 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcTraceLoad "spi_flash_tb.memory.mem_access.pp_enable" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 187 -pos 3 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcAction -pos 184 5 4 -win $_nTrace1 -name "pp_enable" -ctrlKey off
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "select_ok" -win $_nTrace1
wvScrollDown -win $_nWave2 7
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_cpt" -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_cpt" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_cpt" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_cpt" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_cpt" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpt" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "byte_ok" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/memory/spi_decoder/pp"
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 8)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "inhib_pp" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wip" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp" -win $_nTrace1
srcSearchString "Page program cycle is started" -win $_nTrace1 -next -case \
           -allfiles -fileType "*.*"
nsMsgSwitchTab -tab search
nsMsgSelect -range {0 0 0-0}
nsMsgSelect -range {0 0 0-0}
nsMsgAction -tab search -index {0 0 0}
nsMsgSelect -range {0 0 0-0}
nsMsgSelect -range {0 0 1-1}
nsMsgAction -tab search -index {0 0 1}
nsMsgSelect -range {0 0 1-1}
nsMsgSelect -range {0 0 0-0}
nsMsgSelect -range {0 0 0-0}
nsMsgAction -tab search -index {0 0 0}
nsMsgSelect -range {0 0 0-0}
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
wvScrollDown -win $_nWave2 10
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 3022724.455839 3024154.716534
wvSetCursor -win $_nWave2 3023545.766707 -snap {("G7" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcInvokeExtEditor -win $_nTrace1
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
srcSaveAs -win $_nTrace9 -file \
          /home/ft/tree/v1.1/rtl/M25P16_VG_V12/internal_logic.v
srcCloseWindow -win $_nTrace9
verdiDockWidgetSetCurTab -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSearchString "Page program cycle is started" -win $_nTrace1 -next -case \
           -allfiles -fileType "*.*"
srcDeselectAll -win $_nTrace1
debReload
nsMsgSelect -range {0-0}
nsMsgSwitchTab -tab trace
nsMsgSwitchTab -tab search
srcDeselectAll -win $_nTrace1
srcSearchString "Page program cycle is started" -win $_nTrace1 -next -case \
           -allfiles -fileType "*.*"
nsMsgSelect -range {0 0 0-0}
nsMsgAction -tab search -index {0 0 0}
nsMsgSelect -range {0 0 0-0}
nsMsgSelect -range {0 0 1-1}
nsMsgAction -tab search -index {0 0 1}
nsMsgSelect -range {0 0 1-1}
nsMsgSelect -range {0 0 0-0}
nsMsgAction -tab search -index {0 0 0}
nsMsgSelect -range {0 0 0-0}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 1315 -pos 3 -win $_nTrace1
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
srcSelect -win $_nTrace1 -range {1316 1317 2 1 1 1}
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
srcSelect -win $_nTrace1 -range {1316 1316 2 6 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcAction -pos 1317 1 6 -win $_nTrace1 -name "pp_enable" -ctrlKey off
nsMsgSelect -range {0 2 5-5}
nsMsgSelect -range {0 2 4-4}
nsMsgSelect -range {0 2 4-4}
nsMsgAction -tab trace -index {0 2 4}
nsMsgSelect -range {0 2 4-4}
srcSearchString "se_enable" -win $_nTrace1 -next -case
srcSearchString "se_enable" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1251 1251 2 3 1 1}
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcTraceLoad "spi_flash_tb.memory.spi_decoder.pp_enable" -win $_nTrace1
nsMsgSwitchTab -tab trace
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "page_add_index" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
wvScrollDown -win $_nWave2 6
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvSelectSignal -win $_nWave2 {( "G7" 12 )} 
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvSetPosition -win $_nWave2 {("G7" 13)}
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSelectSignal -win $_nWave2 {( "G7" 12 )} 
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSelectSignal -win $_nWave2 {( "G7" 12 )} 
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSelectSignal -win $_nWave2 {( "G7" 12 )} 
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSelectSignal -win $_nWave2 {( "G7" 12 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_prog\[page_add_index\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "page_add_index" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_to_write" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 13)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 13)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_prog\[page_add_index\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "page_add_index" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_prog\[page_add_index\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 3023501.297942 -snap {("G7" 15)}
wvSetCursor -win $_nWave2 3023538.506501 -snap {("G7" 15)}
wvSetCursor -win $_nWave2 3023516.725881 -snap {("G7" 15)}
wvZoom -win $_nWave2 3023483.147426 3023561.194647
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcAction -pos 94 4 6 -win $_nTrace1 -name "add_pp_enable" -ctrlKey off
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
nsMsgSelect -range {2 2 2-2}
nsMsgSelect -range {2 2 2-2}
nsMsgAction -tab trace -index {2 2 2}
nsMsgSelect -range {2 2 2-2}
nsMsgSelect -range {1 2-2}
nsMsgClearMsg -tab trace
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcAction -pos 1289 1 4 -win $_nTrace1 -name "pp_enable" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcAction -pos 1285 1 5 -win $_nTrace1 -name "add_pp_enable" -ctrlKey off
nsMsgSelect -range {0 2 1-1}
nsMsgSelect -range {0 2 3-3}
nsMsgSelect -range {0 2 3-3}
nsMsgSelect -range {0 2 4-4}
nsMsgSelect -range {0 2 3-3}
nsMsgSelect -range {1 2 2-2}
nsMsgSelect -range {0 2 1-1}
nsMsgSelect -range {0 2 1-1}
nsMsgAction -tab trace -index {0 2 1}
nsMsgSelect -range {0 2 1-1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "status_register\[1\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inhib_pp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_wel" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inhib_pp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_wel" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inhib_pp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wip" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wip" -win $_nTrace1
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/memory/spi_decoder/pp_enable"
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSelectSignal -win $_nWave2 {( "G7" 12 )} 
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 12)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 10
wvScrollUp -win $_nWave2 7
wvScrollUp -win $_nWave2 13
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvScrollDown -win $_nWave2 13
wvScrollDown -win $_nWave2 7
wvScrollDown -win $_nWave2 10
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvSelectSignal -win $_nWave2 {( "G7" 9 )} 
wvScrollUp -win $_nWave2 10
wvScrollUp -win $_nWave2 7
wvScrollUp -win $_nWave2 13
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1315 1317 1 1 12 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1315 1315 2 8 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wip" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSearchString "se_enable" -win $_nTrace1 -next -case
srcSearchString "se_enable" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "se_enable" -win $_nTrace1
srcAction -pos 51 3 4 -win $_nTrace1 -name "se_enable" -ctrlKey off
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wip" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 13
wvScrollDown -win $_nWave2 7
wvScrollDown -win $_nWave2 10
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 435787.630025
wvZoom -win $_nWave2 0.000000 30140.134310
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 18 )} 
wvSetCursor -win $_nWave2 18550.717183 -snap {("G7" 18)}
wvSetCursor -win $_nWave2 18627.214986 -snap {("G7" 18)}
srcActiveTrace "spi_flash_tb.memory.spi_decoder.se_enable" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 18580 -TraceValue 1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
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
srcSelect -win $_nTrace1 -range {1248 1250 1 1 20 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "se_enable" -win $_nTrace1
srcSelect -signal "wip" -win $_nTrace1
srcSelect -signal "inhib_se" -win $_nTrace1
srcSelect -signal "reset_wel" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 13)}
wvSetPosition -win $_nWave2 {("G7" 14)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 19)}
wvSetPosition -win $_nWave2 {("G7" 18)}
wvSetPosition -win $_nWave2 {("G7" 17)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/memory/spi_decoder/se_enable" \
           "/spi_flash_tb/memory/spi_decoder/wip" \
           "/spi_flash_tb/memory/spi_decoder/inhib_se" \
           "/spi_flash_tb/memory/spi_decoder/reset_wel"
wvSetPosition -win $_nWave2 {("G7" 17)}
wvSetPosition -win $_nWave2 {("G7" 21)}
wvChangeDisplayAttr -win $_nWave2 -c ID_YELLOW5 -lw 1 -ls solid
wvSelectSignal -win $_nWave2 {( "G7" 18 )} 
wvSelectSignal -win $_nWave2 {( "G7" 19 )} 
wvSelectSignal -win $_nWave2 {( "G7" 20 )} 
wvSelectSignal -win $_nWave2 {( "G7" 21 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1244 1246 1 1 15 1}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1243 1243 12 14 1 39}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1243 1246 2 1 1 1} -backward
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1250 1255 2 1 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1246 1250 1 1 14 1} -backward
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvSelectSignal -win $_nWave2 {( "G7" 12 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvScrollUp -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSetPosition -win $_nWave2 {("G7" 11)}
wvZoom -win $_nWave2 2856733.948420 3640071.449272
wvSetCursor -win $_nWave2 3530225.264191 -snap {("G7" 12)}
wvSetCursor -win $_nWave2 3529728.222629 -snap {("G7" 12)}
srcActiveTrace "spi_flash_tb.memory.spi_decoder.pp_enable" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1314 1316 2 1 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSelectSignal -win $_nWave2 {( "G7" 9 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvAddSignal -win $_nWave2 "/BLANK"
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvAddSignal -win $_nWave2 "/BLANK"
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 8)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 3028213.287122 -snap {("G7" 9)}
wvSetCursor -win $_nWave2 3030201.453368 -snap {("G7" 9)}
srcActiveTrace "spi_flash_tb.memory.spi_decoder.add_pp_enable" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 3028980 -TraceValue 1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 2992923.336259 3090343.482304
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1314 1314 1 14 1 7} -backward
srcDeselectAll -win $_nTrace1
srcSelect -signal "wip" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wip" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inhib_pp" -win $_nTrace1
srcSelect -signal "reset_wel" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvSelectSignal -win $_nWave2 {( "G7" 14 )} 
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvSetCursor -win $_nWave2 3029146.816957 -snap {("G7" 13)}
srcActiveTrace "spi_flash_tb.memory.spi_decoder.inhib_pp" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 3028980 -TraceValue 1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "inhib_pp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1318 1322 1 1 11 1}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSetCursor -win $_nWave2 3526261.546967 -snap {("G7" 11)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {1319 1320 2 1 1 1}
srcDeselectAll -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1115103.641536 4985923.178820
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcAction -pos 1317 1 4 -win $_nTrace1 -name "pp_enable" -ctrlKey off
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G7" 25 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
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
wvScrollUp -win $_nWave2 10
wvScrollDown -win $_nWave2 10
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
wvSetCursor -win $_nWave2 31017772.390838 -snap {("G7" 24)}
wvSelectSignal -win $_nWave2 {( "G7" 24 )} 
wvSetPosition -win $_nWave2 {("G7" 24)}
wvSetPosition -win $_nWave2 {("G7" 23)}
wvSetPosition -win $_nWave2 {("G7" 14)}
wvSetPosition -win $_nWave2 {("G7" 21)}
wvSetPosition -win $_nWave2 {("G7" 19)}
wvSetPosition -win $_nWave2 {("G7" 18)}
wvSetPosition -win $_nWave2 {("G7" 16)}
wvSetPosition -win $_nWave2 {("G7" 15)}
wvSetPosition -win $_nWave2 {("G7" 14)}
srcTraceConnectivity "spi_flash_tb.memory.spi_decoder.reset_wel" -win $_nTrace1
nsMsgSwitchTab -tab trace
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcAction -pos 1317 1 3 -win $_nTrace1 -name "pp_enable" -ctrlKey off
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp" -win $_nTrace1
srcAction -pos 1276 5 1 -win $_nTrace1 -name "pp" -ctrlKey off
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced -scope
srcHBSelect "spi_flash_tb.memory.spi_decoder.decode" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.spi_decoder.decode" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcAction -pos 1280 1 3 -win $_nTrace1 -name "pp_enable" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcAction -pos 1280 1 3 -win $_nTrace1 -name "pp_enable" -ctrlKey off
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcPrevTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcTraceLoad "spi_flash_tb.memory.spi_decoder.pp_enable" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
wvZoom -win $_nWave2 21532999.015127 39348992.247881
wvZoom -win $_nWave2 29242711.822695 30701000.608878
wvZoom -win $_nWave2 29988511.798365 30077341.572143
wvZoom -win $_nWave2 30018441.119347 30027346.642353
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 10
wvScrollUp -win $_nWave2 7
wvScrollUp -win $_nWave2 13
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 30023379.842124 -snap {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 3 4 5 )} 
wvCopy -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvPaste -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvScrollDown -win $_nWave2 20
wvScrollDown -win $_nWave2 7
wvScrollDown -win $_nWave2 12
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvSelectSignal -win $_nWave2 {( "G7" 9 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvSelectSignal -win $_nWave2 {( "G7" 14 )} 
wvSelectSignal -win $_nWave2 {( "G7" 15 )} 
wvSelectSignal -win $_nWave2 {( "G7" 14 )} 
wvSelectSignal -win $_nWave2 {( "G7" 15 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 30022735.660891 30024074.879769
wvSetCursor -win $_nWave2 30023269.309022 -snap {("G7" 22)}
wvSetCursor -win $_nWave2 30023269.309022 -snap {("G7" 22)}
srcActiveTrace "spi_flash_tb.memory.mem_access.p_prog\[0:255\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 30023260 -TraceValue \
           00100100, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 22 )} 
wvSetCursor -win $_nWave2 30023299.050558 -snap {("G7" 22)}
srcActiveTrace "spi_flash_tb.memory.mem_access.p_prog\[0:255\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 30023260 -TraceValue \
           00100100, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111, 11111111
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_prog\[i\]" -win $_nTrace1
srcAction -pos 69 1 1 -win $_nTrace1 -name "p_prog\[i\]" -ctrlKey off
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "page_add_index" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "page_add_index" -win $_nTrace1
srcAction -pos 89 3 5 -win $_nTrace1 -name "page_add_index" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_to_write" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.spi_decoder.decode" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.mem_access" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvSetPosition -win $_nWave2 {("G7" 16)}
wvSetPosition -win $_nWave2 {("G7" 15)}
wvSetPosition -win $_nWave2 {("G7" 14)}
wvSetPosition -win $_nWave2 {("G7" 13)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 13)}
wvSetPosition -win $_nWave2 {("G7" 14)}
wvSelectSignal -win $_nWave2 {( "G7" 15 )} 
wvScrollDown -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvSelectSignal -win $_nWave2 {( "G7" 17 )} 
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvScrollUp -win $_nWave2 24
wvScrollDown -win $_nWave2 24
wvSelectSignal -win $_nWave2 {( "G7" 15 )} 
wvSelectSignal -win $_nWave2 {( "G7" 14 )} 
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvSelectSignal -win $_nWave2 {( "G7" 14 )} 
wvSelectSignal -win $_nWave2 {( "G7" 15 )} 
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvSetPosition -win $_nWave2 {("G7" 16)}
wvSetPosition -win $_nWave2 {("G7" 14)}
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 14)}
srcTraceConnectivity "spi_flash_tb.memory.spi_decoder.wip" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wip" -win $_nTrace1
srcAction -pos 237 1 1 -win $_nTrace1 -name "wip" -ctrlKey off
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcNextTraced
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
wvScrollDown -win $_nWave2 4
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wip" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wip" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvSelectSignal -win $_nWave2 {( "G7" 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G7" 15 )} 
wvSelectSignal -win $_nWave2 {( "G7" 15 16 17 18 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 14)}
wvSelectSignal -win $_nWave2 {( "G7" 14 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 14)}
wvSetPosition -win $_nWave2 {("G7" 13)}
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvSetCursor -win $_nWave2 30023259.111924 -snap {("G7" 13)}
srcActiveTrace "spi_flash_tb.memory.spi_decoder.add_pp_enable" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
wvSetCursor -win $_nWave2 30023295.651525 -snap {("G7" 13)}
srcActiveTrace "spi_flash_tb.memory.spi_decoder.add_pp_enable" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 30023260 -TraceValue 1
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inhib_pp" -win $_nTrace1
srcSelect -signal "add_pp_enable" -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 16)}
wvSetPosition -win $_nWave2 {("G7" 15)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G7" 15)}
wvSetPosition -win $_nWave2 {("G7" 14)}
wvSetPosition -win $_nWave2 {("G7" 13)}
wvSetPosition -win $_nWave2 {("G7" 12)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 13)}
wvSetPosition -win $_nWave2 {("G7" 16)}
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvAddSignal -win $_nWave2 "/BLANK"
wvSetPosition -win $_nWave2 {("G7" 16)}
wvSetPosition -win $_nWave2 {("G7" 17)}
wvSetCursor -win $_nWave2 30023263.360714 -snap {("G7" 14)}
wvSetCursor -win $_nWave2 30023256.562649 -snap {("G7" 14)}
srcActiveTrace "spi_flash_tb.memory.spi_decoder.inhib_pp" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
wvSetCursor -win $_nWave2 30023259.111924 -snap {("G7" 15)}
srcActiveTrace "spi_flash_tb.memory.spi_decoder.add_pp_enable" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "status_register\[1\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "status_register\[1\]" -win $_nTrace1
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
srcSelect -signal "add_pp_enable" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 14 )} 
wvSelectSignal -win $_nWave2 {( "G7" 15 )} 
wvSetCursor -win $_nWave2 30023261.661198 -snap {("G7" 15)}
srcActiveTrace "spi_flash_tb.memory.spi_decoder.add_pp_enable" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 21 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 0.000000 9869291.215266
wvZoom -win $_nWave2 0.000000 4045407.439760
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G7" 30 )} 
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
wvZoom -win $_nWave2 2613086.785327 3413954.248021
wvZoom -win $_nWave2 2954573.419166 3060271.662973
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 10
wvScrollUp -win $_nWave2 7
wvScrollUp -win $_nWave2 13
wvZoom -win $_nWave2 3001185.271605 3047662.989219
wvScrollDown -win $_nWave2 31
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 10
wvScrollUp -win $_nWave2 7
wvScrollUp -win $_nWave2 13
wvZoom -win $_nWave2 3017877.142271 3028759.298235
wvScrollDown -win $_nWave2 13
wvScrollDown -win $_nWave2 7
wvGoToTime -win $_nWave2 3028980
srcDeselectAll -win $_nTrace1
srcSearchString "WARNING : Instruction canceled because the chip is deselected" \
           -win $_nTrace1 -next -case -allfiles -fileType "*.*"
nsMsgSwitchTab -tab search
nsMsgSelect -range {0 0 0-0}
nsMsgAction -tab search -index {0 0 0}
nsMsgSelect -range {0 0 0-0}
nsMsgSelect -range {0 0 1-1}
nsMsgAction -tab search -index {0 0 1}
nsMsgSelect -range {0 0 1-1}
nsMsgSelect -range {0 0 2-2}
nsMsgAction -tab search -index {0 0 2}
nsMsgSelect -range {0 0 2-2}
nsMsgSelect -range {0 0 3-3}
nsMsgAction -tab search -index {0 0 3}
nsMsgSelect -range {0 0 3-3}
nsMsgSelect -range {0 0 4-4}
nsMsgAction -tab search -index {0 0 4}
nsMsgSelect -range {0 0 4-4}
nsMsgSelect -range {0 0 5-5}
nsMsgAction -tab search -index {0 0 5}
nsMsgSelect -range {0 0 5-5}
nsMsgSelect -range {0 0 4-4}
nsMsgAction -tab search -index {0 0 4}
nsMsgSelect -range {0 0 4-4}
srcInvokeExtEditor -win $_nTrace1
nsMsgSelect -range {0 0 5-5}
nsMsgAction -tab search -index {0 0 5}
nsMsgSelect -range {0 0 5-5}
verdiDockWidgetSetCurTab -dock windowDock_nEditor_10
srcSaveAs -win $_nTrace10 -file \
          /home/ft/tree/v1.1/rtl/M25P16_VG_V12/internal_logic.v
srcCloseWindow -win $_nTrace10
verdiDockWidgetSetCurTab -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
nsMsgSwitchTab -tab trace
nsMsgSwitchTab -tab search
srcDeselectAll -win $_nTrace1
srcSelect -signal "pp_enable" -win $_nTrace1
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
wvScrollDown -win $_nWave2 10
wvSelectSignal -win $_nWave2 {( "G7" 9 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 0.000000 8972082.922970
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 2607369.275838 3392995.826199
wvZoom -win $_nWave2 2980741.284860 3063989.783534
wvZoom -win $_nWave2 3013121.570195 3033141.355091
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 10
wvScrollUp -win $_nWave2 7
wvScrollDown -win $_nWave2 7
wvScrollDown -win $_nWave2 10
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 10
wvScrollUp -win $_nWave2 7
wvScrollUp -win $_nWave2 13
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
wvScrollDown -win $_nWave2 13
wvScrollDown -win $_nWave2 7
wvScrollDown -win $_nWave2 10
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 3026002.320121 -snap {("G7" 13)}
wvSetCursor -win $_nWave2 3026002.320121 -snap {("G7" 13)}
srcActiveTrace "spi_flash_tb.memory.spi_decoder.pp" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 3023500 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "spi_flash_tb.memory.spi_decoder.decode" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_op" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 16)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 12)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/memory/spi_decoder/write_op"
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 13)}
wvSetCursor -win $_nWave2 3020552.772075 -snap {("G7" 14)}
wvSetCursor -win $_nWave2 3020489.257529 -snap {("G7" 14)}
srcActiveTrace "spi_flash_tb.memory.spi_decoder.pp" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 3020460 -TraceValue 1
srcHBSelect "spi_flash_tb.memory.spi_decoder.decode" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_latch" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 16)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 12)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/memory/spi_decoder/data_latch\[7:0\]"
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 13)}
wvSetCursor -win $_nWave2 3020501.960438 -snap {("G7" 14)}
wvSetCursor -win $_nWave2 3026015.023031 -snap {("G7" 15)}
wvSetCursor -win $_nWave2 3025989.617212 -snap {("G7" 13)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 10
wvScrollUp -win $_nWave2 7
wvScrollUp -win $_nWave2 13
wvZoom -win $_nWave2 3024452.565199 3027285.313950
wvSetCursor -win $_nWave2 3025257.813575 -snap {("G7" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3018521.048143 3020994.311012
wvSetCursor -win $_nWave2 3019128.378556 -snap {("G7" 2)}
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
wvZoom -win $_nWave2 0.000000 2828307.914506
wvZoom -win $_nWave2 0.000000 143568.929670
wvZoom -win $_nWave2 0.000000 19950.251014
wvZoom -win $_nWave2 0.000000 4835.657289
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12076.869980 18508.048710
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17073.636931 19783.219848
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
wvZoom -win $_nWave2 2697149.094326 3204184.955401
wvZoom -win $_nWave2 3001821.023538 3044931.940659
wvZoom -win $_nWave2 3016318.984244 3023349.127455
wvSetCursor -win $_nWave2 3019044.502963 -snap {("G7" 1)}
wvSetCursor -win $_nWave2 3019205.089991 -snap {("G7" 1)}
wvSetCursor -win $_nWave2 3019129.257228 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 3019173.864736 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 3019227.393745 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 3019289.844256 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 3019370.137770 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 3019432.588280 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 3019468.274286 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 3019544.107049 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 3019615.479062 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 3019709.154828 -snap {("G7" 2)}
wvSetCursor -win $_nWave2 3019173.864736 -snap {("G7" 1)}
srcActiveTrace "spi_flash_tb.memory.s" -win $_nTrace1 -TraceByDConWave -TraceTime \
           3019060 -TraceValue 1
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcHBSelect "spi_flash_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb" -delim "."
srcDeselectAll -win $_nTrace1
wvGoToTime -win $_nWave2 15860
srcFindScope -open -win $_nTrace1
srcFindScope -selectscope 1
srcSearchString "ERROR : tCHDX condition violated" -win $_nTrace1 -next -case \
           -allfiles -fileType "*.*"
nsMsgSwitchTab -tab search
nsMsgSelect -range {0 0 0-0}
nsMsgSelect -range {0 0 0-0}
nsMsgAction -tab search -index {0 0 0}
nsMsgSelect -range {0 0 0-0}
srcDeselectAll -win $_nTrace1
srcSelect -signal "t_C_rise" -win $_nTrace1
srcAction -pos 204 10 5 -win $_nTrace1 -name "t_C_rise" -ctrlKey off
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
nsMsgSwitchTab -tab cmpl
nsMsgSwitchTab -tab general
nsMsgSwitchTab -tab cmpl
nsMsgSwitchTab -tab trace
srcShowCalling -win $_nTrace1
srcSelect -win $_nTrace1 -range {226 226 6 7 1 1}
srcHBSelect "spi_flash_tb.memory.acdc_watch" -win $_nTrace1
srcShowCalling -win $_nTrace1
srcSelect -win $_nTrace1 -range {54 54 4 5 1 1}
srcHBSelect "spi_flash_tb.memory" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.acdc_watch" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.acdc_watch" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.acdc_watch.c_high_watch" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.acdc_watch.c_high_watch" -win $_nTrace1
srcHBSelect "spi_flash_tb.memory.acdc_watch.d_watch" -win $_nTrace1
srcSearchString "ERROR : tSHSL condition violated" -win $_nTrace1 -next -case \
           -allfiles -fileType "*.*"
nsMsgSwitchTab -tab search
srcDeselectAll -win $_nTrace1
srcSelect -word -line 204 -pos 16 -win $_nTrace1
srcAction -pos 204 16 2 -win $_nTrace1 -name "TCHDX" -ctrlKey off
nsMsgSwitchTab -tab general
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
nsMsgSwitchTab -tab cmpl
nsMsgSwitchTab -tab trace
nsMsgSwitchTab -tab search
nsMsgSwitchTab -tab intercon
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvScrollDown -win $_nWave2 54
wvScrollUp -win $_nWave2 65
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvScrollDown -win $_nWave2 0
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoom -win $_nWave2 640863.065926 26531730.929353
wvZoom -win $_nWave2 16428.215649 4780610.753970
wvZoom -win $_nWave2 0.000000 253928.510926
wvZoom -win $_nWave2 0.000000 28357.498682
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
srcHBSelect "spi_flash_tb.memory.spi_decoder" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.memory.spi_decoder" -delim "."
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ready_for_rdata\[7:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G7" 16)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ready_for_rdata\[7:0\]"
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvZoom -win $_nWave2 14538.616076 19144.910278
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetCursor -win $_nWave2 15620.043014 -snap {("G3" 4)}
wvSetCursor -win $_nWave2 15620.043014 -snap {("G3" 4)}
srcActiveTrace "spi_flash_tb.memory.c" -win $_nTrace1 -TraceByDConWave -TraceTime \
           15460 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
srcDeselectAll -win $_nTrace1
srcHBSelect "spi_flash_tb.test0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0" -delim "."
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcSetScope -win $_nTrace1 "spi_flash_tb.test0.ctrl0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data\[7:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/data\[7:0\]"
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcSearchString "ERROR : False instruction, please retry" -win $_nTrace1 -next \
           -case -allfiles -fileType "*.*"
nsMsgSwitchTab -tab search
nsMsgSelect -range {0 0 0-0}
nsMsgAction -tab search -index {0 0 0}
nsMsgSelect -range {0 0 0-0}
srcDeselectAll -win $_nTrace1
srcSelect -word -line 204 -pos 16 -win $_nTrace1
srcAction -pos 204 16 2 -win $_nTrace1 -name "TCHDX" -ctrlKey off
nsMsgSelect -range {0 0 0-0}
nsMsgAction -tab search -index {0 0 0}
nsMsgSelect -range {0 0 0-0}
srcDeselectAll -win $_nTrace1
srcSelect -signal "t_C_rise" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "t_C_rise" -win $_nTrace1
srcAction -pos 204 10 4 -win $_nTrace1 -name "t_C_rise" -ctrlKey off
nsMsgSwitchTab -tab intercon
nsMsgSwitchTab -tab search
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
srcSearchString "ERROR : False instruction, please retry" -win $_nTrace1 -next \
           -case -allfiles -fileType "*.*"
nsMsgSelect -range {1 0-0}
nsMsgSelect -range {0 0 0-0}
nsMsgSelect -range {0 0 0-0}
nsMsgAction -tab search -index {0 0 0}
nsMsgSelect -range {0 0 0-0}
srcDeselectAll -win $_nTrace1
srcSelect -signal "d" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "s" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "t_C_rise" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "t_C_rise" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "c" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "d" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "t_C_rise" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "d" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "t_C_rise" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "t_C_rise" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {197 198 3 1 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {203 204 3 1 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "t_C_rise" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {205 205 7 11 1 8}
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 0.000000 6408630.659264
wvZoom -win $_nWave2 0.000000 272448.130819
wvZoom -win $_nWave2 0.000000 28178.328251
wvSetCursor -win $_nWave2 357.592998 -snap {("G3" 3)}
wvZoom -win $_nWave2 0.000000 4648.708975
wvSetCursor -win $_nWave2 371.660743 -snap {("G3" 4)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 454.252019 -snap {("G3" 4)}
wvSetCursor -win $_nWave2 533.893607 -snap {("G3" 4)}
wvSetCursor -win $_nWave2 613.535195 -snap {("G3" 4)}
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "d" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "d" -win $_nTrace1
srcAction -pos 196 3 0 -win $_nTrace1 -name "d" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "shift_byte\[7\]" -win $_nTrace1
srcAction -pos 51 6 6 -win $_nTrace1 -name "shift_byte\[7\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "shift_byte\[7:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/shift_byte\[7:0\]"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "D" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/D"
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "shift_byte\[7\]" -win $_nTrace1
srcAction -pos 51 6 3 -win $_nTrace1 -name "shift_byte\[7\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "shift_byte\[7:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/clk"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset_n" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/reset_n"
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt\[0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/clk_cnt\[0\]"
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "req" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/req"
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvSelectSignal -win $_nWave2 {( "G3" 14 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2549285.928869 3781642.159886
wvZoom -win $_nWave2 2917585.284712 3216290.919388
wvZoom -win $_nWave2 2994346.567735 3081721.756558
wvZoom -win $_nWave2 3013196.545018 3042192.245370
wvSetCursor -win $_nWave2 3017961.701358 -snap {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G3" 14 )} 
wvZoom -win $_nWave2 3018072.091080 3030398.943387
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvZoom -win $_nWave2 3019331.369773 3019800.666180
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3019499.315949 3019595.795667
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
wvZoom -win $_nWave2 2631864.848823 3843485.556665
wvZoom -win $_nWave2 2921700.513071 3090835.383455
wvZoom -win $_nWave2 3006160.629183 3039107.586802
wvZoom -win $_nWave2 3017512.277651 3032334.227494
wvZoom -win $_nWave2 3019139.306409 3025167.777126
wvZoom -win $_nWave2 3019361.166372 3023962.848017
wvZoom -win $_nWave2 3019387.445010 3022937.981101
wvZoom -win $_nWave2 3019400.962278 3022388.278812
wvZoom -win $_nWave2 3019423.708343 3021760.866519
wvZoom -win $_nWave2 3019444.469899 3021293.731477
wvZoom -win $_nWave2 3019470.284464 3021021.505153
wvZoom -win $_nWave2 3019475.205849 3020706.536485
wvZoom -win $_nWave2 3019475.987150 3020133.842731
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "req" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/req"
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetCursor -win $_nWave2 3019539.017729 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3019538.182887 -snap {("G3" 11)}
srcActiveTrace "spi_flash_tb.memory.c" -win $_nTrace1 -TraceByDConWave -TraceTime \
           3019380 -TraceValue 0
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetCursor -win $_nWave2 3019459.958181 -snap {("G3" 9)}
srcActiveTrace "spi_flash_tb.test0.ctrl0.spi0.req" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 3018740 -TraceValue 0
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
srcDeselectAll -win $_nTrace1
schCreateWindow -delim "." -win $_nSchema1 -scope "spi_flash_tb.test0.ctrl0"
wvSetCursor -win $_nWave2 3019504.622235 -snap {("G3" 8)}
wvSetCursor -win $_nWave2 3019459.540761 -snap {("G3" 9)}
srcActiveTrace "spi_flash_tb.test0.ctrl0.spi0.req" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 3018740 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 10894672.120749
wvZoom -win $_nWave2 0.000000 4534838.141631
wvZoom -win $_nWave2 31651.789060 2388271.356316
wvZoom -win $_nWave2 517629.808957 1613697.158449
wvZoom -win $_nWave2 518325.283164 1280565.013521
wvZoom -win $_nWave2 3488314.537470 3572470.446786
wvZoom -win $_nWave2 3514960.348858 3532635.225751
wvZoom -win $_nWave2 3522934.230501 3525693.126260
wvZoom -win $_nWave2 3524024.834599 3524985.896636
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 14 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2994412.816507 3119302.096543
wvZoom -win $_nWave2 3008597.576105 3036333.139565
wvZoom -win $_nWave2 3019227.195602 3027340.199889
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3463650.981153 3706135.088952
wvZoom -win $_nWave2 3492576.750357 3552274.614459
wvZoom -win $_nWave2 3521592.336589 3535342.542597
wvZoom -win $_nWave2 3524070.165590 3529374.813593
wvSetCursor -win $_nWave2 3527856.795667 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527934.211216 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528018.358551 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527860.161561 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527947.674789 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527853.429774 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527937.577109 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528008.260871 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528102.505886 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528169.823754 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528250.605196 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528331.386637 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528412.168079 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527870.259241 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527937.577109 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527853.429774 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527930.845322 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527691.866891 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527900.552282 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527853.429774 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527951.040683 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528018.358551 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528105.871779 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528179.921434 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528264.068769 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528341.484318 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528422.265759 -snap {("G3" 11)}
wvSelectSignal -win $_nWave2 {( "G3" 15 )} 
wvSetPosition -win $_nWave2 {("G3" 15)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 9)}
srcTraceConnectivity "spi_flash_tb.test0.ready_for_rdata\[7:0\]" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata\[0\]" -win $_nTrace1
srcAction -pos 229 19 3 -win $_nTrace1 -name "rdata\[0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "flag" -win $_nTrace1
wvSetCursor -win $_nWave2 3528469.388267 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3528432.363439 -snap {("G3" 11)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt\[0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcAction -pos 65 7 1 -win $_nTrace1 -name "clk" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "spi_flash_tb" -win $_nTrace1
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "flag" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt\[0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/clk_cnt\[0\]"
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 3528509.778988 -snap {("G3" 10)}
wvSetCursor -win $_nWave2 3528496.315414 -snap {("G3" 10)}
srcActiveTrace "spi_flash_tb.test0.ctrl0.spi0.clk_cnt\[0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 3528460 -TraceValue 0
srcHBSelect "spi_flash_tb.test0.ctrl0.spi0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt\[4:0\]" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G3" 15)}
wvSetPosition -win $_nWave2 {("G3" 16)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 16)}
wvSetPosition -win $_nWave2 {("G3" 15)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/clk_cnt\[4:0\]"
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvZoom -win $_nWave2 3527553.865261 3528805.977607
wvSetPosition -win $_nWave2 {("G3" 9)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/state\[1:0\]"
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAction -pos 57 7 2 -win $_nTrace1 -name "state" -ctrlKey off
wvSetCursor -win $_nWave2 3528458.786557 -snap {("G3" 11)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 3528420.651155 -snap {("G3" 12)}
wvSetCursor -win $_nWave2 3528463.553482 -snap {("G3" 11)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 3526807.046984 3529247.712673
wvSetCursor -win $_nWave2 3527338.232473 -snap {("G3" 12)}
wvSetCursor -win $_nWave2 3527415.664760 -snap {("G3" 12)}
wvSetCursor -win $_nWave2 3527499.291630 -snap {("G3" 12)}
wvSetCursor -win $_nWave2 3527579.821208 -snap {("G3" 12)}
wvSetCursor -win $_nWave2 3527652.607558 -snap {("G3" 12)}
wvSetCursor -win $_nWave2 3527740.880366 -snap {("G3" 12)}
wvSetCursor -win $_nWave2 3527813.666715 -snap {("G3" 12)}
wvSetCursor -win $_nWave2 3527889.550357 -snap {("G3" 12)}
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_cnt\[4:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvAddSignal -win $_nWave2 "/spi_flash_tb/test0/ctrl0/spi0/clk"
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetCursor -win $_nWave2 3527745.526304 -snap {("G3" 6)}
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
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G3" 15)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 13)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3524538.416114 3528948.959186
wvSetCursor -win $_nWave2 3527977.856111 -snap {("G3" 19)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata" -win $_nTrace1
srcAction -pos 11 8 4 -win $_nTrace1 -name "rdata" -ctrlKey off
wvSetCursor -win $_nWave2 3527331.386917 -snap {("G3" 15)}
wvSetCursor -win $_nWave2 3527420.941091 -snap {("G3" 15)}
wvSetCursor -win $_nWave2 3527496.502425 -snap {("G3" 15)}
wvSetCursor -win $_nWave2 3527574.862327 -snap {("G3" 15)}
wvSetCursor -win $_nWave2 3527642.027958 -snap {("G3" 15)}
wvSetCursor -win $_nWave2 3527737.179268 -snap {("G3" 15)}
wvSetCursor -win $_nWave2 3527823.934874 -snap {("G3" 15)}
wvSetCursor -win $_nWave2 3527902.294776 -snap {("G3" 15)}
wvSetCursor -win $_nWave2 3527336.984052 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527415.343955 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527499.300993 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527572.063759 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527656.020798 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527737.179268 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527815.539170 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527888.301936 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527972.258975 -snap {("G3" 11)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 3527893.899073 -snap {("G3" 11)}
srcDeselectAll -win $_nTrace1
debReload
wvSetCursor -win $_nWave2 3527336.984053 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527415.343955 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527490.905290 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527577.660896 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527656.020798 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527734.380700 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527821.136307 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 3527342.581189 -snap {("G3" 15)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
