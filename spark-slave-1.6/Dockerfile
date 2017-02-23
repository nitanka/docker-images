FROM ubuntu:14.04

MAINTAINER nitanka <nitanka.gogoi@razorthink.net>

RUN apt-get update && \
    apt-get install -y software-properties-common python-software-properties wget && \
    apt-add-repository ppa:webupd8team/java -y && \
    apt-get install -y wget && \
    apt-get update -y && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    mkdir /opt/package && \ 
    cd /opt/package && \ 
    wget http://d3kbcqa49mib13.cloudfront.net/spark-1.6.2-bin-hadoop2.6.tgz && \
    tar -xzf spark-1.6.2-bin-hadoop2.6.tgz && \
    mv spark-1.6.2-bin-hadoop2.6 spark 
    
ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
ENV SPARK_HOME=/opt/spark
ENV PATH=${PATH}:${SPARK_HOME}/bin
ENV PATH=${PATH}:${SPARK_HOME}/sbin
COPY start-slave.sh /root/
CMD ["/root/start-slave.sh"]
EXPOSE 4000-40000
