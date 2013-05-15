#!/bin/bash

# odpalane z katalogu livecd zawierającego katalog edit
# odpalac jako root

# przygotowanie sieci
echo "Pzygotowanie sieci ..."
cp /etc/resolv.conf edit/etc/
cp /etc/hosts edit/etc/

# bind /dev/ 
echo "Bind /dev to chroot ..."
mount --bind /dev/ edit/dev

# kopiowanie skryptow dla remix'a do edit/root
echo "Kopiowanie skryptow ..."
cp livechrremix.sh edit/root/
cp livechraptinstall.sh edit/root/
cp livechraptsource.sh edit/root/
cp livechrclean.sh edit/root/

# kopiowanie listy paczek dla remixa z katalogu o jeden poziom niższego
echo "Kopiowanie listy paczek ..."
cp ../inst_deb_wseix.txt edit/root

# kopiowanie potrzebnych katalogow plikow
echo "Kopiwanie plikow katalogow ..."
cp -r ../etc edit/root

# wejscie w chroot w edit
echo "Wejscie w chroot na edit ..."
chroot edit
