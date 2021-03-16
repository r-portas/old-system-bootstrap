#!/bin/bash

# Installs k3s on the machine

# Exit when any command fails
set -e
# Treat unset variables as an error
set -u
# Print all commands to stdout
set -x

# Install pre-reqs
sudo dnf install -y container-selinux selinux-policy-base
sudo dnf install -y https://rpm.rancher.io/k3s/stable/common/centos/7/noarch/k3s-selinux-0.2-1.el7_8.noarch.rpm

# Install k3s
curl -sfL https://get.k3s.io | sh -s - --disable traefik --disable servicelb --disable-cloud-controller