FROM codercom/code-server:3.12.0
USER root

# pip installation
RUN apt-get update \
    && apt-get install apt-utils -y \
    && apt-get upgrade -y \
    && apt-get install python3-distutils -y \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py

# helm installation
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 \
    && chmod 700 get_helm.sh \
    && ./get_helm.sh

# kubectl installation
# RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
#     && curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" \
#     && echo "$(<kubectl.sha256) kubectl" | sha256sum --check \
#     && sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN apt-get install -y apt-transport-https ca-certificates curl \
    && sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update \
    && apt-get install -y kubectl

# put config file to /root/.kube
RUN mkdir /root/.kube 
COPY config /root/.kube
RUN helm --kubeconfig /root/.kube/config