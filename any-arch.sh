#!/bin/bash

[[ -d ~/git ]] || mkdir ~/git

cd git

git clone https://github.com/paulpatault/dotfiles.git config

cd ~/git/config/ && source symlinks.sh


sudo pacman -S ...

# apps
    zathura
    zathura-pdf-mupdf
    firefox
    thunderbird
    gimp
    feh
    kitty

# utilities
    cups
    flameshot
    dunst               #> systemctl --user start dunst.service
    alsa-utils
    sof-firmware
    trayer
    udiskie

# cli tool
    zsh
    git
    fd
    fzf
    ripgrep
    lazygit
    xclip
    tldr
    colordiff
    less
    zip
    unzip
    pandoc
    acpi

    nvim

# WM, DM, ...
    xss-lock
    sddm      # systemctl enable sddm.service
    xmonad
    xmobarr
    greet-d
    # KDE PLASMA

# NVIDIA
    lib32-nvidia-utils
    nvidia
    nvidia-utils

# Intall `yay`

sudo yay -S ...
    envycontrol
        # envycontrol -s hybrid 
        # cat /sys/bus/pci/devices/0000:01:00.0/power_state 
    i3lock-color



cd

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
omz
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# kitty +list-fonts --psnames | grep Fira

# opam
bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
opam init

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# latex
# texlab ? latex full ?

# xmonad
# git clone https://github.com/xmonad/xmonad ~/git/config/xmonad/xmonad
# git clone https://github.com/xmonad/xmonad ~/git/config/xmonad/xmonad-contrib

# dmenu -> from source
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
