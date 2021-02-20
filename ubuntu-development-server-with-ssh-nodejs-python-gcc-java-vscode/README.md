-----------------------
Overview
-----------------------
This image provides an UBUNTU container with: SSH server, web based vs-code, web based file explorer, and development CLIs.<br/>
The development CLIs are: gcc, java, node, python, go and php.<br/>
The container starts in a SUDO "administrator" user, so that SSH connections will be using a regular user instead of using root.

-----------------------
Usage Example:
-----------------------
Assuming that your user has the docker privileges, here is an example for creating and running the container:<br/>
***docker run -d -t \\<br/>
-p 22:22 \\<br/>
-p 8080:8080 \\<br/>
-p 8081:8081 \\<br/>
-e SUDO_PASSWD=my_admin_user_password \\<br/>
-e CODE_PASSWD=my_vscode_password \\<br/>
-e FILEEXP_PASSWD=my_file_explorer_password \\<br/>
--name=MyDevelopmentContainer mbinunn/ubuntu_development_server_with_ssh_nodejs_python_gcc_java_vscode:latest***<br/>
<br/>
If you want to load your local projects folder into the "projects" directory on the container, use:<br/>
***docker run -d -t \\<br/>
-p 22:22 \\<br/>
-p 8080:8080 \\<br/>
-p 8081:8081 \\<br/>
-v /path/to/your/projects:/home/administrator/projects
-e SUDO_PASSWD=my_admin_user_password \\<br/>
-e CODE_PASSWD=my_vscode_password \\<br/>
-e FILEEXP_PASSWD=my_file_explorer_password \\<br/>
--name=MyDevelopmentContainer mbinunn/ubuntu_development_server_with_ssh_nodejs_python_gcc_java_vscode:latest***<br/>
<br/>
You should now be able to:<br/>
- connect via ssh, by typing ***ssh administrator@localhost*** on your terminal, or via apps like PuTTy.<br/>
- connect to vs-code from your browser on: http://localhost:8080<br/>
- connect to file-explorer from your browser on: http://localhost:8081<br/>
<br/>
-----------------------
Optional Variables:
-----------------------
**SUDO_PASSWD** = Initializes the sudo "administrator" user's password<br/> 
**CODE_PASSWD** = Initializes the web based vs-code password<br/>
**FILEEXP_PASSWD** = Initializes the web based file explorer password<br/>
**ROOT_PASSWD** = Initializes the root password of UBUNTU<br/> 

-----------------------
Saving your own image
-----------------------
After making changes, installing software or changing *startup.sh*, save your own image by using the following command:<br/>
***docker commit MyDevelopmentContainer my_own_development_image:v1***<br/>

-----------------------
Source code
-----------------------
See my source code on https://github.com/mbinnun/Dockers/tree/main/ubuntu-development-server-with-ssh-nodejs-python-gcc-java-vscode
