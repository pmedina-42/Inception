run:
	@cd ./srcs ; docker-compose up -d

build:
	@cd .. ; mkdir data ; cd data ; mkdir db_vol wp_vol
	@cd ../data ; chmod 777 db_vol wp_vol
	@cd /root/Documents/Inception/srcs ; docker-compose up -d
clean:
	@./srcs/scripts/clean.sh

rmvols:
	@rm -rf data

kill:
	@./srcs/scripts/kill.sh

massacre:
	@./srcs/scripts/massacre.sh
	@clear
	@echo "Successfull massacre"
