import XMonad
import XMonad.Config.Gnome
import XMonad.Config.Azerty
import qualified Data.Map as M
import XMonad.Layout.Gaps
import XMonad.Config.Desktop (desktopLayoutModifiers)

-- Declare config preferences
config_terminal = "gnome-terminal" -- Default terminal to run
config_focusFollowsMouse :: Bool -- Have focus not follow mouse
config_focusFollowsMouse = False
 
-- Run xmonad with the specified configuration
main = xmonad myConfig

-- Use the gnomeConfig, but change a couple things
myConfig = gnomeConfig {
  keys = \c -> azertyKeys c `M.union` keys gnomeConfig c,
  terminal = config_terminal,
  layoutHook = myLayouts, 
  manageHook = myManageHook,
  focusFollowsMouse = config_focusFollowsMouse
}

myManageHook = composeAll (
    [ manageHook gnomeConfig
    , className =? "Unity-2d-panel"    --> doIgnore
    , className =? "Unity-2d-launcher" --> doIgnore
    ])

myLayouts = gaps [(U, 24)] $
    desktopLayoutModifiers (Tall 1 0.03 0.5 ||| Full ||| Mirror (Tall 1 (3/100) (1/2)))
