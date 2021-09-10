FROM sparklab/spark:3.1.2-hadoop-3.2.0

RUN apt-get update && apt install -y \
    wget \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/cache/apt/*

RUN cd /opt/spark/jars \
 && wget "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.888/aws-java-sdk-bundle-1.11.888.jar"
RUN cd /opt/spark/jars \
 && wget "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.2.0/hadoop-aws-3.2.0.jar"