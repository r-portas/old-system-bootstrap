#!/bin/bash

# Exit script on error
set -e

sudo dnf install -y ansible
ansible-playbook playbook.yml --ask-become-pass