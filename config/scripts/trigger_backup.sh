#!/bin/bash
set -e

PASSPHRASE=$(cat /run/secrets/gpg_passphrase)

trigger_remote() {
    SERVER=$1
    BASE_FOLDER=$2       # Ex: /server1files (La racine du volume)
    
    # C'est ICI le changement : On sauvegarde uniquement le sous-dossier "files"
    SRC_DATA="$BASE_FOLDER/files"
    
    # Mais on stocke l'archive dans "inbox" à la racine
    DEST_ARCHIVE="$BASE_FOLDER/inbox/backup.tar.gz"

    echo "--- Lancement sur $SERVER ---"
    echo "Source : $SRC_DATA"
    echo "Dest   : $DEST_ARCHIVE"

    # On crée le dossier inbox à la racine
    ssh -o StrictHostKeyChecking=no root@$SERVER "mkdir -p $BASE_FOLDER/inbox"
    
    # On lance le backup sur le dossier files UNIQUEMENT
    ssh -o StrictHostKeyChecking=no root@$SERVER 'bash -s' < /scripts/make_archive.sh "$SRC_DATA" "$DEST_ARCHIVE" "$PASSPHRASE"
}

# On garde les appels simples, le script gère le "/files" tout seul
trigger_remote "server1" "/server1files"
trigger_remote "server2" "/server2files"
