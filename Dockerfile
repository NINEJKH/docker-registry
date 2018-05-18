FROM registry

ARG GOPATH="${HOME}/go"
ARG PATH="${PATH}:${GOPATH}/bin"

RUN apk update && apk add --no-cache go git \
  && go get -u gitlab.com/gitlab-org/docker-distribution-pruner \
  && apk del go git \
  && ln -s "${GOPATH}/bin/docker-distribution-pruner" /usr/local/bin/docker-distribution-pruner
