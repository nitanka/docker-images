FROM ubuntu:14.04
 
RUN apt-get update && apt-get install -y wget git curl software-properties-common
RUN apt-add-repository ppa:webupd8team/java -y && apt-get update -y && \
    echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
    echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections && \
    apt-get install -y oracle-java8-installer

RUN apt-get update && apt-get install -y maven ant ruby rbenv make
RUN echo "1.84.3" > .lts-version-number
RUN wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add -
RUN echo deb http://pkg.jenkins-ci.org/debian-stable binary/ >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y jenkins

RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

#RUN mkdir -p /var/jenkins_home && chown -R jenkins /var/jenkins_home
#ADD init.groovy /tmp/WEB-INF/init.groovy
#RUN apt-get install -y zip && cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/init.groovy
#USER jenkins

# VOLUME /var/jenkins_home - bind this in via -v if you want to make this persistent.
#ENV JENKINS_HOME /var/jenkins_home

# for main web interface:
#EXPOSE 8080 

# will be used by attached slave agents:
#EXPOSE 50000 
