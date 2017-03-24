#!/bin/bash


function download {
if [ -f $2 ]; then
    echo "Using already downloaded $2." 
else 
    echo "Download $2." 
    curl -O $1/$2 
fi
}

DEEPGREEN=beta.deepgreendb.16.16.rh6.x86_64.170323.bin
GO=go1.8.linux-amd64.tar.gz

download http://storage.googleapis.com/vitessedata/download $DEEPGREEN
download https://storage.googleapis.com/golang $GO

# dotfiles.   emacs users beware. 
# (cd; tar zcf dotfiles.tgz .vimrc .vim .tmux.conf .gitconfig)
# mv ~/dotfiles.tgz .

docker build -t deepgreen-centos7 .
