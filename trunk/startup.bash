#test if length of "STRING" is non-zero.
if [ -n "$SSH_CLIENT" ];
 then
  #where is our work folder
  export PRJ_PATH='/home/emi/Dropbox/EMI-RMA/googleSVN/in005-project'

  #enter into the project folder
  cd $PRJ_PATH

  #text that will apear after login
  echo "Robot interface (IN005 PROJECT - RMA - 2012)"

  #run our cpp program
  cpp/startup
fi
