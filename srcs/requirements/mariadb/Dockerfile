From alpine:3.14

ARG MYSQL_DB_NAME
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apk update & apk add mariadb

COPY ./config/* /config/

RUN chmod 755 config/* && \
	./config/start.sh
	#./config/init_mdb_env.sh && \

EXPOSE 3306

CMD ["./config/run.sh"]
