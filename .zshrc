export ZSH="$HOME/.oh-my-zsh"

#===== oh-my-zsh OPTIONS =====#
# ZSH_THEME="robbyrussell"
# HYPHEN_INSENSITIVE="true"
# DISABLE_MAGIC_FUNCTIONS="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_AUTO_TITLE="false"
ZSH_CUSTOM="$ZSH/custom"
ENABLE_CORRECTION="true"
CASE_SENSITIVE="false"
DISABLE_LS_COLORS="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(zsh-autosuggestions)

zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7

setopt beep notify nomatch extendedglob
unsetopt autocd
#=============================#

#====== MY VARS =======#
NL=$'\n'

HISTFILE="$HOME/.zsh_history"
HISTSIZE=2000
SAVEHIST=$HISTSIZE
PROMPT='┌─[%B%F{#ff8000}%T%f%b]%B%F{#33ff33}%n💀%m%f%b[%B%F{#3399ff}%~%f%b]${NL}└─➤ '
#======================#

#===== MY ALIASES =====#
alias neofetch='neofetch --config ~/.config/neofetch/config.default'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
#======================#

#===== MY EXPORTS =====#
export NVM_DIR="$HOME/.nvm"
export EDITOR='vim'
export LANG="en_US.UTF-8"
#======================#

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source $ZSH/oh-my-zsh.sh
