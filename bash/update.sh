#! /bin/bash
#clear		# clear terminal window
pwd
echo "Started update script"
svn up | grep ^At
echo "Finished update script"
sleep 1
echo "Recompileing cpp files"
gcc cpp/main-loop.cpp -o cpp/startup
echo "All done"
