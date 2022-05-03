#!/bin/bash

# backups wallet.db file
orig="/mnt/bvb-volume/umbrel/lnd/data/chain/bitcoin/mainnet"
dest="/mnt/backup"
thefile="wallet.db"
app="/mnt/bvb-volume/umbrel/app-data"


while true; do
    inotifywait $orig/$thefile
    cp $orig/$thefile /mnt/backup/
    walletsum=`sha256sum $orig/$thefile |cut -f1 -d" "`
    echo $walletsum > $dest/o.$thefile.sha256
    rsync -av $app/lnbits/ $dest/lnbits/
done


# systemd
# /etc/systemd/system/backup-walletdb.service



