echo "===SETTING PACMAN==="
sudo sed -i 's/#Color/Color/' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads\ =\ 5/ParallelDownloads\ =\ 3/' /etc/pacman.conf
sudo sed -i '/Misc/a ILoveCandy' /etc/pacman.conf
sudo sed -i '/#\[multilib\]/{s/#//;n;s/#//}' /etc/pacman.conf

sudo pacman -Syu

echo "===DOWNLOADING PACKAGES==="
A_PACK=(
	# SYSTEM
	linux-lts linux-lts-headers gdm gnome-shell
	# GUI APPS
	kitty keepassxc qbittorrent
	# FILESYSTEMS
	ntfs-3g exfat-utils dosfstools
	# SOUND
	pipewire pipewire-alsa pipewire-pulse wireplumber pulsemixer
	# FONTS
	noto-fonts noto-fonts-cjk noto-fonts-emoji
	# APP OPENERS
	vlc nemo evince sxiv libreoffice-still gnome-font-viewer gedit
	# QEMU
	virt-manager qemu-full vde2 bridge-utils openbsd-netcat virt-viewer
	# COMPRESSION
	p7zip zip
	# GAMES
	steam
	# BLUETOOTH
	bluez bluez-utils blueman
	# DOCKER
	docker docker-buildx
	# GNOME UTILS
	gnome-control-center gnome-tweaks gnome-shell-extensions gnome-browser-connector gnome-keyring
	# CLI UTILS
	lshw wget curl neofetch lsof man iw plocate dmidecode inkscape imagemagick python-pip
	# OTHER
	xdg-user-dirs jdk-openjdk dnsmasq zsh ufw tk zsh-completions 
)

sudo pacman -S ${A_PACK[@]}

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
[ ! -d ~/.config/neofetch ] && mkdir ~/.config/neofetch
[ ! -d ~/.config/kitty ] && mkdir ~/.config/kitty

cp ~/configs/vim/.vimrc ~/
cp ~/configs/zsh/.* ~/

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
[ ! -d ~/.themes ] && mkdir -p ~/.themes/CustomShell

tar xf ~/configs/gnome/themes/themes/Adwaita-dark.tar.gz -C ~/.themes
tar xf ~/configs/gnome/themes/icons/colloid-cursor.tar.gz -C ~/.icons
tar xf ~/configs/gnome/themes/icons/reversal-icons.tar.gz -C ~/.icons

cp ~/configs/gnome/themes/fonts/* ~/.fonts
cp ~/configs/gnome/themes/arch_logo.jpeg ~/Pictures/wallpapers

cp -r ~/configs/gnome/themes/gnome-shell ~/.themes/CustomShell

gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
 
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
 
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'colloid-cursor'
gsettings set org.gnome.desktop.interface icon-theme 'reversal-icons'
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
sudo systemctl enable libvirtd

sudo ufw enable

echo "===SETTING ZSH SHELL==="
chsh -s $(which zsh)

echo "DONE. YOU SHOULD REBOOT NOW"
