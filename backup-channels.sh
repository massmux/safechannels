#!/bin/bash

# backup of channel.backup file
orig="/mnt/bvb-volume/umbrel/lnd/data/chain/bitcoin/mainnet"
dest="/mnt/backup"
thefile="channel.backup"


while true; do
    inotifywait $orig/$thefile
    cp $orig/$thefile $dest/
    channelssum=`sha256sum $orig/$thefile |cut -f1 -d" "`
    echo $channelssum > $dest/o.$thefile.sha256
done

# systemd
# /etc/systemd/system/backup-channels.service


