# Se descarga la imagen
From nginx:1.15.8-alpine

# Se actualiza e instala todo lo necesario
RUN apk update & apk add openssl

# Se copia y borra todo lo requerido para la configuración de nginx
COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./config/index.html /usr/share/nginx/html/
COPY ./config/style.css /usr/share/nginx/html/
COPY ./config/isaac.jpg /usr/share/nginx/html/

# Se genera el certificado ssl y se dan todos los permisos
RUN openssl req -x509 -sha256 -nodes -newkey rsa:4096 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt -days 365 -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=Learner/CN=localhost"
#RUN chown -R www-data:www-data *
#RUN chmod -R 755 /var/www/*

EXPOSE 80

# Se ejecuta el script de init.sh
CMD ["nginx", "-g", "daemon off;"]
