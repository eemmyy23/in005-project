#test if length of "STRING" is non-zero.

trap "echo Not so fast (Please autentificate first)" SIGINT SIGTERM SIGTSTP

SSH_CLIENT=test
if [ -n "$SSH_CLIENT" ];
 then
  relativeDir=`dirname $BASH_SOURCE`
  #we will stay in our project root-folder all the time
  cd $relativeDir
  
  #get the absolute path to project folder
  export PRJ_DIR=`pwd`
  echo "project dir $PRJ_DIR"
  
  #make sure that all scripts are executabile
  chmod +x bash/*

  #text that will apear after login
	#passed as argument to the childbash
	title="Robot interface (IN005 PROJECT - RMA - 2012)"
	echo $title
  echo "PID: $BASHPID"
  	
	# bin/main-loop 2>/dev/null 1>/dev/null &
	bash/restart.sh updaterOnly
	#start the main program
	#do not permit acces to the shell when exit form main-loop.sh
	echo "starting main-loop.sh"
  while true
	  do
			bash/main-loop.sh "$title"
		done
fi
