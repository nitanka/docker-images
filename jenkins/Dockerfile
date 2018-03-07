FROM ubuntu:14.04

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
 
RUN apt-get update && apt-get install -y wget git curl software-properties-common
RUN apt-add-repository ppa:webupd8team/java -y && apt-get update -y && \
    echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
    echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections && \
    apt-get install -y oracle-java9-installer && \
    apt-get update && apt-get install -y maven ant ruby rbenv make && \ 
    wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add - && \
    echo deb http://pkg.jenkins-ci.org/debian-stable binary/ >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y jenkins

COPY startjenkins.sh /usr/sbin/

ENV JENKINS_HOME /var/lib/jenkins

RUN groupadd -g ${gid} ${group} \
    && useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

#RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
#RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture)" \
#    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture).asc" \
#    && gpg --verify /usr/local/bin/gosu.asc \
#    && rm /usr/local/bin/gosu.asc \
#    && chmod +x /usr/local/bin/gosu
#

EXPOSE 8080 


ENTRYPOINT "/usr/sbin/startjenkins.sh"


