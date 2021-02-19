FROM ubuntu:latest
MAINTAINER mbinunn mbinnun@hotmail.com
WORKDIR /root
COPY ./startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh
ENTRYPOINT ["/bin/bash","/root/startup.sh"]
