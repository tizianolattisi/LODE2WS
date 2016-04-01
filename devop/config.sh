#!/usr/bin/env bash

sed -i 's/localhost/'"$LODE2WS_MONGO_PORT_27017_TCP_ADDR"'/' /usr/src/app/bin/www
sed -i 's/localhost/'"192.168.99.100"'/' /usr/src/app/public/javascripts/tracker.js
