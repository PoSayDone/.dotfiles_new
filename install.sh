#!/bin/bash
echo "Installing dependencies"
yay -S --noconfirm 'sxhkd' 'alacritty' 'rofi' 'polybar' 'dunst' 'maim' 'xclip' 'viewnior' 'feh' 'ksuperkey' 'betterlockscreen' 'picom-jonaburg-fix' 'xfce-polkit' 'xfce4-power-manager''xsettingsd''xorg-xsetroot' 'wmname' 'git' 'bspwm' 'wpgtk' 'zathura' 'zathura-pdf-mupdf' 'pywal-discord-git' 'bpytop' 'nvim' 'qutebrowser'&
BACK_PID=$!
wait $BACK_PID

echo "Cloning dotfiles"
cd $HOME
git clone https://github.com/PoSayDone/.dotfiles_new.git tmpdotfiles
rm -rf $HOME/.config/bspwm $HOME/.config/wpg $HOME/.config/sxhkd $HOME/.config/ranger
cd tmpdotfiles
cp files/.Xresources files/.xsettingsd $HOME
cp -r files/ $HOME/.config/bspwm
cd $HOME/.config/bspwm/
ln -sf $HOME/.config/bspwm/wpg $HOME/.config/
wpg-install.sh -g
ln -sf $HOME/.config/bspwm/sxhkd $HOME/.config/
ln -sf $HOME/.config/bspwm/ranger $HOME/.config/
mkdir $HOME/.fonts
cp fonts/* $HOME/.fonts
fc-cache -r
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

git clone https://github.com/NvChad/NvChad $HOME/config/nvim --depth 1
ln -sf $HOME/tmpdotfiles/files/nvchad/custom $HOME/.config/nvim/lua/

git clone https://github.com/makman12/pywalQute.git $HOME/.config/qutebrowser/pywalQute/
ln -sf $HOME/tmpdotfiles/files/qutebrowser/config.py $HOME/.config/qutebrowser/

rm -rf $HOME/tmpdotfiles
wpg -ns 18.jpg
