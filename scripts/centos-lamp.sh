#!/bin/bash

# Get what yum will need for Node.js install.
curl --silent --location https://rpm.nodesource.com/setup | bash -
# Update CentOS with any patches
yum update -y --exclude-kernel
# Tools
yum install -y nano vim git unzip screen nodejs
# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on
service mysqld stop

service mysqld start

mysql -u root -e "SHOW DATABASES";

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/faddah/vagrant-provision-files/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/faddah/vagrant-provision-files/master/files/info.php

service httpd restart

# Add remaining Node.js & NPM updates and packages.
yum groupinstall -y 'Development Tools'
sudo npm cache clean -f
sudo npm install -g n
sudo n 4.2.2
sudo npm install -g npm@3.3.12
sudo npm i -g lodash@3.0.0 bower browserify connect express grunt grunt-cli gulp gulp-cli horse jasmine mocha require socket.io typescript webpack
