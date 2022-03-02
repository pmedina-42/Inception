#!/bin/sh

sed -i "s/db/$MYSQL_DB/" config/init.sql
sed -i "s/user/$MYSQL_USER/" config/init.sql
sed -i "s/password/$MYSQL_PASSWORD/" config/init.sql
sed -i "s/rootpass/$MYSQL_ROOT_PASSWORD/" config/init.sql
sed -i "s/rootpass/$MYSQL_ROOT_PASSWORD/" config/start.sh
sed -i "s/database/$MYSQL_DB/" config/start.sh

cat config/start.sh

echo $MYSQL_DB
echo $MYSQL_ROOT_PASSWORD
echo $MYSQL_USER
echo $MYSQL_PASSWORD
