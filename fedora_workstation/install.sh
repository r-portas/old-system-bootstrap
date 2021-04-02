#!/bin/bash

#
# Bootstraps a fedora server
#

# Exit script on error
set -e

# Install git, to clone the repo
sudo dnf install -y git make

# Clone the repo
cd ~ && git clone https://github.com/r-portas/system-bootstrap.git

cd ~/system-bootstrap/fedora_server/ && make bootstrap