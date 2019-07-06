#/bin/bash

youtube-dl -f best -x --audio-format mp3 --audio-quality 0 --embed-thumbnail -io './%(title)s.%(ext)s'  -a $1
