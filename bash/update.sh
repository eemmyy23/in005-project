#! /bin/bash
#clear		# clear terminal window

echo "Started update script"
svn up | grep ^At
echo "Finished update script"
sleep 1
echo "Recompileing"
./compile.sh
echo "All done"
