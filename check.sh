#!/bin/bash

BASEDIR=/mnt/bvb-volume/umbrel/lnd/data
BACKUPDIR=/mnt/backup

clear

echo "====Original files===="
ls -la $BASEDIR/chain/bitcoin/mainnet/wallet.db
ls -la $BASEDIR/graph/mainnet/channel.db
ls -la $BASEDIR/chain/bitcoin/mainnet/channel.backup



echo
echo "====Backup files===="
ls -la $BACKUPDIR


