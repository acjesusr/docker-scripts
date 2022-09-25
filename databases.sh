#! /bin/bash

# Create database network
docker network create --driver bridge databases

docker create --name db-postgres --env-file ./pg.env \
-l postgres -l database \
--net databases --restart always -p 5432:5432 \
-v pg-data:/var/lib/postgresql/data \
postgres:13-alpine

docker create --name db-redis --env-file ./redis.env \
-l redis -l database \
--net databases --restart always -p 6379:6379 \
redis:6-alpine
