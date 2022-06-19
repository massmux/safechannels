# Channels backup on Umbrel


This is a collection of scripts for backing up all necessary on your Umbrel install. Initial script from Alex Bosworth, I decided to extend the copy on a remote cifs share and for all the important files. Forked, rearranged and completed from Alex Bosworth

So three different monitoring enabled because of different update times each one has.

## Install

### Requirements

```
sudo apt-get update
sudo apt-get install inotify-tools
```

### Installation

Clone the repo to the home of the umbrel user. 
Then cd the `safechannels` directory and run the following commands:

Copy backup-channel service
```
cp backup-channels.service /etc/systemd/system/
chmod +x /etc/systemd/system/backup-channels.service
```

Copy backup-walletdb service
```
cp backup-walletdb.service /etc/systemd/system/
chmod +x /etc/systemd/system/backup-walletdb.service
```

now reload the systemd daemon

```
sudo systemctl daemon-reload
```

Mount the backup destination at `/mnt/backup`, you can user an USB stick or a network drive.

To mount the usb stick run:

```
sudo mount /dev/sdb1 /mnt/backup
```

Replace `/dev/sdb1` with your USB partition name.
Find the correct partition name using `sudo fdisk -l`


Now start the services

```
sudo systemctl start backup-channels.service 
sudo systemctl start backup-walletdb.service 
```

Note: the backup-walletdb.sh script is backupping also lnbits database. In case you dont have lnbits you can choose to comment the command.
Note: before running the script be sure that backup partition is mounted and umbrel services are running

## Checks

To check if the service are working you can force the backup by simulating an access to the files:
```bash
# Example:

# Wallet file
touch -c -a umbrel/app-data/lightning/data/lnd/data/chain/bitcoin/mainnet/wallet.db

touch -c -a umbrel/app-data/lightning/data/lnd/data/chain/bitcoin/mainnet/channel.backup
```

To check if the backups are ok, just run

```
./check.sh
```

inside the safechannel dir. There is a sha256 hash checksum check on files


## Notes

1. Tested on 0.5 version of Umbrel
2. This is a script not meant for newbies. Doing errors on channels backup is very risky. be sure to know what you are doing, otherwise do not use it. We carry no liability on whatever use you do of this script
3. Do not use on a local partition, it would make no sense. Connect an external device and mount it on /mnt/backup