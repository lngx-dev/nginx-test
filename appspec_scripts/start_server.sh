#!/bin/bash
echo "started `date +%Y%m%d_%H%M%S`" > /var/log/codedeploy/appspec_start.log

id=`docker ps -q`
if [[ $id ]]; then
    docker stop $id
    docker rm $(docker ps -a -q -f status=exited)
fi

cd /mnt/nginx/docker
docker build --no-cache -t nginx-test .

docker run -d -p 80:80 -p 8000:8000 -p 8001:8001 nginx-test:latest
