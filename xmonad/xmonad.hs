import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.SpawnOnce
import XMonad.Util.Loggers
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP


main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . myXmobar
     $ myConfig

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8ec07c" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#d3869b" ""
    blue     = xmobarColor "#83a598" ""
    white    = xmobarColor "#fbf1c7" ""
    yellow   = xmobarColor "#fabd2f" ""
    red      = xmobarColor "#fb4934" ""
    lowWhite = xmobarColor "#a89984" ""


myXmobar =
    withEasySB
      (statusBarProp "xmobar ~/.config/xmonad/xmobarrc" (pure myXmobarPP))
      defToggleStrutsKey

myConfig = def
    { modMask = mod1Mask  -- Left Alt
    , startupHook = myStartupHook
    }
    `additionalKeysP`
      [ ("M-S-z", spawn "dm-tool lock")
      , ("M-S-r", spawn "sudo service lightdm restart")
      , ("M-C-s", unGrab *> spawn "scrot -s")
      , ("M-C-p", spawn "rofi -show run")
      , ("M-f"  , spawn "firefox")
      , ("<XF86MonBrightnessDown>", spawn "lux -s 2%")
      , ("<XF86MonBrightnessUp>"  , spawn "lux -a 2%")
      , ("<XF86AudioRaiseVolume>" , spawn "pactl set-sink-volume @DEFAULT_SINK@ +1%")
      , ("<XF86AudiolowerVolume>" , spawn "pactl set-sink-volume @DEFAULT_SINK@ -1%")
      ]

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "trayer --edge top --align right --SetDockType true \
            \--SetPartialStrut true --expand true --width 10 \
            \--transparent false --tint 0x504945 --height 32"
  spawnOnce "nm-applet"
  spawnOnce "xrandr --output DP-4-2 --scale 1.5x1.5 --pos 0x0"
  spawnOnce "xrandr --output eDP-1  --scale 1.5x1.5 --pos 5120x0"
  spawnOnce "setxkbmap -layout us -option 'compose:caps'"
  spawnOnce "xset r rate 200 50" -- delay rate
  spawnOnce "feh --bg-fill --no-fehbg ~/.wallpaper/ubuntu-default-greyscale-wallpaper.png"
  spawnOnce "officeconfig"
