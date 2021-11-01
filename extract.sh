#!/bin/sh
NAME="$(echo $1 | sed -nr 's/.*dso3kb_(.*).upk.*/\1/p')"
if [ -z "$1" ] || [ -z "$NAME" ] ; then
  echo "Usage decrypt.sh dso3kb_filename.upk"
  exit  
fi
gpg --batch --passphrase dso3000c --output temp.tar.gz -d $1
tar -zxvf temp.tar.gz
rm -f temp.tar.gz
rm -rf "$NAME" &>/dev/null
mkdir "$NAME"
tar -xvf dso3kb.upk.tar --directory ./"$NAME"
rm -rf dso3kb.upk.tar
