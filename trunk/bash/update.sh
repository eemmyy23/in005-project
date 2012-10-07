#! /bin/bash
#clear		# clear terminal window


cd ..
echo "Started update script"
svn up | grep ^At
echo "Finished update script"
sleep 1
echo "Recompileing cpp files"
cd cpp
gcc main-loop.cpp -o startup
echo "All done"
