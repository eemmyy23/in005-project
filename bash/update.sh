#! /bin/bash


lockdir=$PRJ_DIR"/update-in-progress"
if mkdir "$lockdir"
	then    # directory did not exist, but was created successfully
	  echo "*** successfully acquired lock" >&2
    trap 'rm -rf "$lockdir"' 0    # remove directory when script finishes
		  # continue script
	else
		  echo "cannot acquire lock" >&2
			exit 0
	fi
	
echo "Started update script"
svn up
echo "Finished update script"

#Some new scripts could be downloaded
#make sure that all scripts are executabile
chmod +x bash/*

echo "Recompileing"
bash/compile.sh
bash/restart.sh appOnly
sleep 10
echo "*** Update finished" >&2
