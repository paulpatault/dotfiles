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

[ -r ~/.config/kitty  ] && rm -rf ~/.config/kitty
[ -r ~/.config/nvim   ] && rm -rf ~/.config/nvim
[ -r ~/.config/xmonad ] && rm -rf ~/.config/xmonad
[ -r ~/.config/utop   ] && rm -rf ~/.config/utop

ln -s $HERE/kitty      ~/.config/kitty
ln -s $HERE/nvim       ~/.config/nvim
ln -s $HERE/xmonad     ~/.config/xmonad
ln -s $HERE/ocaml/utop ~/.config/utop


# add, ... OMZ
