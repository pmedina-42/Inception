# Se descarga la imagen de nginx:alpine
From alpine:3.14

# Se actualiza e instala todo lo necesario
RUN apk update && apk add nginx && apk add openssl

# Se copia lo requerido para la configuración de nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/index.html /var/www/html/
COPY ./tools/style.css /var/www/html/
COPY ./tools/isaac.jpg /var/www/html/
RUN chmod 777 /var/www/html/

# Se genera el certificado ssl y se dan todos los permisos
RUN mkdir -p /etc/ssl/private && \
	chmod 700 /etc/ssl/private && \
	openssl req -x509 -sha256 -nodes -newkey rsa:4096 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -days 365 -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=Learner/CN=127.0.0.1"

EXPOSE 443

# Se ejecuta el script de init.sh
CMD ["nginx", "-g", "daemon off;"]
