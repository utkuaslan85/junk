FROM openjdk:8-slim

ARG HADOOP_VERSION=3.3.1

RUN apt-get update && apt-get install -y curl --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

# Download and extract the Hadoop binary package.
RUN curl https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz \
	| tar xvz -C /opt/  \
	&& ln -s /opt/hadoop-$HADOOP_VERSION /opt/hadoop \
	&& rm -r /opt/hadoop/share/doc 

# Add S3a jars to the classpath using this hack.
RUN ln -s /opt/hadoop/share/hadoop/tools/lib/hadoop-aws* /opt/hadoop/share/hadoop/common/lib/ && \
    ln -s /opt/hadoop/share/hadoop/tools/lib/aws-java-sdk* /opt/hadoop/share/hadoop/common/lib/

# Set necessary environment variables. 
ENV HADOOP_HOME="/opt/hadoop"
ENV PATH="/opt/bitnami/spark/bin:/opt/hadoop/bin:${PATH}"

# Download and install the standalone metastore binary.
RUN curl https://archive.apache.org/dist/hive/hive-2.3.1/apache-hive-2.3.1-bin.tar.gz \
	| tar xvz -C /opt/ \
	&& ln -s /opt/apache-hive-2.3.1-bin /opt/hive-metastore

ENV HIVE_HOME="/opt/hive-metastore"
ENV PATH="/opt/hive-metastore/bin:${PATH}"

RUN curl -O https://repo1.maven.org/maven2/org/apache/hudi/hudi-hive-sync/0.11.0/hudi-hive-sync-0.11.0.jar \
	&& mv hudi-hive-sync-0.11.0.jar /opt/hive-metastore/lib/ 

# Download and install the mysql connector.
RUN curl -L https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.29.tar.gz \
	| tar xvz -C /opt/ \
	&& ln -s /opt/mysql-connector-java-8.0.29/mysql-connector-java-8.0.29.jar /opt/hadoop/share/hadoop/common/lib/ \
	&& ln -s /opt/mysql-connector-java-8.0.29/mysql-connector-java-8.0.29.jar /opt/hive-metastore/lib/
