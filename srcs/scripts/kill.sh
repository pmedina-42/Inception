#!/bin/sh

ALL="all"

read -p "$(printf "Which service would you want to kill? [name/all] --> ")" SERVICE
if [ "$SERVICE" = "$ALL" ] ;then
	var=$(docker ps |  awk 'NR==2{print $1}')
	docker kill $var
	var=$(docker ps |  awk 'NR==2{print $1}')
	docker kill $var
	var=$(docker ps |  awk 'NR==2{print $1}')
	docker kill $var
else
	var=$(docker ps | grep "$SERVICE" |  awk 'NR==1{print $1}')
	docker kill $var

fi
