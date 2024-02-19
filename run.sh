#!/bin/bash


# Nextcloud Extension Bash 
NEXTCLOUD_ROOT="/mnt/e/erik/"
NEXTCLOUD_EXTENSION_SOURCE="/mnt/e/git/eskopp/nextcloud/"
CURRENT_FOLDER=$(pwd)"/"

# load Stable Diffusion Folder 

source $NEXTCLOUD_EXTENSION_SOURCE"stablediffusionfolder.sh"

# back to basic folder
cd $CURRENT_FOLDER