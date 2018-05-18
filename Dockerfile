FROM registry

ARG GOPATH="${HOME}/go"
ARG PATH="${PATH}:${GOPATH}/bin"

RUN apk update && apk add --no-cache go git

RUN go get -u gitlab.com/gitlab-org/docker-distribution-pruner
