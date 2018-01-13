FROM phusion/baseimage:0.9.22

MAINTAINER aptalca

VOLUME ["/config"]

EXPOSE 8080

RUN echo $TZ > /etc/timezone
