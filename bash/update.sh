#! /bin/bash
#clear		# clear terminal window

echo "Started update script"
svn up | grep ^At
echo "Finished update script"
sleep 1

#make sure that all scripts are executabile
chmod +x bash/*

echo "Recompileing"
bash/compile.sh
echo "All done"
