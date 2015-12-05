#!/bin/bash

# For use with the Atlas Vagrant box, ubuntu/trusty64
# Update Ubuntu apt-get with any patches

echo -e "\n--- Updating packages list ---\n"
sudo apt-get update
# Tools
echo -e "\n--- Installing basic common Dev tools... ---\n"
sudo apt-get install --yes build-essential git git-man unzip python-software-properties
