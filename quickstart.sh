#!/usr/bin/env bash

docker-machine ls
read -p "Select the docker-machine to use, or a new one to create [default]: " machine
machine=${machine:-default}
n=`docker-machine ls --filter "name=$machine" | wc -l| awk '{print $1}'`
if [ $n -eq "1" ];
then
read -p "The $machine docker-machine does not exists, press [Enter] to create them..."
docker-machine create -d virtualbox --virtualbox-disk-size "60000" --virtualbox-memory "2048" --virtualbox-cpu-count "1" "$machine"
fi
n=`docker-machine ls --filter "name=$machine" --filter "state=Running" | wc -l| awk '{print $1}'`
if [ $n -eq "1" ];
then
read -p "The $machine docker-machine is not running, press [Enter] to start them..."
docker-machine start "$machine"
fi
echo "Copy a LODE2 lesson content in public/Website/lectures/01 test/content"
read -p "Premi [Enter] per continuare..."
eval $(docker-machine env lode2)
docker run --name lode2ws-mongo -d -p 27017:27017 mongo:3.2.1
docker build --rm=true --file=devop/Dockerfile -t unitn.it/lode2ws-app .
docker run -v ~/_LODE/WEBSITE:/usr/src/app/public/website -d --name lode2ws-running --link lode2ws-mongo -p 3000:3000 unitn.it/lode2ws-app
set -- "$DOCKER_HOST"
IFS=":"; declare -a Array=($*)
open "http:${Array[1]}:3000/lecture.htmm?content=test"
echo "Se il browser non si è aperto, aprilo tu e punta a http:${Array[1]}:3000/lecture.htmm?content=test"
