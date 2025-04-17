# My Configurations Repository

This repository contains my personal configuration files and scripts for automating the synchronization of my development environment settings. It includes configurations for Zsh, Zed, and VS Code, as well as scripts to keep these configurations in sync with a Git repository.

It uses https://github.com/imbaggaarm/zshrc-auto-sync as a reference for the Zsh configuration and adds automation for Zed configurations. The repository is designed to be used on macOS, leveraging `launchd` services for background synchronization.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Setup](#setup)
- [Automation Scripts](#automation-scripts)
- [License](#license)

---

## Overview

This repository is designed to streamline the management of my development environment by automating the synchronization of configuration files. It uses macOS `launchd` services to monitor changes in configuration files and automatically commit and push updates to a Git repository.

---

## Features

- **Zsh Configuration**: Custom `.zshrc` file with aliases, plugins, and environment variables.
- **Zed Configuration**: Keybindings and settings for the Zed editor.
- **VS Code Configuration**: Keybindings and settings for Visual Studio Code.
- **Automation**: Scripts to monitor changes in configuration files and sync them to a Git repository.
- **macOS Launch Agents**: Automatically run synchronization scripts in the background.

---

## Requirements

Ensure you have the following:

- [fswatch](https://github.com/emcrisostomo/fswatch): Used to monitor file changes.
- A working installation of `zsh`.

---

## Setup

1. Clone this repository:

   ```bash
   git clone https://github.com/lucastnr/my-config.git
   cd my-config
   ```

2. Make the setup script executable:

   ```bash
   chmod +x ./auto_sync/setup_services.sh
   ```

3. Run the setup script to configure and start the macOS `launchd` services:

   ```bash
   ./auto_sync/setup_services.sh
   ```

---

## Automation Scripts

### `setup_services.sh`

This script:

- Makes all necessary scripts executable.
- Copies the `plist` files to `~/Library/LaunchAgents`.
- Loads the `launchd` services to start monitoring file changes.

### `sync_zed.sh` and `sync_zshrc.sh`

These scripts:

- Use `fswatch` to monitor changes in Zed and Zsh configuration files, respectively.
- Trigger the corresponding commit scripts when changes are detected.

### `zed_commit_changes.sh` and `zsh_commit_changes.sh`

These scripts:

- Copy the updated configuration files to the repository.
- Commit and push the changes to the Git repository.

---

## License

This repository is for personal use and is not licensed for public distribution. Feel free to adapt it for your own use, but please ensure you understand the scripts and configurations before using them.

---

## Notes

- Ensure you have write access to the Git repository where changes will be pushed.
- The `fswatch` tool is required for monitoring file changes. Install it via Homebrew:
  ```bash
  brew install fswatch
  ```
- Logs for the `launchd` services can be found in the `~/tmp` directory:
  - `com.lucas.sync-zed.stdout` and `com.lucas.sync-zed.stderr`
  - `com.lucas.sync-zshrc.stdout` and `com.lucas.sync-zshrc.stderr`
- If you do have sensitive information in your configuration files, ensure to exclude them from the repository or use a secure method to handle them.
  - e.g. create a `.secrets.sh` file and run `source .secrets.sh` in your `.zshrc` file.
