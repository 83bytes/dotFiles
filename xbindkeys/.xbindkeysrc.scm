;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start of xbindkeys guile configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This configuration is guile based.
;;   http://www.gnu.org/software/guile/guile.html
;; any functions that work in guile will work here.
;; see EXTRA FUNCTIONS:

;; Version: 1.8.6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BEGIN                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; LOCK  Mod + O
(xbindkey '("Mod4" "o") "i3lock -fc 000000")

;; SUSPEND Mod + P
(xbindkey '("Mod4" "p") "systemctl suspend && i3lock -fc 000000")

;; terminal
(xbindkey '("Mod4" "Return") "urxvt")

;; dmenu
(xbindkey '("Mod4" "d") "dmenu_run")

;; AUDIO
(xbindkey '("XF86AudioMute") "amixer -D pulse set Master 1+ toggle")
(xbindkey '("XF86AudioLowerVolume")' "amixer -D pulse sset Master 5%-")
(xbindkey '("XF86AudioRaiseVolume")' "amixer -D pulse sset Master 5%+")

;; BRIGHTNESS
(xbindkey '("XF86MonBrightnessUp") "light -A 10")
(xbindkey '("XF86MonBrightnessDown") "light -U 10")

;; SCREENSHOT (click and move to sshots dir)
(xbindkey '("Print") "scrot '%Y-%m-%d-%X_$wx$h.png' -e 'mv $f ~/Documents/sshots/'")

;; Org Global Capture (Ctrl + semicolon to launch emacs window for org-capture)
(xbindkey '("Control" "semicolon") "emacsclient -n -e '(make-capture-frame)'")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of xbindkeys guile configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
