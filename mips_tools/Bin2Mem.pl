#! /usr/bin/perl -w

use strict;
use Getopt::Long;

my $BinFile = 'inst_rom.bin';
my $MemFile = 'inst_rom.data';

GetOptions(
	"bin=s"  => \$BinFile,
	"mem=s"  => \$MemFile
);

my $err = 0;
unless( -e $BinFile ){
	print "[ERROR] bin file($BinFile) does not exist!\n";
	$err = 1;
}
if( -z $BinFile ){
	print "[WARNING] bin file($BinFile) is empty!\n";
}
die if($err == 1);
`rm -f $MemFile`;


### 读开启(二进制方式)
open(my $FIN, "<$BinFile") or die "Can't open file [$BinFile] :$!\n";
binmode($FIN);

### 定位到文件尾，获取总字节数
seek($FIN, 0, 2);   ### 0:偏移量     0/1/2:文件开头/当前位置/文件尾
my $byte_num = tell($FIN);

### 定位到文件头
seek($FIN, 0, 0);
# print "$BinFile\t byte number:$byte_num\n";


### 写开启
open(my $FOO, ">$MemFile") or die "Can't open file [$MemFile] :$!\n";

my $buff='';
my $data='';
for(my $count=0; $count<$byte_num; $count=$count+4) {
	read($FIN, $buff, 4);
	$data = unpack("H*", $buff);
	print $FOO "\n" unless($count==0);
	print $FOO $data;
}
      
### 关闭文件
close $FIN;
close $FOO;

print ">>>>>>>> Successed to generate $MemFile <<<<<<<\n"

# **********************************************
#   符号    位宽    类型   符号    大小端
#   h/H      8      字串       
#   i/I      32     数字          little-endian
#   l/L      32     数字          little-endian
#   n/N     16/32   数字           big-endian
#   q/Q     64/64   数字          little-endian
#   s/S     16/16   数字          little-endian
#   v/V     16/32   数字          little-endian
# **********************************************
