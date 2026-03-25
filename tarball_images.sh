#!/usr/bin/env bash
touch mender_images.tar
for i in $(docker images --format "{{.Repository}}:{{.Tag}}" | grep -i mender); do docker image save ${i} >> mender_images.tar; done

docker image save mongo:7.0 >> mender_images.tar
docker image save chrislusf/seaweedfs:latest >> mender_images.tar
docker image save traefik:v3.1 >> mender_images.tar
docker image save nats:2.10 >> mender_images.tar

