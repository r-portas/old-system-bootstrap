#!/bin/bash

#
# Installs and configures ClamAV
#

# Exit when any command fails
set -e
# Treat unset variables as an error
set -u
# Print all commands to stdout
set -x

# App image launcher
# https://github.com/TheAssassin/AppImageLauncher/releases
sudo dnf install -y https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm

# Lens
# https://github.com/lensapp/lens/releases
sudo dnf install -y https://github.com/lensapp/lens/releases/download/v4.1.4/Lens-4.1.4.x86_64.rpm

# Insomnia
# https://github.com/Kong/insomnia/releases
sudo dnf install -y https://github.com/Kong/insomnia/releases/download/core%402021.1.1/Insomnia.Core-2021.1.1.rpm

# VSCode
sudo dnf install -y https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64

# Install default vscode extensions
code --install-extension vscodevim.vim
code --install-extension esbenp.prettier-vscode
