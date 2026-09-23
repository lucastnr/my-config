#!/bin/zsh

cd `dirname "$0"`

cp "$HOME/Library/Application Support/Code/User/settings.json" ../vscode
cp "$HOME/Library/Application Support/Code/User/keybindings.json" ../vscode

git add --all && git commit -m "Sync vscode configs" && git push
