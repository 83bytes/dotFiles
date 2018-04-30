#!/bin/sh

cd /mnt/data/work_space/fsmk/website/fsmk-web/

echo `pwd`

git pull 

jekyll build

rsync -avr /mnt/data/work_space/fsmk/website/fsmk-web/_site/ fsmk:/home/fsmk/public_html
