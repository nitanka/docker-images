FROM ubuntu:14.04

MAINTAINER nitanka <nitanka.gogoi@razorthink.com>

ARG ROOTPASSWD=root

RUN apt-get update && \
    apt-get install debconf-utils && \
    echo "mysql-server-5.6 mysql-server/root_password password ${ROOTPASSWD}" | debconf-set-selections && \
    echo "mysql-server-5.6 mysql-server/root_password_again password ${ROOTPASSWD}" | debconf-set-selections && \
    #debconf-set-selections <<< 'mysql-server mysql-server-5.6/root_password password ${ROOTPASSWD}' && \
    #debconf-set-selections <<< 'mysql-server mysql-server-5.6/root_password_again password ${ROOTPASSWD}' && \
    apt-get -y install mysql-server-5.6 && \
    echo "!/bin/bash \n\
    service mysql start" > /root/startmysql.sh && \
    chmod +x /root/startmysql.sh

ENTRYPOINT /root/startmysql.sh
    
