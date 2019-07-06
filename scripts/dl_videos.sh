#/bin/bash

# $1 has the url

if [[ $1 == *"playlist?"* ]]; then
    youtube-dl -f best -cio '%(playlist_index)s-%(title)s.%(ext)s' $1 --download-archive youtubedl_archive
else
    youtube-dl -f best -cio '%(playlist_index)s-%(title)s.%(ext)s' $1
fi

