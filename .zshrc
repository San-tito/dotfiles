#     _____             __  _ __
#    / ___/____ _____  / /_(_) /_____       Santito
#    \__ \/ __ `/ __ \/ __/ / __/ __ \      https://github.com/San-tito
#   ___/ / /_/ / / / / /_/ / /_/ /_/ /      https://gitlab.com/santito
#  /____/\__,_/_/ /_/\__/_/\__/\____/
#

# ---------------------------------------------------------------
# EXIT IF NOT INTERACTIVE
# ---------------------------------------------------------------
[[ $- != *i* ]] && return


# ---------------------------------------------------------------
# SHELL
# ---------------------------------------------------------------

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=$HISTSIZE
setopt inc_append_history share_history hist_ignore_all_dups
setopt autocd no_beep interactivecomments
unsetopt nomatch

# PATH
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
bindkey -v   # vi mode


# ---------------------------------------------------------------
# ALIASES
# ---------------------------------------------------------------

# Git shortcuts
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'

# zoxide wrapper
if command -v zoxide &>/dev/null; then
  alias cd="zd"
  zd() {
    if [[ $# -eq 0 ]]; then
      builtin cd ~
    elif [[ -d $1 ]]; then
      builtin cd "$1"
    else
      if z "$@"; then
        printf "\U000F17A9 "
        pwd
      else
        echo "Error: Directory not found"
      fi
    fi
  }
fi

# Open files using xdg-open
open() {
  xdg-open "$@" >/dev/null 2>&1 &
}

# Editor
alias vim='nvim'


# ---------------------------------------------------------------
# PROMPT
# ---------------------------------------------------------------
if [[ -d ~/.zsh/themes/spaceship ]]; then
  source ~/.zsh/themes/spaceship/spaceship.zsh-theme
fi


# ---------------------------------------------------------------
# INIT (plugins, tools)
# ---------------------------------------------------------------

# mise
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi

# zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# Autosuggestions
if [[ -d ~/.zsh/plugins/zsh-autosuggestions ]]; then
  source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Syntax highlighting (must be *last*)
if [[ -d ~/.zsh/plugins/zsh-syntax-highlighting ]]; then
  source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


# ---------------------------------------------------------------
# ENVIRONMENT VARIABLES
# ---------------------------------------------------------------
export TERM="xterm-256color"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export SUDO_EDITOR="$EDITOR"
export BAT_THEME="ansi"


# ---------------------------------------------------------------
# INPUTRC-LIKE OPTIONS (Readline compat)
# ---------------------------------------------------------------
# These only affect programs using readline (like bash), not zsh.
# Kept because you included them intentionally.

set meta-flag on
set input-meta on
set output-meta on
set convert-meta off
set completion-ignore-case on
set completion-prefix-display-length 2
set show-all-if-ambiguous on
set show-all-if-unmodified on
set mark-symlinked-directories on
set match-hidden-files off
set page-completions off
set completion-query-items 200
set visible-stats on
set skip-completed-text on
set colored-stats on
