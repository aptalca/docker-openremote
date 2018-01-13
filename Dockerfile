
FROM phusion/baseimage

MAINTAINER aptalca

VOLUME ["/config"]

EXPOSE 8080

RUN echo $TZ > /etc/timezone && \
export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive && \
dpkg-reconfigure tzdata && \
usermod -u 99 nobody && \
usermod -g 100 nobody && \
apt-get update && apt-get install -y \
wget \
oracle-java8-jdk \
unzip && \
export JAVA_HOME=/usr && \
wget https://github.com/openremote/Controller/releases/download/v2.6.0_beta3/OpenRemote-Controller.zip -O /root/OR.zip 

RUN mkdir -p /etc/my_init.d
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh
