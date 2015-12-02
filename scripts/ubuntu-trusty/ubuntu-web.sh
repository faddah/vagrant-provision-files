#!/bin/bash

# Apache
sudo apt-get install --yes apache2-bin apache2-dev
# chkconfig --add httpd
# chkconfig httpd on
sudo update-rc.d apache2 defaults
service apache2 stop

cp /var/www/html/index.html /vagrant/index-apache.html
rm -rf /var/www/html
ln -s /vagrant /var/www/html

service apache2 start

# PHP
sudo apt-get install --yes php5 php5-cli php5-common php5-cgi php5-dev php5-mysql phpmyadmin

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/faddah/vagrant-provision-files/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/faddah/vagrant-provision-files/master/files/info.php

service apache2 restart

cd /
