FROM 10.109.120.111:5000/bitnami-spark-wjar:jan27-22
#USER root
#PYSPARK_PYTHON=/opt/bitnami/python/bin/python \
ENV PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.9.2-src.zip:$PYTHONPATH \
    PATH=$SPARK_HOME/python:$PATH
    #PYSPARK_DRIVER_PYTHON=/opt/bitnami/python/bin/python
