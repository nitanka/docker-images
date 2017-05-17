FROM ubuntu:14.04

MAINTAINER devops <nitanka.gogoi@razorthink.com>
WORKDIR /root

ARG HADOOP_URL='http://mirror.fibergrid.in/apache/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz'

RUN apt-get update && apt-get install -y openssh-server openjdk-7-jdk wget && \
    cd /tmp && \
    wget ${HADOOP_URL} && \
    tar -xzvf hadoop-2.7.3.tar.gz && \
    mv hadoop-2.7.3 /usr/local/hadoop && \
    rm hadoop-2.7.3.tar.gz && \
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    echo 'Host * \n\
              StrictHostKeyChecking no \n\
              UserKnownHostsFile=/dev/null' > ~/.ssh/config && \
    mkdir -p /opt/hdfs/namenode && \ 
    mkdir -p /opt/hdfs/datanode && \
    mkdir -p /opt/hdfs/logs && \
    mkdir -p /tmp/hadoopStore/tmp

ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 
ENV HADOOP_HOME=/usr/local/hadoop 
ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin 

RUN echo '<?xml version="1.0"?> \n\
             <configuration> \n\
               <property> \n\
                <name>hadoop.tmp.dir</name> \n\
                <value>/tmp/hadoopStore/tmp</value> \n\
                <description>A base for other temporary directories.</description> \n\
               </property> \n\
               <property> \n\
                <name>fs.defaultFS</name> \n\
                <value>hdfs://hadoop-namenode:9000/</value> \n\
               </property> \n\
             </configuration>' > ${HADOOP_HOME}/etc/hadoop/core-site.xml



RUN echo '<?xml version="1.0"?> \n\
            <configuration> \n\
              <property> \n\
               <name>dfs.namenode.name.dir</name> \n\
               <value>file:///opt/hdfs/namenode</value> \n\
               <description>NameNode directory for namespace and transaction logs storage.</description> \n\
              </property> \n\
              <property> \n\
               <name>dfs.datanode.data.dir</name> \n\
               <value>file:///opt/hdfs/datanode</value> \n\
               <description>DataNode directory</description> \n\
              </property> \n\
              <property> \n\
               <name>dfs.replication</name> \n\
               <value>2</value> \n\
              </property> \n\
            </configuration>' > ${HADOOP_HOME}/etc/hadoop/hdfs-site.xml
                                                                                                                                                     
RUN echo 'export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 \n\
          export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-"/etc/hadoop"} \n\
 	  for f in $HADOOP_HOME/contrib/capacity-scheduler/*.jar; do \n\
  		if [ "$HADOOP_CLASSPATH" ]; then \n\
    		  export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$f \n\
  		else \n\
    		  export HADOOP_CLASSPATH=$f \n\
  		fi \n\
	  done        \n\    
          export HADOOP_OPTS="$HADOOP_OPTS -Djava.net.preferIPv4Stack=true" \n\
          export HADOOP_NAMENODE_OPTS="-Dhadoop.security.logger=${HADOOP_SECURITY_LOGGER:-INFO,RFAS} -Dhdfs.audit.logger=${HDFS_AUDIT_LOGGER:-INFO,NullAppender} $HADOOP_NAMENODE_OPTS" \n\
   	  export HADOOP_DATANODE_OPTS="-Dhadoop.security.logger=ERROR,RFAS $HADOOP_DATANODE_OPTS" \n\
          export HADOOP_SECONDARYNAMENODE_OPTS="-Dhadoop.security.logger=${HADOOP_SECURITY_LOGGER:-INFO,RFAS} -Dhdfs.audit.logger=${HDFS_AUDIT_LOGGER:-INFO,NullAppender} $HADOOP_SECONDARYNAMENODE_OPTS" \n\
	  export HADOOP_NFS3_OPTS="$HADOOP_NFS3_OPTS" \n\
	  export HADOOP_PORTMAP_OPTS="-Xmx512m $HADOOP_PORTMAP_OPTS" \n\
	  export HADOOP_CLIENT_OPTS="-Xmx512m $HADOOP_CLIENT_OPTS" \n\
          export HADOOP_LOG_DIR=/tmp/hadoopStore/tmp \n\
          export HADOOP_SECURE_DN_LOG_DIR=${HADOOP_LOG_DIR}/${HADOOP_HDFS_USER} \n\
          export HADOOP_PID_DIR=${HADOOP_PID_DIR} \n\
          export HADOOP_SECURE_DN_PID_DIR=${HADOOP_PID_DIR} \n\
          export HADOOP_IDENT_STRING=$USER' > ${HADOOP_HOME}/etc/hadoop/hadoop-env.sh

RUN echo "#!/bin/bash \n\
    service ssh start\n\
    /usr/local/hadoop/bin/hadoop namenode -format \n\
    /usr/local/hadoop/sbin/start-dfs.sh \n\ 
    while true; do sleep 1000; done" > /root/start-master.sh && \
    chmod +x /root/start-master.sh && \
    ln -s /root/start-master.sh /bin/start-master

RUN echo "#!/bin/bash \n\
    service ssh start\n\
    /usr/local/hadoop/sbin/start-dfs.sh \n\ 
    while true; do sleep 1000; done" > /root/start-slave.sh && \
    chmod +x /root/start-slave.sh && \
    ln -s /root/start-slave.sh /bin/start-slave

EXPOSE 9000
EXPOSE 50070

CMD [ "sh","-c","start-master" ]         

