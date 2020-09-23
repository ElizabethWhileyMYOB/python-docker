#!/bin/bash

# build the flask container
docker build -t flask-service ./flask

# build the nginx container
docker build -t nginx-service ./nginx

# create the network
docker network create mini-network