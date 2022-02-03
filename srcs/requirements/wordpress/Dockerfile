# Se descarga la imagen
From alpine:3.15

# Se actualiza e instala todo lo necesario
RUN apk update && apk upgrade && apk add php-fpm wget php-gd php-cli php-mbstring php-pdo
					
# El .tar de Wordpress se descarga, descomprime, y se borra
RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xvzf latest.tar.gz && \
	rm -rf latest.tar.gz

COPY ./requirements/wordpress/config/wp-config.php /var/www/html/
