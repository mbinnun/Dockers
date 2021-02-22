-----------------------
Overview
-----------------------
This image provides an LXDE base UBUNTU desktop with a web based VNC access.<br/>
The desktop is intended to be a development environment.<br/>
It contains CLI based tools like gcc, java, node, python, go, php-cli and UI based tools like VSCode, QtCreator etc.<br/>

-----------------------
Usage Example:
-----------------------
Assuming that your user has the docker privileges, here is an example for creating and running the container:<br/>
***docker run -d -t --privileged \\<br/>
-p 22:22 \\<br/>
-p 5900:5900 \\<br/>
-p 6080:6080 \\<br/>
-e SUDO_PASSWD=my_admin_user_password \\<br/>
-e VNC_PASSWD=my_vnc_password \\<br/>
-e VNC_WIDTH=1024 \\<br/>
-e VNC_HEIGHT=768 \\<br/>
-e VNC_DEPTH=16 \\<br/>
--name=MyDesktopContainer mbinunn/ubuntu_development_desktop-lxde_with_vnc:latest***<br/>
<br/>
**Note:** The --privileged swith is not mandatory and you can safely run in a non-privileged mode, but it is required if you want access to the physical machine devices.
<br/>
If you want to load your local documents folder into the "Documents" directory on the container, use:<br/>
***docker run -d -t --privileged \\<br/>
-p 22:22 \\<br/>
-p 5900:5900 \\<br/>
-p 6080:6080 \\<br/>
-e SUDO_PASSWD=my_admin_user_password \\<br/>
-e VNC_PASSWD=my_vnc_password \\<br/>
-e VNC_WIDTH=1024 \\<br/>
-e VNC_HEIGHT=768 \\<br/>
-e VNC_DEPTH=16 \\<br/>
-v /path/to/your/documents:/home/administrator/Documents \\<br/>
--name=MyDesktopContainer mbinunn/ubuntu_development_desktop-lxde_with_vnc:latest***<br/>
<br/>
**You should now be able to:**<br/>
-connect via ssh, by typing ***ssh administrator@localhost*** on your terminal, or via apps like PuTTy.<br/>
-connect to the desktop from your browser on: http://localhost:6080<br/>
-connect through your VNC client on localhost:5900<br/>

-----------------------
Optional Variables:
-----------------------
**SUDO_PASSWD** = Initializes the sudo "administrator" user's password<br/> 
**ROOT_PASSWD** = Initializes the root password of UBUNTU<br/> 
**VNC_PASSWD** = Initializes the vnc service password<br/>
**VNC_WIDTH** = Initializes the vnc desktop width<br/>
**VNC_HEIGHT** = Initializes the vnc desktop height<br/>
**VNC_DEPTH** = Initializes the vnc desktop color depth<br/>

-----------------------
Saving your own image
-----------------------
After making changes, installing software or changing *startup.sh*, save your own image by using the following command:<br/>
***docker commit MyDesktopContainer my_own_desktop_image:v1***<br/>

-----------------------
Source code
-----------------------
See my source code on https://github.com/mbinnun/Dockers/tree/main/ubuntu-development-desktop-lxde-with-vnc
