run:
	@cd ./srcs ; docker-compose up -d

build:
	cd /${USER} ; mkdir data ; chmod 777 data
	cd /${USER}/data ; mkdir wpvol mdbvol ; chmod 777 wpvol mdbvol
	cd /${USER}/Documents/Inception/srcs ; docker-compose up -d

clean:
	@./srcs/scripts/clean.sh

kill:
	@./srcs/scripts/kill.sh

massacre:
	@./srcs/scripts/massacre.sh
	docker volume rm srcs_mdbvol
	docker volume rm srcs_wpvol
	rm -rf /${USER}/data
	@clear
	@echo "Successfull massacre"

re: massacre build
	
show:
	@echo "\n\tIMAGES CREATED"
	@docker images
	@echo "\n\tCONTAINERS RUNNING"
	@docker ps
	@echo "\n\tVOLUME LIST"
	@docker volume ls
