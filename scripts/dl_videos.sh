#/bin/bash

# $@ has all urls as yl-dl supports multiple urls
# do not mix playlist and non-playlist urls

# add --limit-rate 500K to limit to 500 Kbps

if [[ $@ == *"playlist?"* ]]; then
    youtube-dl -f best -cio '%(playlist_index)s-%(title)s.%(ext)s' $@ --download-archive youtubedl_archive
else
    youtube-dl -f best -cio '%(playlist_index)s-%(title)s.%(ext)s' $@ 
fi

