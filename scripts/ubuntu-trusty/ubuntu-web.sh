#!/bin/bash

# Apache
echo -e "\n\n--- Doing the Apache2 install... ---\n\n"
sudo apt-get install --yes apache2 apache2-bin apache2-dev

echo -e "\n\n--- Stop apache2 service... ---\n\n"
sudo service apache2 stop

echo -e "\n\n--- Making it so /vagrant common directory is the web file directory... ---\n\n"
sudo mv /var/www/html/index.html /vagrant/index-apache.html
sudo rm -rf /var/www/html
sudo ln -s /vagrant /var/www/html

echo -e "\n\n--- Starting apache2... ---\n\n"
sudo service apache2 start

# PHP 5.6
# from http://www.dev-metal.com/install-setup-php-5-6-ubuntu-14-04-lts/ - add apt repository ppa that has latest php 5.6.x
echo -e "\n\n--- Getting repository for PHP 5.6... ---\n\n"
sudo add-apt-repository ppa:ondrej/php5-5.6

# run apt-get update again after all that
echo -e "\n\n--- Running apt-get update again after updating repository... ---\n\n"
sudo apt-get update

# install all the php5.6.x
echo -e "\n\n--- Installing all of PHP 5.6... ---\n\n"
sudo apt-get install --yes php5 php5-cli php5-common php5-cgi php5-dev php5-mysql

# Download Starter Content
echo -e "\n\n--- Downloading web files... ---\n\n"
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/faddah/vagrant-provision-files/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/faddah/vagrant-provision-files/master/files/info.php

echo -e "\n\n--- Restarting apache2 after PHP 5.6 install... ---\n\n"
sudo service apache2 restart

cd /
