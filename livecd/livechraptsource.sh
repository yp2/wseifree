#!/bin/bash

export HOME=/root
export LC_ALL=C

# zmiana repozytoriow
echo "Kopiowanie sources.list"
cp /etc/apt/sources.list /etc/apt/sources.list_bak

#nowe repa
echo "Kopiowanie nowego sources.list"
cp /root/etc/apt/sources.list /etc/apt/sources.list

apt-get update

# dociagniece brakujacych kluczy
echo 'Prosze czekac...';
#get all missing public keys
apt-get update 2> /tmp/keymissing; for key in $(grep "NO_PUBKEY" /tmp/keymissing |sed "s/.*NO_PUBKEY //"); do echo -e "\nProcessing key: $key"; gpg --keyserver pool.sks-keyservers.net --recv $key && gpg --export --armor $key |sudo apt-key add -; done



