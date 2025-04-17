#!/bin/zsh

DIR_PATH=`dirname "$0"`

/opt/homebrew/bin/fswatch -o $HOME/.config/zed/settings.json $HOME/.config/zed/keymap.json | xargs -n1 zsh $DIR_PATH/zed_commit_changes.sh
