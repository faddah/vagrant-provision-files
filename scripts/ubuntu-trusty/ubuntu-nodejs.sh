#!/bin/bash

# Get what yum will need for Node.js install.
curl --silent --location https://rpm.nodesource.com/setup | bash -

# Add remaining Node.js & NPM updates and packages.
# sudo apt-get groupinstall -y 'Development Tools'
sudo npm cache clean -f
sudo npm install -g n
sudo n 4.2.2
sudo npm install -g npm@3.3.12
sudo npm i -g lodash@3.0.0 bower browserify connect express grunt grunt-cli gulp gulp-cli horse jasmine mocha require socket.io typescript webpack
