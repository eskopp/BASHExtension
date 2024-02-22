#!/bin/bash

# Load Nextcloud Path
source /mnt/e/git/eskopp/BASHExtension/nextcloud_path.sh

# YT-DLP settings
export YT_DLP_ROOT=$NEXTCLOUD_ROOT"Media/YouTube/"

# YT-DLP Flags
export YT_DLP_PLAYLIST=$YT_DLP_ROOT

# YT-DLP Extension
export YT_DLP_VIDEO_ROOT=$YT_DLP_ROOT"video/"
export YT_DLP_MUSIC_ROOT=$YT_DLP_ROOT"music/"

# YT-DLP Backup
export YT_DLP_BACKUP_ROOT=$YT_DLP_ROOT"backup/"
export YT_DLP_CHANNEL_BACKUP=$YT_DLP_BACKUP_ROOT"channel/"
export YT_DLP_PLAYLIST_BACKUP=$YT_DLP_BACKUP_ROOT"playlist/"
export YT_DLP_ALBUM_BACKUP=$YT_DLP_BACKUP_ROOT"album/"
export YT_DLP_MUSIC_BACKUP=$YT_DLP_BACKUP_ROOT"music/"

# YT-DLP Base Folder
export YT_DLP_CHANNEL=$YT_DLP_VIDEO_ROOT"channel/"
export YT_DLP_PLAYLIST=$YT_DLP_VIDEO_ROOT"playlist/"
export YT_DLP_ALBUM=$YT_DLP_MUSIC_ROOT"album/"
export YT_DLP_MUSIC=$YT_DLP_MUSIC_ROOT"music/"

# YT-DLP File Handler
export YT_DLP_CHANNEL_FILE=$YT_DLP_ROOT"yt_channel.txt"
export YT_DLP_PLAYLIST_FILE=$YT_DLP_ROOT"yt_playlist.txt"
export YT_DLP_ALBUM_FILE=$YT_DLP_ROOT"yt_album.txt"
export YT_DLP_MUSIC_FILE=$YT_DLP_ROOT"yt_music.txt"
