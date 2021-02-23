-----------------------
Overview
-----------------------
This image provides an UBUNTU container with a preinstalled POSTFIX and DOVECOT server for getting and sending e-mails.
It has a built in option to use your GMail account as an SMTP relay.
The incoming mails can be downloaded by a POP3/SMTP client.

-----------------------
Usage Example:
-----------------------
Assuming that your user has the docker privileges, here is an example for creating and running the container:<br/>
***docker run -d -t \\<br/>
-p 25:25 \\<br/>
-p 110:110 \\<br/>
-p 143:143 \\<br/>
-e EMAIL_DOMAIN="MyMailDomain.com, MyOtherMailDomain.net" \\<br/>
--name MyPostfixContainer mbinunn/ubuntu_mail_pop3_imap_server_postfix_dovecot_gmailsmtp***<br/>
<br/>
If you want to use the GMail SMTP feature, use:<br/>
***docker run -d -t \\<br/>
-p 25:25 \\<br/>
-p 110:110 \\<br/>
-p 143:143 \\<br/>
-e EMAIL_DOMAIN="MyMailDomain.com, MyOtherMailDomain.net" \\<br/>
-e USE_GMAIL_SMTP=1 \\<br/>
-e GMAIL_SMTP_USER=MyGmailUser@gmail.com \\<br/>
-e GMAIL_SMTP_PASSWD=MyGmailPassword \\<br/>
--name MyPostfixContainer mbinunn/ubuntu_mail_pop3_imap_server_postfix_dovecot_gmailsmtp***<br/>
<br />
The server should be now up and starting getting emails and POP/IMAP requests.<br/>

-----------------------
Creating an e-mail account:
-----------------------
To create e-mail accounts in the server, use:
***docker exec -i -t -u root MyPostfixContainer bash -c "/root/mail-create-user.sh username password"***

-----------------------
Optional Variables:
-----------------------
**EMAIL_DOMAIN** = Comma seperated list of accepted domains<br/>
**USE_GMAIL_SMTP** = Send it only if you want GMail SMTP, otherwise do not send<br/>
**GMAIL_SMTP_USER** = Full GMail user name including @gmail.com<br/>
**GMAIL_SMTP_PASSWD** = Gmail account's password<br/
**ROOT_PASSWD** = Initializes the root password of UBUNTU<br/> 

-----------------------
Saving your own image
-----------------------
After making changes, installing software or changing *startup.sh*, save your own image by using the following command:<br/>
***docker commit MyPostfixContainer my_own_postfix_image:v1***<br/>

-----------------------
Source code
-----------------------
See my source code on https://github.com/mbinnun/Dockers/tree/main/ubuntu-mail-pop3-imap-server-postfix-dovecot-gmailsmtp
