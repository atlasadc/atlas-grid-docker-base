#!/bin/sh
OSREL=${1}
if [ -z "$OSREL" ] ; then
  FULLPATH="`\ls $PWD/Dockerfile 2>/dev/null`"
  if [ -z "$FULLPATH" ] ; then
    echo "No Dockerfile found in local directory"
    exit 1
  fi
  OSREL="`echo $FULLPATH | awk -F'/' '{print $(NF-2)$(NF-1)}'`"
fi
if [ -z "$OSREL" ] ; then
  echo "USAGE:"
  echo "`basename $0` <OSREL>"
  echo "e.g. `basename $0` centos7"
  exit
fi

docker buildx build -t atlasadc/atlas-grid-${OSREL}-base --ulimit "nofile=1048576:1048576" --platform linux/amd64,linux/arm64 --push .
docker buildx build -t registry.cern.ch/atlasadc/atlas-grid-${OSREL}-base --ulimit "nofile=1048576:1048576" --platform linux/amd64,linux/arm64 --push .
