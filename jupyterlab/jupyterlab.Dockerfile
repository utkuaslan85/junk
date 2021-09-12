FROM 10.152.183.174:5000/spark:3.1.2-hadoop-3.2.0-aws

RUN pip install --upgrade pip

RUN apt-get update && apt install -y curl

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs git

RUN pip install \
    jupyterlab==3.1.11 \
    ipynb==0.5.1 \
    jupyterlab-sparkmonitor \
    pyspark==3.1.2

# python packages
RUN pip install jupyterlab-git fastavro avro confluent-kafka python-binance \
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
RUN ipython profile create && \
    ipython profile create --ipython-dir=.ipython && \
    echo "c.InteractiveShellApp.extensions.append('sparkmonitor.kernelextension')" >>  .ipython/profile_default/ipython_config.py && \
    echo "c.InteractiveShellApp.extensions.append('sparkmonitor.kernelextension')" >>  $(ipython profile locate default)/ipython_kernel_config.py


RUN ln -s /usr/local/lib/python3.9/dist-packages/sparkmonitor/listener.jar /opt/spark/jars/listener.jar

RUN jupyter lab build

VOLUME /home/notebook/

CMD jupyter lab --debug --LabApp.token='' --allow-root --port=8888 --notebook-dir=/home/notebook/  --no-browser --ip=0.0.0.0 
