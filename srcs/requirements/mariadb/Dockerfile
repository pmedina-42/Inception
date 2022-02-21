From alpine:3.14

RUN apk update & apk add mariadb

COPY ./config /config/
RUN chmod 777 config/start.sh

EXPOSE 3306

CMD ["./config/start.sh"]
