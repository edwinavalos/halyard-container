#!/bin/bash -e

TAG=$(grep -Eo "[0-9]*\.[0-9]*\.[0-9]*" <<< "${VERSION}")
[ -e halyard ] && rm -rf halyard
[ -e .gradle ] && rm -rf .gradle
git clone https://github.com/spinnaker/halyard.git
cd halyard
git checkout tags/"${1}"
export GRADLE_USER_HOME=../.gradle
echo "Doing the assemble"
./gradlew assemble -q
echo "Finished the assemble"
echo "Doing the web installDist"
./gradlew halyard-web:installDist -x test -q
echo "Doing the cli installDist"
./gradlew halyard-cli:installDist -x test -q
echo "Finished the cli installDist"
cd ..

docker build -f Dockerfile -t edwinavalos/halyard:"${TAG}" .
docker push edwinavalos/halyard:"${TAG}"
