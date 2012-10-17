#! /bin/bash
. bash/ask.sh

#check if file already exists

function questions {
	
	# ther is no validation implemented, so the user is alerted
	echo "Warning pleas check your imput before pressing enter !!!"

	if ask "Do you want the source files too?" N; then
		  source=1
	else
		  source=0
	fi
	
	if ask "Do you want to check for OS updates too?" Y; then
		  osupds=1
	else
		  osupds=0
	fi

	echo -e "How often should the script check for updates?\nProvide an integer value (seconds)\nUse value 0 to disable automatic updates";
	read period
	if [ $period -eq 0 ]; then save; exit 0; fi

	echo -e "What actions do you want to be taken on new updates?\n[di] display only\n[dw] download only\n[dwin] download and install"
	echo 
	read action

	if ask "Do you want the script to silent?" Y; then
		  silent=1
	else
		  silent=0
	fi

	echo -e "Enter your password";
	read pass

	save
	
}

function save {
	echo "#Config file" > config.sh
	echo "source=$source" >> config.sh
	echo "osupds=$osupds" >> config.sh
	echo "period=$period" >> config.sh
	echo "silent=$silent" >> config.sh
	echo "action=$action" >> config.sh
	echo "pass=$pass" >> config.sh
	
	bash/restart.sh updaterOnly

}

#defaults
source=0
osupds=1
period=30 
action=dwin
silent=1
pass=emi

if [ -f "`pwd`/config.sh" ];then
	ask "Do you want to reconfigure?" N && questions
else
	if ask "Do you want to setup your preferences now?" Y; then
		  questions
	else
		  echo "OK. The default conf will pe used!"
			save
	fi
fi
