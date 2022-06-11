#!/bin/bash

mkdir ${HOME}/phoenix-postgres-data/
docker run -d \
 --name phoenix-psql \
 -e POSTGRES_PASSWORD=postgres \
 -e POSTGRES_USERNAME=postgres \
 -v ${HOME}/phoenix-postgres-data/:/var/lib/postgresql/data \
 -p 5432:5432 \
 postgres