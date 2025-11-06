# Ubuntu 22.04 base
FROM ubuntu:22.04
MAINTAINER HIT Big Data Lab

WORKDIR /root

# Install basic tools, SSH, Java 21, Scala
RUN apt-get update && \
    apt-get install -y openssh-server openjdk-21-jdk scala wget vim net-tools && \
    mkdir /var/run/sshd

# --- Environment variables ---
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV SCALA_HOME=/usr/share/scala
ENV HADOOP_VERSION=3.4.2
ENV SPARK_VERSION=4.0.1
ENV HADOOP_HOME=/usr/local/hadoop
ENV SPARK_HOME=/usr/local/spark
ENV PATH=$PATH:$JAVA_HOME/bin:$SCALA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SPARK_HOME/bin:$SPARK_HOME/sbin

# --- Install Hadoop 3.4.2 ---
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar -xzvf hadoop-${HADOOP_VERSION}.tar.gz && \
    mv hadoop-${HADOOP_VERSION} ${HADOOP_HOME} && \
    rm hadoop-${HADOOP_VERSION}.tar.gz

# --- Install Spark 4.0.1 (without Hadoop) ---
RUN wget https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-without-hadoop.tgz && \
    tar -xzvf spark-${SPARK_VERSION}-bin-without-hadoop.tgz && \
    mv spark-${SPARK_VERSION}-bin-without-hadoop ${SPARK_HOME} && \
    rm spark-${SPARK_VERSION}-bin-without-hadoop.tgz


# --- Instal sudo ---
RUN apt-get update && apt-get install -y openssh-server openjdk-21-jdk scala wget vim net-tools sudo

# --- SSH configuration (passwordless) ---
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys

# --- Hadoop directories ---
RUN mkdir -p ~/hdfs/namenode ~/hdfs/datanode ${HADOOP_HOME}/logs


# --- Copy configs (these will come from ./config folder) ---
COPY config/* ${HADOOP_HOME}/etc/hadoop/
COPY spark-config/* ${SPARK_HOME}/conf/

# --- Format HDFS ---
RUN ${HADOOP_HOME}/bin/hdfs namenode -format

# --- Start SSH & shell ---
CMD ["sh", "-c", "service ssh start; bash"]
