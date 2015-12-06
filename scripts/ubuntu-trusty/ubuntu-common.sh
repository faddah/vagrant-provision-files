#!/bin/bash

# For use with the Atlas Vagrant box, ubuntu/trusty64
# Get latest git from core maintainers repository
echo -e "\n\n--- Getting latest git repository... ---\n\n"
sudo add-apt-repository ppa:git-core/ppa
# Update Ubuntu apt-get for the repository to take effect
echo -e "\n\n--- Updating packages list ---\n\n"
sudo apt-get update
# Tools
echo -e "\n\n--- Installing basic common Dev tools... ---\n\n"
sudo apt-get install --yes build-essential git git-man unzip python-software-properties
