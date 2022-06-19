#!/bin/bash

# backups wallet.db file
orig="/mnt/data/umbrel/app-data/lightning/data/lnd/data/chain/bitcoin/mainnet"
dest="/mnt/backup"
thefile="wallet.db"
app="/mnt/data/umbrel/apps"


while true; do
    inotifywait $orig/$thefile
    cp $orig/$thefile $dest/
    walletsum=`sha256sum $orig/$thefile |cut -f1 -d" "`
    echo $walletsum > $dest/o.$thefile.sha256
    rsync -av $app/lnbits/ $dest/lnbits/
done


# file location
# /etc/systemd/system/backup-walletdb.service