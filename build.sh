#!/bin/sh
if [ -z "$1" ]; then
  echo "Usage build.sh filename"
  exit  
fi
rm -f dso3kb_$1.upk dso3kb.upk.tar
cd $1
tar -cvf ../dso3kb.upk.tar *
cd ..
tar -zcvf dso3kb_$1.tar.gz dso3kb.upk.tar
gpg --batch --passphrase dso3000c --cipher-algo AES --output dso3kb_$1.upk -c dso3kb_$1.tar.gz
rm -f dso3kb_$1.tar.gz dso3kb.upk.tar
