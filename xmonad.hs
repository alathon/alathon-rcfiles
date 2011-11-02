import XMonad.Hooks.UrgencyHook
import XMonad hiding ((|||))
import System.Exit
import Data.Ratio ((%))
import qualified XMonad.StackSet as W
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Scratchpad
import XMonad.Layout.NoBorders
import XMonad.Layout.Reflect
import XMonad.Layout.IM
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Grid
import XMonad.Layout.Tabbed
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.PerWorkspace
import System.IO

myManageHook = composeAll
    [ className =? "Gimp" --> doFloat,
      className =? "Vncviewer" --> doFloat,
      className =? "Pidgin" --> doShift "im",
      className =? "Xchat" --> doShift "7",
	  className =? "Skype" --> doShift "7",
      className =? "MPlayer" --> doFloat,
      className =? "xvnc4viewer" --> doFloat,
      className =? "xvncviewer" --> doFloat,
      className =? "vncviewer" --> doFloat,
      className =? "VirtualBox" --> doFloat,
      className =? "war3" --> doFloat,
      className =? "wine" --> doFloat,
      isFullscreen --> doFullFloat
    ]

imLayout = avoidStruts $
	withIM (1%7) (And (ClassName "Pidgin") (Role "buddy_list")) Grid

tabbedLayout = tabbed shrinkText tabbedConf

tabbedConf = defaultTheme { fontName = "xft:Terminus" }

genericLayouts = avoidStruts $
				 smartBorders $
				 toggleLayouts (noBorders Full) $
				 tiled ||| tabbedLayout ||| Mirror tiled ||| (noBorders Full) ||| GridRatio (2/2)
	where
		tiled = Tall 1 (3 / 100) (1 / 2)

myLayouts = onWorkspaces ["im"] imLayout $
			genericLayouts

myWorkspaces = ["1","2","3","4","5","6","7","im","9","0"]

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/alathon/.xmobarrc"
    xmonad $ withUrgencyHook NoUrgencyHook defaultConfig
        { manageHook = manageDocks <+> myManageHook
                                   <+> manageHook defaultConfig
--        , layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig
		, layoutHook = myLayouts
		, workspaces = myWorkspaces
        , logHook = dynamicLogWithPP $ xmobarPP
                { ppOutput = hPutStrLn xmproc
				, ppUrgent = xmobarColor "yellow" "red" . xmobarStrip
                , ppTitle = xmobarColor "green" "" . shorten 50
                }
		, startupHook = setWMName "LG3D"
        , modMask = mod4Mask
        , terminal = "gnome-terminal"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command -l")
		, ((mod4Mask,               xK_p     ), spawn "exe=`dmenu_run` && eval \"exec $exe\"")
		, ((0, 0x1008FF13), spawn "amixer -c 0 set Master 2%+ unmute")
		, ((0, 0x1008FF11), spawn "amixer -c 0 set Master 2%- unmute")
		, ((0, 0x1008FF12), spawn "amixer -c 0 set Master mute")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot s")
        , ((0, xK_Print), spawn "scrot")
        ] 
