#!/bin/bash

# backups channel.db file
orig="/mnt/bvb-volume/umbrel/lnd/data/graph/mainnet"
dest="/mnt/backup"
thefile="channel.db"

while true; do
    inotifywait $orig/$thefile
    cp $orig/$thefile $dest/
    channelsum=`sha256sum $orig/$thefile |cut -f1 -d" "`
    echo $channelsum > $dest/o.$thefile.sha256
done

# systemd
# /etc/systemd/system/backup-channeldb.service

