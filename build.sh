#!/bin/bash

docker run --rm --network=$DOCKER_NETWORK --name=$PROJECT_NAME-redis -d redis
docker run --rm --network=$DOCKER_NETWORK --name=$PROJECT_NAME-pg -e POSTGRES_PASSWORD=data_transfers -d postgres:13
sleep 10

REDIS_IP=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $PROJECT_NAME-redis)
PG_IP=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $PROJECT_NAME-pg)

docker buildx build $DOCKER_ARGS \
    --build-arg DB_ENV_POSTGRESQL_USER=postgres \
    --build-arg DB_ENV_POSTGRESQL_PASS=data_transfers \
    --build-arg DB_PORT_5432_TCP_ADDR=$PG_IP \
    --build-arg REDIS_PORT_6379_TCP_ADDR=$REDIS_IP \
    --build-arg SECRET_KEY_BASE=$SECRET_KEY_BASE \
    --build-arg DD_API_KEY=$DD_API_KEY \
    .
rc=$?

docker stop $PROJECT_NAME-redis $PROJECT_NAME-pg

if [ $rc -ne 0 ]; then
  echo -e "Docker build failed"
  exit $rc
fi
