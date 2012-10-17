#!/bin/bash
#
# Script to perform some common system operations
#
trap "echo Not so fast. Please autentificate first!" SIGINT SIGTERM SIGTSTP
waitForEnter () {
	echo "Press Enter to return to the main menu. . ."
	read
}



while :
do
	clear
	echo $1
	uptime
	echo "main-loop.sh (own) PID: $BASHPID"
	echo "statup.sh (parent) PID: $PPID"
	echo "OPTIONS:"
	echo "[1] view update setting (using cat)"
	echo "[2] change your setting (using nano)"
	echo "[3] manual check for updates"
	echo "[4] test.sh"
	echo "[r] restart this"
	echo "[x] exit to shell (as root)"
	echo "";echo ""
	echo -n "Enter your menu choice [a-0]: "
	read goto
	case $goto in
	# 1) (nohup bin/main-loop 2>/dev/null 1>/dev/null &);waitForEnter;;
	  1) cat config.sh;waitForEnter;;	
		2) nano config.sh;;
		3) bash/update.sh 1>/dev/null &
				sleep .2
				waitForEnter;;
		r) exit 0;;
		x) 	kill -kill $PPID
				exit 0;;
		*) echo "Please select a valid option";waitForEnter;;
	esac
done

