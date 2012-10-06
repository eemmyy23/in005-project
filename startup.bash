if [ -n "$SSH_CLIENT" ];
  then text=" modified shell"
  export PS1='\[\e[0;31m\]\u@\h:\w${text}$\[\e[m\] '
  echo "Robot interface (IN005 PROJECT - RMA - 2012)"
  export PRJ_PATH='/home/emi/Dropbox/EMI-RMA/googleSVN/in005-project'
  ${PRJ_PATH}/01_create_join
fi

