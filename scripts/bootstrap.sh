#!/usr/bin/env bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../"

if [ ! -f ${ROOT_DIR}.env ]; then
    (>&2 echo "WARNING. Environment file does not exists. Please create '.env' file. You can use '.env.example' as a reference")
    exit
fi

source ${ROOT_DIR}.env

docker build --tag php-fpm php-fpm

mkdir -p ${APP_PATH}
docker start symfony-php || docker run --env-file .env -v ${ROOT_DIR}${APP_PATH}:/opt/project --name symfony-php -d php-fpm

docker exec -it symfony-php bash -c "composer create-project symfony/framework-standard-edition ."

docker stop symfony-php
docker rm symfony-php
docker-compose up -d
