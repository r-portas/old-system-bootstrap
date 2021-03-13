#!/bin/bash

#
# Installs common tools for a base Fedora system,
# this includes extra repos like RPM Fusion
#

# Exit when any command fails
set -e
# Treat unset variables as an error
set -u
# Print all commands to stdout
set -x

# Setup the stable repository
sudo dnf config-manager \
  --add-repo \
  https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install -y docker-ce docker-ce-cli containerd.io

sudo systemctl start docker

# Create the docker group and add the current user
sudo groupadd docker
# Add the current user
# NOTE this will only be applied after logging out then back in
sudo usermod -aG docker $USER