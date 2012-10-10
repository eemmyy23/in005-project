#!/bin/bash 
#whoami
source /home/emi/work_electric/setup.bash
export ROS_IP=10.67.81.146
export ROS_MASTER_URI="http://10.67.81.146:11311"
export ROS_HOME="/home/emi/.ros"
nohup roscore> foo1.out 2> foo1.err < /dev/null &
sleep 5

