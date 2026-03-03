#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <registration_token>"
  exit 1
fi

REGISTRATION_TOKEN=$1

docker exec -it gitlab-runner gitlab-runner register \
  --non-interactive \
  --url "http://gitlab:80" \
  --registration-token "$REGISTRATION_TOKEN" \
  --executor "docker" \
  --docker-image "docker:latest" \
  --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
  --description "docker-runner"
