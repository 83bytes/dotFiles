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
(xbindkey '("Mod4" "o") "playerctl pause && i3lock -fc 000000")

;; SUSPEND Mod + P
(xbindkey '("Mod4" "p") "playerctl pause && systemctl suspend && i3lock -fc 000000")

;; terminal
(xbindkey '("Mod4" "Return") "urxvt")

;; dmenu
(xbindkey '("Mod4" "d") "dmenu_run")

;; AUDIO - HP
;; (xbindkey '("F6") "amixer -D pulse set Master 1+ toggle")
;; (xbindkey '("F7")' "amixer -D pulse sset Master 5%-")
;; (xbindkey '("F8")' "amixer -D pulse sset Master 5%+")

;; AUDIO - thinkpad
(xbindkey '("F1") "amixer -D pulse set Master 1+ toggle")
(xbindkey '("F2")' "amixer -D pulse sset Master 5%-")
(xbindkey '("F3")' "amixer -D pulse sset Master 5%+")

;; BRIGHTNESS - HP
;; (xbindkey '("F3") "light -A 10")
;; (xbindkey '("F2") "light -U 10")

;; BRIGHTNESS - thinkpad (light is better than xorg-backlight)
(xbindkey '("F6") "light -A 10")
(xbindkey '("F5") "light -U 10")

;; PLAYER - HP
;; (xbindkey '("F9") "playerctl previous")
;; (xbindkey '("F10")' "playerctl play-pause")
;; (xbindkey '("F11")' "playerctl next")


;; PLAYER - thinkpad
(xbindkey '("F9") "playerctl previous")
(xbindkey '("F10")' "playerctl play-pause")
(xbindkey '("F11")' "playerctl next")

;; SCREENSHOT (click and move to sshots dir)
(xbindkey '("Print") "scrot '%Y-%m-%d-%X_$wx$h.png' -e 'mv $f ~/Documents/sshots/'")

;; Org Global Capture (Ctrl + semicolon to launch emacs window for org-capture)
(xbindkey '("Control" "Shift" "semicolon") "emacsclient -n -e '(make-capture-frame)'")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of xbindkeys guile configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
