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

# Install RPM Fusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Update system packages
sudo dnf update -y

# Install common packages
sudo dnf install -y \
  vim \
  htop \
  vlc \
  VirtualBox \
  vagrant \
  gnome-tweaks \
  dnf-plugins-core # Used by docker script

# Set vim as the default editor
grep -qxF 'export EDITOR=vim' ~/.bash_profile || echo 'export EDITOR=vim' >> ~/.bash_profile

# Tell git to use merge by default
git config pull.rebase false
