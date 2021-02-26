-----------------------
Overview
-----------------------
This image provides an UBUNTU LAMP server including Apache2, PHP, MySQL database, Adminer(phpmyadmin replacement) and Webmin (server administration interface).<br/>
It has a built in option to generate SSL certificates with letsencrypt.<br/>
The server works by default on ports 80/443, and able to handle multiple domains in the vhosts.conf file.

-----------------------
Usage Example:
-----------------------
Assuming that your user has the docker privileges, here is an example for creating and running the container:<br/>
***docker run -i -t \\<br/>
-p 80:80 \\<br/>
-p 443:443 \\<br/>
-p 10000:10000 \\<br/>
-e MYSQL_PASSWD=my_mysql_root_password \\<br/>
-e SUDO_PASSWD=my_admin_user_password \\<br/>
--name MyLampContainer mbinunn/ubuntu_lamp_server_apache2_mysql_adminer_webmin***<br/>
<br/>
If you want to implement your own **vhosts.conf** file or load your local WWW folder, then use:<br/>
***docker run -i -t \\<br/>
-p 80:80 \\<br/>
-p 443:443 \\<br/>
-p 10000:10000 \\<br/>
-v /path/to/your/WWW/folder:/home/administrator/WWW \\<br/>
-v /path/to/your/vhosts.conf:/etc/apache2/sites-available/000-default.conf \\<br/>
-e MYSQL_PASSWD=my_mysql_root_password \\<br/>
-e SUDO_PASSWD=my_admin_user_password \\<br/>
--name MyLampContainer mbinunn/ubuntu_lamp_server_apache2_mysql_adminer_webmin***<br/>
<br/>
**NOTE:**<br/>
The above command will start the container in the interactive mode, so that you'll see the apache server response.<br/>
If you want to run the server in detached mode, use the **-d switch** instead of **-i**.<br/>
Also consider using **--restart=always** to run the container continously when running in production.<br/>
<br/>
**NOTES:**<br/>
-To use webmin, go to http://localhost:10000 in your browser and use the "administrator" user to sign in.<br/>
-To use adminer, go to http://localhost/adminer in your browser and use the MySQL root user to sign in.<br/>

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
**MYSQL_PASSWD** = Initializes the MySQL root user's password.<br/>
**SUDO_PASSWD** = Initializes the "administrator" user's password.<br/>
**ROOT_PASSWD** = Initializes the root password of UBUNTU<br/> 

-----------------------
Saving your own image
-----------------------
After making changes, installing software or changing *startup.sh*, save your own image by using the following command:<br/>
***docker commit MyLampContainer my_own_php_image:v1***<br/>

-----------------------
Source code
-----------------------
See my source code on https://github.com/mbinnun/Dockers/tree/main/ubuntu-lamp-server-apache2-mysql-adminer
