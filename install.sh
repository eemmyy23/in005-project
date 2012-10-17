#! /bin/bash
clear
echo "Installing the software..."

#linux dist, version 				lsb_release -d


# Autentificate reading the password and pipe-ing it to apt-get
# echo "Assuming that you are an administrator, enter your password:"
# read usrPass
# echo "$usrPass" | sudo -S apt-get -y install subversion
sudo apt-get -y install subversion

#the script assumes that the user wants to install
#in a new random folder in relative to it's current path
#for testing in the development period
relativeDir=`dirname $BASH_SOURCE`"/"`date +%s`
#enter project root-folder all the time
mkdir $relativeDir; cd $relativeDir

#get the absolute path to project folder
export PRJ_DIR=`pwd`
echo "project dir $PRJ_DIR"


#is there a proxy? svn may not be configured
if [ -n "$http_proxy" ]; then
    echo "proxy is set: $http_proxy"
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

#download the program in the new project dir
svn checkout http://in005-project.googlecode.com/svn/trunk/ $PRJ_DIR
echo Your files were downloaded in $PRJ_DIR

#make scripts executabile
chmod +x startup.sh
chmod +x bash/*

#install dependencies.sh
#the password is pass as an argument
bash/dependencies.sh "$usrPass"

#compile cpp files
source bash/compile.sh

#modify ~/.bashrc
echo "${PRJ_DIR}/startup.sh" >> /home/`whoami`/.bashrc
echo Your ~/.bashrc file was modified

#configures the program according to the user preferences

echo Finished installing the software!

bash/setup.sh

./startup.sh
