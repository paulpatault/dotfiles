#!/bin/bash


THE_PATH=$HOME/git

# rm -f ~/.gitconfig
# rm -f ~/.zshrc
# rm -f ~/.ocamlinit
# rm -f ~/.lambda-term-inputrc
# rm -f ~/.Xresources
# rm -f ~/.xinitrc

ln -sf $THE_PATH/git/config                ~/.gitconfig
ln -sf $THE_PATH/shell/zshrc               ~/.zshrc
ln -sf $THE_PATH/ocaml/ocamlinit           ~/.ocamlinit
ln -sf $THE_PATH/ocaml/lambda-term-inputrc ~/.lambda-term-inputrc
ln -sf $THE_PATH/git/config/x/.Xresources  ~/.Xresources
ln -sf $THE_PATH/git/config/x/.xinitrc     ~/.xinitrc

# rm -rf ~/.config/kitty
# rm -rf ~/.config/nvim
# rm -rf ~/.config/xmonad
# rm -rf ~/.config/utop
# rm -rf ~/.config/dunst
# rm -rf ~/.config/betterlockscreen
# rm -rf ~/.wallpaper

ln -sf $THE_PATH/nvim             ~/.config/nvim
ln -sf $THE_PATH/xfce4            ~/.config/xfce4
ln -sf $THE_PATH/xmonad           ~/.config/xmonad
ln -sf $THE_PATH/ocaml/utop       ~/.config/utop
ln -sf $THE_PATH/kitty            ~/.config/kitty
ln -sf $THE_PATH/dunst            ~/.config/dunst
ln -sf $THE_PATH/wallpaper        ~/.wallpaper
ln -sf $THE_PATH/cups             ~/.cups


sudo ln -sf ~/git/config/screen_lock@.service /etc/systemd/system 

ln -s $THE_PATH/kitty/themes/gruvbox.conf $THE_PATH/kitty/theme.conf


ln -s $THE_PATH/firefox-about-config/chrome -> .mozilla/firefox/….default/
