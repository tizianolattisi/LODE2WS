LODE2 WS
========

LODE2 websocket server.

Quick start
===========

Download and install Docker from https://www.docker.com.
Optional: install LODE2 from https://github.com/tizianolattisi/LODE2.

Execute in a bash shell

git clone https://github.com/tizianolattisi/LODE2WS.git
docker-machine ls
echo "Copy a LODE2 lesson content in public/Website/lectures/01 test/content"
read -p "Premi [Enter] per continuare..."
cd LODE2WS/
docker-machine create -d virtualbox --virtualbox-disk-size "60000" --virtualbox-memory "2048" --virtualbox-cpu-count "1" lode2
eval $(docker-machine env lode2)
docker run --name lode2ws-mongo -d -p 27017:27017 mongo:3.2.1
docker build --rm=true --file=devop/Dockerfile -t unitn.it/lode2ws-app .
docker run -v ~/_LODE/WEBSITE:/usr/src/app/public/website -d --name lode2ws-running --link lode2ws-mongo -p 3000:3000 unitn.it/lode2ws-app
set -- "$DOCKER_HOST"
IFS=":"; declare -a Array=($*)
open "http:${Array[1]}:3000/Website/lectures/01%20test/"
echo "Se il browser non si è aperto, aprilo tu e punta a http:${Array[1]}:3000/Website/lectures/01%20test/"


Mongo DB usage
==============

Connect to Mongo DB:

mongo 127.0.0.1:27017

Example:

use lodelogs
db.logs.find().pretty()


Note
====

Mac and Win users should point to the docker-machine ip instead 127.0.0.1
