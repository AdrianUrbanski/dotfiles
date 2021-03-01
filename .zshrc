
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi

# set up prompt

autoload -U promptinit
promptinit
prompt pure

# aliases

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='ls --color=auto'
alias ll='ls-color=auto'
alias grep='grep --color=auto'
alias sc="source $HOME/.zshrc"  # reload zsh configuration

# history
setopt histignorealldups sharehistory
HISTFILE=~/.zsh/histfile
HISTSIZE=5000
SAVEHIST=5000

# Completion system

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/adis/.zshrc'

# use vi keybindings
bindkey -v

autoload -Uz compinit
compinit

# environment variables
export VISUAL=nvim
export EDITOR=nvim
export TERMINAL=urxvt

# misc
setopt beep
unsetopt autocd
COMPLETION_WAITING_DOTS="true"
