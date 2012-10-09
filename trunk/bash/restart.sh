#! /bin/bash

echo "Stopping the program"

pid=`cat pid.txt`

echo "kill $pid"
kill $pid
sleep 2
echo "Starting the program"
sleep 1
bin/main-loop

