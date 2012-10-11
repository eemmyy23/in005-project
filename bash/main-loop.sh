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
	echo "[c] run main-loop.cpp"
	echo "[p] kill main-loop (with php)"
	echo "[i] robot info"
	echo "[t] test.sh"
	echo "[0] Exit/Stop"
	echo "[1] Restart"
	echo "[2] KILL"
	echo "";echo ""
	echo -n "Enter your menu choice [a-0]: "
	read goto
	case $goto in
		c) (nohup bin/main-loop 2>/dev/null 1>/dev/null &);waitForEnter;;
		p) php -f php/script.php "kill update" "";waitForEnter;;
		i) bash/info.sh;waitForEnter;;
		t) source bash/test.sh ;waitForEnter;;
		0) exit 0;;
		1) bash/restart.sh;waitForEnter;;
		2) 	kill -kill $PPID
			 	kill -kill `cat pid.txt`
				rm pid.txt
				exit 0;;
		*) echo "Please select a valid option";waitForEnter;;
	esac
done

