FROM ahanaio/prestodb-sandbox:0.275
USER root
RUN rm /opt/presto-server/plugin/hive-hadoop2/hudi-presto-bundle-0.11.0.jar \
	/opt/presto-server/plugin/hudi/hudi-presto-bundle-0.11.0.jar \
	&& curl -O https://repo1.maven.org/maven2/org/apache/hudi/hudi-presto-bundle/0.12.0/hudi-presto-bundle-0.12.0.jar \
	&& cp hudi-presto-bundle-0.12.0.jar /opt/presto-server/plugin/hive-hadoop2/ \
	&& mv hudi-presto-bundle-0.12.0.jar /opt/presto-server/plugin/hudi/
