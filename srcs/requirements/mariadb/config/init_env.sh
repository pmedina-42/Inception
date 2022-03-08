#!/bin/sh

echo $MYSQL_DB

sed -i "s/bbdd/$MYSQL_DB/" config/start.sh
sed -i "s/user/$MYSQL_USER/" config/start.sh
sed -i "s/pw/$MYSQL_PASSWORD/" config/start.sh
sed -i "s/rootp/$MYSQL_ROOT_PASSWORD/" config/start.sh
