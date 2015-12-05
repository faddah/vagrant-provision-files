#!/bin/bash

# MySQL

# Get debconf-utils for this MySQL set-up.
sudo apt-get install debconf-utils -y > /dev/null

# Set-up so when MySQL install asks for password, it gets it.
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password mysqld"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password mysqld"

# Auto-update again so it gets those changes.
sudo apt-get update

sudo apt-get install --yes mysql-server-5.6 mysql-common-5.6 mysql-client-5.6
# chkconfig --add mysqld
# chkconfig mysqld on
service mysqld stop

service mysqld start

mysql -u root -e "SHOW DATABASES";
# read -r -p "Enter password: " response
# response=${response,,}    # tolower
# if [[ $response =~ ^(^M)$ ]]
