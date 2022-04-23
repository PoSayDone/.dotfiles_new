#!/bin/bash
echo "Installing dependencies"
yay -S 'sxhkd' 'alacritty' 'rofi' 'polybar' 'dunst' 'maim' 'xclip' 'viewnior' 'feh' 'ksuperkey' 'betterlockscreen' 'picom-ibhagwan-git' 'xfce-polkit' 'xfce4-power-manager''xsettingsd''xorg-xsetroot' 'wmname' 'lunarvim-git' 'git' 'bspwm-rounded-corners-git' 'wpgtk'
cd $HOME
git clone https://github.com/PoSayDone/.dotfiles_new.git tmpdotfiles
cd tmpdotfiles
cp files/.Xresources files/.xsettingsd $HOME
cp -r files/ $HOME/.config/bspwm1
cd $HOME/.config/bspwm1/
ln -s wpg $HOME/.config/wpg2
ln -s sxhkd $HOME/.config/sxhkd2
mkdir $HOME/.fonts
cp fonts/* $HOME/.fonts
fc-cache -r
rm -rf $HOME/tmpdotfiles
