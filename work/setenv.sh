source ~/.bashrc

dir=`pwd`
filelist="filelist.vc"
echo "You're working at directory: $dir"

WORK_PATH=~/tree/v1.1
export WORK_PATH
echo "WORK_PATH: $WORK_PATH"

echo "seart to prepare filelist!"
rm -rf $filelist
touch $filelist
for file in `ls $WORK_PATH/vc/*.vc`
do
	cat $file >> $filelist
done
echo "prepare filelist done!"
