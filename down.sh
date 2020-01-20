#!/bin/bash

#---> Docker start
cpath=`pwd`
cd docker
docker-compose stop
cd `echo $cpath`