#! /bin/bash
clear
echo Installing the software... 

relativeDir=`dirname $BASH_SOURCE`
#we will stay in our project root-folder all the time
cd $relativeDir

#get the absolute path to project folder
export PRJ_DIR=`pwd`
echo "project dir $PRJ_DIR"

#remove this file
rm $BASH_SOURCE

#we will download the program in the same folder where this file is
svn checkout http://in005-project.googlecode.com/svn/trunk/ $PRJ_DIR
echo Your files were downloaded in $PRJ_DIR

#modify ~/.bashrc
username=`whoami`
echo "source ${PRJ_DIR}/startup.bash" >> /home/${username}/.bashrc
echo Your ~/.bashrc file was modified

#compile 
source ${PRJ_DIR}/bash/compile.sh

echo Finished installing the software!
