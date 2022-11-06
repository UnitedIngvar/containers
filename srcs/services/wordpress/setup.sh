#!bin/bash/

# if wordpress/ directory exists, it means
# that we are starting the contaniner for the first time
if [ ! -e "/var/www/wordpress" ]; then
    mv wordpress/ /var/www/
	rm latest.tar.gz
	mv /tmp/wp-config.php /var/www/wordpress
	chown -R www-data:www-data /var/www/wordpress
fi

# we need php-fpm to run on foreground. If it doesn't, the docker container will stop immediately
sed -i -e "s|MYSQL_DATABASE|'$MYSQL_DATABASE'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|MYSQL_USER|'$MYSQL_USER'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|MYSQL_PASSWORD|'$MYSQL_PASSWORD'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf
mkdir -p /run/php/

exec /usr/sbin/php-fpm7.3
