#!/bin/bash

# $@ has all urls as yl-dl supports multiple urls
# do not mix playlist and non-playlist urls

# add --limit-rate 500K to limit to 500 Kbps

if [[ $@ == *"playlist?"* ]]; then
    echo "$@" > ./playlist_url
    yt-dlp -f bestvideo+bestaudio --merge-output-format mkv -cio '%(playlist_index)s-%(title)s.%(ext)s' "$@" --download-archive youtubedl_archive
else
    yt-dlp -f bestvideo+bestaudio --merge-output-format mkv -cio '%(title)s.%(ext)s' "$@"
fi

