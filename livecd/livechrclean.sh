#!/bin/bash

export HOME=/root
export LC_ALL=C

# czyszczenie apt'a
echo "Czyszczenie apt'a ..."
aptitude clean

# czyszczenie sieci
rm /etc/hosts
rm /etc/resolv.conf

# czyszczenie po instalcji pakietów
echo "Usuwanie zbędnych danych po instalcji pakietow ..."
rm /var/lib/dbus/machine-id
rm /sbin/initctl
dpkg-divert --rename --remove /sbin/initctl


# wychodzenie z chroot, odmotowanie proc, sys dev/pts/
echo "Wychodzenie z chroot"
umount /proc || umount -lf /proc
umount /sys
umount /dev/pts

# usuwanie zbędnych plików
echo "Usuwanie zbednych plikow"
rm -rf /tmp/* ~/.bash_history

