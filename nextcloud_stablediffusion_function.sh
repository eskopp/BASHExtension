#!/bin/bash
function nextcloud_stablediffusion(){
    #  Syntax Text Folder
    mkdir -p $NEXTCLOUD_STABLE_DIFFUSION_TEXT
    mv "$NEXTCLOUD_STABLE_DIFFUSION_TEXT2IMG"*.txt $NEXTCLOUD_STABLE_DIFFUSION_TEXT >/dev/null 2>&1

    # Syntax Face Folder
    mkdir -p $NEXTCLOUD_STABLE_DIFFUSION_FACE
    mv "$NEXTCLOUD_STABLE_DIFFUSION_TEXT2IMG"*-before-face-restoration.png $NEXTCLOUD_STABLE_DIFFUSION_FACE >/dev/null 2>&1
}