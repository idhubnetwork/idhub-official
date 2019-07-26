#!/bin/bash

set -e
cd ~/idhub-gitlab/docker/
DIR_PATH=$(dirname $(readlink -f $0))
VERSION=$1
echo "DIR_PATH = $DIR_PATH"
echo "VERSION = $VERSION"
if [ -z $VERSION ]; then
  VERSION="latest"
  echo "VERSION = $VERSION"
  # echo "bash update.sh {NAME}"
  # exit 1
fi

cd $DIR_PATH/../
git fetch -a
git checkout $VERSION
# git pull origin master

# if [ -z $VERSION ]; then
#   echo "git pull origin master"
#   git pull origin master
# else
#   echo "git fetch -a"
#   echo "git checkout $VERSION"
#   git fetch -a
#   git checkout $VERSION
# fi

cd $DIR_PATH/
docker-compose build idhubweb01
docker rm -f idhubweb01
docker-compose up -d idhubweb01
docker ps -a

echo -e "\n\nUpdate finished.($(date))\n"
