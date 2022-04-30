#!/bin/bash

# backups wallet.db file

while true; do
    inotifywait /mnt/bvb-volume/umbrel/lnd/data/chain/bitcoin/mainnet/wallet.db
    cp /mnt/bvb-volume/umbrel/lnd/data/chain/bitcoin/mainnet/wallet.db /mnt/backup/
done


# systemd
# /etc/systemd/system/backup-walletdb.service