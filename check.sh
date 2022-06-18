#!/bin/bash

BASEDIR=/mnt/bvb-volume/umbrel/lnd/data
BACKUPDIR=/mnt/backup

clear

printf "==== Original files ====\n"
ls -la $BASEDIR/chain/bitcoin/mainnet/wallet.db
ls -la $BASEDIR/graph/mainnet/channel.db
ls -la $BASEDIR/chain/bitcoin/mainnet/channel.backup

Owalletsum=`cat /mnt/backup/o.wallet.db.sha256`
Ochannelsum=`cat /mnt/backup/o.channel.db.sha256`
Ochannelbksum=`cat /mnt/backup/o.channel.backup.sha256`


printf "\n==== Backup files ====\n"
ls -la $BACKUPDIR

walletsum=`sha256sum $BACKUPDIR/wallet.db |cut -f1 -d" "`
channelsum=`sha256sum $BACKUPDIR/channel.db |cut -f1 -d" "`
channelbksum=`sha256sum $BACKUPDIR/channel.backup |cut -f1 -d" "`


printf "\n==== Files Check ===="

printf "\n[wallet.db]\n"
if [ "$walletsum" == "$Owalletsum" ]; then
    echo "wallet.db matches with backup."
else
    echo "!! wallet.db does NOT match with backup."
fi
echo "Original file sha256: $Owalletsum"
echo "Backup   file sha256: $walletsum"

printf "\n[channel.db]\n"
if [ "$channelsum" == "$Ochannelsum" ]; then
    echo "channel.db matches with backup."
else
    echo "!! channel.db does NOT match with backup. This is normal while system running"
fi
echo "Original file sha256: $Ochannelsum"
echo "Backup   file sha256: $channelsum"

printf "\n[channel-backup]\n"
if [ "$channelbksum" == "$Ochannelbksum" ]; then
    echo "channel-backup matches with backup."
else
    echo "!! channel-backup does NOT match with backup."
fi
echo "Original file sha256: $Ochannelbksum"
echo "Backup   file sha256: $channelbksum"


