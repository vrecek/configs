echo "===DOWNLOADING PACKAGES==="
sudo pacman -S gnome-shell gdm gnome-control-center gnome-tweaks gnome-shell-extensions gnome-browser-connector gnome-keyring kitty git xdg-user-dirs nemo sxiv vlc keepassxc libreoffice-still qbittorrent noto-fonts noto-fonts-cjk noto-fonts-emoji evince lshw inkscape jdk-openjdk gedit dnsmasq imagemagick python-pip pipewire pipewire-alsa pipewire-pulse wireplumber wget neofetch lsof curl zsh man linux-lts linux-lts-headers iw plocate pulsemixer ufw tk zsh-completions zip 

xdg-user-dirs-update

echo "===SETTING YAY==="
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "===DOWNLOADING LIBREWOLF/VSCODIUM==="
yay -S librewolf-bin
yay -S vscodium-bin

echo "===SETTING MIME==="
xdg-mime default sxiv.desktop image/png
xdg-mime default sxiv.desktop image/jpeg
xdg-mime default sxiv.desktop image/jpg

xdg-mime default org.gnome.gedit.desktop text/plain
xdg-mime default org.gnome.gedit.desktop application/x-zerosize

xdg-mime default org.gnome.Evince.desktop application/pdf

echo "===INSTALLING VIM-PLUG==="
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PlugInstall'

echo "===INSTALLING OH-MY-ZSH==="
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "===MOVING CONFIG FILES==="
[ ! -d ~/Pictures/ascii ] && mkdir ~/Pictures/ascii
[ ! -d ~/Pictures/wallpapers ] && mkdir ~/Pictures/wallpapers
[ ! -d ~/.config/neofetch ] && mkdir ~/.config/neofetch

cp ~/configs/vim/.vimrc ~/
cp ~/configs/zsh/.* ~/

cp ~/configs/neofetch/config.default ~/.config/neofetch
cp ~/configs/neofetch/neofetch_ascii.txt ~/Pictures/ascii/

cp ~/configs/kitty/kitty.conf ~/.config/kitty/
cp ~/configs/kitty/window_logo_path.png ~/Pictures/tux.png
cp ~/configs/kitty/background_image.png ~/Pictures/wallpapers/parrot_right.png

sudo cp ~/configs/sysctl/99-settings.conf /etc/sysctl.d/

echo "===SETTING THEMES==="
[ ! -d ~/.icons ] && mkdir ~/.icons
[ ! -d ~/.fonts ] && mkdir ~/.fonts
[ ! -d ~/.themes ] && mkdir ~/.themes

cp -r ~/configs/gnome/themes/colloid-cursor ~/.icons
cp -r ~/configs/gnome/themes/reversal-icons ~/.icons
cp -r ~/configs/gnome/themes/Adwaita-dark ~/.themes
cp ~/configs/gnome/themes/Cascadia* ~/.fonts
cp ~/configs/gnome/themes/Symbols* ~/.fonts
cp ~/configs/gnome/themes/arch_logo.jpeg ~/Pictures/wallpapers

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

CUSTOM0="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
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
