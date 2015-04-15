# Introduction #

This project was initially intended to simulate a fully functional embedded device, running a Linux distribution. Among other issues, the possibility of auto updating the device was taken into account, which finally became the main topic for the project.

As seen in the previous sections almost all the software products get their latest updates by connecting to a remote server. Usually this is done using HTTP request to a public server whose address is predefined in the software it’s self by the producer.
Many developers are using online tools to be able to share the code with colleagues or end-users. Those tools offer features like versioning and a public web address to access the code or related files. This project is hosted on code.google.com. The link to the project home page is: http://code.google.com/p/in005-project.


# Details #

There is provided, a small installation script which has the following features:
  * requires administrative permissions
  * takes into account the environment of the current system (OS version, proxy settings)
  * installs any needed dependencies
  * downloads the source code of the program itself
  * compiles the required files
  * configures the program according to the user preferences