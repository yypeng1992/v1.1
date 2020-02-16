# 使用说明
## 安装 mips 编译器
按照下面的过程安装 `mips 编译器`。

1. 在 terminal 中运行：
>`sudo apt-get update`

2. 在 terminal 中运行：
>`sudo apt-get install emdebian-archive-keyring`

3. 在 terminal 中运行： 
>`sudo apt-get install linux-libc-dev-mips-cross libc6-mips-cross \`
>`libc6-dev-mips-cross binutils-mips-linux-gnu gcc-mips-linux-gnu \`
>`g++-mips-linux-gnu`

4. 在 terminal 中运行以下命令，输出若为 **mips-linux-gnu**，则说明安装成功。
> `mips-linux-gnu-gcc -dumpmachine`

**注意**：前 3 步中需要输入用户密码。
 

## 目录层次
	---- mips_tools
			|
			|-- Bin2Mem.pl          perl脚本（禁止修改）
			|-- ram.ld              链接规则（禁止修改）
			|-- Makefile            makefile 文件（禁止修改）
			|-- inst_rom.S          汇编文件（可修改）
			|-- inst_rom.data       verilog 仿真中使用的指令数据（自动生成）
			|


## 使用方法
1. 修改汇编文件 `inst_rom.S`。
2. 在 `mips_tools` 目录下运行命令 `make all` 生成目标文件 `inst_rom.data`。

## 常用命令
命令 | 功能 |
:-: | :-: 
`make all` |  生成目标文件 `inst_rom.data`， 但保留临时文件 |
`make clean` | 删除临时文件 |
`make clean-all` | 删除临时文件和目标文件 |
