# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# This will show up for each command when running the 'history' command
HIST_STAMPS="yyyy-mm-dd"

plugins=(git firebase zsh-autosuggestions zsh-syntax-highlighting aliases docker gh macos)

source $ZSH/oh-my-zsh.sh
source $HOME/.secrets.sh

FIREBASE_ZSH_ICON=true
PROMPT='%F{cyan}%1d%f $(firebase_project) $(git_prompt_info)%(!.#.~) '

# python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
# python end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/lib/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/lib/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/lib/google-cloud-sdk/completion.zsh.inc'; fi

# System Variables
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"
export NODE_EXTRA_CA_KEY="$(mkcert -CAROOT)/rootCA-key.pem"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

webstorm() { /Applications/WebStorm.app/Contents/MacOS/webstorm $* &> /dev/null &| }

# Custom Variables
export JAVA_HOME=$(/usr/libexec/java_home -v 17) # Java Version

# aliases
alias r='source ~/.zshrc'
alias search_alias='alias | grep'
alias p='pnpm'
alias ghpr='gh pr create --web --assignee @me'
alias gcm='cat ~/.claude/commands/gen-commit-msg.md | claude -p --dangerously-skip-permissions --model haiku'
alias yt-mp3='yt-dlp -x --audio-format mp3 -o "~/Downloads/%(title)s.%(ext)s"'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm end

# Used by Claude Code
export EDITOR=zed
