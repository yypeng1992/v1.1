#!usr/bin/perl -w
#use strict;


system("CLS");
system("color b");
system("TITLE runing...");

=pod
function:当前脚本实现功能为，提取原配置信息文件中的参数，生成电路中固定格式的配置信息文件！
prlblems:需要考虑下面几个问题..
         -----------------------------------------------
		 1、提取原配置文件中的参数
		 2、识别各个参数的不同表示，转化为统一格式
		 3、数据合成
		 -----------------------------------------------
=cut

##########################
#打开原文件/目标文件
##########################
my $orginal_file = "ddr_cfg_info.vh";
my $result_file  = $orginal_file.".cfg";
open(FIN,"<$orginal_file")||die("Couldn't open file : $orginal_file!!");
open(FOUT,">$result_file")||die("Couldn't open file : $result_file!!");
open(FOO,">log2016")||die("Couldn't open file : $!!!"); ##记录log

##########################
#提取配置通道个数
##########################
my $ddr_ach_num;
my $num_get_flag=0;

##########################
#提取有效配置数据
##########################
my @data_array;

##########################
#配置项分解
##########################
my($cfg_name, $cfg_value);
my %cfg0_info_array=(  ## store the value of every number in cfg_info
	"third_req"        => '0',          ## 1-bit
	"stream"           => '0',          ## 1-bit
	"Broadcast"        => '0',          ## 1-bit
	"Row_Column"       => '0',          ## 1-bit
	"Read_Write"       => '0',          ## 1-bit
	"D2D_FLAG"         => '0',          ## 1-bit
	"ch_cluster_num"   => '000',        ## 3-bits
	"Vr_id"            => '000000000',  ## 9-bits
	"ddr_channel_id"   => '00000'       ## 5-bits
);
my %valid0_array=(   ## record the step of process in getting number value
	"third_req"        => '0',          ## 1-bit
	"stream"           => '0',          ## 1-bit
	"Broadcast"        => '0',          ## 1-bit
	"Row_Column"       => '0',          ## 1-bit
	"Read_Write"       => '0',          ## 1-bit
	"D2D_FLAG"         => '0',          ## 1-bit
	"ch_cluster_num"   => '0',          ## 1-bit
	"Vr_id"            => '0',          ## 1-bit
	"ddr_channel_id"   => '0'           ## 1-bit	
);
my %cfg1_info_array=(
	"ch_data_pos0_1st"  => '00000000',    ## 8-bits
	"ch_data_pos1_1st"  => '00000000',    ## 8-bits
	"ch_data_pos2_1st"  => '00000000',    ## 8-bits
	"ch_data_pos3_1st"  => '00000000'     ## 8-bits
);
my %valid1_array=( 
	"ch_data_pos0_1st"  => '0',    ## 1-bit
	"ch_data_pos1_1st"  => '0',    ## 1-bit
	"ch_data_pos2_1st"  => '0',    ## 1-bit
	"ch_data_pos3_1st"  => '0'     ## 1-bit
);
my %cfg2_info_array=(
	"ch_data_pos4_1st"  => '00000000',    ## 8-bits
	"ch_data_pos5_1st"  => '00000000',    ## 8-bits
	"ch_data_pos6_1st"  => '00000000',    ## 8-bits
	"ch_data_pos7_1st"  => '00000000'     ## 8-bits
);
my %valid2_array=( 
	"ch_data_pos4_1st"  => '0',    ## 1-bit
	"ch_data_pos5_1st"  => '0',    ## 1-bit
	"ch_data_pos6_1st"  => '0',    ## 1-bit
	"ch_data_pos7_1st"  => '0'     ## 1-bit
);  


my %cfg3_info_array=(
	"ch_addr_pos0_1st"  => '00000000',    ## 8-bits
	"ch_addr_pos1_1st"  => '00000000',    ## 8-bits
	"ch_addr_pos2_1st"  => '00000000',    ## 8-bits
	"ch_addr_pos3_1st"  => '00000000'     ## 8-bits
);
my %valid3_array=( 
	"ch_addr_pos0_1st"  => '0',    ## 1-bit
	"ch_addr_pos1_1st"  => '0',    ## 1-bit
	"ch_addr_pos2_1st"  => '0',    ## 1-bit
	"ch_addr_pos3_1st"  => '0'     ## 1-bit
);
my %cfg4_info_array=(
	"ch_addr_pos4_1st"  => '00000000',    ## 8-bits
	"ch_addr_pos5_1st"  => '00000000',    ## 8-bits
	"ch_addr_pos6_1st"  => '00000000',    ## 8-bits
	"ch_addr_pos7_1st"  => '00000000'     ## 8-bits
);
my %valid4_array=( 
	"ch_addr_pos4_1st"  => '0',    ## 1-bit
	"ch_addr_pos5_1st"  => '0',    ## 1-bit
	"ch_addr_pos6_1st"  => '0',    ## 1-bit
	"ch_addr_pos7_1st"  => '0'     ## 1-bit
);  
my %cfg5_info_array=(
	"ch_start_addr"     => '000000000000000000000000000000'     ## 30-bits
);
my %valid5_array=( 
	"ch_start_addr"     => '0'     ## 1-bit
); 
my %cfg6_info_array=( 
	"ch_column_num_1st"  => '00000000000000',    ## 14-bits
	"ch_row_num_1st"     => '0000000000000000'   ## 16-bits
);   
my %valid6_array=( 
	"ch_column_num_1st"  => '0',    ## 1-bit
	"ch_row_num_1st"     => '0'     ## 1-bit
);   
my %cfg7_info_array=( 
	"ch_column_num_2nd"  => '00000000000000',    ## 14-bits
	"ch_row_num_2nd"     => '0000000000000000'   ## 16-bits
);   
my %valid7_array=( 
	"ch_column_num_2nd"  => '0',    ## 1-bit
	"ch_row_num_2nd"     => '0'     ## 1-bit
);   

my %cfg8_info_array=(
	"ch_data_pos0_2nd"  => '000',    ## 3-bits
	"ch_data_pos1_2nd"  => '000',    ## 3-bits
	"ch_data_pos2_2nd"  => '000',    ## 3-bits
	"ch_data_pos3_2nd"  => '000',    ## 3-bits
	"ch_data_pos4_2nd"  => '000',    ## 3-bits
	"ch_data_pos5_2nd"  => '000',    ## 3-bits
	"ch_data_pos6_2nd"  => '000',    ## 3-bits
	"ch_data_pos7_2nd"  => '000'     ## 3-bits
);
my %valid8_array=( 
	"ch_data_pos0_2nd"  => '0',    ## 1-bit
	"ch_data_pos1_2nd"  => '0',    ## 1-bit
	"ch_data_pos2_2nd"  => '0',    ## 1-bit
	"ch_data_pos3_2nd"  => '0',    ## 1-bit
	"ch_data_pos4_2nd"  => '0',    ## 1-bit
	"ch_data_pos5_2nd"  => '0',    ## 1-bit
	"ch_data_pos6_2nd"  => '0',    ## 1-bit
	"ch_data_pos7_2nd"  => '0'     ## 1-bit
);
my %cfg9_info_array=(
	"ch_addr_pos0_2nd"  => '000',    ## 3-bits
	"ch_addr_pos1_2nd"  => '000',    ## 3-bits
	"ch_addr_pos2_2nd"  => '000',    ## 3-bits
	"ch_addr_pos3_2nd"  => '000',    ## 3-bits
	"ch_addr_pos4_2nd"  => '000',    ## 3-bits
	"ch_addr_pos5_2nd"  => '000',    ## 3-bits
	"ch_addr_pos6_2nd"  => '000',    ## 3-bits
	"ch_addr_pos7_2nd"  => '000'     ## 3-bits
);
my %valid9_array=( 
	"ch_addr_pos0_2nd"  => '0',    ## 1-bit
	"ch_addr_pos1_2nd"  => '0',    ## 1-bit
	"ch_addr_pos2_2nd"  => '0',    ## 1-bit
	"ch_addr_pos3_2nd"  => '0',    ## 1-bit
	"ch_addr_pos4_2nd"  => '0',    ## 1-bit
	"ch_addr_pos5_2nd"  => '0',    ## 1-bit
	"ch_addr_pos6_2nd"  => '0',    ## 1-bit
	"ch_addr_pos7_2nd"  => '0'     ## 1-bit
);


my %cfg10_info_array=(
	"ch_circu_times"    => '000000000000000000000000000000'     ## 30-bits
);
my %valid10_array=( 
	"ch_circu_times"    => '0'     ## 1-bit
); 
my %cfg11_info_array=(
	"ch_col_addr_burst"    => '000000000000000000000000000000'     ## 30-bits
);
my %valid11_array=( 
	"ch_col_addr_burst"    => '0'     ## 1-bit
); 
my %cfg12_info_array=(
	"ch_row_addr_burst"    => '000000000000000000000000000000'     ## 30-bits
);
my %valid12_array=( 
	"ch_row_addr_burst"    => '0'     ## 1-bit
); 
my %cfg13_info_array=(
	"ch_2nd_addr_burst"    => '000000000000000000000000000000'     ## 30-bits
);
my %valid13_array=( 
	"ch_2nd_addr_burst"    => '0'     ## 1-bit
); 
my %cfg14_info_array=(
	"ch_access_length"    => '000000000000000000000000000000'     ## 30-bits
);
my %valid14_array=( 
	"ch_access_length"    => '0'     ## 1-bit
); 
# my %cfg15_info_array=(
	# "Resevered"    => '00000000000000000000000000000000'     ## 32-bits
# );
# my %valid15_array=( 
	# "Resevered"    => '0'     ## 1-bit
# ); 


##########################
#数据合成
##########################
my $cfg_info_bin;
my $all_cfg_info_done_flag = 0;

##########################
#屏蔽注释
##########################
my $comment_flag=0;

##########################
#记录日志
##########################
my $log_line = 0;

while(<FIN>){
	s/(^\s*)|(\s*$)//g;
	if($_ eq ''){
	    $log_line = $log_line+1;
		printf FOO "\$log_line=$log_line ----------- space line\n";
		next;
	};   ##忽略空白行
    chomp;
	
	if($comment_flag==0){
		if(m{^/ \* }x){      ##注释头
			if(m{\* /$}x){   ##注释尾
				$comment_flag=0;
				$log_line = $log_line+1;
				printf FOO "\$log_line=$log_line --------------------multiline comment----------immediately done\n";
			}else{
				$comment_flag=1;
				$log_line = $log_line+1;
				printf FOO "\$log_line=$log_line --------------------multiline comment----------start-----\n";
			}
			next;
		}else{              ##无注释头
		    
			s/(.*)(\/\/)(.*)/$1/;       ##去除以//开头的注释
			if($_ eq ''){
				$log_line = $log_line+1;
				printf FOO "\$log_line=$log_line --------------------singleline comment--\n";
				print  "$_\n";
				next;
			}else{
				$log_line = $log_line+1;
				printf FOO "\$log_line=$log_line --------valid ------singleline comment--\n";
				print  "$_\n";
				###################################################################
				######  得到真实有效的原始配置信息数据，插入处理过程
				###################################################################
			    @data_array = split(" ",$_);
				($cfg_name, $cfg_value)= (shift@data_array, shift@data_array);
				if($num_get_flag == 0){
					if($cfg_name eq 'ddr_ach_num'){  ##compare the real name and expection
						$num_get_flag=1;
						$ddr_ach_num = $cfg_value;
						print "-----ddr ach number: $ddr_ach_num\n";
					}
				##}elsif($ddr_ach_num >=1 && $ddr_ach_num <=32){
				}else{
					$cfg_value = &identify($cfg_value);  ### transform

				######## cfg0 start ######
					if($cfg_name eq 'third_req'){
						$cfg0_info_array{'third_req'} = $cfg_value;
						   $valid0_array{'third_req'} = 1;
					}elsif($cfg_name eq 'stream'){
						$cfg0_info_array{'stream'} = $cfg_value;
						   $valid0_array{'stream'} = 1;
					}elsif($cfg_name eq 'Broadcast'){
						$cfg0_info_array{'Broadcast'} = $cfg_value;
						   $valid0_array{'Broadcast'} = 1;
					}elsif($cfg_name eq 'Row_Column'){
						$cfg0_info_array{'Row_Column'} = $cfg_value;
						   $valid0_array{'Row_Column'} = 1;
					}elsif($cfg_name eq 'Read_Write'){
						$cfg0_info_array{'Read_Write'} = $cfg_value;
						   $valid0_array{'Read_Write'} = 1;
					}elsif($cfg_name eq 'D2D_FLAG'){
						$cfg0_info_array{'D2D_FLAG'} = $cfg_value;
						   $valid0_array{'D2D_FLAG'} = 1;
					}elsif($cfg_name eq 'ch_cluster_num'){
						$cfg0_info_array{'ch_cluster_num'} = $cfg_value;
						   $valid0_array{'ch_cluster_num'} = 1;
					}elsif($cfg_name eq 'Vr_id'){
						$cfg0_info_array{'Vr_id'} = $cfg_value;
						   $valid0_array{'Vr_id'} = 1;
					}elsif($cfg_name eq 'ddr_channel_id'){
						$cfg0_info_array{'ddr_channel_id'} = $cfg_value;
						   $valid0_array{'ddr_channel_id'} = 1;
				######## cfg1 start ######
					}elsif ($cfg_name eq 'ch_data_pos0_1st'){
						$cfg1_info_array{'ch_data_pos0_1st'} = $cfg_value;
						   $valid1_array{'ch_data_pos0_1st'} = 1;
					}elsif ($cfg_name eq 'ch_data_pos1_1st'){
						$cfg1_info_array{'ch_data_pos1_1st'} = $cfg_value;
						   $valid1_array{'ch_data_pos1_1st'} = 1
					}elsif ($cfg_name eq 'ch_data_pos2_1st'){
						$cfg1_info_array{'ch_data_pos2_1st'} = $cfg_value;
						   $valid1_array{'ch_data_pos2_1st'} = 1;
					}elsif ($cfg_name eq 'ch_data_pos3_1st'){
						$cfg1_info_array{'ch_data_pos3_1st'} = $cfg_value;
						   $valid1_array{'ch_data_pos3_1st'} = 1;
				######## cfg2 start ######
					}elsif ($cfg_name eq 'ch_data_pos4_1st'){
						$cfg2_info_array{'ch_data_pos4_1st'} = $cfg_value;
						   $valid2_array{'ch_data_pos4_1st'} = 1;
					}elsif ($cfg_name eq 'ch_data_pos5_1st'){
						$cfg2_info_array{'ch_data_pos5_1st'} = $cfg_value;
						   $valid2_array{'ch_data_pos5_1st'} = 1
					}elsif ($cfg_name eq 'ch_data_pos6_1st'){
						$cfg2_info_array{'ch_data_pos6_1st'} = $cfg_value;
						   $valid2_array{'ch_data_pos6_1st'} = 1;
					}elsif ($cfg_name eq 'ch_data_pos7_1st'){
						$cfg2_info_array{'ch_data_pos7_1st'} = $cfg_value;
						   $valid2_array{'ch_data_pos7_1st'} = 1;
				######## cfg3 start ######
					}elsif ($cfg_name eq 'ch_addr_pos0_1st'){
						$cfg3_info_array{'ch_addr_pos0_1st'} = $cfg_value;
						   $valid3_array{'ch_addr_pos0_1st'} = 1;
					}elsif ($cfg_name eq 'ch_addr_pos1_1st'){
						$cfg3_info_array{'ch_addr_pos1_1st'} = $cfg_value;
						   $valid3_array{'ch_addr_pos1_1st'} = 1
					}elsif ($cfg_name eq 'ch_addr_pos2_1st'){
						$cfg3_info_array{'ch_addr_pos2_1st'} = $cfg_value;
						   $valid3_array{'ch_addr_pos2_1st'} = 1;
					}elsif ($cfg_name eq 'ch_addr_pos3_1st'){
						$cfg3_info_array{'ch_addr_pos3_1st'} = $cfg_value;
						   $valid3_array{'ch_addr_pos3_1st'} = 1;
				######## cfg4 start ######
					}elsif ($cfg_name eq 'ch_addr_pos4_1st'){
						$cfg4_info_array{'ch_addr_pos4_1st'} = $cfg_value;
						   $valid4_array{'ch_addr_pos4_1st'} = 1;
					}elsif ($cfg_name eq 'ch_addr_pos5_1st'){
						$cfg4_info_array{'ch_addr_pos5_1st'} = $cfg_value;
						   $valid4_array{'ch_addr_pos5_1st'} = 1
					}elsif ($cfg_name eq 'ch_addr_pos6_1st'){
						$cfg4_info_array{'ch_addr_pos6_1st'} = $cfg_value;
						   $valid4_array{'ch_addr_pos6_1st'} = 1;
					}elsif ($cfg_name eq 'ch_addr_pos7_1st'){
						$cfg4_info_array{'ch_addr_pos7_1st'} = $cfg_value;
						   $valid4_array{'ch_addr_pos7_1st'} = 1;
				######## cfg5 start ######
					}elsif ($cfg_name eq 'ch_start_addr'){
						$cfg5_info_array{'ch_start_addr'} = $cfg_value;
						   $valid5_array{'ch_start_addr'} = 1;
				######## cfg6 start ######
					}elsif ($cfg_name eq 'ch_column_num_1st'){
						$cfg6_info_array{'ch_column_num_1st'} = $cfg_value;
						   $valid6_array{'ch_column_num_1st'} = 1;
					}elsif ($cfg_name eq 'ch_row_num_1st'){
						$cfg6_info_array{'ch_row_num_1st'} = $cfg_value;
						   $valid6_array{'ch_row_num_1st'} = 1;
				######## cfg7 start ######
					}elsif ($cfg_name eq 'ch_column_num_2nd'){
						$cfg7_info_array{'ch_column_num_2nd'} = $cfg_value;
						   $valid7_array{'ch_column_num_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_row_num_2nd'){
						$cfg7_info_array{'ch_row_num_2nd'} = $cfg_value;
						   $valid7_array{'ch_row_num_2nd'} = 1;
				######## cfg8 start ######
					}elsif ($cfg_name eq 'ch_data_pos0_2nd'){
						$cfg8_info_array{'ch_data_pos0_2nd'} = $cfg_value;
						   $valid8_array{'ch_data_pos0_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_data_pos1_2nd'){
						$cfg8_info_array{'ch_data_pos1_2nd'} = $cfg_value;
						   $valid8_array{'ch_data_pos1_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_data_pos2_2nd'){
						$cfg8_info_array{'ch_data_pos2_2nd'} = $cfg_value;
						   $valid8_array{'ch_data_pos2_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_data_pos3_2nd'){
						$cfg8_info_array{'ch_data_pos3_2nd'} = $cfg_value;
						   $valid8_array{'ch_data_pos3_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_data_pos4_2nd'){
						$cfg8_info_array{'ch_data_pos4_2nd'} = $cfg_value;
						   $valid8_array{'ch_data_pos4_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_data_pos5_2nd'){
						$cfg8_info_array{'ch_data_pos5_2nd'} = $cfg_value;
						   $valid8_array{'ch_data_pos5_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_data_pos6_2nd'){
						$cfg8_info_array{'ch_data_pos6_2nd'} = $cfg_value;
						   $valid8_array{'ch_data_pos6_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_data_pos7_2nd'){
						$cfg8_info_array{'ch_data_pos7_2nd'} = $cfg_value;
						   $valid8_array{'ch_data_pos7_2nd'} = 1;
				######## cfg9 start ######
					}elsif ($cfg_name eq 'ch_addr_pos0_2nd'){
						$cfg9_info_array{'ch_addr_pos0_2nd'} = $cfg_value;
						   $valid9_array{'ch_addr_pos0_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_addr_pos1_2nd'){
						$cfg9_info_array{'ch_addr_pos1_2nd'} = $cfg_value;
						   $valid9_array{'ch_addr_pos1_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_addr_pos2_2nd'){
						$cfg9_info_array{'ch_addr_pos2_2nd'} = $cfg_value;
						   $valid9_array{'ch_addr_pos2_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_addr_pos3_2nd'){
						$cfg9_info_array{'ch_addr_pos3_2nd'} = $cfg_value;
						   $valid9_array{'ch_addr_pos3_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_addr_pos4_2nd'){
						$cfg9_info_array{'ch_addr_pos4_2nd'} = $cfg_value;
						   $valid9_array{'ch_addr_pos4_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_addr_pos5_2nd'){
						$cfg9_info_array{'ch_addr_pos5_2nd'} = $cfg_value;
						   $valid9_array{'ch_addr_pos5_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_addr_pos6_2nd'){
						$cfg9_info_array{'ch_addr_pos6_2nd'} = $cfg_value;
						   $valid9_array{'ch_addr_pos6_2nd'} = 1;
					}elsif ($cfg_name eq 'ch_addr_pos7_2nd'){
						$cfg9_info_array{'ch_addr_pos7_2nd'} = $cfg_value;
						   $valid9_array{'ch_addr_pos7_2nd'} = 1;
				######## cfg10 start ######
					}elsif  ($cfg_name eq 'ch_circu_times'){
						$cfg10_info_array{'ch_circu_times'} = $cfg_value;
						   $valid10_array{'ch_circu_times'} = 1;;
				######## cfg11 start ######
					}elsif  ($cfg_name eq 'ch_col_addr_burst'){
						$cfg11_info_array{'ch_col_addr_burst'} = $cfg_value;
						   $valid11_array{'ch_col_addr_burst'} = 1;
				######## cfg12 start ######
					}elsif  ($cfg_name eq 'ch_row_addr_burst'){
						$cfg12_info_array{'ch_row_addr_burst'} = $cfg_value;
						   $valid12_array{'ch_row_addr_burst'} = 1;
				######## cfg13 start ######
					}elsif  ($cfg_name eq 'ch_2nd_addr_burst'){
						$cfg13_info_array{'ch_2nd_addr_burst'} = $cfg_value;
						   $valid13_array{'ch_2nd_addr_burst'} = 1;
				######## cfg14 start ######
					}elsif  ($cfg_name eq 'ch_access_length'){
						$cfg14_info_array{'ch_access_length'} = $cfg_value;
						   $valid14_array{'ch_access_length'} = 1;
					}


				############ together cfg0 ############
					if(&ready(\%valid0_array)==1){
						%valid0_array = &reset(\%valid0_array);
						printf FOO "----------here gets cfg0 info\n";
						$cfg_info_bin = $cfg0_info_array{"third_req"}.
										$cfg0_info_array{"stream"}.
										$cfg0_info_array{"Broadcast"}.
										$cfg0_info_array{"Row_Column"}.
										$cfg0_info_array{"Read_Write"}.
										$cfg0_info_array{"D2D_FLAG"}.
										'000'.
										$cfg0_info_array{"ch_cluster_num"}.
										'000'.
										$cfg0_info_array{"Vr_id"}.
										'000'.
										$cfg0_info_array{"ddr_channel_id"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG0: $cfg_info_bin\n";
					}
				############ together cfg1 ############
					if(&ready(\%valid1_array)==1){
						%valid1_array = &reset(\%valid1_array);
						printf FOO "----------here gets cfg1 info\n";
						$cfg_info_bin = $cfg1_info_array{"ch_data_pos3_1st"}.
										$cfg1_info_array{"ch_data_pos2_1st"}.
										$cfg1_info_array{"ch_data_pos1_1st"}.
										$cfg1_info_array{"ch_data_pos0_1st"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG1: $cfg_info_bin\n";
					}
				############ together cfg2 ############
					if(&ready(\%valid2_array)==1){
						%valid2_array = &reset(\%valid2_array);
						printf FOO "----------here gets cfg2 info\n";
						$cfg_info_bin = $cfg2_info_array{"ch_data_pos7_1st"}.  ## together cfg information
										$cfg2_info_array{"ch_data_pos6_1st"}.
										$cfg2_info_array{"ch_data_pos5_1st"}.
										$cfg2_info_array{"ch_data_pos4_1st"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG2: $cfg_info_bin\n";
					}
				############ together cfg3 ############
					if(&ready(\%valid3_array)==1){
						%valid3_array = &reset(\%valid3_array);
						printf FOO "----------here gets cfg3 info\n";
						$cfg_info_bin = $cfg3_info_array{"ch_addr_pos3_1st"}.
										$cfg3_info_array{"ch_addr_pos2_1st"}.
										$cfg3_info_array{"ch_addr_pos1_1st"}.
										$cfg3_info_array{"ch_addr_pos0_1st"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG3: $cfg_info_bin\n";
					}
				############ together cfg4 ############
					if(&ready(\%valid4_array)==1){
						%valid4_array = &reset(\%valid4_array);
						printf FOO "----------here gets cfg4 info\n";
						$cfg_info_bin = $cfg4_info_array{"ch_addr_pos7_1st"}.  ## together cfg information
										$cfg4_info_array{"ch_addr_pos6_1st"}.
										$cfg4_info_array{"ch_addr_pos5_1st"}.
										$cfg4_info_array{"ch_addr_pos4_1st"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG4: $cfg_info_bin\n";
					}
				############ together cfg5 ############
					if(&ready(\%valid5_array)==1){
						%valid5_array = &reset(\%valid5_array);
						printf FOO "----------here gets cfg5 info\n";
						$cfg_info_bin = '00'.$cfg5_info_array{"ch_start_addr"}; ## together cfg information
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG5: $cfg_info_bin\n";
					}
				############ together cfg6 ############
					if(&ready(\%valid6_array)==1){
						%valid6_array = &reset(\%valid6_array);
						printf FOO "----------here gets cfg6 info\n";
						$cfg_info_bin = '00'.             ## together cfg information
										$cfg6_info_array{"ch_column_num_1st"}.
										$cfg6_info_array{"ch_row_num_1st"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG6: $cfg_info_bin\n";
					}
				############ together cfg7 ############
					if(&ready(\%valid7_array)==1){
						%valid7_array = &reset(\%valid7_array);
						printf FOO "----------here gets cfg7 info\n";
						$cfg_info_bin = '00'.             ## together cfg information
										$cfg7_info_array{"ch_column_num_2nd"}.
										$cfg7_info_array{"ch_row_num_2nd"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG7: $cfg_info_bin\n";
					}
				############ together cfg8 ############
					if(&ready(\%valid8_array)==1){
						%valid8_array = &reset(\%valid8_array);
						printf FOO "----------here gets cfg8 info\n";
						$cfg_info_bin = '00000000'.       ## together cfg information
										$cfg8_info_array{"ch_data_pos7_2nd"}.
										$cfg8_info_array{"ch_data_pos6_2nd"}.
										$cfg8_info_array{"ch_data_pos5_2nd"}.
										$cfg8_info_array{"ch_data_pos4_2nd"}.
										$cfg8_info_array{"ch_data_pos3_2nd"}.
										$cfg8_info_array{"ch_data_pos2_2nd"}.
										$cfg8_info_array{"ch_data_pos1_2nd"}.
										$cfg8_info_array{"ch_data_pos0_2nd"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG8: $cfg_info_bin\n";
					}
				############ together cfg9 ############
					if(&ready(\%valid9_array)==1){
						%valid9_array = &reset(\%valid9_array);
						printf FOO "----------here gets cfg9 info\n";
						$cfg_info_bin = '00000000'.       ## together cfg information
										$cfg9_info_array{"ch_addr_pos7_2nd"}.
										$cfg9_info_array{"ch_addr_pos6_2nd"}.
										$cfg9_info_array{"ch_addr_pos5_2nd"}.
										$cfg9_info_array{"ch_addr_pos4_2nd"}.
										$cfg9_info_array{"ch_addr_pos3_2nd"}.
										$cfg9_info_array{"ch_addr_pos2_2nd"}.
										$cfg9_info_array{"ch_addr_pos1_2nd"}.
										$cfg9_info_array{"ch_addr_pos0_2nd"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG9: $cfg_info_bin\n";
					}
				############ together cfg10 ############
					if(&ready(\%valid10_array)==1){
						%valid10_array = &reset(\%valid10_array);
						printf FOO "----------here gets cfg10 info\n";
						$cfg_info_bin = '00'.             ## together cfg information
										$cfg10_info_array{"ch_circu_times"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG10: $cfg_info_bin\n";
					}
				############ together cfg11 ############
					if(&ready(\%valid11_array)==1){
						%valid11_array = &reset(\%valid11_array);
						printf FOO "----------here gets cfg11 info\n";
						$cfg_info_bin = '00'.             ## together cfg information
										$cfg11_info_array{"ch_col_addr_burst"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG11: $cfg_info_bin\n";
					}
				############ together cfg12 ############
					if(&ready(\%valid12_array)==1){
						%valid12_array = &reset(\%valid12_array);
						printf FOO "----------here gets cfg12 info\n";
						$cfg_info_bin = '00'.             ## together cfg information
										$cfg12_info_array{"ch_row_addr_burst"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG12: $cfg_info_bin\n";
					}
				############ together cfg13 ############
					if(&ready(\%valid13_array)==1){
						%valid13_array = &reset(\%valid13_array);
						printf FOO "----------here gets cfg13 info\n";
						$cfg_info_bin = '00'.             ## together cfg information
										$cfg13_info_array{"ch_2nd_addr_burst"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG13: $cfg_info_bin\n";
					}
				############ together cfg14 ############
					if(&ready(\%valid14_array)==1){
						%valid14_array = &reset(\%valid14_array);
						printf FOO "----------here gets cfg14 info\n";
						$cfg_info_bin = '00'.             ## together cfg information
										$cfg14_info_array{"ch_access_length"};
						printf FOUT "$cfg_info_bin\n";
						printf FOO "CFG14: $cfg_info_bin\n";

						printf FOUT "00000000000000000000000000000000 (default add)\n";
						printf FOO "CFG15: 00000000000000000000000000000000 (default add)\n";
						
						$all_cfg_info_done_flag = 1  if($ddr_ach_num == 0);
						$ddr_ach_num = $ddr_ach_num-1  if($ddr_ach_num != 0);  ## loop control
						if($all_cfg_info_done_flag == 1){
							printf FOUT " end.....\n";
							printf FOO " end......\n";
							last;
						}
					}
				############ together cfg15 ############
					## end ...
					
				}
			}
		}
		
	}else{
			if(m{\* /$}x){
				$comment_flag=0;
				$log_line = $log_line+1;
				printf FOO "\$log_line=$log_line --------------------multiline comment----------end-------\n";
			}else{
				$log_line = $log_line+1;
				printf FOO "\$log_line=$log_line --------------------multiline comment----------go on..---\n";
				next;
			}
	}
}

###### identify the mumber
## recieve orginal value
## return binary value
sub identify{
	my $data = shift;
	my($oct,$bin);
print "in1----\$data = $data\n";
if($data =~ m/(?<WIDTH>\d*)(\'b|B)(?<VALUE>\d*)/){
#	print "bin---matched\n";
	$width = $+{WIDTH};
	$value = $+{VALUE};
	$oct   = oct("0b".$value);
}elsif($data =~ m/(?<WIDTH>\d*)(\'h|H)(?<VALUE>\d*)/){
#	print "hex---matched\n";
	$width = $+{WIDTH};
	$value = $+{VALUE};
	$oct   = oct("0x".$value);
}elsif($data =~ m/(?<WIDTH>\d*)(\'d|D)(?<VALUE>\d*)/){
#	print "oct---matched\n";
	$width = $+{WIDTH};
	$value = $+{VALUE};
	$oct   = $value;
}else{
#	print "oct---matched(default)\n";
	$width = 1;  ## default
	$value = $data;
	$oct   = $value;
}
	return sprintf("%0${width}b",$oct);
}

sub ready{
	my $hashref = shift;
	my @value = values %$hashref;
	return eval join("*",@value);
}

sub reset{
	my $hashref = shift;
	foreach (keys %$hashref){
		$$hashref{$_} = 0;
	}
	return %$hashref;
}
close FIN;
close FOUT;
close FOO;