#!/bin/bash
if [ -z $1 ]
then
	echo "Please supply an initial password."
	exit 2
fi
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
docker build -t "coach/ajenti" .
docker kill coach_ajenti
docker rm coach_ajenti
docker run -d \
	--name coach_ajenti \
	--net=host \
	-e PASSWORD=$1 \
	coach/ajenti
# docker logs coach_ajenti -f
