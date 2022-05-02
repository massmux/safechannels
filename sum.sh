#!/bin/bash

BASEDIR=/mnt/bvb-volume/umbrel/lnd/data
BACKUPDIR=/mnt/backup

clear

echo "====Original files===="
ls -la $BASEDIR/chain/bitcoin/mainnet/wallet.db
ls -la $BASEDIR/graph/mainnet/channel.db
ls -la $BASEDIR/chain/bitcoin/mainnet/channel.backup

walletsum=`sha256sum $BASEDIR/chain/bitcoin/mainnet/wallet.db |cut -f1 -d" "`
channelsum=`sha256sum $BASEDIR/graph/mainnet/channel.db |cut -f1 -d" "`
channelbksum=`sha256sum $BASEDIR/chain/bitcoin/mainnet/channel.backup |cut -f1 -d" "`


echo
echo "====Backup files===="
ls -la $BACKUPDIR

Owalletsum=`sha256sum $BACKUPDIR/wallet.db |cut -f1 -d" "`
Ochannelsum=`sha256sum $BACKUPDIR/channel.db |cut -f1 -d" "`
Ochannelbksum=`sha256sum $BACKUPDIR/channel.backup |cut -f1 -d" "`

echo
echo "====Check===="

if [ "$walletsum" == "$Owalletsum" ]; then
    echo "wallet.db matches with backup."
else
    echo "!! wallet.db does NOT match with backup."
fi

if [ "$channelsum" == "$Ochannelsum" ]; then
    echo "channel.db matches with backup."
else
    echo "!! channel.db does NOT match with backup."
fi

if [ "$channelbksum" == "$Ochannelbksum" ]; then
    echo "channel-backup matches with backup."
else
    echo "!! channel-backup does NOT match with backup."
fi
