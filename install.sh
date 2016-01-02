#!/bin/sh

# install dependencies
apt-get install -y rsync

# set default configuration
if [ ! -e "/etc/stack-up.conf" ]; then
    cp stack-up.conf /etc/
fi

# run daily backups
cp stack-up.sh /etc/cron.daily/stack-up
