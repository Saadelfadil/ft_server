chown -R mysql: /var/lib/mysql
service mysql start
mysql -u root -e "CREATE USER 'sel-fadi'@'localhost' IDENTIFIED BY '0000'"
mysql --user=root -e "CREATE DATABASE wordpdata;"
mysql -u root -e "GRANT ALL ON *.* TO 'sel-fadi'@'localhost';FLUSH PRIVILEGES;"
