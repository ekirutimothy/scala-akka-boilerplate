#!/bin/bash

# unofficial bash strict mode
set -euo pipefail
IFS=$'\n\t'

title() {
cat<<"EOT"

      __         _       __    __           _           __
     / /_  _____(_)___ _/ /_  / /__      __(_)___  ____/ /
    / __ \/ ___/ / __ `/ __ \/ __/ | /| / / / __ \/ __  /
   / /_/ / /  / / /_/ / / / / /_ | |/ |/ / / / / / /_/ /
  /_.___/_/  /_/\__, /_/ /_/\__/ |__/|__/_/_/ /_/\__,_/
               /____/

EOT
}
title

DOCKER_REGISTRY=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

echo "[+] Push images to ECR"

eval $(aws ecr get-login --region $AWS_REGION)

docker tag ${CIRCLE_PROJECT_REPONAME} ${DOCKER_REGISTRY}/${CIRCLE_PROJECT_REPONAME}:${CIRCLE_SHA1}
docker tag ${CIRCLE_PROJECT_REPONAME} ${DOCKER_REGISTRY}/${CIRCLE_PROJECT_REPONAME}:latest

docker push ${DOCKER_REGISTRY}/${CIRCLE_PROJECT_REPONAME}:${CIRCLE_SHA1}
docker push ${DOCKER_REGISTRY}/${CIRCLE_PROJECT_REPONAME}:latest
