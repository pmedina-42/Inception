#!/bin/sh

openrc
touch /run/openrc/softlevel
# Initialize mariadb database
/etc/init.d/mariadb setup
rc-service mariadb start

mysql -u root << EOF
CREATE USER 'root'@'%' IDENTIFIED BY 'rootp';
CREATE DATABASE bbdd;
CREATE USER 'user'@'%' IDENTIFIED BY 'pw';
GRANT ALL PRIVILEGES ON bbdd.* TO 'user'@'%';
GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'rootp';
FLUSH PRIVILEGES;
EOF

mysql -u root --password='rootp' 'bbdd' < config/wordpress.sql
