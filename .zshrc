# zmodload zsh/zprof

# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=zsh)"

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/opt/llvm/bin:/usr/local/bin:/usr/local/sbin:/Users/zimi/.bin:/Users/s1hofmann/Documents/git/flutter/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/s1hofmann/.oh-my-zsh

. /Users/s1hofmann/.z.sh

autoload zmv
alias zcp='zmv -C'
alias zln='zmv -L'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="rkj-repos"
# ZSH_THEME="amuse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(brew colorize cp git node npm macos vi-mode kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias vim="nvim"
alias python="python3"

alias ec="vim ~/.zshrc"
alias rc="source ~/.zshrc"
alias cl=clear

alias pn=pnpm

alias srv="ssh -p 5110 zimi@simon-hofmann.org"
alias devsrv="ssh -p 5110 zimi@s1h.org"
alias cat="highlight -O ansi --force"

alias iawriter="cd /Users/s1hofmann/Library/Mobile\ Documents/27N4MQEA55~pro~writer/Documents"

function rpath() {
    otool -l $1 | grep RPATH -A2
}

function noQuarantine () {
    echo "Removing $1 from quarantine"
    xattr -d com.apple.quarantine `which $1`
}

function createCluster () {
    echo "Setting up single node cluster $1"
    scw k8s cluster create name=$1 version=1.23.6 pools.0.size=1 pools.0.node-type=DEV1-M pools.0.name=dev tags.0=dev-cluster
}

function deleteCluster () {
    echo "Tearing down development cluster $1"
    scw k8s cluster delete $1
}

function createPodSpec () {
    echo "Creating pod spec $1 for image $2"
    kubectl run $1 --image=$2 --dry-run=client -o yaml > "$1.yaml"
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export BW_SESSION="jW3R5DQmPTGPngTD1VYz7fKryeXyTlisqybygmuAdktfoaSmvExAGpCaLbhcIqHxLUcDhf6+PDlbxJySXgkYZQ=="

# zprof

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/s1hofmann/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

if [ -z ${TMUX+x} ]; then tmux new -A -s default; fi
