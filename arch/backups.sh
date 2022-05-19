
===========================================================================================================
# recomended to use BOTH, timeshift and better-fs
timeshift
better fs snapshot ability

[timeshift https://www.youtube.com/watch?v=U-lMJHcjCVs]
===========================================================================================================
# RSYNC:
Backup Syntax

# mount backup drive:
mount /dev/sda2 /home/files
# base install:
sudo rsync -aAXv --delete --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/home/files,/lost+found} / /home/files/backup/2022-05-01
# with XFCE:

rsync -aAXv --delete --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/home/files,/lost+found} / /home/files/backup/2022-05-01_xfce

Restore Syntax
sudo rsync -aAXv --delete /backup /system
