# syntax=docker/dockerfile:1
FROM cadlabsorg/jupyter-lab-environment:v0.1.2
RUN pip install --upgrade pip
RUN pip install --upgrade jupyterlab jupyterlab-git
RUN conda update -n base conda && conda install -c conda-forge nodejs
RUN pip install fastavro avro confluent-kafka python-binance \
    kafka-python python-binance minio modin[all] websocket-client \
    requests PyGithub argo-workflows s3fs git+https://github.com/couler-proj/couler
RUN pip install jupyterlab-python-file ipylab jupyter_bokeh \
    jupyterlab_execute_time jupyterlab-lsp ipympl jedi-language-server \
    jupyterlab-plugin-graph jupyterlab-spreadsheet-editor jupyter-dash \
    jlab-enhanced-cell-toolbar lckr-jupyterlab-variableinspector \
    jupyterlab_play_cell_button jupyterlab-sparkmonitor
RUN ipython profile create --ipython-dir=.ipython && \
    echo "c.InteractiveShellApp.extensions.append('sparkmonitor.kernelextension')" >>  .ipython/profile_default/ipython_config.py
RUN jupyter lab build

