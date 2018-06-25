FROM debian:stable-slim 

#COPY videoskim-0.0.1-SNAPSHOT.jar /opt/

RUN apt-get update -y && \
    apt-get install procps -y 

COPY jdk1.8.0_171 /usr/lib/jvm

RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/bin/java 1 && \
    update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/bin/javac 1
    update-alternatives --install /usr/bin/jps jps /usr/lib/jvm/bin/jps 1 


    




