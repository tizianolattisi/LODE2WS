LODE2 WS
========

LODE2 websocket server.

Setup
=====

Download and install Docker from https://www.docker.com.

Copy a LODE2 lesson content in public/Website/lectures/01 test/content

Run a container based on mongo image:

```docker run --name lode2ws-mongo -d -p 27017:27017 mongo:3.2.1```

Build and execute the LODE2 WS image:

```docker build -t unitn.it/lode2ws-app .
docker run -i -t --name lode2ws-running --link lode2ws-mongo -p 3000:3000 unitn.it/lode2ws-app```

Point the browser to http://127.0.0.1:3000/Website/lectures/01%20test/


Mongo DB usage
==============

Connect to Mongo DB:

```mongo 127.0.0.1:27017```

Example:

```use lodelogs
 db.logs.find().pretty()```


Note
====

Mac and Wind users should point to the docker-machine ip instead 127.0.0.1
