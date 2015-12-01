#!/bin/bash

# MySQL
sudo apt-get install mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on
service mysqld stop

service mysqld start

mysql -u root -e "SHOW DATABASES";
