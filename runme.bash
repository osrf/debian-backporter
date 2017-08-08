#!/bin/bash

set -o errexit
docker build -t backporter backporter
docker run -ti -v `pwd`/ceres-solver:/tmp/backports/ backporter
