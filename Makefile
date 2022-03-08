run:
	@cd ./srcs ; docker-compose up -d

build:
	cd /${USER} ; mkdir data ; chmod 777 data
	cd /${USER}/data ; mkdir wpvol mdbvol ; chmod 777 wpvol mdbvol
	cd /${USER}/Documents/Inception/srcs ; docker-compose up -d

clean:
	@./srcs/scripts/clean.sh

rmvols:
	docker volume rm srcs_mdbvol
	docker volume rm srcs_wpvol
	rm -rf /${USER}/data

kill:
	@./srcs/scripts/kill.sh

massacre: rmvols
	@./srcs/scripts/massacre.sh
	@clear
	@echo "Successfull massacre"

re: massacre build
