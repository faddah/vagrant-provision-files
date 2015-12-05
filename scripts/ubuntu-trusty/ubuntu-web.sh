#!/bin/env bash

# Apache
sudo apt-get install --yes apache2 apache2-bin apache2-dev

sudo service apache2 stop

sudo mv /var/www/html/index.html /vagrant/index-apache.html
sudo rm -rf /var/www/html
sudo ln -s /vagrant /var/www/html

sudo service apache2 start

# PHP
# from http://www.dev-metal.com/install-setup-php-5-6-ubuntu-14-04-lts/ - add apt repository ppa that has latest php 5.6.x
sudo add-apt-repository ppa:ondrej/php5-5.6

# update apt-get and apt-get latest python software properties to make all this php install work
sudo apt-get update
sudo apt-get install python-software-properties

# run apt-get update again after all that
sudo apt-get update

# install all the php5.6.x
sudo apt-get install --yes php5 php5-cli php5-common php5-cgi php5-dev php5-mysql

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/faddah/vagrant-provision-files/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/faddah/vagrant-provision-files/master/files/info.php

sudo service apache2 restart

cd /
