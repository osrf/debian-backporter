FROM ubuntu:artful

RUN apt-get update && apt-get install -y git-buildpackage equivs
ENV DEBIAN_FRONTEND noninteractive
RUN mkdir -p /tmp/backports
ADD build_package.bash /tmp/build_package.bash
WORKDIR /tmp/backports

CMD /tmp/build_package.bash
