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
if [ "$OSREL" == "centos6" -o "$OSREL" == "slc6" ] ; then
  PLATF="linux/amd64"
else
  PLATF="linux/amd64,linux/arm64"
fi

docker buildx build -t atlasadc/atlas-grid-${OSREL}-base --ulimit "nofile=1048576:1048576" --platform ${PLATF} --push .
docker buildx build -t registry.cern.ch/atlasadc/atlas-grid-${OSREL}-base --ulimit "nofile=1048576:1048576" --platform ${PLATF} --push .
