# This script configures macOS Dock settings using the `defaults` command.
## Remove the delay when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -int 0

## Update the Dock animation duration
defaults write com.apple.dock autohide-time-modifier -float 0.4;
killall Dock
