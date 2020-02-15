  .org 0x0         ## 允许程序从地址 0x0 开始
  .global _start   ## 定义一个全剧符号 _start
  .set noat        ## 允许自由使用寄存器 $1
_start:
  ori $1,$0,0x1100
  ori $2,$0,0x0020
  ori $3,$0,0xff00
  ori $4,$0,0xffff
  ori $5,$0,0xf0f0
