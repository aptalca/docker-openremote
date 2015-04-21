
FROM phusion/baseimage:0.9.11

MAINTAINER aptalca

VOLUME ["/config"]

EXPOSE 8080

RUN echo $TZ > /etc/timezone && \
export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive && \
dpkg-reconfigure tzdata && \
apt-get update && apt-get install -y \
wget \
openjdk-6-jdk \
unzip && \
export JAVA_HOME=/usr && \
wget http://sourceforge.net/projects/openremote/files/OpenRemote-Controller-2.1.0.zip/download -O /root/OR.zip && \
unzip -u /root/OR.zip -d /config/ && \
cd /config/OpenRemote-Controller-2.1.0/bin && \
chmod +x openremote.sh

CMD cd /config/OpenRemote-Controller-2.1.0/bin/ && ./openremote.sh start
