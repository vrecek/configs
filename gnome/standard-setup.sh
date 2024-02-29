echo "===DOWNLOADING PACKAGES==="
sudo pacman -S gnome-shell gdm gnome-control-center gnome-tweaks gnome-shell-extensions gnome-browser-connector gnome-keyring kitty git xdg-user-dirs nemo sxiv vlc keepassxc libreoffice-still qbittorrent noto-fonts noto-fonts-cjk noto-fonts-emoji evince lshw inkscape jdk-openjdk gedit dnsmasq imagemagick python-pip pipewire pipewire-alsa pipewire-pulse wireplumber wget

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

echo "===ENABLING GDM==="
sudo systemctl enable gdm

echo "DONE. YOU SHOULD REBOOT NOW"
