#!/bin/sh

sed -i "s/bbdd/$MYSQL_DATABASE/" config/initdb.sql
sed -i "s/user/$MYSQL_USER/" config/initdb.sql
sed -i "s/pass/$MYSQL_PASSWORD/" config/initdb.sql
sed -i "s/rootp/$MYSQL_ROOT_PASSWORD/" config/initdb.sql
sed -i "s/rootpass/$MYSQL_ROOT_PASSWORD/" config/mariadb-init.sh
sed -i "s/bbdd/$MYSQL_DATABASE/" config/mariadb-init.sh

echo $MYSQL_DATABASE
echo $MYSQL_ROOT_PASSWORD
echo $MYSQL_USER
echo $MYSQL_PASSWORD
