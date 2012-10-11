#! /bin/bash
clear
echo "Installing the software..."

echo "Enter your password:"
read usrPass

echo "$usrPass" | sudo -S apt-get -y install subversion

relativeDir=`dirname $BASH_SOURCE`
#enter project root-folder all the time
cd $relativeDir

#get the absolute path to project folder
export PRJ_DIR=`pwd`
echo "project dir $PRJ_DIR"

#remove this file
rm $BASH_SOURCE

#is there a proxy? svn may not be configured
if [ -n "$http_proxy" ]; then
    echo "prxy is set: $http_proxy"
    tmp=`echo -n ${http_proxy} | cut -d/ -f3`
    host=`echo $tmp | cut -d: -f1`
    port=`echo $tmp | cut -d: -f2`    
    svnConfigFile="$HOME/.subversion/servers"
    if [ `cat $svnConfigFile | grep -c $host` -eq 0 ];then
        echo "proxy is not set for svn"
        echo "http-proxy-host = $host" >> $svnConfigFile
        echo "http-proxy-port = $port" >> $svnConfigFile
        echo "$svnConfigFile was configured with your proxy settings"
    else
        echo "proxy settings are already applied for svn"
    fi
else
    echo '$http_proxy is not set'
fi

#we will download the program in the same folder where this file is
svn checkout http://in005-project.googlecode.com/svn/trunk/ $PRJ_DIR
echo Your files were downloaded in $PRJ_DIR

#make scripts executabile
chmod +x startup.sh
chmod +x bash/*

#install dependencies.sh
source bash/dependencies.sh "$usrPass"

#compile cpp files
bash/compile.sh

#modify ~/.bashrc
username=`whoami`
echo "${PRJ_DIR}/startup.sh" >> /home/${username}/.bashrc
echo Your ~/.bashrc file was modified

echo Finished installing the software!
