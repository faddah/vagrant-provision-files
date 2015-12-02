#!/bin/bash

# Apache
sudo apt-get install --yes apache2-bin apache2-dev
# chkconfig --add httpd
# chkconfig httpd on
# service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

# service httpd start

# PHP
sudo apt-get install --yes php5 php5-cli php5-common php5-cgi php5-dev php5-mysql phpmyadmin

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/faddah/vagrant-provision-files/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/faddah/vagrant-provision-files/master/files/info.php

# service httpd restart

cd /
