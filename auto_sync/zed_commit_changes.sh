#!/bin/zsh

cd `dirname "$0"`

cp $HOME/.config/zed/settings.json ../zed
cp $HOME/.config/zed/keymap.json ../zed

git add --all
git commit -m "Sync zed configs"
git push
