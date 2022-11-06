FROM	debian:buster

COPY	setup.sh /tmp/
COPY	mariadb.cnf /tmp/
COPY	todo_list.sql /tmp/

RUN		apt-get update \
		&& apt-get install mariadb-server mariadb-client dumb-init -y \
		&& chmod 111 /tmp/setup.sh \
		&& mv ./tmp/mariadb.cnf /etc/mysql/mariadb.cnf \
		&& chmod 0444 /etc/mysql/mariadb.cnf

ENTRYPOINT ["/usr/bin/dumb-init"]

EXPOSE		3306

CMD	["/tmp/setup.sh"]
