#test if length of "STRING" is non-zero.
#SSH_CLIENT=test
trap "echo Not so fast (Please autentificate first)" SIGINT SIGTERM SIGTSTP
if [ -n "$SSH_CLIENT" ];
 then
  relativeDir=`dirname $BASH_SOURCE`
  #we will stay in our project root-folder all the time
  cd $relativeDir
  
  #get the absolute path to project folder
  export PRJ_DIR=`pwd`
  echo "project dir $PRJ_DIR"
  kkt="caca"
  #make sure that all scripts are executabile
  chmod +x bash/*

  #text that will apear after login
  echo "Robot interface (IN005 PROJECT - RMA - 2012)"
  echo "PID: $$"
  #start the main program
	#bin/main-loop
  while true
	do
	bash/main-loop.sh
	done
fi
