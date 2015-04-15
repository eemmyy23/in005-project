# Introduction #
The main goal is to apply the learned notions during the OS course.
I am trying to make an interface for a robot connected to a Linux computer.
# Installation #
## quick install ##
navigate to the folder where you want to install then:
```
export http_proxy="http://proxy-address:port/"
wget http://in005-project.googlecode.com/svn/trunk/install.sh
chmod +x install.sh
./install.sh
```
## install.sh ##
It's provided by the **install.sh** script. This script is supposed to:
  * check/install all required dependencies (via apt-get)
  * downloaded the latest source code from the repository
  * compile everything
  * modify the .bashrc belonging to the current user
## .bashrc ##
The **.bashrc** was modified by including or adding another source file (startup.bash)
## startup.bash ##
Within this file, **startup.bash**, it is established if the new shell was initialized by a remote client using ssh, and if so a c++ program is automatically launched. There might be some filters applied regarding the ip of the client or the maximum clients per ip. The working path is changed to the project directory(folder).
# Folder organisation #
Exluding the previous files, everything else is structured in the project folder as:
  * c/c++ source files are in the **cpp** folder
  * c/c++ executable files are in the **bin** folder
  * bash scripts are in the **bash** folder
# Workflow #
![http://in005-project.googlecode.com/files/20121010_011736.jpg](http://in005-project.googlecode.com/files/20121010_011736.jpg)
## main-loop.cpp ##
This is the main program which will run as long as the user is logged in.
It is an user interface, providing a predefined set of options for the user's needs.
  * Handles the automatic update of the application (as threads)
  * Handles signals, not permitting the user to kill the program or escape to the shell