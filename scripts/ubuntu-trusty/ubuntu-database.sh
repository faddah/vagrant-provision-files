#!/bin/bash

# MySQL
sudo apt-get install --yes mysql-common mysql-server mysql-client mysql-workbench
# chkconfig --add mysqld
# chkconfig mysqld on
service mysqld stop

service mysqld start

mysql -u root -p -e "SHOW DATABASES";
# read -r -p "Enter password: " response
# response=${response,,}    # tolower
# if [[ $response =~ ^(^M)$ ]]
