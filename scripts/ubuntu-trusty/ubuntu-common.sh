#!/bin/bash

# For use with the Atlas Vagrant box, ubuntu/trusty64
# Update Ubuntu apt-get with any patches
echo -e "\n\n--- Updating packages list ---\n\n"
sudo apt-get update
# Tools
echo -e "\n\n--- Installing basic common Dev tools... ---\n\n"
sudo apt-get install --yes build-essential git git-man unzip python-software-properties
