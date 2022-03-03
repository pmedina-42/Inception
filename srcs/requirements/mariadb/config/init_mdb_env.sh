#!/bin/sh

sed -i "s/user/$MYSQL_USER/" config/start.sh
sed -i "s/password/$MYSQL_PASSWORD/" config/start.sh
sed -i "s/rootpass/$MYSQL_ROOT_PASSWORD/" config/start.sh
sed -i "s/database/$MYSQL_DB/" config/start.sh

