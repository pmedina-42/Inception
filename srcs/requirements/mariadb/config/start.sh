echo "Iniciando la base de datos..."

cat << EOF > create.sql
CREATE USER IF NOT EXISTS '$MYSQL_ROOT'@''%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
CREATE DATABASE IF NOT EXISTS '$MYSQL_DATABASE'@'%';
GRANT ALL ON '.'.* TO '$MYSQL_ROOT'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'
GRANT ALL ON '$MYSQL_DATABASE'.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'
FLUSH PRIVILEGES;
EOF

mysql < create.sql

mysql -u root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < tools/wordpress.sql
