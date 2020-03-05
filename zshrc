#######################
#
# Prompt
#
#######################

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
HOSTNAME=$(hostname)
precmd_title() { print -Pn "\e]0;$HOSTNAME\a" }
precmd_functions+=( precmd_vcs_info precmd_title )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{243}%b%a%f'

RPROMPT=\$vcs_info_msg_0_
PROMPT='%F{243}%~%f %(?..%F{red}[%?]%f )%(!.#.$) '

#######################
#
# Completion
#
#######################
zstyle ':completion:*:(ssh|scp|sftp|rsh|rsync):*' users

# The following lines were added by compinstall

zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/user/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#######################
#
# Behaviour
#
#######################

setopt no_case_glob
bindkey -e

#######################
#
# Helper Functions
#
#######################

_has() {
    which $1>/dev/null 2>&1
}

#######################
#
# Path
#
#######################

typeset -U path # Make path variable act like a set

path=("$HOME/linuxbrew/.linuxbrew/bin" $path)
path=("$HOME/Apps/composer" $path)
path=("$HOME/n/bin" $path)
path=("$HOME/bin" $path)
path=("$HOME/.local/share/flutter/bin" $path)
path=("/home/linuxbrew/.linuxbrew/bin" $path)

path=($^path(N-/)) # Remove paths that do not exist

#######################
#
# History
#
#######################

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000
setopt append_history nomatch
setopt share_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_verify


#######################
#
# Aliases
#
#######################

alias rm='rm -I'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if _has exa; then
    alias ls="exa --git"
    alias ll="exa --all --long --git"
    alias la="exa --all --binary --group --header --long --git"
    alias l="ls"
fi

_has fdfind && alias fd="fdfind"

eval "$(lua ~/Apps/z.lua/z.lua --init zsh)"
if _has z; then
    alias zz='z -c'      # restrict matches to subdirs of $PWD
    alias zi='z -i'      # cd with interactive selection
    alias zf='z -I'      # use fzf to select in multiple matches
    alias zb='z -b'      # quickly cd to the parent directory
fi

#######################
#
# Includes
#
#######################
