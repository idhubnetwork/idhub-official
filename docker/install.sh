#!/bin/bash

DIR_PATH=$(dirname $(readlink -f $0))
DOCKER_DATA_ROOT_PATH="/var/lib/docker"

#if [ ! -f /etc/docker/daemon.json ] ; then
#    if [ ! -d /etc/docker ] ; then
#        mkdir -p /etc/docker
#    fi
#    sudo cp daemon.json /etc/docker/daemon.json
#    sudo sed -i "s#<DATA_ROOT_PATH>#$DOCKER_DATA_ROOT_PATH#g" /etc/docker/daemon.json
#    sudo service docker restart
#fi

if [ ! -f $DIR_PATH/configure.conf ] ; then 
    cp $DIR_PATH/configure.conf.default $DIR_PATH/configure.conf
fi

if [ ! -f $DIR_PATH/docker-compose.yml ] ; then
    cp $DIR_PATH/docker-compose.yml.default $DIR_PATH/docker-compose.yml
fi

mkdir -p $DIR_PATH/data/mysql $DIR_PATH/log/mysql \
         $DIR_PATH/log/idhub_web01 \
         $DIR_PATH/log/nginx

chmod 777 $DIR_PATH/data/mysql $DIR_PATH/log/mysql $DIR_PATH/log/idhub_web01
