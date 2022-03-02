From alpine:3.14

ARG MYSQL_DB
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apk update & apk add mariadb \
	mariadb-client \
	 openrc # openrc no es un servicio sino una dependencia de algunas distribuciones de linux para iniciar servicios

COPY ./config/* /config/

RUN chmod 755 config/* && \
	./config/init_mdb_env.sh && \
	./config/start.sh

#RUN echo $MYSQL_DB

EXPOSE 3306

CMD ["./config/run.sh"]
