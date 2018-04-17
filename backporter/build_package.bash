#!/bin/bash


set -o errexit
cd /tmp/backports/opencv

apt-get update
mk-build-deps -ir -t "apt-get -qq --no-install-recommends"
echo "Done installing deps"

# try pulling a sourcedeb if it exists
# (cd .. && apt-get source PACKAGE_NAME) || true


# For straight build
echo "Building package"
gbp buildpackage -uc -us --git-upstream-tree=sid --git-debian-branch=sid
echo "Done building package"
mkdir -p output
mv ../*.deb ../*.changes ../*.dsc output/
