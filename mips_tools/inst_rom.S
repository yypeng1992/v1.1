  .org 0x0         ## 允许程序从地址 0x0 开始
  .global _start   ## 定义一个全剧符号 _start
  .set noat        ## 允许自由使用寄存器 $1
  .set noreorder   ## 关闭延迟槽, 防止编译器调整跳转类指令的执行顺序
  .global _start

_start:
	ori $1,$0,0x1234
	sw $1,0x0($0)
	ori $1,$0,0x5678
	sc $1,0x0($0)

	lw $1,0x0($0)
	nop

	ori $1,$0,0x0
	ll $1,0x0($0)

	nop
	addi $1,$1,0x1
	sc $1,0x0($0)
	lw $1,0x0($0)
	




 
