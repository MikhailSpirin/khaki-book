#!/bin/sh

cd ~/Sites/dark-khaki-book
source .venv/bin/activate

echo "... commit and push ..."

git add .
current_date_time=$(date)
git commit -m "automated - $(date) - $1"
git push

echo "... building ..."

mkdocs gh-deploy
