#!/bin/bash

# build the flask container
docker build -t flask ./flask

# build the nginx container
docker build -t nginx ./nginx

# create the network
docker network create mini-network

# start the flask container and add it to the network
docker run --rm --expose 8080 --network=mini-network --env APP_NAME=MyFlaskApp -itd --name flask flask

# start the nginx container
docker run --rm -p 80:80 --network=mini-network --name nginx nginx