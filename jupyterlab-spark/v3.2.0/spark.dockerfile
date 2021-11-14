FROM localhost:32000/spark-py:3.2.0-hadoop-3.2.0

RUN apt-get update && apt install -y \
    wget \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/cache/apt/*

RUN cd /opt/spark/jars \
 && wget "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.102/aws-java-sdk-bundle-1.12.102.jar"
RUN cd /opt/spark/jars \
 && wget "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.2.0/hadoop-aws-3.2.0.jar"
RUN cd /opt/spark/jars \
 && wget "https://repo1.maven.org/maven2/org/apache/spark/spark-streaming-kafka-0-10_2.12/3.2.0/spark-streaming-kafka-0-10_2.12-3.2.0.jar"
RUN cd /opt/spark/jars \
 && wget "https://repo1.maven.org/maven2/org/apache/hudi/hudi-spark3-bundle_2.12/0.9.0/hudi-spark3-bundle_2.12-0.9.0.jar"
RUN cd /opt/spark/jars \
 && wget "https://repo1.maven.org/maven2/org/apache/spark/spark-sql-kafka-0-10_2.12/3.2.0/spark-sql-kafka-0-10_2.12-3.2.0.jar"
RUN cd /opt/spark/jars \
 && wget "https://repo1.maven.org/maven2/org/apache/spark/spark-avro_2.13/3.2.0/spark-avro_2.13-3.2.0.jar"

CMD python3
# tag built image as localhost:32000/spark:3.2.0-hadoop-3.2.0-wjar