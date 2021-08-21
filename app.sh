#!/bin/env  bash

VERSION=latest
PREFIX=xmaeltht/entry-level-challenge-p41
TAG=$VERSION

#build the image
echo "Building image"
docker build -t $PREFIX:$TAG .

#Pushing the image to docker hub
echo "Pushing image"
docker push $PREFIX:$TAG

#Running the image
echo "Running image"
docker run --rm -p 80:80 $PREFIX:$TAG