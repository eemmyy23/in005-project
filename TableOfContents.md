

  * [Introduction](Intro.md)
  1. [activate this program when user connects via ssh](ssh.md)
  1. force the user to enter and stay into the interface program
    * use an infinite loop
    * handle signals
    * provide simple UI
    * manage updates and recompile the source (with program restart)
    * interact with bash scripts
    * escape to shell if admin
  1. provide update mechanism (as thread)
    * download the source form svn
    * compile the new downloaded files
    * restart the interface after update
    * provide a fake realistic progress bar :))
  1. interact with the robot
    * start/stop the robot's programs (shell cmd)
    * find the PIDs & other info about robot's software (bash scripts)
    * move the robot fw/bw & right/left (shell cmd with pipe or redirects)
  1. provide a preferences mechanism per ip
    * to store env vars like http\_proxy
    * to store the robot's max speed