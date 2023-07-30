#!/usr/bin/env bash

# put either the urls or a file with the urls

youtube-dl -f bestaudio -x --audio-format mp3 --audio-quality 0 --embed-thumbnail -io './%(title)s.%(ext)s' "$@"
