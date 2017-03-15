# scala-akka-boilerplate

[![CircleCI][circleci-image]][circleci-url]

[circleci-image]: https://circleci.com/gh/brightwindanalysis/scala-akka-boilerplate.svg?style=svg
[circleci-url]: https://circleci.com/gh/brightwindanalysis/scala-akka-boilerplate

### Useful commands
```
# start the project
sbt run

# hot reload
sbt ~re-start

# check style
sbt scalastyle

# run test
sbt test
```

### Docker
```
# generate Dockerfile in target/docker/
sbt docker:stage

# build image
sbt docker:publishLocal

# run temporary containter
docker run \
  --rm \
  --network="host" \
  -p 8080:3000 \
  --name scala-akka-boilerplate \
  scala-akka-boilerplate:latest

# run containter in background
docker run \
  --detach \
  --network="host" \
  -e HTTP_PORT="8080" \
  --name scala-akka-boilerplate \
  scala-akka-boilerplate:latest

# access container
docker exec -it scala-akka-boilerplate bash

# access container as root
docker exec -it --user root scala-akka-boilerplate bash
```

### CI/CD

[Setup](http://docs.aws.amazon.com/AmazonECR/latest/userguide/ECR_GetStarted.html) Amazon ECR

Create a unique IAM user and configure AWS permissions on CircleCI:
* `AmazonEC2ContainerRegistryPowerUser` to push on the registry

Config SSH permissions on CircleCI to deploy on EC2

Config the following CircleCI Environment Variables:
* AWS_REGION
* AWS_ACCOUNT_ID (registry)
* EC2_USERNAME
* EC2_HOST
