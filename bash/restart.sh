#! /bin/bash

echo "RESTART SCRIPT Stopping the program"

pid=`cat pid.txt`

echo "kill $pid"
kill -kill $pid > /dev/null 2>&1
sleep 2
echo "Starting the program"
sleep 1
#bin/main-loop

