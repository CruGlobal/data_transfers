#!/bin/bash

docker network create $PROJECT_NAME
docker run --rm --network=$PROJECT_NAME --name=$PROJECT_NAME-redis -d redis
docker run --rm --network=$PROJECT_NAME --name=$PROJECT_NAME-pg -e POSTGRES_PASSWORD=data_transfers -d postgres:13
sleep 2

docker build \
    --network $PROJECT_NAME \
    --build-arg DB_ENV_POSTGRESQL_USER=postgres \
    --build-arg DB_ENV_POSTGRESQL_PASS=data_transfers \
    --build-arg DB_PORT_5432_TCP_ADDR=$PROJECT_NAME-pg \
    --build-arg REDIS_PORT_6379_TCP_ADDR=$PROJECT_NAME-redis \
    --build-arg SECRET_KEY_BASE=SECRET_KEY_BASE \
    --build-arg DD_API_KEY=$DD_API_KEY \
    -t 056154071827.dkr.ecr.us-east-1.amazonaws.com/$PROJECT_NAME:$ENVIRONMENT-$BUILD_NUMBER .
rc=$?

docker stop $PROJECT_NAME-redis $PROJECT_NAME-pg
docker network rm $PROJECT_NAME

if [ $rc -ne 0 ]; then
  echo -e "Docker build failed"
  exit $rc
fi
