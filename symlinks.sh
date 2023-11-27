#!/bin/bash

HERE=$(pwd)

[ -r ~/.gitconfig           ] && rm -f ~/.gitconfig
[ -r ~/.zshrc               ] && rm -f ~/.zshrc
[ -r ~/.ocamlinit           ] && rm -f ~/.ocamlinit
[ -r ~/.lambda-term-inputrc ] && rm -f ~/.lambda-term-inputrc

ln -s $HERE/git/config                ~/.gitconfig
ln -s $HERE/shell/zshrc               ~/.zshrc
ln -s $HERE/ocaml/ocamlinit           ~/.ocamlinit
ln -s $HERE/ocaml/lambda-term-inputrc ~/.lambda-term-inputrc

[ -r ~/.config/kitty            ] && rm -rf ~/.config/kitty
[ -r ~/.config/nvim             ] && rm -rf ~/.config/nvim
[ -r ~/.config/xmonad           ] && rm -rf ~/.config/xmonad
[ -r ~/.config/utop             ] && rm -rf ~/.config/utop
[ -r ~/.config/dunst            ] && rm -rf ~/.config/dunst
[ -r ~/.config/betterlockscreen ] && rm -rf ~/.config/betterlockscreen
[ -r ~/.wallpaper               ] && rm -rf ~/.wallpaper

ln -s $HERE/nvim             ~/.config/nvim
ln -s $HERE/xmonad           ~/.config/xmonad
ln -s $HERE/ocaml/utop       ~/.config/utop
ln -s $HERE/kitty            ~/.config/kitty
ln -s $HERE/dunst            ~/.config/dunst
ln -s $HERE/wallpaper        ~/.wallpaper
ln -s $HERE/betterlockscreen ~/.config/betterlockscreen

ln -s $HERE/kitty/themes/gruvbox.conf $HERE/kitty/theme.conf
