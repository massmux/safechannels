#!/bin/bash

# backups channel.db file

while true; do
    inotifywait /mnt/bvb-volume/umbrel/lnd/data/graph/mainnet/channel.db
    cp /mnt/bvb-volume/umbrel/lnd/data/graph/mainnet/channel.db /mnt/backup/
done

# systemd
# /etc/systemd/system/backup-channeldb.service

