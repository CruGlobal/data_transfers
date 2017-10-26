#!/bin/bash

docker network create $PROJECT_NAME
docker run --rm --network=$PROJECT_NAME --name=$PROJECT_NAME-redis -d redis
docker run --rm --network=$PROJECT_NAME --name=$PROJECT_NAME-mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=true -d mysql
sleep 2

docker build \
    --network $PROJECT_NAME \
    --build-arg DB_ENV_MYSQL_USER=root \
    --build-arg DB_PORT_3306_TCP_ADDR=$PROJECT_NAME-mysql \
    --build-arg REDIS_PORT_6379_TCP_ADDR=$PROJECT_NAME-redis \
    -t 056154071827.dkr.ecr.us-east-1.amazonaws.com/$PROJECT_NAME:$ENVIRONMENT-$BUILD_NUMBER .
rc=$?

docker stop $PROJECT_NAME-redis $PROJECT_NAME-mysql
docker network rm $PROJECT_NAME

if [ $rc -ne 0 ]; then
  echo -e "Docker build failed"
  exit $rc
fi
