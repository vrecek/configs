echo "===DOWNLOADING PACKAGES==="
# SYSTEM
sudo pacman -S linux-lts linux-lts-headers gdm gnome-shell
# GUI APPS
sudo pacman -S kitty keepassxc qbittorrent 
# FILE SYSTEMS
sudo pacman -S ntfs-3g exfat-utils dosfstools
# FONTS
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji
# APP OPENERS
sudo pacman -S vlc nemo evince sxiv libreoffice-still gnome-font-viewer gedit
# SOUND
sudo pacman -S pipewire pipewire-alsa pipewire-pulse wireplumber pulsemixer
# QEMU
sudo pacman -S virt-manager qemu-full vde2 bridge-utils openbsd-netcat virt-viewer
# GAMES
sudo pacman -S steam
# COMPRESSION
sudo pacman -S p7zip zip

sudo pacman -S gnome-control-center gnome-tweaks gnome-shell-extensions gnome-browser-connector gnome-keyring git xdg-user-dirs lshw inkscape jdk-openjdk dnsmasq imagemagick python-pip wget neofetch lsof curl zsh man iw plocate ufw tk zsh-completions docker docker-buildx dmidecode bluez bluez-utils blueman 

xdg-user-dirs-update

echo "===SETTING YAY==="
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "===DOWNLOADING YAY PACKAGES==="
yay -S librewolf-bin
yay -S vscodium-bin
yay -S prismlauncher-git

echo "===SETTING MIME==="
xdg-mime default org.gnome.gedit.desktop text/plain
xdg-mime default org.gnome.gedit.desktop application/x-zerosize

xdg-mime default org.gnome.Evince.desktop application/pdf

xdg-mime default nemo.desktop inode/directory

echo "===INSTALLING OH-MY-ZSH==="
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "===MOVING CONFIG FILES==="
mkdir ~/Pictures/ascii
mkdir ~/Pictures/wallpapers
mkdir ~/.cache/zsh
[ ! -d ~/.config/neofetch ] && mkdir ~/.config/neofetch
[ ! -d ~/.config/kitty ] && mkdir ~/.config/kitty

cp ~/configs/vim/.vimrc ~/
cp ~/configs/zsh/.zshfn ~/.cache/zsh
cp ~/configs/zsh/.zshrc ~/

cp ~/configs/neofetch/config.default ~/.config/neofetch
cp ~/configs/neofetch/neofetch_ascii.txt ~/Pictures/ascii/

cp ~/configs/kitty/kitty.conf ~/.config/kitty/
cp ~/configs/kitty/window_logo_path.png ~/Pictures/tux.png
cp ~/configs/kitty/background_image.png ~/Pictures/wallpapers/parrot_right.png

sudo cp ~/configs/sysctl/99-settings.conf /etc/sysctl.d/

echo "===INSTALLING VIM-PLUG==="
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PlugInstall'

echo "===SETTING THEMES==="
[ ! -d ~/.icons ] && mkdir ~/.icons
[ ! -d ~/.fonts ] && mkdir ~/.fonts
[ ! -d ~/.themes ] && mkdir ~/.themes

tar xf ~/configs/gnome/themes/themes/Adwaita-dark.tar.gz -C ~/.themes
tar xf ~/configs/gnome/themes/icons/colloid-cursor.tar.gz -C ~/.icons
tar xf ~/configs/gnome/themes/icons/reversal-icons.tar.gz -C ~/.icons

cp ~/configs/gnome/themes/fonts/Cascadia* ~/.fonts
cp ~/configs/gnome/themes/fonts/Symbols* ~/.fonts
cp ~/configs/gnome/themes/arch_logo.jpeg ~/Pictures/wallpapers

mkdir ~/.themes/CustomShell
cp -r ~/configs/gnome/themes/gnome-shell ~/.themes/CustomShell

gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
 
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
 
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Colloid-cursor'
gsettings set org.gnome.desktop.interface icon-theme 'Reversal-icons'
gsettings set org.gnome.desktop.interface font-name 'Cascadia Code 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Cascadia Mono 11'

gsettings set org.gnome.shell enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.github.com']"
gsettings set org.gnome.shell.extensions.user-theme name 'CustomShell'

CUSTOM0="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['$CUSTOM0']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CUSTOM0 name 'terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CUSTOM0 command 'kitty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CUSTOM0 binding '<Ctrl><Alt>t'

gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Ctrl><Alt>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>tab']"

gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'pl')]"

gsettings set org.gnome.desktop.background picture-uri-dark file:///home/vrecek/Pictures/wallpapers/arch_logo.jpeg

echo "===ENABLING DAEMONS==="
sudo systemctl enable gdm
sudo systemctl enable ufw

sudo ufw enable

echo "===SETTING ZSH SHELL==="
chsh -s $(which zsh)

echo "DONE. YOU SHOULD REBOOT NOW"
