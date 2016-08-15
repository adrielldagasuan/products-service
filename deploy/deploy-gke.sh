#!/bin/bash

# Exit on any error
set -e

sudo /opt/google-cloud-sdk/bin/gcloud docker push docker.io/adrielldagasuan/products-service-gke
sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
kubectl patch deployment docker-hello-google -p '{"spec":{"template":{"spec":{"containers":[{"name":"docker-hello-google","image":"docker.io/adrielldagasuan/products-service-gke:'"$CIRCLE_SHA1"'"}]}}}}'
