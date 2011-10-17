import XMonad
import XMonad.Config.Gnome
import XMonad.Config.Azerty
import qualified Data.Map as M

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
  focusFollowsMouse = config_focusFollowsMouse
}
