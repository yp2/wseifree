#!/bin/bash

export HOME=/root
export LC_ALL=C

# instalacja pakietow z pliku bez pakietow zalecanych
echo "instalacja pakitow ..."
sudo apt-get update
#sudo apt-get upgrade
cat /root/inst_deb_wseix.txt | xargs apt-get install --no-install-recommends -y
