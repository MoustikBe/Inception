#!/bin/sh
set -x 
sleep 10 

echo $SQL_DATABASE $DOMAIN_NAME $SQL_USER $USER1_LOGIN

if [ ! -f /var/www/wordpress/wp-config.php ]; then 
    wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
    sleep 2
    if ! wp core install --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'; then
      echo "WordPress core installation failed"
      exit 1
    fi
    sleep 2
    wp user create  --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt1
fi

if [ ! -d /run/php ]; then
    mkdir /run/php
fi
exec php-fpm83 -F
