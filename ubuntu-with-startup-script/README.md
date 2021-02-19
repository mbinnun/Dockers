-----------------------
Overview
-----------------------
This image provides an UBUNTU container with a built-in startup script on */root/startup.sh* .<br/>
It is intended for creating ubuntu based images without the need of using a Dockerfile for integrating startup commands.

-----------------------
Usage Example:
-----------------------
Assuming that your user has the docker privileges, here is an example for creating and running the container:<br/>
***docker run -i -t --name=MyContainer mbinunn/ubuntu_with_startup_script***<br/>
<br/>
For integrating your own *startup.sh* from the host system, use: <br/>
***docker run -i -t -v /path/to/startup.sh:/root/startup.sh --name=MyContainer mbinunn/ubuntu_with_startup_script***<br/>

-----------------------
Saving your own image
-----------------------
After making changes, installing software and changing *startup.sh* to you needs, type ***exit*** and save your own image by using the following command:<br/>
***docker commit MyContainer my_own_image:v1***<br/>
