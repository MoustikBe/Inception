FROM alpine:3.21
RUN apk update
RUN apk upgrade
RUN apk add vim 
RUN apk add mariadb mariadb-client
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld 
COPY /conf/my.cnf /etc/my.cnf
COPY /conf/init_db.sh /init_db.sh
RUN chmod +x /init_db.sh
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
CMD [ "/init_db.sh" ]
