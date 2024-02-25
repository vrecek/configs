export ZSH="$HOME/.oh-my-zsh"

#===== oh-my-zsh OPTIONS =====#
# ZSH_THEME="robbyrussell"
# HYPHEN_INSENSITIVE="true"
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_AUTO_TITLE="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
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

#===== oh-my-zsh EXPORTS =====#
export LANG=en_US.UTF-8
export EDITOR='vim'
# export MANPATH="/usr/local/man:$MANPATH"
# export ARCHFLAGS="-arch x86_64"
#=============================#

#====== MY VARS =======#
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
PROMPT='[%B%F{#ff8000}%T%f%b]%B%F{#33ff33}%n💀%m%f%b[%B%F{#3399ff}%~%f%b]$ '
#======================#

#===== MY ALIASES =====#
alias neofetch='neofetch --config ~/.config/neofetch/config.default'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
#======================#

#===== MY EXPORTS =====#
export NVM_DIR="$HOME/.nvm"
#======================#

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source $ZSH/oh-my-zsh.sh
