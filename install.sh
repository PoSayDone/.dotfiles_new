#!/bin/bash
DIR=$HOME/.config/bspwm
CONFIG_DIR=$HOME/.config/
bold=$(tput bold)
normal=$(tput sgr0)

clear

#Dependencies
echo -e "\e[1;31m${bold}Installing dependencies${normal}\e[0m"
yay -Syu --noconfirm 'sxhkd' 'rofi' 'dunst' 'alsa-utils' 'spotifywm-git'\
  'nerd-fonts-jetbrains-mono' 'maim' 'xclip' 'viewnior' 'feh'\
  'ksuperkey' 'betterlockscreen' 'xfce-polkit' 'xfce4-power-manager'\
  'xsettingsd' 'xorg-xsetroot' 'wmname' 'git' 'bspwm' 'wpgtk'\
  'zathura' 'zathura-pdf-mupdf' 'pywal-discord-git' 'bpytop'\
  'neovim' 'qutebrowser' 'apple-fonts' 'nerd-fonts-complete'\
  'qt5-styleplugins' 'lutris' 'kotatogram-dekstop' 'discord'\
  'betterdiscordctl' 'steam' 'dash' 'eww' 'networkmanager-dmenu-git' \
  'base-devel' 'rustup' 'python' 'python-pip' 'lf' 'archivemount-git'\
  'gobject-introspection' 'imagemagick' 'zsh' 'jq' 'poetry' 'xdo'\
  'mpd' 'mpc' 'playerctl' 'pamixer' 'redshift' 'spicetify-cli' --needed
BACK_PID=$!
wait $BACK_PID
clear

#Picom
echo -e "\e[1;31m${bold}Installing Picom${normal}\e[0m"
git clone https://github.com/FT-Labs/picom $DIR/picom
cd $DIR/picom
meson --buildtype=release . build
sudo ninja -C build install
cd ..
rm -rf picom
clear

#Cloning dots
echo -e "\e[1;31m${bold}Cloning dotfiles${normal}\e[0m"
cd $HOME
git clone https://github.com/PoSayDone/.dotfiles_new.git
rm -rf $DIR $CONFIG_DIR/wpg $CONFIG_DIR/sxhkd $CONFIG_DIR/lf $CONFIG_DIR/qt5ct $CONFIG_DIR/gtk-3.0 $HOME/.Xresources $HOME/.xsettingsd $CONFIG_DIR/wpg $HOME/.zshenv $CONFIG_DIR/dunst $CONFIG_DIR/networkmanager-dmenu
cd .dotfiles_new
ln -sf $HOME/.dotfiles_new/files/ $DIR
cd $DIR/
ln -sf $DIR/wpg $CONFIG_DIR/
bash /usr/bin/wpg-install.sh -g
clear

#Symlinks
echo -e "\e[1;31m${bold}Symlinking dotfiles${normal}\e[0m"
ln -sf $DIR/.zshenv $HOME/
ln -sf $DIR/.Xresources $HOME
ln -sf $DIR/.xsettingsd $HOME
ln -sf $DIR/Scripts $HOME/
ln -sf $DIR/sxhkd $CONFIG_DIR/
ln -sf $DIR/eww $CONFIG_DIR/
ln -sf $DIR/lf $CONFIG_DIR/
ln -sf $DIR/dunst $CONFIG_DIR/
ln -sf $DIR/qt5ct $CONFIG_DIR/
ln -sf $DIR/gtk-3.0 $CONFIG_DIR/
ln -sf $DIR/betterlockscreenrc $CONFIG_DIR/
ln -sf $DIR/discord/* $CONFIG_DIR/BetterDicord/themes/
ln -sf $DIR/networkmanager-dmenu $CONFIG_DIR/
clear



#Fonts
echo -e "\e[1;31m${bold}Coping fonts${normal}\e[0m"
mkdir $HOME/.fonts
cp $HOME/.dotfiles_new/files/fonts/* $HOME/.fonts
fc-cache -r
clear

#Lf, nvim shortcuts
echo -e "\e[1;31m${bold}Creating apps shortcuts${normal}\e[0m"
sudo ln -sf $DIR/Scripts/lf-archivemount /usr/local/bin/
sudo ln -sf $DIR/Scripts/spicetifyreload /usr/local/bin/
ln -sf $HOME/.dotfiles_new/files/applications/* $HOME/.local/share/applications
clear

#Suckless Terminal
echo -e "\e[1;31m${bold}Installing Suckless Terminal${normal}\e[0m"
git clone https://github.com/siduck/st/
cd st
sudo make install
cd ..
rm -rf st
clear

#Zathura
echo -e "\e[1;31m${bold}Installing zathura-pywal${normal}\e[0m"
git clone https://github.com/mlscarlson/zathura-pywal/
cd zathura-pywal
sudo make install
cd ..
rm -rf zathura-pywal
clear

#NvChad installation
echo -e "\e[1;31m${bold}Installing nvchad${normal}\e[0m"
git clone https://github.com/NvChad/NvChad $CONFIG_DIR/nvim --depth 1
ln -sf $HOME/.dotfiles_new/files/nvchad/custom $CONFIG_DIR/nvim/lua/
clear

#qutebrowser pywal theme installation
echo -e "\e[1;31m${bold}Installing pywal theme for qutebrowser${normal}\e[0m"
git clone https://github.com/makman12/pywalQute.git $CONFIG_DIR/qutebrowser/pywalQute/
ln -sf $HOME/.dotfiles_new/files/qutebrowser/config.py $CONFIG_DIR/qutebrowser/
clear

#Python lib for colors in player
echo -e "\e[1;31m${bold}Installing Material You Python library${normal}\e[0m"
git clone https://github.com/avanishsubbiah/material-color-utilities-python
cd material-color-utilities-python
sed -i '/\[tool\.poetry\.dependencies\]/a python="^3.7"' pyproject.toml
poetry build
poetry install
cd ..
rm -rf material-color-utilities-python
clear

#Spicetify
echo -e "\e[1;31m${bold}Configuring spicetify${normal}\e[0m"
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify backup apply enable-devtools
ln -sf $DIR/spicetify/ziro $CONFIG_DIR/spicetify/Themes/
spicetify config current_theme ziro
spicetify apply
clear

#BetterDicord
echo -e "\e[1;31m${bold}Installing BetterDicord${normal}\e[0m"
betterdiscordctl install
clear

#Shell
echo -e "\e[1;31m${bold}Changing shell${normal}\e[0m"
chsh -s $(which zsh)
clear

#wpgtk
echo -e "\e[1;31m${bold}Setting wallpaper and theme${normal}\e[0m"
wpg -ns 63.jpg
clear
