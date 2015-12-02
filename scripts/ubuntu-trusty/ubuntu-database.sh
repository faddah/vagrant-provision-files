#!/bin/bash

# MySQL
sudo apt-get install mysql-common mysql-server mysql-client mysql-workbench
chkconfig --add mysqld
chkconfig mysqld on
service mysqld stop

service mysqld start

mysql -u root -e "SHOW DATABASES";
