#! /bin/bash
clear
echo Installing the software...

export PRJ_DIR=`dirname $BASH_SOURCE`
rm $BASH_SOURCE
cd $PRJ_DIR

#we will download the program in the same folder as the install.sh
svn checkout http://in005-project.googlecode.com/svn/trunk/ $PRJ_DIR
echo Your files were downloaded in $PRJ_DIR

#modify ~/.bashrc
username=`whoami`
echo "source ${PRJ_DIR}/startup.bash" >> /home/${username}/.bashrc
echo Your ~/.bashrc file was modified

#compile 
source ${PRJ_DIR}/bash/compile.sh

echo Finished installing the software!
