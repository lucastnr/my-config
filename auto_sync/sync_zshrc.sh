#!/bin/zsh

DIR_PATH=`dirname "$0"`

/opt/homebrew/bin/fswatch -o $HOME/.zshrc $HOME/.zsh/ | xargs -n1 zsh $DIR_PATH/zsh_commit_changes.sh