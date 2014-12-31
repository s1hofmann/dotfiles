# Path to your oh-my-zsh configuration.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rkj-repos"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux cp python systemd vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export EDITOR="vim"

# repeat last command
alias re='exec $(fc -ln -1)'

# colored gcc output
export GCC_COLORS="true"

cpp_tags ()
{
    cd $1
    dir=${PWD##*/}
    mkdir -p ~/.vim/tags/$dir
    ctags -R --sort=yes --c++-kinds=+cdefglmnpstuvx --fields=+afikKlmnsSzt --extra=+q -f ~/.vim/tags/$dir/tags .
    cd -
}

c_tags ()
{
    cd $1
    dir=${PWD##*/}
    mkdir -p ~/.vim/tags/$dir
    ctags -R --sort=yes --c-kinds=+cdefglmnpstuvw --fields=+afikKlmnsSzt --extra=+q -f ~/.vim/tags/$dir/tags .
    cd -
}

py_tags ()
{
    cd $1
    dir=${PWD##*/}
    mkdir -p ~/.vim/tags/$dir
    ctags -R --sort=yes --python-kinds=+cfmvi --fields=+afikKlmnsSzt --extra=+q -f ~/.vim/tags/$dir/tags .
    cd -
}

alias nmux='tmux new -s'
alias kmux='tmux kill-session -t'
alias amux='tmux attach -t'
alias lmux='tmux list-sessions'

alias pwgen='pwgen -yn'
