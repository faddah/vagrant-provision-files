#!/bin/bash

# Apache
sudo apt-get install --yes apache2 apache2-bin apache2-dev
# sudo update-rc.d apache2 defaults
# service apache2 stop

sudo mv /var/www/html/index.html /vagrant/index-apache.html
sudo rm -rf /var/www/html
sudo ln -s /vagrant /var/www/html

# service apache2 start

# PHP
sudo apt-get install --yes php5 php5-cli php5-common php5-cgi php5-dev php5-mysql

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/faddah/vagrant-provision-files/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/faddah/vagrant-provision-files/master/files/info.php

# service apache2 restart

cd /
