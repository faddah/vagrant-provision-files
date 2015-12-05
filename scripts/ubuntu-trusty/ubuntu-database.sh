#!/bin/bash

# MySQL

# Set-up so when MySQL install asks for password, it gets it.
debconf-set-selections <<< 'mysql-server mysql-server/root_password password mysqld'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mysqld'

# Auto-update again so it gets those changes.
apt-get update

sudo apt-get install --yes mysql-server-5.6 mysql-common-5.6 mysql-client-5.6
# chkconfig --add mysqld
# chkconfig mysqld on
service mysqld stop

service mysqld start

mysql -u root -e "SHOW DATABASES";
# read -r -p "Enter password: " response
# response=${response,,}    # tolower
# if [[ $response =~ ^(^M)$ ]]
