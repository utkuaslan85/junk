FROM localhost:32000/spark-py:3.1.2-hadoop-3.2.0

RUN apt-get update && apt install -y \
    wget \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/cache/apt/*

RUN cd /opt/spark/jars \
    && wget "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.888/aws-java-sdk-bundle-1.11.888.jar" \
    && wget "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.2.0/hadoop-aws-3.2.0.jar" \
    && wget "https://repo1.maven.org/maven2/org/apache/spark/spark-streaming-kafka-0-10_2.12/3.1.2/spark-streaming-kafka-0-10_2.12-3.1.2.jar" \
    && wget "https://repo1.maven.org/maven2/org/apache/hudi/hudi-spark3-bundle_2.12/0.9.0/hudi-spark3-bundle_2.12-0.9.0.jar" \
    && wget "https://repo1.maven.org/maven2/org/apache/spark/spark-sql-kafka-0-10_2.12/3.1.2/spark-sql-kafka-0-10_2.12-3.1.2.jar" \
    && wget "https://repo1.maven.org/maven2/org/apache/spark/spark-avro_2.12/3.1.2/spark-avro_2.12-3.1.2.jar" \
    && wget "https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/3.0.0/kafka-clients-3.0.0.jar" \
    && wget "https://repo1.maven.org/maven2/org/apache/spark/spark-streaming-kafka-0-10-assembly_2.12/3.1.2/spark-streaming-kafka-0-10-assembly_2.12-3.1.2.jar" \
    && wget "https://repo1.maven.org/maven2/org/apache/commons/commons-pool2/2.11.1/commons-pool2-2.11.1.jar" \
    && wget "https://repo1.maven.org/maven2/org/apache/spark/spark-token-provider-kafka-0-10_2.12/3.1.2/spark-token-provider-kafka-0-10_2.12-3.1.2.jar" \
    && wget "https://repo1.maven.org/maven2/org/apache/kafka/kafka_2.12/3.0.0/kafka_2.12-3.0.0.jar" \
    && wget "https://repo1.maven.org/maven2/org/apache/hudi/hudi-utilities-bundle_2.12/0.9.0/hudi-utilities-bundle_2.12-0.9.0.jar"

# CMD python3
# tag built image as localhost:32000/spark:3.1.2-hadoop-3.2.0-wjar-hede