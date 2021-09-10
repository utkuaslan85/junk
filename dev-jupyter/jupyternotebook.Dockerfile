FROM jupyterlab/spark:3.1.2-hadoop-3.2.0

RUN pip install --upgrade pip \
    jupyterlab jupyterlab-git

RUN apt install -y nodejs

RUN pip install \
    jupyterlab==3.1.11 \
    ipynb==0.5.1 \
    jupyterlab-sparkmonitor \
    pyspark==3.1.2

# python packages
RUN pip install fastavro avro confluent-kafka python-binance \
    kafka-python python-binance minio modin[all] websocket-client \
    requests PyGithub argo-workflows git+https://github.com/couler-proj/couler

# jupyterlab extensions
RUN pip install jupyterlab-python-file ipylab jupyter_bokeh \
    jupyterlab_execute_time jupyterlab-lsp ipympl jedi-language-server \
    jupyterlab-plugin-graph jupyterlab-spreadsheet-editor jupyter-dash \
    jlab-enhanced-cell-toolbar lckr-jupyterlab-variableinspector \
    jupyterlab_play_cell_button
RUN pip install s3fs

# install extension to monitor spark
RUN ipython profile create --ipython-dir=.ipython && \
echo "c.InteractiveShellApp.extensions.append('sparkmonitor.kernelextension')" >>  .ipython/profile_default/ipython_config.py

RUN ln -s /usr/local/lib/python3.9/dist-packages/sparkmonitor/listener.jar /opt/spark/jars/listener.jar

VOLUME /home/notebook/

RUN jupyter lab build

CMD IPYTHONDIR=.ipython jupyter lab --port=8888 --debug --LabApp.token='' --allow-root
