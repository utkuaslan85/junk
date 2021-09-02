# syntax=docker/dockerfile:1
FROM cadlabsorg/jupyter-lab-environment:v0.1.2
RUN pip install --upgrade pip
RUN pip install --upgrade jupyterlab jupyterlab-git
RUN conda update -n base conda
RUN conda install -c conda-forge nodejs
RUN pip install jupyterlab-python-file ipylab jupyter_bokeh
RUN pip install jupyterlab_execute_time jupyterlab-lsp ipympl jedi-language-server
RUN pip install jupyterlab-plugin-graph jupyterlab-spreadsheet-editor jupyter-dash
RUN pip install jlab-enhanced-cell-toolbar lckr-jupyterlab-variableinspector
RUN pip install jupyterlab_play_cell_button
RUN jupyter lab build
RUN pip install fastavro avro confluent-kafka python-binance s3fs
RUN pip install kafka-python python-binance minio modin[all] websocket-client
RUN pip install requests PyGithub argo-workflows
RUN pip install git+https://github.com/couler-proj/couler
