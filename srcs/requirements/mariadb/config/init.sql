CREATE USER 'root'@'%' IDENTIFIED BY 'rootpass';
CREATE DATABASE wordpressdb;
CREATE USER 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpressdb.* TO 'user'@'%';
GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'rootpass';
FLUSH PRIVILEGES;
