#!/bin/bash 
#whoami
source /home/emi/work_electric/setup.bash
#export ROS_IP=192.168.1.2
#export ROS_MASTER_URI="http://192.168.1.2:11311"
export ROS_HOME="/home/emi/.ros"
### commands
echo '<h3>ROS nodes:</h3><textarea readonly class="scroll">'
rosnode list
echo '</textarea><h3>ROS topics:</h3><textarea readonly class="scroll">'
rostopic list
echo "</textarea>"
