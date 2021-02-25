-----------------------
Overview
-----------------------
This image provides an UBUNTU Apache2 PHP server with url-rewritng and reverse-proxy support.<br/>
It has a built in option to generate SSL certificates with letsencrypt.<br/>
The server works by default on ports 80/443, and able to handle multiple domains in the vhosts.conf file.

-----------------------
Usage Example:
-----------------------
Assuming that your user has the docker privileges, here is an example for creating and running the container:<br/>
***docker run -i -t \\<br/>
-p 80:80 \\<br/>
-p 443:443 \\<br/>
-v /path/to/your/WWW/folder:/home/administrator/WWW \\<br/>
-e SUDO_PASSWD=admin123 \\<br/>
--name MyPhpContainer mbinunn/ubuntu_apache2_php_server***<br/>
<br/>
If you have multiple domains or multiple websites in your WWW folder, and you want to implement your own **vhosts.conf** file, then use:<br/>
***docker run -i -t \\<br/>
-p 80:80 \\<br/>
-p 443:443 \\<br/>
-v /path/to/your/WWW/folder:/home/administrator/WWW \\<br/>
-v /path/to/your/vhosts.conf:/etc/apache2/sites-available/000-default.conf \\<br/>
-e SUDO_PASSWD=admin123 \\<br/>
--name MyPhpContainer mbinunn/ubuntu_apache2_php_server***<br/>
<br/>
**NOTE:**<br/>
The above command will start the container in the interactive mode, so that you'll see the apache server response.<br/>
If you want to run the server in detached mode, use the **-d switch** instead of **-i**.<br/>
Also consider using **--restart=always** to run the container continously when running in production.<br/>

-----------------------
SSL Certificates:
-----------------------
Use the following command to generate an SSL certificate for a domain:<br/>
***docker exec -i -t -u root MyProxyContainer bash -c "/home/administrator/ssl-cert-generate.sh MY_NEW_DOMAIN.com"***<br/>
(you'll have to enter an e-mail when doing this for the first time)<br/>
<br/>
Use the following command to renew all the existing certificates:<br/>
***docker exec -i -t -u root MyProxyContainer bash -c "/home/administrator/ssl-renew.sh"***<br/>

-----------------------
Optional Variables:
-----------------------
**SUDO_PASSWD** = Initializes the "administrator" user's password.<br/>
**ROOT_PASSWD** = Initializes the root password of UBUNTU<br/> 

-----------------------
Saving your own image
-----------------------
After making changes, installing software or changing *startup.sh*, save your own image by using the following command:<br/>
***docker commit MyPhpContainer my_own_php_image:v1***<br/>

-----------------------
Source code
-----------------------
See my source code on https://github.com/mbinnun/Dockers/tree/main/ubuntu-apache2-php-server
