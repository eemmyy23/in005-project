#test if length of "STRING" is non-zero.
if [ -n "$SSH_CLIENT" ];
 then
  relativeDir=`dirname $BASH_SOURCE`
  #we will stay in our project root-folder all the time
  cd $relativeDir
  
  #get the absolute path to project folder
  export PRJ_DIR=`pwd`
  echo "project dir $PRJ_DIR"

  #text that will apear after login
  echo "Robot interface (IN005 PROJECT - RMA - 2012)"

  #run our cpp program
  bin/main-loop
fi
