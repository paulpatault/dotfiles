-------------------------------------------------------------------------------

-- xmonad
import XMonad
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Ungrab
import XMonad.Util.SpawnOnce
import XMonad.Layout.ThreeColumns
import XMonad.Layout.SimplestFloat

-- kde
import XMonad.Config.Kde
import qualified XMonad.StackSet as W

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

-- myConfig = kde4Config {
myConfig = def {
      modMask            = mod4Mask,
      startupHook        = myStartupHook,
      -- manageHook         = manageHook kde4Config <+> myManageHook,
      layoutHook         = myLayout,
      normalBorderColor  = dark0_hard,
      terminal           = "kitty",
      focusedBorderColor = bright_orange
    }
    `additionalKeysP` myKeys

myKeys =
    [ ("M-S-l", spawn "betterlockscreen -l")
    , ("M-S-x", spawn "bash $HOME/git/scripts/monitor_on_boot")
    , ("M-S-t n", spawn "dunstctl set-paused toggle")
    , ("M-p"  , spawn "dmenu_run -fn 'FiraCode-16'")
    , ("<Print>", unGrab *> spawn "scrot -s")
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
  spawnOnce "trayer --edge top --align right --SetDockType true \
            \--SetPartialStrut true --expand true --width 4 \
            \--transparent true --tint 0x504945 --height 32"
  -- spawnOnce "nm-applet"                                                         -- network manager
  spawnOnce "setxkbmap -layout us -option 'compose:caps'"                       -- us layout with caps as compose key
  spawnOnce "xset r rate 200 50"                                                -- delay rate
  spawnOnce "xfce4-power-manager"                                               -- power management
  spawnOnce "udiskie"                                                           -- external media handler
  spawnOnce "bash $HOME/git/scripts/monitor_on_boot"                            -- xrandr config

{- myManageHook = composeAll . concat $
    [ [ className   =? c --> doFloat           | c <- myFloats]
    , [ title       =? t --> doFloat           | t <- myOtherFloats]
    , [ className   =? c --> doF (W.shift "2") | c <- webApps]
    , [ className   =? c --> doF (W.shift "3") | c <- ircApps]
    ]
  where myFloats      = ["MPlayer", "Gimp"]
        myOtherFloats = ["alsamixer"]
        webApps       = ["Firefox-bin", "Opera"] -- open on desktop 2
        ircApps       = ["Ksirc"]                -- open on desktop 3 -}

-------------------------------------------------------------------------------

myXmobar =
  withEasySB
    (statusBarProp cmd (pure myXmobarPP)) toggleStrutsKey
  where
    cmd = "xmobar $HOME/.config/xmonad/xmobarrc"
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
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor bright_purple ""
    blue     = xmobarColor bright_blue ""
    aqua     = xmobarColor bright_aqua ""
    aquan    = xmobarColor neutral_aqua ""
    white    = xmobarColor light1 ""
    yellow   = xmobarColor bright_yellow ""
    red      = xmobarColor bright_red ""
    lowWhite = xmobarColor dark4 ""

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
