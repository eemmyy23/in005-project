#! /bin/bash
#clear		# clear terminal window

echo "Started update script"
#svn up
echo "Finished update script"

#Some new scripts could be downloaded
#make sure that all scripts are executabile
chmod +x bash/*

echo "Recompileing"
bash/compile.sh
bash/restart.sh

