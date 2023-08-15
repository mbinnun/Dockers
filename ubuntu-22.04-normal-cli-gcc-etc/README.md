-----------------------
Overview
-----------------------
This image provides an UBUNTU container with a preinstalled CLI tools such as gcc, python, curl,<br/>
and a SUDO "administrator" user, so that SSH connections will be to a regular user instead of using root.

-----------------------
Usage Example:
-----------------------
Assuming that your user has the docker privileges, here is an example for creating and running the container:<br/>
***docker run -d -t \\<br/>
-p 22:22 \\<br/>
-e SUDO_PASSWD=my_admin_user_password \\<br/>
--name=MySshSudoContainer mbinunn/ubuntu_22.04_normal_cli_gcc_etc***<br/>
<br/>
You should now be able to connect by typing ***ssh administrator@localhost*** on your terminal, or via apps like PuTTy.<br/>

-----------------------
Optional Variables:
-----------------------
**SUDO_PASSWD** = Initializes the sudo "administrator" user's password<br/> 
**ROOT_PASSWD** = Initializes the root password of UBUNTU<br/> 

-----------------------
Saving your own image
-----------------------
After making changes, installing software or changing *startup.sh*, save your own image by using the following command:<br/>
***docker commit MySshSudoContainer my_own_ubuntu_22.04_image:v1***<br/>

-----------------------
Source code
-----------------------
See my source code on https://github.com/mbinnun/Dockers/tree/main/ubuntu-22.04-normal-cli-gcc-etc

-----------------------
Credits
-----------------------
written by mbinnun <br>
https://moshe.binnun.me/ <br>
https://moshe.binnun.me/%D7%9E%D7%A9%D7%94-%D7%91%D7%9F-%D7%A0%D7%95%D7%9F
