#!/bin/sh

sleep 10 

# J'crois c'est pas bon il faut une verif d'un fichier. 
wp config create --allow-root \
                 --dbname=$SQL_DATABASE \
                 --dbuser=$SQL_USER \
                 --dbuser=$SQL_PASSWORD \
                 --dbhost=mariadb:3306 --path='/var/www/wordpress'
                 