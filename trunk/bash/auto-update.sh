#! /bin/bash
source config.sh

while :
do
		if [ $period -eq 0 ]; then
			echo "*** Automatic updates disabled" >&2;			
			exit 0;
		fi
    bash/update.sh &    
		sleep $period
   
done
