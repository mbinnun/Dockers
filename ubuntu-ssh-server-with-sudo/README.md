-----------------------
Overview
-----------------------
This image provides an UBUNTU container with a preinstalled OpenSSH server,<br/>
and a SUDO "administrator" user, so that SSH connections will be to a regular user instead of using root.

-----------------------
Usage Example:
-----------------------
Assuming that your user has the docker privileges, here is an example for creating and running the container:<br/>
***docker run -d -t \\<br/>
-p 22:22 \\<br/>
-e SUDO_PASSWD=my_admin_user_password \\<br/>
--name=MySshSudoContainer mbinunn/ubuntu_ssh_server_with_sudo***<br/>
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
***docker commit MySshSudoContainer my_own_ssh_with_sudo_image:v1***<br/>

-----------------------
Source code
-----------------------
See my source code on https://github.com/mbinnun/Dockers/tree/main/ubuntu-ssh-server-with-sudo
