#!/bin/bash

# backup of channel.backup file

while true; do
    inotifywait /mnt/bvb-volume/umbrel/lnd/data/chain/bitcoin/mainnet/channel.backup
    cp /mnt/bvb-volume/umbrel/lnd/data/chain/bitcoin/mainnet/channel.backup /mnt/backup/
done

# systemd
# /etc/systemd/system/backup-channels.service

