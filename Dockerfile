
FROM phusion/baseimage:0.9.11

MAINTAINER aptalca

VOLUME ["/opt/OpenRemote-Controller-2.1.0"]

EXPOSE 8080

RUN echo $TZ > /etc/timezone && \
apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y \
wget \
openjdk-6-jdk \
unzip && \
export JAVA_HOME=/usr && \
wget http://sourceforge.net/projects/openremote/files/OpenRemote-Controller-2.1.0.zip/download -O /root/OR.zip && \
unzip /root/OR.zip -d /opt/ && \
cd /opt/OpenRemote-Controller-2.1.0/bin && \
chmod +x openremote.sh

CMD cd /opt/OpenRemote-Controller-2.1.0/bin/ && ./openremote.sh start
