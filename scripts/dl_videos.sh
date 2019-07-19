#/bin/bash

# $@ has all urls as yl-dl supports multiple urls
# do not mix playlist and non-playlist urls

if [[ $@ == *"playlist?"* ]]; then
    youtube-dl -f best -cio '%(playlist_index)s-%(title)s.%(ext)s' $@ --download-archive youtubedl_archive --limit-rate 500K
else
    youtube-dl -f best -cio '%(playlist_index)s-%(title)s.%(ext)s' $@ --limit-rate 500K
fi

