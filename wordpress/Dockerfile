# 3.15, потому что на latest нету php7 :(
FROM alpine:3.15

# Скачиваем модули PHP (почистить ненужные)
RUN apk add php7-common \
	php7-session \
	php7-iconv \
	php7-json \
	php7-gd \
	php7-curl \
	php7-xml \
	php7-mysqli \
	php7-imap \
	php7-cgi \
	fcgi \
	php7-pdo \
	php7-pdo_mysql \
	php7-soap \
	php7-xmlrpc \
	php7-posix \
	php7-mcrypt \
	php7-gettext \
	php7-ldap \
	php7-ctype \
	php7-dom \
	php7-simplexml \
	mysql-client

# скачиваем wordpress
RUN mkdir -p /usr/share/webapps && \
cd /usr/share/webapps && \
wget http://wordpress.org/latest.tar.gz && \
tar -xzvf latest.tar.gz && \
rm latest.tar.gz

# Добавим свой php.ini, можем в нем определять свои значения конфига
ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini

# Указываем рабочую директорию для PHP
WORKDIR /var/www

EXPOSE 3085/tcp

CMD ["php-fpm", "--nodaemonize"]

