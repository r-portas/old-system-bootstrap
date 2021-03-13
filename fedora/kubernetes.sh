#!/bin/bash

# Exit when any command fails
set -e
# Treat unset variables as an error
set -u
# Print all commands to stdout
set -x

# Variables
KUBECTX_VERSION=v0.9.3
KUBENS_VERSION=v0.9.3

BIN_PATH=/usr/local/bin
TMP_PATH=/tmp/kubernetes-tools

mkdir -p $TMP_PATH

# Kubectl
curl -o $TMP_PATH/kubectl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install $TMP_PATH/kubectl $BIN_PATH/kubectl

# Kubectx
curl -o $TMP_PATH/kubectx.tar.gz -L https://github.com/ahmetb/kubectx/releases/download/${KUBECTX_VERSION}/kubectx_${KUBECTX_VERSION}_linux_x86_64.tar.gz
tar -xzf $TMP_PATH/kubectx.tar.gz -C $TMP_PATH
sudo install $TMP_PATH/kubectx $BIN_PATH/kubectx

# Kubens
curl -o $TMP_PATH/kubens.tar.gz -L https://github.com/ahmetb/kubectx/releases/download/${KUBENS_VERSION}/kubens_${KUBENS_VERSION}_linux_x86_64.tar.gz
tar -xzf $TMP_PATH/kubens.tar.gz -C $TMP_PATH
sudo install $TMP_PATH/kubens $BIN_PATH/kubens

# k3d
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# Skaffold
curl -o $TMP_PATH/skaffold -L https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
sudo install $TMP_PATH/skaffold $BIN_PATH/skaffold

rm -rf $TMP_PATH