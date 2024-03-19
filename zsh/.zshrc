export ZSH="$HOME/.oh-my-zsh"

#===== oh-my-zsh OPTIONS =====#
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="true"
CASE_SENSITIVE="false"
DISABLE_LS_COLORS="false"

ZSH_CUSTOM="$ZSH/custom"

HIST_STAMPS="yyyy-mm-dd"

plugins=(zsh-autosuggestions)

zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7

setopt beep notify nomatch extendedglob
unsetopt autocd
#=============================#

#====== MY VARS =======#
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=$HISTSIZE

PS1=$'┌─[%B%F{#ff8000}%T%f%b]%B%F{#33ff33}%n💀%m%f%b[%B%F{#3399ff}%~%f%b]\n└─➤ '
#======================#

#===== MY ALIASES =====#
alias neofetch='neofetch --config ~/.config/neofetch/config.default'
alias neofetch-def='neofetch --config ~/.config/neofetch/config.conf'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias open='xdg-open 2>/dev/null'
alias xdg-mime='XDG_UTILS_DEBUG_LEVEL=2 xdg-mime'
alias sctl='sudo systemctl'
alias da='sudo'

alias zrc='vim ~/.zshrc'

alias fw='sudo ufw'
alias fwlist='fw status numbered'

alias ports='sudo lsof -Pni'
alias mixer='pulsemixer'
alias weather='curl wttr.in'
alias myip='curl ipinfo.io/ip'
#======================#

#===== MY EXPORTS =====#
export NVM_DIR="$HOME/.nvm"
export EDITOR='vim'
export LANG="en_US.UTF-8"
export STEAMAPPS="$HOME/.steam/steam/steamapps/common"
export PYTHONPATH="/home/vrecek/.local/lib/python3.11/site-packages"
export ZSH_COMPDUMP="$ZSH/cache/.zcompdump-$HOST"
export GTK_THEME='Adwaita-dark'
#======================#

#====== MY BINDS ======#
bindkey \^U backward-kill-line
#======================#

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

#====== MY FUNCS ======#
source ~/.zshfn
#======================#

source $ZSH/oh-my-zsh.sh
