#!/usr/bin/env bash

set -e

if [[ "${TRAVIS_BRANCH}" == "master" ]]; then
  DOCKER_TAG="latest"
else
  DOCKER_TAG="${TRAVIS_BRANCH}"
fi

echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

docker tag "${DOCKER_REPO}:${TRAVIS_COMMIT}" "${DOCKER_REPO}:${DOCKER_TAG}"
docker tag "${DOCKER_REPO}:${TRAVIS_COMMIT}" "${DOCKER_REPO}:travis-${TRAVIS_BUILD_NUMBER}"

docker push "${DOCKER_REPO}"
