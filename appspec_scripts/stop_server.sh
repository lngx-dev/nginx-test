#!/bin/bash
echo "stopped `date +%Y%m%d_%H%M%S`" > /var/log/codedeploy/appspec_stop.log

id=`docker ps -q`
if [[ $id ]]; then
    docker stop ${id}
    docker rm $(docker ps -a -q -f status=exited)
fi

rm -rf /mnt/nginx/*
