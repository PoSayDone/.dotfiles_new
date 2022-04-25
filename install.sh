#!/bin/bash
echo "Installing dependencies"
yay -S 'sxhkd' 'alacritty' 'rofi' 'polybar' 'dunst' 'maim' 'xclip' 'viewnior' 'feh' 'ksuperkey' 'betterlockscreen' 'picom-jonaburg-fix' 'xfce-polkit' 'xfce4-power-manager''xsettingsd''xorg-xsetroot' 'wmname' 'lunarvim-git' 'git' 'bspwm' 'wpgtk' 'zathura' 'zathura-pdf-mupdf' 'pywal-discord-git'
cd $HOME
git clone https://github.com/PoSayDone/.dotfiles_new.git tmpdotfiles
rm -rf $HOME/.config/bspwm $HOME/.config/wpg $HOME/.config/sxhkd $HOME/.config/ranger
cd tmpdotfiles
cp files/.Xresources files/.xsettingsd $HOME
cp -r files/ $HOME/.config/bspwm
cd $HOME/.config/bspwm/
ln -sf wpg $HOME/.config/wpg
ln -sf sxhkd $HOME/.config/sxhkd
ln -sf ranger $HOME/.config
mkdir $HOME/.fonts
cp fonts/* $HOME/.fonts
fc-cache -r
rm -rf $HOME/tmpdotfiles
cd $HOME

#Zathura
git clone https://github.com/mlscarlson/zathura-pywal/
cd zathura-pywal
sudo make install
cd ..
rm -rf zathura-pywal

#Firefox theme
curl -fsSL https://raw.githubusercontent.com/manilarome/blurredfox/master/install.sh | bash -s -- stable
echo "Please, specify your path to colors.css in ~/.mozilla/firefox/...default-release/chrome/colores/blurred.css"
