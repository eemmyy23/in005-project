#test if length of "STRING" is non-zero.
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
  echo "Robot interface (IN005 PROJECT - RMA - 2012)"

  #start the cpp program
	while:
	do
		bin/main-loop
		echo "The main loop program was terminated"
		echo "Retrying to relaunh in 5 seconds ..."
		sleep 5
	done
fi
