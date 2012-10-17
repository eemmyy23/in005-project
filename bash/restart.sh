#!/bin/bash
echo "executing restart.sh"

function updaterOnly {
	if [ `pgrep -c auto-update.sh` != 0 ]; then
		kill `pgrep auto-update.sh`
	fi
	bash/auto-update.sh 1>/dev/null &	
}

function appOnly {
	if [ `pgrep -c main-loop.sh` != 0 ]; then
		kill -kill `pgrep main-loop.sh`
	fi
}

case $1 in
	"updaterOnly")	updaterOnly;;
	"appOnly")			appOnly;;
esac
