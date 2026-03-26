#!/usr/bin/env bash
mapfile -t images < <(
  docker images --format '{{.Repository}}:{{.Tag}}' | grep -i mender
)

images+=(
  mongo:7.0
  chrislusf/seaweedfs:latest
  traefik:v3.1
  nats:2.10
)

docker image save -o mender_images.tar "${images[@]}"

