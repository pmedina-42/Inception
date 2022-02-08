#!/bin/sh

var=$(docker ps |  awk 'NR==2{print $1}')
docker kill $var

