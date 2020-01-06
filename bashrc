# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Basic exports
export EDITOR="emacs"
set LANG=en_GB.UTF-8
set LC_ALL=en_GB.UTF-8

# Color
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# History settings
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# General Settings
shopt -s checkwinsize  # check window size after commands and update output
shopt -s globstar      # the pattern "**" will match recursivly
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'

# Prompt
RESET="$(tput sgr0)"
BLUE="$(tput setaf 4)"
GREEN="$(tput setaf 2)"
GREY="$(tput setaf 244)"
RED="$(tput setaf 1)"
YELLOW="$(tput setaf 3)"

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  host="\u@\h "
fi

PS1="\[$GREY\]$userhost\w\[$RESET\] \\$ "

# Path
export PATH="$PATH:~/bin:~/.local/share/flutter/bin"

# Alias definitions
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.win_aliases ] && . ~/.win_aliases
