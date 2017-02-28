FROM ubuntu:wily

RUN apt-get update && apt-get install -y git-buildpackage equivs
ENV DEBIAN_FRONTEND noninteractive
RUN mkdir -p /tmp/backports
WORKDIR /tmp/backports


# For all
# docker build -t backporter .
# docker run -ti -v /data/backports/ceres-solver:/tmp/backports/ backporter

# mk-build-deps -ir -t "apt-get -qq --no-install-recommends"


# For debinc uncomment this
# (cd .. && apt-get source PACKAGE_NAME)
# dpkg-buildpackage -uc -us


# For straight build

# gbp buildpackage -uc -us

# mkdir -p output
# cp ../*.deb ../*.changes ../*.dsc output/


