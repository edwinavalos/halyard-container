#!/usr/bin/env bash

docker run -d -v $(pwd):/root/ --name=halyard edwinavalos/halyard:0.37.0
docker docker exec -it halyard /bin/sh