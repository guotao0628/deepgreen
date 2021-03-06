#!/bin/bash


function download {
if [ -f $2 ]; then
    echo "Using already downloaded $2." 
else 
    echo "Download $2." 
    /usr/bin/curl -O $1/$2 
fi
}

DEEPGREEN=deepgreendb.16.17.rh6.x86_64.170521.bin
GO=go1.8.linux-amd64.tar.gz

download http://storage.googleapis.com/vitessedata/download $DEEPGREEN
download https://storage.googleapis.com/golang $GO

docker build --no-cache=true -t deepgreen .
