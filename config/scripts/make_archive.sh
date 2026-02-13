#!/bin/bash
set -e;

FOLDER_TO_BACKUP=$1;
ARCHIVE=$2;
PASSPHRASE=$3
tmp_folder=/tmp/$(uuidgen)

mkdir -p $tmp_folder

cp -r $FOLDER_TO_BACKUP/ $tmp_folder

tar czf $ARCHIVE $tmp_folder

gpg --yes --passphrase $PASSPHRASE -c --batch $ARCHIVE

rm -rf $tmp_folder
rm -rf $ARCHIVE
