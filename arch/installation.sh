
//TODO:

nice tutorial to setup open box to practice installs: https://www.youtube.com/channel/UCWUAfnIKnxN39t0coJY4cqQ?spfreload=10

STEPS:

# Configure wireless
-driver is not installed, meaning i have to install it explicitly
-iw is not installed, why is that?

# Install/Configure boot loader
# Install microcode package

# Reboot

//automating installation : https://shirotech.com/linux/how-to-automate-arch-linux-installation

//installation: https://www.youtube.com/watch?v=lizdpoZj_vU

//arch-install-iso packages : https://git.archlinux.org/archiso.git/tree/configs/releng/packages.both
//base packages : https://www.archlinux.org/groups/x86_64/base/
//base-devel packages: https://www.archlinux.org/groups/x86_64/base-devel/

//search packages: https://www.archlinux.org/packages/

//FSTAB:
https://www.howtogeek.com/howto/38125/htg-explains-what-is-the-linux-fstab-and-how-does-it-work/

===========================================================================================================
//PARTITIONING:

# How to check whether partition table is MBR or GPT?

https://superuser.com/questions/522971/is-a-boot-partition-always-necessary

===========================================================================================================
//REF:

https://ryanwellsconsulting.wordpress.com/2017/10/09/install-arch-linux-with-i3wm-on-virtualbox-pt-1/
https://ryanwellsconsulting.wordpress.com/2017/10/12/install-arch-linux-with-i3wm-on-virtualbox-pt-2/
===========================================================================================================
//COMMANDS:

ls /sys/firmware/efi/efivars : check if uefi or bios
ping google.com : check wifi
wifi-menu : choose network (dialog package has to be installed)
timedatectl set-ntp true

# Partitions:
lsblk : list disks
fdisk -l : list disks
fdisk /dev/sdax : create partitions
mkfs.ext4 /dev/sdX1
mkswap /dev/sdX2 :
swapon /dev/sdX2
mount /dev/sda1 /mnt
genfstab -U /mnt >> /mnt/etc/fstab
pacstrap /mnt base base-devel

//change into installation
arch-chroot /mnt

//Set timezone
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc

//Localization:
locale-gen
nano /etc/locale.conf //uncomment LANG=en_US.UTF-8

Ctrl+D
reboot
===========================================================================================================
//GTP:

* Bios Must be in UEFI boot mode
* Secure boot must be disabled for GPT to work

# Partitions:
lsblk : list disks
fdisk -l : list disks
-------------------------------------------------------------------------------
//CREATE_PARTITIONS
# Enter fdisk mode
fdisk /dev/sdax : create partitions
-------------------------------------------------------------------------------
//FORMAT_PARTITIONS:
# Swap
mkswap /dev/sdX2
# format EFI partition:
mkfs.fat -F 32 /dev/efi_system_partition
# format All linux partitions:
mkfs.ext4 /dev/sdX1

-------------------------------------------------------------------------------
//MOUNT PARTITIONS:
mount /dev/sdaX /mnt
mount --mkdir /dev/efi_system_partition /mnt/boot
swapon /dev/sdaX
-------------------------------------------------------------------------------
//INSTALL PACKAGES
pacstrap /mnt base base-devel
pacstrap /mnt base base-devel linux linux-firmware iwd dhcpcd ntfs-3g rsync nano grub efibootmgr w3m

# after installation probably because directories like /etc don't exist yet
genfstab -U /mnt >> /mnt/etc/fstab

# change into installation
arch-chroot /mnt

# Set timezone
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc

# Localization:
locale-gen
nano /etc/locale.conf //uncomment LANG=en_US.UTF-8

# set root password:
passwd
-------------------------------------------------------------------------------
//BOOTLOADER:

# install grub:
pacamn -Sy grub

# install efi bootload mgr:
pacman -Sy efibootmgr

# GPT install
grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB

# MBR install:
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

-------------------------------------------------------------------------------
//NETWORK CONFIGURATION:
systemctl --now enable iwd
systemctl start dhcpcd
systemctl enable dhcpcd
-------------------------------------------------------------------------------
//POST INSTALL:

# install some good fonts
pacman -S ttf-dejavu  ttf-droid  ttf-inconsolata








===========================================================================================================
