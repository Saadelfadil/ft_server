FROM debian:buster

RUN   apt-get update \
&&    apt-get -qq install apt-utils \
&&    apt-get -y -qq install wget \
&&    apt-get -y -qq install nginx \
&&    wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.zip \
&&    apt-get -y -qq install php-fpm \
&&    apt-get -y -qq install php-mysql \
&&    apt-get install unzip \
&&    apt-get -y -qq install gnupg \
&&    apt-get install dpkg \
&&    apt-get -y -qq install lsb-release \
&&    unzip -qq phpMyAdmin-4.9.0.1-all-languages.zip \
&&    apt-get install -y  curl \
&&    mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin
COPY  srcs/nginx-selfsigned.crt /etc/ssl 
COPY  srcs/nginx-selfsigned.key /etc/ssl
COPY  srcs/default /etc/nginx/sites-available
COPY  srcs/Mysqlinstall.sh /
RUN   sh Mysqlinstall.sh
COPY  srcs/Mysqlconfig.sh /
COPY  srcs/wordpress.sh /
RUN   sh Mysqlconfig.sh \
&&    sh wordpress.sh 
COPY  srcs/services_start.sh /
CMD   sh services_start.sh

EXPOSE 80
EXPOSE 443
