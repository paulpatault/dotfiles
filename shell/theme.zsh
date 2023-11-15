
theme_gruvbox_light () {
    rm -f $HOME/.config/kitty/theme.conf
    ln -s $HOME/.config/kitty/themes/gruvbox-light-hard.conf $HOME/.config/kitty/theme.conf
    export THEME_BG="light"
    export COLORSCHEME="gruvbox"

    echo "macos_thicken_font 0.4" > $HOME/.config/kitty/kitty_aux.conf
    echo "export COLORSCHEME=gruvbox" > $HOME/.config/shell/theme_choice.zsh
    echo "export THEME_BG=light" >> $HOME/.config/shell/theme_choice.zsh
}

theme_gruvbox () {
    rm -f $HOME/.config/kitty/theme.conf
    ln -s $HOME/.config/kitty/themes/gruvbox.conf $HOME/.config/kitty/theme.conf
    export THEME_BG="dark"
    export COLORSCHEME="gruvbox"

    echo "" > $HOME/.config/kitty/kitty_aux.conf
    echo "export COLORSCHEME=gruvbox" > $HOME/.config/shell/theme_choice.zsh
    echo "export THEME_BG=dark" >> $HOME/.config/shell/theme_choice.zsh
}

theme_moonbow () {
    rm -f $HOME/.config/kitty/theme.conf
    ln -s $HOME/.config/kitty/themes/moonbow.conf $HOME/.config/kitty/theme.conf
    export THEME_BG="dark"
    export COLORSCHEME="moonbow"

    echo "" > $HOME/.config/kitty/kitty_aux.conf
    echo "export COLORSCHEME=moonbow" > $HOME/.config/shell/theme_choice.zsh
    echo "export THEME_BG=dark" >> $HOME/.config/shell/theme_choice.zsh
}

theme_tokyo_day () {
    rm -f $HOME/.config/kitty/theme.conf
    ln -s $HOME/.config/kitty/themes/tokyo-night-day.conf $HOME/.config/kitty/theme.conf
    export THEME_BG="light"
    export COLORSCHEME="tokyonight-day"

    echo "macos_thicken_font 0.3" > $HOME/.config/kitty/kitty_aux.conf
    echo "export COLORSCHEME=tokyonight-day" > $HOME/.config/shell/theme_choice.zsh
    echo "export THEME_BG=light" >> $HOME/.config/shell/theme_choice.zsh
}

theme_tokyo () {
    rm -f $HOME/.config/kitty/theme.conf
    ln -s $HOME/.config/kitty/themes/tokyo-night.conf $HOME/.config/kitty/theme.conf
    export THEME_BG="dark"
    export COLORSCHEME="tokyonight"

    echo "" > $HOME/.config/kitty/kitty_aux.conf
    echo "export COLORSCHEME=tokyonight" > $HOME/.config/shell/theme_choice.zsh
    echo "export THEME_BG=dark" >> $HOME/.config/shell/theme_choice.zsh
}

theme_github () {
    rm -f $HOME/.config/kitty/theme.conf
    ln -s $HOME/.config/kitty/themes/github-light.conf $HOME/.config/kitty/theme.conf
    export THEME_BG="light"
    export COLORSCHEME="github"

    echo "macos_thicken_font 0.3" > $HOME/.config/kitty/kitty_aux.conf
    echo "export COLORSCHEME=github" > $HOME/.config/shell/theme_choice.zsh
    echo "export THEME_BG=light" >> $HOME/.config/shell/theme_choice.zsh
}

alias github=theme_github
alias gruvbox=theme_gruvbox
alias gruvbox_light=theme_gruvbox_light
alias moonbow=theme_moonbow
alias tokyo=theme_tokyo
alias tokyo_day=theme_tokyo_day

# f1 () {
#     if defaults read -g AppleInterfaceStyle &>/dev/null; then
#         echo "coucou"
#     else
#         echo "coucou2"
#     fi
# }
