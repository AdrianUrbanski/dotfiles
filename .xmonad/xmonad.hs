import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Paste
import XMonad.Config.Desktop
import Graphics.X11.ExtraTypes.XF86

main = do 
	xmproc <- spawnPipe "xmobar"
	xmonad $ ewmh $ docks def
		{ terminal	= myTerminal
		, modMask	= myModMask
		, borderWidth 	= myBorderWidth
		, workspaces	= myWorkspaces

		, focusedBorderColor = "#ff6680"

		-- docks management
		, layoutHook	= avoidStruts $ layoutHook defaultConfig
		, manageHook	= manageHook def <+> manageDocks
		, logHook 	= dynamicLogWithPP xmobarPP
			{ ppOutput	 = hPutStrLn xmproc
			, ppTitle	 = xmobarColor "#69e1d3" "" . shorten 50
			}

		-- fullscreen windows handling
		, handleEventHook = ewmhDesktopsEventHook <+> fullscreenEventHook

		} `additionalKeys`
		[ ((myModMask, xK_t), spawn "brave") -- launch web browser
		, ((0, xK_Insert), pasteSelection) -- X-selection-paste buffer
		, ((0, xK_Print), spawn "maim -s -u | xclip -selection clipboard -t image/png -i")
		, ((0, xF86XK_AudioRaiseVolume), spawn "amixer set Master 5%+")
		, ((0, xF86XK_AudioLowerVolume), spawn "amixer set Master 5%-")
		]

myTerminal = "urxvt"
myModMask = mod4Mask
myBorderWidth = 3
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
