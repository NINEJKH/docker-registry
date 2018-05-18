#!/usr/bin/env bash

set -e

if [[ "${TRAVIS_BRANCH}" == "master" ]]; then
  TAG="latest"
else
  TAG="${TRAVIS_BRANCH}"
fi

echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

docker tag "${DOCKER_REPO}:${COMMIT}" "${DOCKER_REPO}:${TAG}"
docker tag "${DOCKER_REPO}:${COMMIT}" "${DOCKER_REPO}:travis-${TRAVIS_BUILD_NUMBER}"

docker push "${DOCKER_REPO}"
