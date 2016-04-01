# Docker machine (OSX)
docker-machine create -d virtualbox --virtualbox-disk-size "60000" --virtualbox-memory "4096" --virtualbox-cpu-count "2" lode2
docker-machine start lode2
eval $(docker-machine env lode2)

# Mongo db
docker run --name lode2ws-mongo -d -p 27017:27017 mongo:3.2.1

# Node app
docker build -t unitn.it/lode2ws-app .
docker run -i -t --name lode2ws-running --link lode2ws-mongo -p 3000:3000 unitn.it/lode2ws-app


