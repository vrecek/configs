### Config files for the:
- kitty terminal<br>
- neofetch<br>
- zsh<br>
- vim<br>
- sysctl params

### Also contains utils:
- scss config<br>
- typescript class for web dev

### GNOME setup
GNOME setup for Arch Linux, just run `./standard-setup.sh` after CLEAN Arch installation<br>
May prompt for several things:<br>
sudo      -> password<br>
man       -> 1 (man-db)<br>
jack      -> 2 (pipewire-jack)<br>
pacman    -> y<br>
steam     -> video driver<br>
oh-my-zsh -> n<br>
oh-my-zsh -> ^D<br>
vim       -> :q :q<br>
ssh       -> keygen

#### Recomended after GNOME setup:
- extensions: AATWS, AppIndicator and KStatusNotifierItem Support, Blur my Shell, Dash to Dock, Desktop Icons NG (DING), Open Bar<br>
- customize SSH port<br>
- customize enabled/disabled services. Check "ENABLING SERVICES" in `standard_setup.sh`<br>
- customize autostart (/etc/xdg/autostart)<br>
- change power saving settings (power-settings-daemon)
