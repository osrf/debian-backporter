# OSRF generic debian backporter

This repository provide scripts and dockerfiles to (back)port debian packages to other Debian based distributions

## How to use it

### Get the code
- get backporter: git clone https://github.com:osrf/debian-backporter.git

### Before running the script

#### Configure your target architecture
- Modify the dockerfile to use a base image matching the wanted platform/architecture:

  - ubuntu:xenial (64 bits)

  - osrf/ubuntu_i386:xenial (32 bits)

  - osrf/ubuntu_armhf:xenial (arm v7)

  - osrf/ubuntu_arm64:xenial (arm v8)

  - debian:stretch

  - osrf/debian_arm64:stretch


#### Clone the upstream repository of the package you want to backport

```
cd debian_backporter
```

- clone the repository of the package you want to backport:
  - The repository used by debian can be found on the debian source package page (e.g  for "ceres-solver":https://packages.debian.org/source/sid/ceres-solver
  - On the right side get the git repository link: "Debian Source Repository (Git)"

- cd <REPO_NAME>
- switch tp the release branch (debian/VERSION_NUMBER): `git checkout debian/<VERSION_NUMBER>`

#### Modify the repository to build

- if you want to give a specific version number for your deb: edit the last entry of the changelog to reflect the version number you want (you may need to create a new branch to match the version number you decided to use

- if you want to apply patches, apply them (with quilt) and generate new changelog

#### Specify the repository you want to build

- in runme.bash: replace "ceres-solver" with the name of the debian repository you cloned

### Run the script

- run the backporting script: `bash runme.bash`

### After running the script

#### Copy the resulting artifacts

`cd <DEBIAN_BACKPORTER_CLONE>/<DEBIAN_REPO_NAME> && mkdir <ABS_PATH_ARTIFACT_DESTINATION> && cp output/* <ABS_PATH_ARTIFACT_DESTINATION>`

#### Restore the repository in it's original state

`cd <DEBIAN_BACKPORTER_CLONE>/<DEBIAN_REPO_NAME> && sudo git clean -dxf`
