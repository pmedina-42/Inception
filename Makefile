run:
	@cd ./srcs ; docker-compose up -d

build:
	cd /root/ ; mkdir data ; chmod 777 data
	cd /root/data ; mkdir wpvol mdbvol ; chmod 777 wpvol mdbvol
	cd /root/Documents/Inception/srcs ; docker-compose up -d

clean:
	@./srcs/scripts/clean.sh

rmvols:
	@rm -rf data

kill:
	@./srcs/scripts/kill.sh

massacre: rmvols
	@./srcs/scripts/massacre.sh
	docker volume rm srcs_mdbvol
	docker volume rm srcs_wpvol
	@clear
	@echo "Successfull massacre"
