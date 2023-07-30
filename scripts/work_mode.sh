#!/bin/env bash

# This will block certain websites so that I can not access then during work timings/focus mode

sed  -i '1i 127.0.0.1 \tfacebook.com www.facebook.com' /etc/hosts
sed  -i '1i 127.0.0.1 \tinstagram.com www.instagram.com' /etc/hosts
sed  -i '1i 127.0.0.1 \treddit.com www.reddit.com' /etc/hosts
sed  -i '1i 127.0.0.1 \ttwitter.com www.twitter.com' /etc/hosts
