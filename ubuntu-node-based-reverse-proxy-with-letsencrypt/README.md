-----------------------
Overview
-----------------------
This image provides an UBUNTU reverse proxy server based on node-rebird.<br/>
It has a built in option to generate SSL certificates with letsencrypt.<br/>
The server works by default on ports 80/443, and forwards the http request to the right application/port by parsing the URL's domain. If the domain has not been identified, the server shows error 404.

-----------------------
Usage Example:
-----------------------
Assuming that your user has the docker privileges, here is an example for creating and running the container:<br/>
***docker run -i -t \\<br/>
-p 80:80 \\<br/>
-p 443:443 \\<br/>
-v /path/to/proxy-list.json:/root/proxy-list.json \\<br/>
--name MyProxyContainer mbinunn/ubuntu_node_based_reverse_proxy_with_letsencrypt***<br/>
<br/>
By default, the reverse-proxy server will not show a log of the http requests.<br/>
If you want to show the log, use:<br/>
***docker run -i -t \\<br/>
-p 80:80 \\<br/>
-p 443:443 \\<br/>
-v /path/to/proxy-list.json:/root/proxy-list.json \\<br/>
-e SHOW_LOG=1 \\<br/>
--name MyProxyContainer mbinunn/ubuntu_node_based_reverse_proxy_with_letsencrypt***<br/>
<br/>
By default, the reverse-proxy server will automatically send the x-forwarded-header to the target ip.<br/>
If you don't want to send, use:<br/>
***docker run -i -t \\<br/>
-p 80:80 \\<br/>
-p 443:443 \\<br/>
-v /path/to/proxy-list.json:/root/proxy-list.json \\<br/>
-e DISABLE_XFWD=1 \\<br/>
--name MyProxyContainer mbinunn/ubuntu_node_based_reverse_proxy_with_letsencrypt***<br/>
<br/>
**NOTE:**<br/>
The above commands will start the container in the interactive mode, so that you'll see the proxy server response.<br/>
If you want to run the server in detached mode, use the **-d switch** instead of **-i**.<br/>

-----------------------
The proxy-list.json file:
-----------------------
You should implement the **proxy-list.json** file and use it with the **-v switch**. The file should look like this:<br/>
[<br/>
  {"domain":"mydomain.com", "ssl":1, "target_ip":"localhost"   , "target_port":3000},<br/>
  {"domain":"example1.com", "ssl":0, "target_ip":"192.168.0.1" , "target_port":8000},<br/>
  {"domain":"example2.com", "ssl":0, "target_ip":"HOST_IP"     , "target_port":8080},<br/>
  {"domain":"app-api.com" , "ssl":1, "target_ip":"api.app.com" , "target_port":4444}<br/>
]<br/>
<br/>
**NOTES:**<br/>
-When **"ssl"** is **1**, the domain will be queried on port 443. Otherwise it'll be queried on port 80.<br/>
-If using **"HOST_IP"** as the value of **target_ip**, it'll automatically calculate the container's host machine IP address.<br/>

-----------------------
SSL Certificates:
-----------------------
Use the following command to generate an SSL certificate for a domain:<br/>
***docker exec -i -t -u root MyProxyContainer bash -c "/root/ssl-cert-generate.sh MY_NEW_DOMAIN.com"***<br/>
<br/>
Use the following command to renew all the existing certificates:<br/>
***docker exec -i -t -u root MyProxyContainer bash -c "/root/ssl-renew.sh"***<br/>

-----------------------
Optional Variables:
-----------------------
**SHOW_LOG** = Pass this variable only if you want to show the log, otherwise do not pass it<br/>
**DISABLE_XFWD** = Pass this variable only if you want to prevent x-forwarded header from being sent, otherwise do not pass it<br/>
**ROOT_PASSWD** = Initializes the root password of UBUNTU<br/> 

-----------------------
Saving your own image
-----------------------
After making changes, installing software or changing *startup.sh*, save your own image by using the following command:<br/>
***docker commit MyProxyContainer my_own_proxy_image:v1***<br/>

-----------------------
Source code
-----------------------
See my source code on https://github.com/mbinnun/Dockers/tree/main/ubuntu-node-based-reverse-proxy-with-letsencrypt
