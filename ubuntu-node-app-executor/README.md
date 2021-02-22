-----------------------
Overview
-----------------------
This image provides an UBUNTU container to run a Node-JS based app.<br/>
You are able to choose wether the app is running as user or as root.

-----------------------
Usage Example:
-----------------------
Assuming that your user has the docker privileges, here is an example for creating and running the container:<br/>
***docker run -i -t \\<br/>
-p 3000:3000 \\<br/>
-e ENV_VAR="variable to the app" \\<br/>
--name=MyNodeContainer mbinunn/ubuntu_node_app_executor***<br/>
<br/>
If you want to run the app as root, use:<br/>
***docker run -i -t \\<br/>
-p 3000:3000 \\<br/>
-e RUN_AS_ROOT=1 \\<br/>
-e ENV_VAR="variable to the app" \\<br/>
--name=MyNodeContainer mbinunn/ubuntu_node_app_executor***<br/>
<br/>
If you want to load your app folder from the host, use:<br/>
***docker run -i -t \\<br/>
-p 3000:3000 \\<br/>
-v /path/to/app/on/host:/home/administrator/app \\<br/>
-e ENV_VAR="variable to the app" \\<br/>
--name=MyNodeContainer mbinunn/ubuntu_node_app_executor***<br/>
<br/>
**NOTES:**<br/><br/>
-The port 3000 on the usage example is for the example app that will run by default. Change the port to the needs of your own app.<br/><br/>
-In the usage example I'm running the container in the interactive mode with the -i switch, so that we're able to see the app's output. You can use the -d switch to run in detached mode instead.<br/><br/>
-To have your app running continously in a production server, use --restart=always so that your app will be automatically running after a host server restart.<br/><br/>
-The ENV_VAR is only a variable for the example app. You can pass any "-e" variable that you want, and then get it in your app by calling ***const YOUR_VAR = process.env.YOUR_VARIABLE || '';*** (same as you would getting a regular bash exported variable).<br/>

-----------------------
Optional Variables:
-----------------------
**RUN_AS_ROOT** = Pass this variable only if you want to run the app as the container's root, otherwise do not pass it<br/>
**SUDO_PASSWD** = Initializes the sudo "administrator" user's password<br/> 
**ROOT_PASSWD** = Initializes the root password of UBUNTU<br/> 

-----------------------
Saving your own image
-----------------------
After making changes, installing software or changing *startup.sh*, save your own image by using the following command:<br/>
***docker commit MyNodeContainer my_own_node_image:v1***<br/>

-----------------------
Source code
-----------------------
See my source code on https://github.com/mbinnun/Dockers/tree/main/ubuntu-node-app-executor
