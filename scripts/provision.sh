#!/bin/bash

# Install Git, Nano, Screen, Node.js & NPM, update Node.js, update NPM, add Node.js packages

curl --silent --location https://rpm.nodesource.com/setup | bash -
yum install -y git
yum install -y nano
yum install -y screen
yum install -y nodejs
yum groupinstall -y 'Development Tools'
sudo npm cache clean -f
sudo npm install -g n
sudo n 4.2.2
sudo npm install -g npm@3.3.12
sudo npm i -g lodash@3.0.0 bower browserify connect express grunt grunt-cli gulp gulp-cli horse jasmine mocha require socket.io typescript webpack
