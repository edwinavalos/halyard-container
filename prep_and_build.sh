#!/bin/bash -e

VERSION=version-0.37.0
TAG=$(grep -Eo "[0-9]*\.[0-9]*\.[0-9]*" <<< "${VERSION}")
[ -e halyard ] && rm -rf halyard
[ -e .gradle ] && rm -rf .gradle
git clone https://github.com/spinnaker/halyard.git
cd halyard
git checkout tags/"${VERSION}"
export GRADLE_USER_HOME=../.gradle
./gradlew halyard-web:installDist -x test -q
./gradlew halyard-cli:installDist -x test -q
cd ..

docker build -f Dockerfile -t edwinavalos/halyard:"${TAG}" .
docker push edwinavalos/halyard:"${TAG}"
