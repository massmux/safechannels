# Channels backup on Umbrel


This is a collection of scripts for backing up all necessary on your Umbrel install. Initial script from Alex Bosworth, I decided to extend the copy on a remote cifs share and for all the important files.

So three different monitoring enabled because of different update times each one has.

## Install

clone repo on user's home (user running umbrel). then cd the directory and

```
cp backup-channels.service /etc/systemd/system/backup-channels.service
chmod +x /etc/systemd/system/backup-channels.service
```


```
cp backup-walletdb.service /etc/systemd/system/backup-walletdb.service
chmod +x /etc/systemd/system/backup-walletdb.service
```

now reload the daemon

```
sudo systemctl daemon-reload

```

Change the mount script to mount you external partition. Hereafter we will suppose that your external partition is mounted on /mnt/backup

Now start the services

```
sudo systemctl start backup-channels.service 
sudo systemctl start backup-walletdb.service 
```

Note: the backup-walletdb.sh script is backupping also lnbits database. In case you dont have lnbits you can choose to comment the command.
Note: before running the script be sure that backup partition is mounted and umbrel services are running

## Checks

to check if the backups are ok, just run

```
./check.sh
```

inside the safechannel dir. There is a sha256 hash checksum check on files


## Notes

1. tested on 0.4.18 version of umbrel
2. this is a script not meant for newbies. Doing errors on channels backup is very risky. be sure to know what are you doing, otherwise do not use it. We carry no liability on whatever use you do of this script
