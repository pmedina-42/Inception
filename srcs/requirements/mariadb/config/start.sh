#!/bin/sh

openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
rc-service mariadb start
rc-service mariadb status
mysql -u root < config/init.sql
#aqui peta mariadb
#mysql -u root --password='rootpass' 'wordpressdb' < config/wordpress.sql
