#!/bin/bash
echo "Installing dependencies"
yay -S --noconfirm 'sxhkd' 'alacritty' 'rofi' 'polybar' 'dunst' 'maim' 'xclip' 'viewnior' 'feh' 'ksuperkey' 'betterlockscreen' 'picom-animations-git' 'xfce-polkit' 'xfce4-power-manager' 'xsettingsd' 'xorg-xsetroot' 'wmname' 'git' 'bspwm' 'wpgtk' 'zathura' 'zathura-pdf-mupdf' 'pywal-discord-git' 'bpytop' 'neovim' 'qutebrowser' 'apple-fonts' 'nerd-fonts-complete' 'qt5-styleplugins' 'lutris' 'kotatogram-dekstop-bin' 'discord' 'betterdiscordctl' 'steam' 'dash'
BACK_PID=$!
wait $BACK_PID

echo "Cloning dotfiles"
cd $HOME
git clone https://github.com/PoSayDone/.dotfiles_new.git
rm -rf $HOME/.config/bspwm $HOME/.config/wpg $HOME/.config/sxhkd $HOME/.config/ranger $HOME/.config/qt5ct $HOME/.config/gtk-3.0 $HOME/.Xresources
cd .dotfiles_new
cp files/.Xresources files/.xsettingsd $HOME
ln -sf $HOME/.dotfiles_new/files/ $HOME/.config/bspwm
cd $HOME/.config/bspwm/
ln -sf $HOME/.config/bspwm/wpg $HOME/.config/
wpg-install.sh -g
ln -sf $HOME/.config/bspwm/sxhkd $HOME/.config/
ln -sf $HOME/.config/bspwm/lf $HOME/.config/
ln -sf $HOME/.config/bspwm/ranger $HOME/.config/
ln -sf $HOME/.config/bspwm/qt5ct $HOME/.config/
ln -sf $HOME/.config/bspwm/gtk-3.0 $HOME/.config/
mkdir $HOME/.fonts
cp fonts/* $HOME/.fonts
fc-cache -r
cd $HOME
ln -sf $HOME/.dotfiles_new/files/scripts/autofocus $HOME/Scripts
ln -sf $HOME/.dotfiles_new/files/scripts/st_pad $HOME/Scripts
ln -sf $HOME/.dotfiles_new/files/applications/lf.desktop $HOME/.local/share/applications
ln -sf $HOME/.dotfiles_new/files/applications/nvim.desktop $HOME/.local/share/applications

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
ln -sf $HOME/.dotfiles_new/files/nvchad/custom $HOME/.config/nvim/lua/

git clone https://github.com/makman12/pywalQute.git $HOME/.config/qutebrowser/pywalQute/
ln -sf $HOME/.dotfiles_new/files/qutebrowser/config.py $HOME/.config/qutebrowser/

wpg -ns 13.jpg
