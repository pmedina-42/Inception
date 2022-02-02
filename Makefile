build:
	cd ./srcs ; docker-compose up -d

run:
	mkdir volumes ; cd volumes ; mkdir wp_vol mbd_vol
	cd srcs ; docker compose up 

clean:
	docker system prune -a
