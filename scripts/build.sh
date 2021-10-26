#!/bin/sh
OSREL=${1}
if [ -z "$OSREL" ] ; then
  echo "USAGE:"
  echo "`basename $0` <OSREL>"
  echo "e.g. `basename $0` centos7"
  exit
fi
docker buildx build -t atlasadc/atlas-grid-${OSREL}-base --platform linux/amd64,linux/arm64 --push .
