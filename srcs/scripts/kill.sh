#!/bin/sh

read -p "$(printf "Which service would you want to kill? --> ")" SERVICE
	var=$(docker ps | grep "$SERVICE" |  awk 'NR==1{print $1}')
	docker kill $var
