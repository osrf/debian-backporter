#!/bin/bash

DOCKER_IMAGE=osrf/backporter

set -o errexit
docker build -t ${DOCKER_IMAGE} backporter
docker run -ti -v `pwd`/ceres-solver:/tmp/backports/ ${DOCKER_IMAGE}
