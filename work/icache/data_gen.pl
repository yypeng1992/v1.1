#!/usr/bin/perl -w

use strict;
use warnings;

my $file = "initmemory.txt";
my $random_enable = 0;
open(my $FOO, ">", "$file") or die "Can not open file to write!$!\n";
my $length = 8192*256;
my $line_byte_num = 256;
my $byte_addr = 0;

my $num;
my $NUM;
my $cnt=0;
while($byte_addr < $length) {
	$num = ($random_enable == 0) ? $byte_addr : int(rand(2**8));
	$NUM = sprintf("%02x", $num);
	print $FOO "$NUM ";
	$byte_addr += 1;
	$cnt += 1;
	if($cnt==256) {
		$cnt = 0;
		print $FOO "\n";
	}
}

sub GetByte{
	my($random_ena, $addr) = (shift, shift);
	my $NUM = sprintf("%02x", (
	                            ($random_ena == 0) ? $addr : int(rand(2**8))
	                          ));
	return $NUM;
}

close($FOO);
print ">>>> data gen done <<<<\n";
