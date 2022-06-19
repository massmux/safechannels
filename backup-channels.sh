#!/bin/bash

# backup of channel.backup file
orig="/mnt/data/umbrel/app-data/lightning/data/lnd/data/chain/bitcoin/mainnet"
dest="/mnt/backup"
thefile="channel.backup"


while true; do
    inotifywait $orig/$thefile
    cp $orig/$thefile $dest/
    channelssum=`sha256sum $orig/$thefile |cut -f1 -d" "`
    echo $channelssum > $dest/o.$thefile.sha256
done

# file location
# /etc/systemd/system/backup-channels.service