#!/bin/bash

# backup of channel.backup file
orig="/mnt/bvb-volume/umbrel/lnd/data/chain/bitcoin/mainnet"
dest="/mnt/backup"
thefile="channel.backup"


cp $orig/$thefile $dest/
channelssum=`sha256sum $orig/$thefile |cut -f1 -d" "`
echo $channelssum > $dest/o.$thefile.sha256


# backups channel.db file
orig="/mnt/bvb-volume/umbrel/lnd/data/graph/mainnet"
dest="/mnt/backup"
thefile="channel.db"

##cp $orig/$thefile $dest/
##channelsum=`sha256sum $orig/$thefile |cut -f1 -d" "`
##echo $channelsum > $dest/o.$thefile.sha256


# backups wallet.db file
orig="/mnt/bvb-volume/umbrel/lnd/data/chain/bitcoin/mainnet"
dest="/mnt/backup"
thefile="wallet.db"
app="/mnt/bvb-volume/umbrel/app-data"


cp $orig/$thefile $dest
walletsum=`sha256sum $orig/$thefile |cut -f1 -d" "`
echo $walletsum > $dest/o.$thefile.sha256
rsync -av $app/lnbits/ $dest/lnbits/





