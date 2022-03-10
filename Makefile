info:
	@echo "\n\tmake build: create volumes and build containers"
	@echo "\tmake run: build containers"
	@echo "\tmake kill: introduce a container name to kill it"
	@echo "\tmake clean: clean images"
	@echo "\tmake massacre: kill all containers and remove volumes"
	@echo "\tmake re: massacre & build"
	@echo "\tmake stop: stop containers"
	@echo "\tmake reset: stop containers and run"
	@echo "\tmake scr: stop, clean and run"
	@echo "\tmake show: show images, containers, volumes and networks\n"

run:
	@cd ./srcs ; docker-compose up -d

build:
	@cd /${USER} ; mkdir data ; chmod 777 data
	@cd /${USER}/data ; mkdir wpvol mdbvol ; chmod 777 wpvol mdbvol
	@cd /${USER}/Documents/Inception/srcs ; docker-compose up -d

clean:
	@./srcs/scripts/clean.sh

kill:
	@./srcs/scripts/kill.sh

massacre:
	@./srcs/scripts/massacre.sh
	@docker volume rm srcs_mdbvol
	@docker volume rm srcs_wpvol
	@rm -rf /${USER}/data
	@clear
	@echo "Successfull massacre"

re: massacre build
	
stop:
	@./srcs/scripts/stop.sh

scr:	stop clean run

reset:	stop run

show:
	@echo "\n\tIMAGES CREATED"
	@docker images
	@echo "\n\tCONTAINERS RUNNING"
	@docker ps
	@echo "\n\tVOLUME LIST"
	@docker volume ls
	@echo "\n\tNETWORKS"
	@docker network ls
	@echo
