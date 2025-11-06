# Java & Hadoop
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop

# Spark paths
export SPARK_HOME=/usr/local/spark
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

# Networking
export SPARK_MASTER_HOST=master
export SPARK_LOCAL_IP=master
export SPARK_MASTER_WEBUI_PORT=8080

# Hadoop classpath integration (critical)
export SPARK_DIST_CLASSPATH=$($HADOOP_HOME/bin/hadoop classpath)

# Optional but recommended
export SPARK_LOG_DIR=$SPARK_HOME/logs
export SPARK_WORKER_DIR=$SPARK_HOME/work
