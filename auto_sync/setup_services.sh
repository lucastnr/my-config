# Run `chmod +x ./auto_sync/setup_services.sh` to make this file executable
DIR_PATH=`dirname "$0"`

chmod +x $DIR_PATH/sync_zed.sh
chmod +x $DIR_PATH/sync_zshrc.sh
chmod +x $DIR_PATH/sync_vscode.sh

chmod +x $DIR_PATH/zed_commit_changes.sh
chmod +x $DIR_PATH/zsh_commit_changes.sh
chmod +x $DIR_PATH/vscode_commit_changes.sh

cp $DIR_PATH/com.lucas.auto-sync-zed.plist $HOME/Library/LaunchAgents
cp $DIR_PATH/com.lucas.auto-sync-zshrc.plist $HOME/Library/LaunchAgents
cp $DIR_PATH/com.lucas.auto-sync-vscode.plist $HOME/Library/LaunchAgents

handle_error() {
    echo "WARNING: Unloading $1 service failed, but this may be the first time you are configuring this"
}

launchctl unload $HOME/Library/LaunchAgents/com.lucas.auto-sync-zed.plist || handle_error "zed"
launchctl load $HOME/Library/LaunchAgents/com.lucas.auto-sync-zed.plist

launchctl unload $HOME/Library/LaunchAgents/com.lucas.auto-sync-zshrc.plist || handle_error "zshrc"
launchctl load $HOME/Library/LaunchAgents/com.lucas.auto-sync-zshrc.plist

launchctl unload $HOME/Library/LaunchAgents/com.lucas.auto-sync-vscode.plist || handle_error "vscode"
launchctl load $HOME/Library/LaunchAgents/com.lucas.auto-sync-vscode.plist
