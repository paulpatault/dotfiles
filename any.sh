#!/bin/bash

sudo apt update
sudo apt upgrade

[ -d ~/git ] || mkdir ~/git

cd git

git clone https://github.com/paulpatault/dotfiles.git config

# cd ~/git/config/ && source symlinks.sh

cd

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
omz
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# kitty +list-fonts --psnames | grep Fira

# apps
sudo apt install zathura firefox # firefox: log in + goto about:config and set `layout.css.devPixelsPerPx <- 1.5`
sudo apt install fonts-firacode

# TOOLS
sudo apt install fdfind # sudo ln -s /usr/bin/fdfind /usr/bin/fd
sudo apt install bat    # ln -s /usr/bin/batcat ~/.local/bin/bat
sudo apt install exa
sudo apt install fzf
sudo apt install fastfetch
sudo apt install colordiff
sudo apt install xclip
sudo apt install lightdm
sudo apt-get install ripgrep
sudo apt-get install trayer
sudo apt-get install xscreensaver
sudo apt-get install feh
sudo apt-get install nm-applet
# sudo apt install texlive-full
# sudo apt install rofi

# neovim
sudo apt install snapd
sudo snap install nvim --classic
sudo snap install signal-desktop
sudo apt install libx11-dev libxft-dev libxinerama-dev libxrandr-dev libxss-dev

# python
sudo apt install python3-neovim
sudo apt-get install software-properties-common
sudo apt-get install python-dev python-pip python3-dev python3-pip

# opam
bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
opam init
# opam install ocaml-lsp-server

# haskell
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
ghc install cabal

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# latex
cd ~/git
gcl1 git@github.com:latex-lsp/texlab && cd texlab
cargo build --release
cargo install --git https://github.com/latex-lsp/texlab --locked
cd

# sudo dpkg-reconfigure lightdm
#
# Ly DM
# git clone --recurse-submodules https://github.com/fairyglade/ly
# cd ly
# make
# make install installsystemd
# systemctl enable ly.service
# systemctl disable getty@tty2.service

# xmonad
git clone https://github.com/xmonad/xmonad ~/git/config/xmonad/xmonad
git clone https://github.com/xmonad/xmonad ~/git/config/xmonad/xmonad-contrib
git clone https://github.com/xmonad/xmonad-contrib
cabal install --package-env=$HOME/git/config/xmonad --lib base xmonad xmonad-contrib
cabal install --package-env=$HOME/git/config/xmonad xmonad

# sudo apt install dmenu -> from source
cd ~/git
git clone https://git.suckless.org/dmenu && cd dmenu
wget https://tools.suckless.org/dmenu/patches/fuzzymatch/dmenu-fuzzymatch-4.9.diff
git apply dmenu-fuzzymatch-4.9.diff
git apply ~/git/config/dmenu/config.def.h.diff
sudo make install
cd

# betterlockscreen
# sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
cd ~/git
git clone https://github.com/Raymo111/i3lock-color.git && cd i3lock-color && ./install-i3lock-color.sh
wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system latest true
mkdir -p ~/.cache/betterlockscreen/
betterlockscreen -u .wallpaper/pieter_bruegel_the_elder-massacre_of_the_innocents-1567.jpg --fx blur,dim,dimblur --blur 0.7
cd
# cd /tmp
# wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/next/system/betterlockscreen%40.service
# sudo cp betterlockscreen@.service /usr/lib/systemd/system/
# systemctl enable betterlockscreen@$USER
# popd

# dunst
# sudo apt install libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev
# sudo apt install libnotify-dev
sudo apt install dunst

# TODO
# lux : git clone https://github.com/Ventto/lux.git ...
# pacman -S lux
