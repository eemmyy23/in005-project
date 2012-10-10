#!/bin/bash
#
# Script to perform some common system operations
#

waitForEnter () {
	echo "Press Enter to return to the main menu. . ."
	read
}

while :
do
	clear
	echo "************************"
	echo "*       My tools       *"
	echo "************************"
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
	echo "************************"
	echo -n "Enter your menu choice [a-0]: "
	read goto
	case $goto in
		t) source bash/test.sh ;waitForEnter;;
		0) exit 0;;
		1) bash/restart.sh;waitForEnter;;
		*) echo "Please select a valid option";waitForEnter;;
	esac
done

