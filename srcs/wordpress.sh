cd var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
wp core config  --dbhost=localhost --dbname=wordpdata --dbuser=sel-fadi --dbpass=0000 --allow-root
chmod 644 wp-config.php
wp core install --url=localhost --title="Your Blog Title" --admin_name=sel-fadi_admin --admin_password=0000 --admin_email=root@roor.root --allow-root
 cd ~ 
