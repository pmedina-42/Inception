#!/bin/sh

var=$(docker ps |  awk 'NR==2{print $1}')
docker stop $var
var=$(docker ps |  awk 'NR==2{print $1}')
docker stop $var
var=$(docker ps |  awk 'NR==2{print $1}')
docker stop $var
