mkdir /var/www/html/mb
chown -R mysql: /var/lib/mysql
service nginx start
service php7.3-fpm start
service mysql restart
cat