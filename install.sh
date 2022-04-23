#!/bin/bash
echo "Installing dependencies"
yay -S 'sxhkd' 'alacritty' 'rofi' 'polybar' 'dunst' 'maim' 'xclip' 'viewnior' 'feh' 'ksuperkey' 'betterlockscreen' 'picom-ibhagwan-git' 'xfce-polkit' 'xfce4-power-manager''xsettingsd''xorg-xsetroot' 'wmname' 'lunarvim-git' 'git' 'bspwm' 'wpgtk'
cd $HOME
git clone https://github.com/PoSayDone/.dotfiles_new.git tmpdotfiles
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
