From	alpine:3.14

ARG	DB_NAME
ARG	DB_USER
ARG	DB_PASSWORD

RUN	apk update && apk upgrade && apk add php php-fpm php-opcache php-mysqli php php-phar php-curl php-dom php-exif php-fileinfo php-json php-mbstring php-sodium php-openssl php-xml php-zip
RUN	mkdir var/www && \
	mkdir var/www/html && \
	chmod 777 var && \
	chmod 777 var/www && \
	chmod 777 var/www/html && \
	mkdir var/www/html/wordpress

COPY	./config/initwp.sh /var/www/html/wordpress
COPY	./config/wp-config.php /var/www/html/wordpress

RUN	chmod 755 /var/www/html/wordpress/initwp.sh && \
	./var/www/html/wordpress/initwp.sh

RUN	wget https://wordpress.org/latest.tar.gz && \
	tar -xvzf latest.tar.gz && \
 	mv wordpress/* /var/www/html/wordpress && \
	rm -rf latest.tar.gz && \
	rm -rf wordpress

RUN	echo "listen = 9000" >> /etc/php7/php-fpm.d/www.conf

CMD	["php-fpm7", "--nodaemonize"]

