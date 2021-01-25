wget -qq https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb 
echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | /usr/bin/debconf-set-selections 
DEBIAN_FRONTEND=noninteractive dpkg -i mysql-apt-config_0.8.13-1_all.deb 
apt-get -qq update 
DEBIAN_FRONTEND=noninteractive apt-get -y -qq install mysql-server