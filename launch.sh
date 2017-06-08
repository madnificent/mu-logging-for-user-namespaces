#!/bin/bash

cd $(dirname $([ -L $0 ] && readlink -f $0 || echo $0))
trap 'kill -TERM $PID' TERM INT
cd mu-docker-watcher
./init.sh &
PID=$!
trap - TERM INT
docker-compose up
kill $PID
