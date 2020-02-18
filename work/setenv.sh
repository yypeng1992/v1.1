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
cat $WORK_PATH/vc/rtl.vc    >  $filelist
cat $WORK_PATH/vc/share.vc  >> $filelist
cat $WORK_PATH/vc/sim.vc    >> $filelist

echo "prepare filelist done!"
