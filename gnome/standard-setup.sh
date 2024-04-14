echo "===SETTING PACMAN==="
sudo sed -i '/Misc/a ILoveCandy' /etc/pacman.conf
sudo sed -i '/#Parallel/ {s/#//; s/5/3/}' /etc/pacman.conf
sudo sed -i '/#\[multilib\]/ {s/#//; n; s/#//}' /etc/pacman.conf
sudo sed -i 's/#Color/Color/' /etc/pacman.conf

sudo pacman -Syu


echo "===DOWNLOADING PACKAGES==="
A_PACK=(
	# SYSTEM
	linux-lts linux-lts-headers gdm gnome-shell
	# GUI APPS
	kitty keepassxc qbittorrent pinta
	# FILESYSTEMS
	ntfs-3g exfatprogs dosfstools
	# SOUND
	pipewire pipewire-alsa pipewire-pulse wireplumber pulsemixer
	# FONTS
	noto-fonts noto-fonts-cjk noto-fonts-emoji
	# APP OPENERS
	vlc nautilus evince nsxiv libreoffice-still gnome-font-viewer gedit
	# QEMU
	virt-manager qemu-full vde2 bridge-utils virt-viewer
	# COMPRESSION
	p7zip zip
	# GAMES
	steam discord
	# BLUETOOTH
	bluez bluez-utils
	# DOCKER
	docker docker-buildx
	# GNOME UTILS
	gnome-control-center gnome-tweaks gnome-shell-extensions gnome-browser-connector gnome-themes-extra
	# XDG UTILS
	xdg-desktop-portal-gnome xdg-user-dirs
	# CLI UTILS
	wget curl neofetch man plocate inkscape imagemagick python-pip lftp wl-clipboard openssh tree openbsd-netcat 
	# DIAGNOSTIC
	lshw lsof dmidecode nmap iw smartmontools wireshark-qt
	# ZSH
	zsh zsh-completions
	# OTHER
	jdk-openjdk dnsmasq ufw tk apache syslog-ng logrotate cronie mesa-utils mesa-demos pacman-contrib openvpn power-profiles-daemon git sassc gst-plugin-pipewire
)

sudo pacman -S ${A_PACK[@]}

xdg-user-dirs-update


echo "===ENABLING SERVICES==="
sudo systemctl enable gdm
sudo systemctl enable ufw
sudo systemctl enable dnsmasq
sudo systemctl enable syslog-ng@default.service
sudo systemctl enable libvirtd
sudo systemctl enable virtlogd

sudo systemctl disable cronie
sudo systemctl disable httpd
sudo systemctl disable sshd
sudo systemctl disable systemd-resolved


echo "===SETTING FIREWALL==="
sudo ufw enable
sudo ufw default deny incoming
sudo ufw deny 20
sudo ufw deny 21
sudo ufw deny 22
sudo ufw deny 80
sudo ufw deny 443
sudo sed -i '/ignore_all/ s/0/1/' /etc/ufw/sysctl.conf


echo "===SETTING YAY==="
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

if [ $(command -v 'yay') ]; then
	echo "===DOWNLOADING YAY PACKAGES==="
	yay -S librewolf-bin
	yay -S vscodium-bin
	yay -S prismlauncher
fi


echo "===SETTING MIME==="
xdg-mime default org.gnome.gedit.desktop text/plain
xdg-mime default org.gnome.gedit.desktop application/x-zerosize

xdg-mime default org.gnome.Evince.desktop application/pdf

xdg-mime default org.gnome.Nautilus.desktop inode/directory


echo "===INSTALLING NODEJS==="
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.nvm/nvm.sh

NODELTS=$(nvm ls-remote | grep Latest | tail -1 | awk '{print $1}')
nvm install $NODELTS


echo "===INSTALLING OH-MY-ZSH==="
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo "ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=#ff4022
ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
ZSH_HIGHLIGHT_STYLES[redirection]=fg=#ffec22

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=#FFA759
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=#FFA759

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=#FCB13C
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=#FCB13C
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=#FCB13C" >> ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


echo "===MOVING CONFIG FILES==="
mkdir ~/Pictures/ascii ~/Pictures/logos ~/Pictures/wallpapers ~/Music/sounds
[ ! -d ~/.config/neofetch ] && mkdir ~/.config/neofetch
[ ! -d ~/.config/kitty ] && mkdir ~/.config/kitty

cp ~/configs/vim/.vimrc ~/
cp ~/configs/zsh/.* ~/

cp ~/configs/neofetch/config.default ~/configs/neofetch/config.conf ~/.config/neofetch
cp ~/configs/neofetch/neofetch_ascii.txt ~/Pictures/ascii/
cp ~/configs/neofetch/neofetch_png.png ~/Pictures/logos/

cp ~/configs/kitty/kitty.conf ~/.config/kitty/
cp ~/configs/kitty/window_logo_path.png ~/Pictures/logos/tux.png
cp ~/configs/kitty/background_image.png ~/Pictures/wallpapers/parrot_right.png
cp ~/configs/kitty/bell_bong.wav ~/Music/sounds/

sudo cp ~/configs/sysctl/99-settings.conf /etc/sysctl.d/


echo "===INSTALLING VIM-PLUG==="
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PlugInstall'


echo "===SETTING GNOME==="
[ ! -d ~/.icons ] && mkdir ~/.icons
[ ! -d ~/.fonts ] && mkdir ~/.fonts
mkdir -p ~/.themes/CustomShell

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

CUSTOM0="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['$CUSTOM0']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CUSTOM0 name 'terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CUSTOM0 command 'kitty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CUSTOM0 binding '<Ctrl><Alt>t'

gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power idle-brightness 100

gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Ctrl><Alt>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>tab']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Control>BackSpace']"
gsettings set org.gnome.desktop.wm.keybindings begin-move "['<Control>Down']"

gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'pl')]"

gsettings set org.gnome.desktop.interface clock-format '24h'

gsettings set org.gnome.desktop.background show-desktop-icons true
gsettings set org.gnome.desktop.background picture-uri-dark file://$HOME/Pictures/wallpapers/arch_logo.jpeg


echo "===GNOME EXTENSIONS==="
gsettings set org.gnome.shell enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.github.com', 'dash-to-dock@micxgx.gmail.com']"

# dash-to-dock
git clone https://github.com/micheleg/dash-to-dock

cd dash-to-dock
make && make install
cd ..

rm -rf dash-to-dock

# user-theme
gsettings set org.gnome.shell.extensions.user-theme name 'CustomShell'


echo "===OTHER CONFIGURATIONS ==="
# VSCODIUM
if [ $(command -v "codium") ]; then
	echo "=vscodium="

	while read ext; do
                codium --install-extension $ext
        done < ~/configs/vscodium/vscextensions.txt

	cp ~/configs/vscodium/keybindings.json ~/configs/vscodium/settings.json ~/.config/VSCodium/User
fi


# QEMU
if [ $(command -v libvirtd) ]; then
	echo "=libvirt="
	
	sudo usermod -aG libvirt $USER
	sudo sed -Ei '/#unix_sock_(group|ro_perms|rw_perms) =/ s/#//' /etc/libvirt/libvirtd.conf
fi


# STEAM
if [ $(command -v steam) ]; then
	echo "=steam="

	$(which steam) &> /dev/null

	echo "@nClientDownloadEnableHTTP2PlatformLinux 0
	@fDownloadRateImprovementToAddAnotherConnection 1.0" >> ~/.steam/steam/steam_dev.cfg
fi


# SSH
if [ $(command -v ssh) ]; then
	echo "=ssh="
	sudo sed -Ei '/#(PermitRoot|PasswordAuth)/ {s/#//; s/yes/no}' /etc/ssh/sshd_config
	ssh-keygen -t rsa -b 4096
fi


# WIRESHARK
if [ $(command -v wireshark) ]; then
	sudo usermod -aG wireshark $USER	
fi


# HOSTS
echo "=hosts="
sudo sh -c 'echo "127.0.0.1 localhost" >> /etc/hosts'
sudo sed -i '/#DNSStubListener=/ {s/#//; s/yes/no/}' /etc/systemd/resolved.conf


# GRUB
echo "=grub="
sudo grub-mkconfig -o /boot/grub/grub.cfg


# ZSH
echo "===SETTING ZSH SHELL==="
chsh -s $(which zsh)


echo "DONE. YOU SHOULD REBOOT NOW"
