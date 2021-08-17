#!/usr/bin/env bash

set -e

readonly CONFIG="/var/snap/microk8s/current/args/containerd-template.toml"
readonly SOCKET="/var/snap/microk8s/common/run/containerd.sock"

sudo mkdir -p /var/snap/microk8s/current/var/lock
sudo touch /var/snap/microk8s/current/var/lock/gpu

echo "Installing NVIDIA Operator"

microk8s.helm3 install gpu-operator nvidia/gpu-operator \
  --version=v1.7.1 \
  --set operator.defaultRuntime=containerd \
  --set driver.enabled=false \
  --set toolkit.env[0].name=CONTAINERD_CONFIG \
  --set toolkit.env[0].value=$CONFIG \
  --set toolkit.env[1].name=CONTAINERD_SOCKET \
  --set toolkit.env[1].value=$SOCKET

echo "NVIDIA is enabled"