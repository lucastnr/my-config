#!/bin/zsh

DIR_PATH=`dirname "$0"`

/opt/homebrew/bin/fswatch -o $HOME/Library/Application\ Support/Code/User/settings.json $HOME/Library/Application\ Support/Code/User/keybindings.json | xargs -n1 zsh $DIR_PATH/vscode_commit_changes.sh
