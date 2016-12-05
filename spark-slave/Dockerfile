FROM java:v1

MAINTAINER Nitanka Gogoi <nitankagogoi@gmail.com>

ARG SPARK_URL="http://d3kbcqa49mib13.cloudfront.net/spark-2.0.2-bin-hadoop2.7.tgz"

RUN apt-get update && \
    apt-get install -y curl && \
    cd /tmp && \
    curl -O ${SPARK_URL} && \
    tar -xzf spark-2.0.2-bin-hadoop2.7.tgz && \
    mv spark-2.0.2-bin-hadoop2.7 /opt/spark

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
ENV SPARK_HOME=/opt/spark
ENV PATH=${PATH}:${SPARK_HOME}/bin
ENV PATH=${PATH}:${SPARK_HOME}/sbin

COPY start-slave.sh /root/
CMD ["/root/start-slave.sh"]
EXPOSE 4000-40000
