#!/bin/bash

# MySQL
sudo apt-get install --yes mysql-server-5.6 mysql-common-5.6 mysql-client-5.6 mysql-workbench
# chkconfig --add mysqld
# chkconfig mysqld on
service mysqld stop

service mysqld start

mysql -u root -e "SHOW DATABASES";
# read -r -p "Enter password: " response
# response=${response,,}    # tolower
# if [[ $response =~ ^(^M)$ ]]
