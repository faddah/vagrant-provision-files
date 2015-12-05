#!/bin/bash

# MySQL

# Get debconf-utils for this MySQL set-up.
# sudo apt-get install debconf-utils -y > /dev/null

# Set-up so when MySQL install asks for password, it gets it.
# sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password mysqld"
# sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password mysqld"

# Auto-update again so it gets those changes.
# sudo apt-get update

# sudo apt-get install --yes mysql-server-5.6 mysql-common-5.6 mysql-client-5.6
# chkconfig --add mysqld
# chkconfig mysqld on
# service mysqld stop

# service mysqld start

# Trying this MySQL install by Ryan Rosiek found here, https://gist.github.com/rrosiek/8190550, see if it works better

# Variables
APPENV=local
DBHOST=localhost
DBNAME=dbtest
DBUSER=root
DBPASSWD=mysqld

echo -e "\n--- Mkay, installing now... ---\n"

echo -e "\n--- Updating packages list ---\n"
apt-get -qq update

# Commented out as these are all ready installed by Ubuntu or the ubuntu-common.sh
# echo -e "\n--- Install base packages ---\n"
# apt-get -y install vim curl build-essential python-software-properties git > /dev/null 2>&1

# Commented out as these are all ready installed/handled by Ubuntu or my ubuntu-web.sh and ubuntu-nodejs.sh
# echo -e "\n--- Add some repos to update our distro ---\n"
# add-apt-repository ppa:ondrej/php5 > /dev/null 2>&1
# Don't need this, not installing node.js in this script
# add-apt-repository ppa:chris-lea/node.js > /dev/null 2>&1

echo -e "\n--- Updating packages list ---\n"
apt-get -qq update

echo -e "\n--- Install MySQL specific packages and settings ---\n"
echo "mysql-server mysql-server/root_password password $DBPASSWD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | debconf-set-selections
# apt-get -y install mysql-server-5.5 phpmyadmin > /dev/null 2>&1
# Changing the above install line to my own version
sudo apt-get -y install mysql-server mysql-common mysql-client phpmyadmin

echo -e "\n--- Setting up our MySQL user and db ---\n"
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"

mysql -u root -p -e "SHOW DATABASES";
read -r -p "Enter password: " response
response=${response,,}    # tolower
if [[ $response =~ ^(mysqld)$ ]]
