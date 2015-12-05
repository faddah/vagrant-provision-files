#!/bin/bash

# Update Apt
sudo apt-get update

# Get what apt-get will need for Node.js install.
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

# Install node.js & npm with apt-get

sudo apt-get install --yes nodejs

# Fixes for the node.js & npm directories
mkdir ~/npm-global
sudo npm config set prefix '~/npm-global'
sudo rm -rf ~/.profile
sudo mv ~/profile-nodejs ~/.profile
source ~/.profile

# Remove any unnecessary packages from Apt

sudo apt-get autoremove

sudo npm cache clean -f
# sudo npm install -g n
# sudo n 4.2.2
# sudo npm install -g npm@3.3.12
sudo npm i -g lodash@3.10.1 bower browserify connect express grunt grunt-cli gulp gulp-cli horse jasmine mocha n require socket.io typescript webpack

sudo npm list -g --depth=0

# ...done!
