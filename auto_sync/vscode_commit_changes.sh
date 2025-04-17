#!/bin/zsh

cd `dirname "$0"`

cp $HOME/.zshrc ../

git add --all
git commit -m "Sync vscode configs"
git push
