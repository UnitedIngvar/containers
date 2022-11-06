FROM		debian:buster

COPY		./setup.sh /tmp
COPY		./wp-config.php /tmp

RUN		apt-get update \
		&& apt-get install php-fpm php-mysql curl dumb-init tar -y \
		&& echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf \
		&& curl -LO https://wordpress.org/latest.tar.gz \
		&& tar xzvf latest.tar.gz

ENTRYPOINT ["/usr/bin/dumb-init"]

EXPOSE		9000

CMD	["bash", "/tmp/setup.sh"]
