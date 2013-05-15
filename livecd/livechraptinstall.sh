#!/bin/bash

export HOME=/root
export LC_ALL=C

# instalacja pakietow z pliku bez pakietow zalecanych
echo "instalacja pakitow ..."
sudo apt-get update
#sudo apt-get upgrade
# to powoduje upgrade systemu a tego chcemy uniknac
#sudo dpkg --set-selections < /root/inst_deb_wseix.txt
#sudo apt-get --no-install-recommends -y dselect-upgrade 

#powrot do starej wersji
cat /root/inst_deb_wseix.txt | xargs apt-get install --no-install-recommends -y
