From	alpine:3.14

RUN	apk update && apk add nginx && apk add openssl

COPY	./conf/nginx.conf /etc/nginx/nginx.conf

RUN	mkdir -p /etc/ssl/private && \
	chmod 700 /etc/ssl/private && \
	openssl req -x509 -sha256 -nodes -newkey rsa:4096 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -days 365 -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=Learner/CN=127.0.0.1"

CMD	["nginx", "-g", "daemon off;"]
