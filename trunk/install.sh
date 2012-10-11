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

#make scripts executabile
chmod +x startup.sh
chmod +x bash/*

#install dependencies.sh
source dependencies.sh

#compile cpp files
bash/compile.sh

#modify ~/.bashrc
username=`whoami`
echo "${PRJ_DIR}/startup.sh" >> /home/${username}/.bashrc
echo Your ~/.bashrc file was modified

echo Finished installing the software!
