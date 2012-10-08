#! /bin/bash

#we will download the program in the same folder as the install.sh
svn checkout http://in005-project.googlecode.com/svn/trunk/ ./
export PRJ_DIR=`dirname $BASH_SOURCE`
echo Your files were downloaded in $PRJ_DIR

#modify ~/.bashrc
username=`whoami`
echo "source ${PRJ_DIR}/startup.bash" >> /home/${username}/.bashrc
echo Your ~/.bashrc file was modified

#compile 
mkdir ${PRJ_DIR}/bin

