export ZSH="$HOME/.oh-my-zsh"

#===== oh-my-zsh OPTIONS =====#
ZSH_CUSTOM="$ZSH/custom"
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7

#=========== OPTS ============#
setopt notify 
setopt nomatch 
setopt extendedglob
setopt hist_ignore_dups
setopt beep

unsetopt autocd
#=============================#

#====== MY VARS =======#
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HIST_STAMPS="yyyy-mm-dd"
ENABLE_CORRECTION="true"
CASE_SENSITIVE="false"

PS1=$'┌─[%B%F{#ff8000}%T%f%b]%B%F{#33ff33}%n💀%m%f%b[%B%F{#3399ff}%~%f%b]\n└─➤ '
#======================#

#===== MY ALIASES =====#
alias neofetch='neofetch --config ~/.config/neofetch/config.default'
alias neofetch-def='neofetch --config ~/.config/neofetch/config.conf'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

alias open='xdg-open 2>/dev/null'
alias xdg-mime='XDG_UTILS_DEBUG_LEVEL=2 xdg-mime'
alias sctl='sudo systemctl'
alias da='sudo'

alias zrc='vim ~/.zshrc'

alias fw='sudo ufw'
alias fwlist='fw status numbered'

alias ports='sudo lsof -Pni'
alias top='top -o RES -d 1 -e m'
alias mixer='pulsemixer'
alias weather='curl wttr.in'
alias myip='curl ipinfo.io/ip'
alias wl-copy='wl-copy --paste-once --trim-newline'
alias gget='gsettings get'
alias gset='gsettings set'
#======================#

#===== MY EXPORTS =====#
export NVM_DIR="$HOME/.nvm"
export EDITOR='vim'
export LANG="en_US.UTF-8"
export STEAMAPPS="$HOME/.steam/steam/steamapps/common"
export PYTHONPATH="$HOME/.local/lib/python3.11/site-packages"
export ZSH_COMPDUMP="$ZSH/cache/.zcompdump-$HOST"
#======================#

#====== MY BINDS ======#
bindkey \^U backward-kill-line
#======================#

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

#====== MY FUNCS ======#
source ~/.zshfn
#======================#

source $ZSH/oh-my-zsh.sh
