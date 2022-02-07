# Se descarga la imagen
From alpine:3.15

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD

# Se actualiza e instala todo lo necesario
RUN apk update && apk upgrade && apk add php-fpm wget php-gd php-cli php-mbstring php-pdo
					
# El .tar de Wordpress se descarga, descomprime, y se borra
RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xvzf latest.tar.gz && \
	mv wordpress/* /var/www/html/wordpress && \
	rm -rf latest.tar.gz wordpress

COPY ./config/initwp.sh /var/www/html/wordpress/
COPY ./config/wp-config.php /var/www/html/wordpress/
RUN chmod 777 /var/www/html/wordpress/*
RUN ./var/www/html/wordpress/initwp.sh

EXPOSE 9000
