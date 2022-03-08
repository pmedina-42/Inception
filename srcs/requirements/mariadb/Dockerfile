FROM	alpine:3.14

ARG	MYSQL_USER
ARG	MYSQL_DB
ARG	MYSQL_PASSWORD
ARG	MYSQL_ROOT_PASSWORD

RUN 	apk update && apk --no-cache upgrade && \
	apk add mariadb \
	mariadb-client \
	openrc # openrc no es un servicio sino una dependencia de algunas distribuciones para iniciarlos

COPY	config/ /config/
RUN	chmod 777 /config/*
RUN 	sh /config/init_env.sh && \
	sh /config/start.sh

CMD 	["./config/run.sh"]
