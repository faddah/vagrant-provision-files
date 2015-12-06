#!/bin/bash

# Get what apt-get will need for Node.js install.
echo -e "\n\n--- Get source needed for Node.js install... ---\n\n"
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

# Update Apt
echo -e "\n\n--- Updating apt-get... ---\n\n"
sudo apt-get update

# Install node.js & npm with apt-get
echo -e "\n\n--- Starting Node.js install... ---\n\n"
sudo apt-get install --yes nodejs

# Remove any unnecessary packages from Apt
echo -e "\n\n--- Node.js install - done-zo! Removing anything unnecessary from apt-get... ---\n\n"
sudo apt-get autoremove

# Desired NPM Packages install
echo -e "\n\n--- Starting NPM Extra Packages install... ---\n\n"
sudo npm cache clean -f
sudo npm i -g lodash@3.10.1 bower browserify connect express grunt grunt-cli gulp gulp-cli horse jasmine mocha n require socket.io typescript webpack

# Fixes for permissions of the node.js & npm directories
echo -e "\n\n--- Starting Fixes for Node.js & NPM permissions... ---\n\n"
sudo mkdir /home/vagrant/npm-global
sudo npm config set prefix '/home/vagrant/npm-global'
sudo rm -rf /home/vagrant/.profile
sudo mv /home/vagrant/profile-nodejs /home/vagrant/.profile
source /home/vagrant/.profile

echo -e "\n\n--- Node.js & NPM install... all done! ---\n\n"

npm list -g --depth=0

# ...done!
