#!/bin/bash

#---> Docker start
cpath=`pwd`
cd docker
docker-compose up -d nginx workspace mariadb phpmyadmin neo4j
cd `echo $cpath`