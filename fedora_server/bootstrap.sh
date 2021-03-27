#!/bin/bash

# Exit script on error
set -e

sudo dnf install -y ansible
# Uncomment below if not running as root
ansible-playbook playbook.yml # --ask-become-pass