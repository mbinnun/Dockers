-----------------------
Overview
-----------------------
This image provides an UBUNTU container with a preinstalled OpenSSH server.

-----------------------
Usage Example:
-----------------------
Assuming that your user has the docker privileges, here is an example for creating and running the container:<br/>
***docker run -d -t \\
-p 22:22 \\
-e ROOT_PASSWD=my_root_password \\
--name=MySshContainer mbinunn/ubuntu_ssh_server***<br/>
<br/>
You should now be able to connect by typing ***ssh root@localhost*** on your terminal, or via apps like PuTTy.<br/>
-----------------------
Optional Variables:
-----------------------
**ROOT_PASSWD** = Initializes the root password of UBUNTU<br/> 

-----------------------
Saving your own image
-----------------------
After making changes, installing software or changing *startup.sh*, save your own image by using the following command:<br/>
***docker commit MySshContainer my_own_ssh_image:v1***<br/>

-----------------------
Source code
-----------------------
See my source code on https://github.com/mbinnun/Dockers/tree/main/ubuntu-ssh-server
