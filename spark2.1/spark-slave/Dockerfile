#DOCKERFILE FOR SPARK-SLAVE
 
#METADATA
# { 
# "imageName":"spark", 
# "tag":"slave",
# "description":"desc"
# }
#METADATA

FROM ubuntu:14.04
MAINTAINER Nitanka Gogoi <nitanka.gogoi@razorthink.com>
 
ARG SPARK_URL="http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz"
RUN apt-get update && \
    apt-get install -y curl && \
    cd /tmp && \
    curl -O ${SPARK_URL} && \
    tar -xzf spark-2.1.0-bin-hadoop2.7.tgz && \
    mv spark-2.1.0-bin-hadoop2.7 /opt/spark && \
    echo "#!/bin/bash" > /root/start-slave.sh && \
    echo "spark-class org.apache.spark.deploy.worker.Worker spark://spark-master:7077" >> /root/start-slave.sh && \
    chmod +x /root/start-slave.sh
    
 
ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
ENV SPARK_HOME=/opt/spark
ENV PATH=${PATH}:${SPARK_HOME}/bin
ENV PATH=${PATH}:${SPARK_HOME}/sbin
 
CMD ["/root/start-slave.sh"]
EXPOSE 4000-40000
