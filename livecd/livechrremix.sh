#!/bin/bash 
# exporty
echo "Niezbende eksporty dla srodowiska ..."
export HOME=/root
export LC_ALL=C

# montowanie /proc /sys /dev/pts 
echo "Montowanie /proc /sys /dev/pts ..."
mount -t proc none /proc
mount -t sysfs none /sysfs
mount -t devpts none /dev/pts

# ustawienie apt'a
echo "Ustawianie apt'a ..."
dbus-uuidgen > /var/lib/dbus/machine-id
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl
