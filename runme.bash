#!/bin/bash

set -o errexit
docker build -t backporter backporter
docker run -ti -v `pwd`/opencv:/tmp/backports/ backporter
