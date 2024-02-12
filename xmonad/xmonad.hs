-------------------------------------------------------------------------------

import qualified System.FilePath.Posix as FP

-- xmonad
import XMonad
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Ungrab
import XMonad.Util.SpawnOnce
import XMonad.Layout.ThreeColumns
import XMonad.Layout.SimplestFloat

import System.Exit (exitSuccess)

-- xmobar
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Util.Loggers

-------------------------------------------------------------------------------

main :: IO ()
main = do
    xmonad
    . myXmobar
    $ myConfig

-------------------------------------------------------------------------------

myConfig = def {
      modMask            = mod4Mask,
      startupHook        = myStartupHook,
      layoutHook         = myLayout,
      normalBorderColor  = dark0_hard,
      terminal           = "kitty",
      focusedBorderColor = if dark then bright_orange else faded_orange
    }
    `additionalKeysP` myKeys

myKeys =
    [ ("M-S-l", spawn "i3lock --color 62693e")
    , ("M-S-x", spawn "/bin/zsh $HOME/git/scripts/monitor_on_boot")
    , ("M-S-t n", spawn "dunstctl set-paused toggle")
    , ("M-p"  , spawn "dmenu_run -fn 'FiraCode-8'")
    , ("M-S-p", spawn "bash $HOME/git/scripts/i3lock.sh")
    , ("<Print>", unGrab *> spawn "flameshot gui")
    , ("<XF86AudioPlay>", unGrab *> spawn "flameshot gui")
    , ("<XF86MonBrightnessDown>", spawn "bash $HOME/git/scripts/changeLux - 2")
    , ("<XF86MonBrightnessUp>"  , spawn "bash $HOME/git/scripts/changeLux + 2")
    , ("<XF86AudioRaiseVolume>" , spawn "bash $HOME/git/scripts/changeVolume 1%+")
    , ("<XF86AudioLowerVolume>" , spawn "bash $HOME/git/scripts/changeVolume 1%-")
    , ("<XF86AudioMute>"        , spawn "bash $HOME/git/scripts/changeVolume toggle")
    ]

myLayout = tiled ||| threecol ||| Full ||| simplestFloat
  where
     tiled    = Tall nmaster delta ratio
     threecol = ThreeColMid nmaster delta ratio
     nmaster  = 1
     ratio    = 1/2
     delta    = 3/100

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "bash $HOME/git/scripts/keyboard_config"                            -- keymaps
  spawnOnce "feh --bg-fill --no-fehbg ~/.wallpaper/Hopper-Gas-1940.png"         -- wallpaper
  spawnOnce "xfce4-power-manager"                                               -- power management
  spawnOnce "udiskie"                                                           -- external media handler
  spawnOnce "dunst"                                                             -- notification manager
  spawnOnce "bash $HOME/git/scripts/monitor_on_boot"                            -- xrandr config

-------------------------------------------------------------------------------

dark = True

myXmobar =
  withEasySB
    (statusBarProp cmd (pure myXmobarPP)) toggleStrutsKey
  where
    cmd = if dark then "xmobar $HOME/.config/xmonad/xmobarrc"
                  else "xmobar $HOME/.config/xmonad/xmobarrc-light"
    toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
    toggleStrutsKey XConfig{ modMask = m } = (m, xK_b)

myXmobarPP :: PP
myXmobarPP = def
    { ppCurrent         = magenta . wrap "[" "]"
    , ppVisible         = blue . wrap "`" "`"
    , ppHidden          = white . wrap "" ""
    , ppHiddenNoWindows = const ""
    , ppTitleSanitize   = xmobarStrip
    , ppSep             = magenta " • "
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "`") (lowWhite "`") . blue    . ppWindow

    ppWindow :: String -> String
    ppWindow = xmobarRaw . shorten 30 . (\w ->
        if null w
        then "untitled"
        else if FP.isValid w then FP.takeFileName w
        else w) . trim

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = if dark then xmobarColor bright_purple ""
                       else xmobarColor faded_purple ""
    blue     = if dark then xmobarColor bright_blue ""
                       else xmobarColor faded_blue ""
    aqua     = if dark then xmobarColor bright_aqua ""
                       else xmobarColor faded_aqua ""
    yellow   = if dark then xmobarColor bright_yellow ""
                       else xmobarColor faded_yellow ""
    red      = if dark then xmobarColor bright_red ""
                       else xmobarColor faded_red ""
    aquan    = xmobarColor neutral_aqua ""
    white    = if dark then xmobarColor light1 ""
                       else xmobarColor dark4 ""
    lowWhite = if dark then xmobarColor dark4 ""
                       else xmobarColor light1 ""

-------------------------------------------------------------------------------

dark0_hard       = "#1d2021"
dark0            = "#282828"
dark0_soft       = "#32302f"
dark1            = "#3c3836"
dark2            = "#504945"
dark3            = "#665c54"
dark4            = "#7c6f64"
light0_hard      = "#f9f5d7"
light0           = "#fbf1c7"
light0_soft      = "#f2e5bc"
light1           = "#ebdbb2"
light2           = "#d5c4a1"
light3           = "#bdae93"
light4           = "#a89984"
bright_red       = "#fb4934"
bright_green     = "#b8bb26"
bright_yellow    = "#fabd2f"
bright_blue      = "#83a598"
bright_purple    = "#d3869b"
bright_aqua      = "#8ec07c"
bright_orange    = "#fe8019"
neutral_red      = "#cc241d"
neutral_green    = "#98971a"
neutral_yellow   = "#d79921"
neutral_blue     = "#458588"
neutral_purple   = "#b16286"
neutral_aqua     = "#689d6a"
neutral_orange   = "#d65d0e"
faded_red        = "#9d0006"
faded_green      = "#79740e"
faded_yellow     = "#b57614"
faded_blue       = "#076678"
faded_purple     = "#8f3f71"
faded_aqua       = "#427b58"
faded_orange     = "#af3a03"
dark_red_hard    = "#792329"
dark_red         = "#722529"
dark_red_soft    = "#7b2c2f"
light_red_hard   = "#fc9690"
light_red        = "#fc9487"
light_red_soft   = "#f78b7f"
dark_green_hard  = "#5a633a"
dark_green       = "#62693e"
dark_green_soft  = "#686d43"
light_green_hard = "#d3d6a5"
light_green      = "#d5d39b"
light_green_soft = "#cecb94"
dark_aqua_hard   = "#3e4934"
dark_aqua        = "#49503b"
dark_aqua_soft   = "#525742"
light_aqua_hard  = "#e6e9c1"
light_aqua       = "#e8e5b5"
light_aqua_soft  = "#e1dbac"
gray             = "#928374"
