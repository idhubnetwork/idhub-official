#!/bin/bash
CONF_FILE="/etc/idhub/configure.conf"
ARG="$1"
if [ -f $CONF_FILE ] ; then
    source $CONF_FILE
    IDHUB_DIR=$IDHUB_WEB_WORKDIR
    LOG_DIR=$IDHUB_SYSTEM_LOG
else
    IDHUB_DIR="./"
    LOG_DIR="/var/log"
fi

change_config() {
    cd $IDHUB_DIR
}

usage() {
    echo "no \"$ARG\" arg, only \"-p\", \"-d\", \"-m\""
}

main () {
    cd $IDHUB_DIR
    if [ $# == 0 ] ; then
        echo "no arg. nothing to do."
        exec /sbin/init
    else
        if [ -f /initialization ] && [ `cat /initialization` == "1" ] ; then
            if [ "$ARG" == "-p" ] ; then
                echo "$(date +'[%d/%b/%Y %T]') Start Service" >> $LOG_DIR/pm2.log
                pm2 start server.js 1>>$LOG_DIR/pm2.log 2>>$LOG_DIR/pm2.err.log
                exec /sbin/init
            elif [ "$ARG" == "-d" ] ; then
                echo "$(date +'[%d/%b/%Y %T]') Start Service" >> $LOG_DIR/pm2.log
                pm2 start server.js 1>>$LOG_DIR/pm2.log 2>>$LOG_DIR/pm2.err.log
                exec /sbin/init
            elif [ "$ARG" == "-m" ] ;then
                echo "$(date +'[%d/%b/%Y %T]') Change setting" >> $LOG_DIR/setting.log
                change_config
                echo "$(date +'[%d/%b/%Y %T]') Start Service" >> $LOG_DIR/pm2.log
                pm2 start server.js 1>>$LOG_DIR/pm2.log 2>>$LOG_DIR/pm2.err.log
                exec /sbin/init
            else
                usage
                exec /sbin/init
            fi
        else
            if [ "$ARG" == "-p" ] ; then
                echo "$(date +'[%d/%b/%Y %T]') Init setting" >> $LOG_DIR/setting.log
                change_config
                echo "$(date +'[%d/%b/%Y %T]') First Start Service" >> $LOG_DIR/pm2.log
                pm2 start server.js 1>>$LOG_DIR/pm2.log 2>>$LOG_DIR/pm2.err.log
            elif [ "$ARG" == "-d" -o "$ARG" == "-r" -o "$ARG" == "-n" ] ; then
                echo "$(date +'[%d/%b/%Y %T]') Init setting" >> $LOG_DIR/setting.log
                change_config
                echo "$(date +'[%d/%b/%Y %T]') First Start Service" >> $LOG_DIR/pm2.log
                pm2 start server.js 1>>$LOG_DIR/pm2.log 2>>$LOG_DIR/pm2.err.log
            elif [ "$ARG" == "-m" ] ;then
                change_config
            else
                usage
                exec /sbin/init
            fi
            echo "1" > /initialization
        fi
    fi
}

main "$@"
