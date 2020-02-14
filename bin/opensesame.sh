# Assumes the following is in /etc/fstab
# UUID=5DACC3692D2D990F	/mnt/Red	ntfs-3g	defaults,uid=1000,gid=1000,umask=002,errors=continue,noauto 0 0
# /dev/mapper/blue	/mnt/Blue	ext4	defaults,noauto,user	  0	  0

echo "Da ba dee da ba dai"
sudo cryptsetup luksOpen /dev/sda1 blue && mount /mnt/Blue && ls -lah /mnt/Blue
