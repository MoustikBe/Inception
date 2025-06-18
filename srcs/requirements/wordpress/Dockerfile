FROM alpine:3.21
RUN apk update
RUN apk upgrade 
RUN apk add vim
RUN apk add wget
RUN apk add php-iconv
RUN apk add --no-cache php83 php83-fpm php83-mysqli php83-phar mariadb-client
RUN apk add --no-cache php-phar
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN chown -R root:root /var/www/wordpress
COPY /conf/www.conf /etc/php83/php-fpm.d/www.conf
COPY /conf/auto_config.sh auto_config.sh
RUN chmod +x auto_config.sh
ENTRYPOINT [ "sh", "auto_config.sh" ]