FROM	debian:buster


RUN		apt-get update \
		&& apt-get install dumb-init nginx -y

RUN		apt-get install openssl -y

RUN		openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
		-subj "/C=RU/ST=Russia/L=Moscow/O=School21/CN=hcrakeha.42.fr" \
		-keyout /etc/ssl/private/hcrakeha.key -out /etc/ssl/certs/hcrakeha.crt


COPY	./conf/todo.conf /etc/nginx/todo.conf

COPY	./conf/hosts /etc/


ENTRYPOINT	["/usr/bin/dumb-init"]

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]
