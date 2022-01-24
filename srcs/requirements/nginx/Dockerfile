# Se descarga la imagen de nginx:alpine
From nginx:1.15.8-alpine

# Se actualiza e instala todo lo necesario
RUN apk update & apk add openssl

# Se copia y borra todo lo requerido para la configuración de nginx
COPY requirements/nginx/conf/nginx.conf /etc/nginx/nginx.conf
COPY requirements/nginx/tools/index.html /usr/share/nginx/html/
COPY requirements/nginx/tools/style.css /usr/share/nginx/html/
COPY requirements/nginx/tools/isaac.jpg /usr/share/nginx/html/
#COPY ./conf/default.conf /etc/nginx/conf.d casi casi esta ssl configurado


# Se genera el certificado ssl y se dan todos los permisos
RUN openssl req -x509 -sha256 -nodes -newkey rsa:4096 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt -days 365 -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=Learner/CN=10.13.200.62"
#RUN chown -R www-data:www-data *
#RUN chmod -R 755 /var/www/*

EXPOSE 80

# Se ejecuta el script de init.sh
CMD ["nginx", "-g", "daemon off;"]
