#!/bin/sh

cat << EOF > /config/init.sql
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'rootpass'
CREATE DATABASE IF NOT EXISTS database
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password'
GRANT ALL PRIVILEGES ON wordpressdb.* TO 'user'@'%'
GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'rootpass'
FLUSH PRIVILEGES
EOF 

openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
rc-service mariadb start
rc-service mariadb status
mysql -u root < config/init.sql
mysql -u root --password='rootpass' 'database' < config/wordpress.sql
mysql_upgrade
