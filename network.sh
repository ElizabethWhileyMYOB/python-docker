#!/bin/bash

# build the flask container
docker build -t flask-service ./flask

# build the nginx container
docker build -t nginx-service ./nginx

# create the network
docker network create mini-network

# start the flask container and add it to the network
docker run --network=mini-network -itd --name flask-service -p 80:80 flask-service

# start the nginx container
docker run --network=mini-network -itd --name nginx-service -e 8080 nginx-service