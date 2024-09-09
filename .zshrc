#     _____             __  _ __
#    / ___/____ _____  / /_(_) /_____
#    \__ \/ __ `/ __ \/ __/ / __/ __ \   Santito
#   ___/ / /_/ / / / / /_/ / /_/ /_/ /   https://github.com/San-tito
#  /____/\__,_/_/ /_/\__/_/\__/\____/    https://gitlab.com/santito
#

### Environment
export TERM="xterm-256color"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

### VI MODE
bindkey -v

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

### XDG_*_HOME
if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

### ALIASES ###
alias vim="nvim"
alias df='df -h'
alias free='free -m'
alias grep='grep --color=auto'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gcl='git clone --recurse-submodules'
alias gcam='git commit --all --message'
alias gfa='git fetch --all --tags --prune'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias gloga='git log --oneline --decorate --graph --all'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

### THEME
source $ZSH/themes/spaceship/spaceship.zsh-theme

### PLUGINS
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=($ZSH/plugins/zsh-completions/src $fpath)
