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
setopt extendedhistory
setopt beep

unsetopt autocd
#=============================#

#====== MY VARS =======#
HISTFILE="$HOME/.cache/zsh/.zsh_history"
HISTSIZE=20000
SAVEHIST=$HISTSIZE
HIST_STAMPS="yyyy-mm-dd"
ENABLE_CORRECTION="true"
CASE_SENSITIVE="false"
PATH="$PATH:/home/$USER/.local/bin"
DISTRO=$(cat /etc/os-release)

#========= PS1 =========#
TIMECLR='#6F84BF'
HOSTCLR='#5171c6'
DIRCLR='#6e7cc9'

PS1=$'┌─%F{$TIMECLR}\ue0b2%f%K{$TIMECLR}%F{#fff}%T%f%k%F{$TIMECLR}%K{$HOSTCLR}\ue0b0%f%F{#fff} %n@%m %f%k%F{$HOSTCLR}%K{$DIRCLR}\ue0b0%f%F{#ffffff} %~ $f%k%F{$DIRCLR}\ue0b0%f\n└─\ue0b0 '
#======================#


#===== MY ALIASES =====#
alias neofetch='fastfetch -c ~/.config/fastfetch/config_main.jsonc'

alias ls='eza --color=always --icons=always'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

alias open='xdg-open 2>/dev/null'
alias xdg-mime='XDG_UTILS_DEBUG_LEVEL=2 xdg-mime'
alias sctl='sudo systemctl'
alias sctlu='systemctl --user'
alias da='sudo'

alias zrc='nvim ~/.zshrc'
alias zfn='nvim ~/.zshfn'
alias vrc='nvim ~/.config/nvim/init.vim'

alias fw='sudo ufw'
alias fwlist="fw status numbered | grep -v 'v6'"

alias ports='sudo lsof -Pni'
alias topo='/usr/bin/top -o RES -d 1 -e m'
alias top='btop'
alias dusage='df -h | head -n1 && df -h | grep "^/dev" | sort'
alias psearch='ps aux | grep -i'

alias vm='sudo virsh'
alias vmlist='vm list --all'
alias vmsnaps='vm snapshot-list --domain'

alias weather='curl wttr.in'
alias myip='curl ipinfo.io/ip'
alias f='yazi'
alias nv='nvim'

alias nsxiv='nsxiv -a'
alias wl-copy='wl-copy --trim-newline'
alias hist='history -i'
alias edit='sudoedit'

alias plasmarestart='kquitapp6 plasmashell && kstart plasmashell'

alias getsize='for i in ./*; do echo $(du -hs $i); done | sort -h'
alias gethist='hist | grep'

alias search='ls -al | grep -i'

alias pkgsearch='(pacman -Qnq && pacman -Qmq) | grep -i'
alias pkginfol='pacman -Qi'
alias pkginfor='pacman -Si'
alias pkgi='sudo pacman -S'
alias pkgd='sudo pacman -Rns'
alias pkgupg='sudo pacman -Syu'
alias pkgupga='yay -Syu'
alias pkglist='pacman -Qnq'
alias pkglista='pacman -Qmq'
alias pkgcleancache='paccache -ruk0 && paccache -rk1'
alias pkgclean='sudo pacman -Rns $(pacman -Qdtq)'

alias startbt='sctl start bluetooth'
alias stopbt='sctl stop bluetooth'
alias startssh='fw allow 2468 && sctl start sshd'
alias stopssh='fw deny 2468 && sctl stop sshd'

alias pyenv="source $HOME/Documents/pyenv/bin/activate"
#======================#

#===== MY EXPORTS =====#
export ANDROID_SDK_ROOT=~/Android/Sdk
export ANDROID_AVD_HOME=~/.android/avd
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH"
export EDITOR='nvim'
export LANG="en_US.UTF-8"
export STEAMAPPS="$HOME/.steam/steam/steamapps/common"
export WALLPAPERS="$HOME/Pictures/wallpapers"
export MINECRAFT="$HOME/.local/share/PrismLauncher/instances"
#export PYTHONPATH="/home/vrecek/Documents/pyenv/lib/python3.13/site-packages"
export ZSH_COMPDUMP="$ZSH/cache/.zcompdump-$HOST"
#======================#

#====== MY BINDS ======#
bindkey \^U backward-kill-line
bindkey \^E end-of-line
bindkey \^A beginning-of-line
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
#======================#

source ~/.zshfn
source $ZSH/oh-my-zsh.sh

#===== MY ALIASES ... =====#
alias ls='eza --color=always --icons=always'
#==========================#

