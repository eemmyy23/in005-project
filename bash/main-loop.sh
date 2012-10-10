#!/bin/bash
#
# Script to perform some common system operations
#
trap "echo Not so fast (Please autentificate first)" SIGINT SIGTERM SIGTSTP
waitForEnter () {
	echo "Press Enter to return to the main menu. . ."
	read
}

while :
do
	clear
  echo "project dir $PRJ_DIR"
	echo "************************"
	echo "*       My tools       *"
	echo "***********************"
	echo "my     PID: $$"
	echo "parent PID: $PPID"
	echo "* [t] Test             *"
	echo "* [x] x                *"
	echo "* [x] x                *"
	echo "* [x] x                *"
	echo "* [x] x                *"
	echo "* [x] x                *"
	echo "* [x] x                *"
	echo "* [x] x                *"
	echo "* [0] Exit/Stop        *"
	echo "* [1] Restart          *"
	echo "* [2] KILL             *"
	echo "************************"
	echo -n "Enter your menu choice [a-0]: "
	read goto
	case $goto in
		t) source bash/test.sh ;waitForEnter;;
		0) exit 0;;
		1) bash/restart.sh;waitForEnter;;
		2) kill -kill $PPID; exit 0;;
		*) echo "Please select a valid option";waitForEnter;;
	esac
done

