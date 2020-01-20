#!/bin/bash

#---> Docker start
cpath=`pwd`
cd docker
docker-compose up -d apache2 workspace mariadb phpmyadmin neo4j
cd `echo $cpath`