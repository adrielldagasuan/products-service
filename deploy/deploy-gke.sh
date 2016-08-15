#!/bin/bash

# Exit on any error
set -e

docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
docker push adrielldagasuan/products-service-gke:$CIRCLE_SHA1
sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
kubectl patch deployment docker-hello-google -p '{"spec":{"template":{"spec":{"containers":[{"name":"docker-hello-google","image":"docker.io/adrielldagasuan/products-service-gke:'"$CIRCLE_SHA1"'"}]}}}}'
