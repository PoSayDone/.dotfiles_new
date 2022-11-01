#!/bin/bash
DIR=$HOME/.config/bspwm
CONFIG_DIR=$HOME/.config/

echo "Installing dependencies"
yay -S --noconfirm 'sxhkd' 'alacritty' 'rofi' 'polybar' 'dunst' 'nerd-fonts-jetbrains-mono'\
  'maim' 'xclip' 'viewnior' 'feh' 'ksuperkey' 'betterlockscreen'\
  'picom-animations-git' 'xfce-polkit' 'xfce4-power-manager'\
  'xsettingsd' 'xorg-xsetroot' 'wmname' 'git' 'bspwm' 'wpgtk'\
  'zathura' 'zathura-pdf-mupdf' 'pywal-discord-git' 'bpytop'\
  'neovim' 'qutebrowser' 'apple-fonts' 'nerd-fonts-complete'\
  'qt5-styleplugins' 'lutris' 'kotatogram-dekstop' 'discord'\
  'betterdiscordctl' 'steam' 'dash' 'eww' 'networkmanager-dmenu-git'
yay --sync --noconfirm base-devel rustup python python-pip \
  dunst bspwm gobject-introspection imagemagick \
  mpd mpc playerctl pamixer rofi redshift zsh jq todo-bin --needed
BACK_PID=$!
wait $BACK_PID

echo "Cloning dotfiles"
cd $HOME
git clone https://github.com/PoSayDone/.dotfiles_new.git
rm -rf $DIR $CONFIG_DIR/wpg $CONFIG_DIR/sxhkd $CONFIG_DIR/ranger $CONFIG_DIR/qt5ct $CONFIG_DIR/gtk-3.0 $HOME/.Xresources
cd .dotfiles_new
cp files/.Xresources files/.xsettingsd $HOME
ln -sf $HOME/.dotfiles_new/files/ $DIR
cd $DIR/
ln -sf $DIR/wpg $CONFIG_DIR/
wpg-install.sh -g

ln -sf $DIR/Scripts $HOME/
ln -sf $DIR/sxhkd $CONFIG_DIR/
ln -sf $DIR/eww $CONFIG_DIR/
ln -sf $DIR/lf $CONFIG_DIR/
ln -sf $DIR/ranger $CONFIG_DIR/
ln -sf $DIR/qt5ct $CONFIG_DIR/
ln -sf $DIR/gtk-3.0 $CONFIG_DIR/
ln -sf $DIR/betterlockscreenrc $CONFIG_DIR/
ln -sf $DIR/networkmanager-dmenu $CONFIG_DIR/
mkdir $HOME/.fonts
cp $HOME/.dotfiles_new/files/fonts/* $HOME/.fonts
fc-cache -r

ln -sf $HOME/.dotfiles_new/files/applications/* $HOME/.local/share/applications

cp $HOME/.dotfiles_new/files/.zshenv $HOME/

#Zathura
git clone https://github.com/mlscarlson/zathura-pywal/
cd zathura-pywal
sudo make install
cd ..
rm -rf zathura-pywal

#Firefox theme
curl -fsSL https://raw.githubusercontent.com/manilarome/blurredfox/master/install.sh | bash -s -- stable
echo "Please, specify your path to colors.css in ~/.mozilla/firefox/...default-release/chrome/colores/blurred.css"

#NvChad installation
git clone https://github.com/NvChad/NvChad $HOME/config/nvim --depth 1
ln -sf $HOME/.dotfiles_new/files/nvchad/custom $CONFIG_DIR/nvim/lua/

#qutebrowser pywal theme installation
git clone https://github.com/makman12/pywalQute.git $CONFIG_DIR/qutebrowser/pywalQute/
ln -sf $HOME/.dotfiles_new/files/qutebrowser/config.py $CONFIG_DIR/qutebrowser/

wpg -ns 13.jpg
