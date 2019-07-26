#!/bin/bash

DIR_PATH=$(dirname $(readlink -f $0))

rm -rf $DIR_PATH/data/mysql/* $DIR_PATH/log/mysql/* \
       $DIR_PATH/log/idhub_web01/* \
       $DIR_PATH/log/nginx/*

sudo chmod 777 $DIR_PATH/data/mysql $DIR_PATH/log/mysql $DIR_PATH/log/idhub_web01
