#!/bin/bash 
#whoami
source /home/emi/work_electric/setup.bash
#export ROS_IP=192.168.1.2
#export ROS_MASTER_URI="http://192.168.1.2:11311"
#export ROS_HOME="/home/emi/.ros"
### commands
echo "nodes:"
rosnode list
echo "";echo "topics"
rostopic list

