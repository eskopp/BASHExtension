# YT-DLP settings
export YT_DLP_ROOT="/mnt/e/erik/Media/YouTube/"

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

# create folder
yt_create() {
    mkdir -p "$YT_DLP_ROOT"
    mkdir -p "${YT_DLP_ROOT}video/channel"
    mkdir -p "${YT_DLP_ROOT}video/playlist"
    mkdir -p "${YT_DLP_ROOT}music/music"
    mkdir -p "${YT_DLP_ROOT}music/album"
    mkdir -p "${YT_DLP_ROOT}backup/channel"
    mkdir -p "${YT_DLP_ROOT}backup/playlist"
    mkdir -p "${YT_DLP_ROOT}backup/album"
    mkdir -p "${YT_DLP_ROOT}backup/music"
    touch "${YT_DLP_ROOT}yt_channel.txt"
    touch "${YT_DLP_ROOT}yt_playlist.txt"
    touch "${YT_DLP_ROOT}yt_album.txt"
    touch "${YT_DLP_ROOT}yt_music.txt"
}

# delete yt-dlp
yt_delete() {
    current_path=$PWD
    cd $YT_DLP_ROOT
    cd ..
    rm -rf "YouTube"
    cd $current_path
}

# YouTube Playlist
yt_playlist_add() {
    local playlist="$1"
    if [[ -z "$playlist" ]]; then
        echo "Error: No playlist ID provided."
        return 1
    fi

    if grep -Fxq "$playlist" "$YT_DLP_PLAYLIST_FILE"; then
        echo "Error: Playlist '$playlist' is already in the file."
    else
        echo "$playlist" >>"$YT_DLP_PLAYLIST_FILE"
    fi
}

# Show all yt Playlists to download
yt_playlist_view() {
    batcat $YT_DLP_PLAYLIST_FILE || cat $YT_DLP_PLAYLIST_FILE
}

# Edit all yt playlists to download
yt_playlist_edit() {
    code $YT_DLP_PLAYLIST_FILE || nano $YT_DLP_PLAYLIST_FILE || nvim $YT_DLP_PLAYLIST_FILE || vim $YT_DLP_PLAYLIST_FILE  
}

# Download Playlist
yt_playlist_download() {
    mkdir -p $YT_DLP_PLAYLIST        # Make Playlist Folder
    mkdir -p $YT_DLP_PLAYLIST_BACKUP # Make Playlist Backup Folder

    while IFS= read -r playlist || [[ -n "$playlist" ]]; do
        if ! yt-dlp --embed-metadata --windows-filenames --embed-thumbnail --embed-chapters --restrict-filenames --download-archive $YT_DLP_PLAYLIST_BACKUP$playlist".txt" -f "bestvideo[ext=mkv]+bestaudio[ext=m4a]/best[ext=mkv]/best" -o $YT_DLP_PLAYLIST"%(uploader)s/%(playlist_title)s/%(title)s.%(ext)s" "https://youtube.com/playlist?list=$playlist"; then
            echo "Failed to download playlist $playlist, skipping..."
        fi
    done <"$YT_DLP_PLAYLIST_FILE"
}

# YouTube Channel
yt_channel_add() {
    local channel="$1"
    if [[ -z "$channel" ]]; then
        echo "Error: No channel ID provided."
        return 1
    fi

    if grep -Fxq "$channel" "$YT_DLP_CHANNEL_FILE"; then
        echo "Error: Channel '$channel' is already in the file."
    else
        echo "$channel" >>"$YT_DLP_CHANNEL_FILE"
    fi
}

# Show all yt Channel to download
yt_channel_view() {
    batcat $YT_DLP_CHANNEL_FILE || cat $YT_DLP_CHANNEL_FILE
}

# Edit all yt playlists to download
yt_channel_edit() {
    code $YT_DLP_CHANNEL_FILE || nano $YT_DLP_CHANNEL_FILE || nvim $YT_DLP_CHANNEL_FILE || vim $YT_DLP_CHANNEL_FILE
}

yt_channel_download() {
    mkdir -p $YT_DLP_CHANNEL        # Make Channel Folder
    mkdir -p $YT_DLP_CHANNEL_BACKUP # Make Channel Backup Folder

    while IFS= read -r channelname || [[ -n "$channelname" ]]; do
        if ! yt-dlp --embed-metadata --windows-filenames --embed-chapters --embed-thumbnail --restrict-filenames --download-archive $YT_DLP_CHANNEL_BACKUP"$channelname.txt" -f "bestvideo[ext=mkv]+bestaudio[ext=m4a]/best[ext=mkv]/best" --merge-output-format mkv -o $YT_DLP_CHANNEL"%(uploader)s/%(title)s.%(ext)s" "https://youtube.com/@$channelname/videos"; then
            echo "Failed to download channel $channelname, skipping..."
        fi
    done <"$YT_DLP_CHANNEL_FILE"
}

# YouTube Album
yt_album_add() {
    local channel="$1"
    if [[ -z "$channel" ]]; then
        echo "Error: No album ID provided."
        return 1
    fi

    if grep -Fxq "$channel" "$YT_DLP_ALBUM_FILE"; then
        echo "Error: Album '$channel' is already in the file."
    else
        echo "$channel" >>"$YT_DLP_ALBUM_FILE"
    fi
}

# Show all yt Channel to download
yt_album_view() {
    batcat $YT_DLP_ALBUM_FILE || cat $YT_DLP_ALBUM_FILE
}

# Edit all yt playlists to download
yt_album_edit() {
    code $YT_DLP_ALBUM_FILE || nano $YT_DLP_ALBUM_FILE || nvim $YT_DLP_ALBUM_FILE || vim $YT_DLP_ALBUM_FILE
}

yt_album_download() {
    mkdir -p $YT_DLP_ALBUM        # Make Album Folder
    mkdir -p $YT_DLP_ALBUM_BACKUP # Make Album Backup Folder

    while IFS= read -r album || [[ -n "$album" ]]; do
        if ! yt-dlp --embed-metadata --embed-thumbnail --windows-filenames --embed-chapters --restrict-filenames --download-archive "$YT_DLP_ALBUM_BACKUP$album.txt" -f "bestaudio" --extract-audio --audio-format mp3 --audio-quality 0 -o "$YT_DLP_ALBUM%(uploader)s/%(playlist_title)s/%(title)s.%(ext)s" "https://music.youtube.com/playlist?list=$album"; then
            echo "Failed to download album $album, skipping..."
        fi
    done <"$YT_DLP_ALBUM_FILE"
}

# YouTube music
yt_music_add() {
    local channel="$1"
    if [[ -z "$channel" ]]; then
        echo "Error: No channel ID provided."
        return 1
    fi

    if grep -Fxq "$channel" "$YT_DLP_MUSIC_FILE"; then
        echo "Error: ID '$channel' is already in the file."
    else
        echo "$channel" >>"$YT_DLP_MUSIC_FILE"
    fi
}

yt_music_view() {
    batcat $YT_DLP_MUSIC_FILE || cat $YT_DLP_MUSIC_FILE
}

yt_music_edit() {
    code $YT_DLP_MUSIC_FILE || nano $YT_DLP_MUSIC_FILE || nvim $YT_DLP_MUSIC_FILE || vim $YT_DLP_MUSIC_FILE
}

yt_music_download() {
    mkdir -p $YT_DLP_MUSIC        # Make Music Folder
    mkdir -p $YT_DLP_MUSIC_BACKUP # Make Music Backup Folder

    while IFS= read -r playlist_id || [[ -n "$playlist_id" ]]; do
        if ! yt-dlp --embed-metadata --embed-thumbnail --windows-filenames --embed-chapters --restrict-filenames --download-archive "$YT_DLP_MUSIC_BACKUP$playlist_id.txt" -f "bestaudio" --extract-audio --audio-format mp3 --audio-quality 0 -o "$YT_DLP_MUSIC%(playlist_title)s/%(title)s.%(ext)s" "https://music.youtube.com/playlist?list=$playlist_id"; then
            echo "Failed to download music playlist $playlist_id, skipping..."
        fi
    done <"$YT_DLP_MUSIC_FILE"
}

yt_install() {
    sudo apt update
    sudo apt install -y python3-pip
    sudo apt install -y ffmpeg
    sudo apt install -y bat
    sudo apt install -y nautilus
    sudo apt install -y nano 
    sudo apt install -y neovim
    sudo apt upgrade -y
    pip install yt-dlp
}

yt_folder() {
    nautilus $YT_DLP_ROOT
}


yt_update(){
    yt_album_download
    yt_channel_download
    yt_music_download
    exit 0
}