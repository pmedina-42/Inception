# Se descarga la imagen
From alpine:3.14

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD

# Se actualiza e instala todo lo necesario
RUN apk update && apk upgrade && apk add php7 php7-fpm php7-mbstring
					
# El .tar de Wordpress se descarga, descomprime, y se borra
RUN	wget https://wordpress.org/latest.tar.gz && \
	tar -xvzf latest.tar.gz && \
 	chmod 777 wordpress && \
	rm -rf latest.tar.gz && \
	mkdir var/www && \
	mkdir var/www/html && \
	chmod 777 var && \
	chmod 777 var/www && \
	chmod 777 var/www/html

COPY ./config/initwp.sh /var/www/html/
COPY ./config/initwp.sh /var/www/html/wordpress/
COPY ./config/wp-config.php /var/www/html/
RUN	chmod 777 /var/www/html/wordpress && \
	mv wordpress/* /var/www/html/wordpress && \
	rm -rf wordpress && \
	mv /var/www/html/wp-config.php /var/www/html/wordpress/

RUN chmod 777 /var/www/html/* && \
	./var/www/html/initwp.sh
	

EXPOSE 9000

###RUN echo "listen 9000" >> /etc/php7/php-fpm.d/www.conf

CMD ["php-fpm7", "--nodaemonize"]
